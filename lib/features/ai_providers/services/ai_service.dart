import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/ai_provider_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AI service that supports multiple providers with automatic fallback.
/// Supported: OpenAI, Gemini, Groq, OpenRouter, Ollama, NVIDIA, Anthropic, DeepSeek, Mistral, Cohere, xAI, Custom REST API
class AIService {
  final Dio _dio;

  AIService() : _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 15),
  ));

  /// Send a prompt to the AI provider and get a response.
  /// If [provider] fails, it throws an exception for fallback handling.
  Future<String> sendPrompt({
    required AIProviderModel provider,
    required String prompt,
    String? systemPrompt,
  }) async {
    switch (provider.providerType) {
      case 'openai':
        return _sendOpenAI(provider, prompt, systemPrompt);
      case 'gemini':
        return _sendGemini(provider, prompt, systemPrompt);
      case 'groq':
        return _sendGroq(provider, prompt, systemPrompt);
      case 'openrouter':
        return _sendOpenRouter(provider, prompt, systemPrompt);
      case 'ollama':
        return _sendOllama(provider, prompt, systemPrompt);
      case 'nvidia':
        return _sendNvidia(provider, prompt, systemPrompt);
      case 'anthropic':
        return _sendAnthropic(provider, prompt, systemPrompt);
      case 'deepseek':
        return _sendDeepSeek(provider, prompt, systemPrompt);
      case 'mistral':
        return _sendMistral(provider, prompt, systemPrompt);
      case 'cohere':
        return _sendCohere(provider, prompt, systemPrompt);
      case 'xai':
        return _sendxAI(provider, prompt, systemPrompt);
      case 'custom':
        return _sendCustom(provider, prompt, systemPrompt);
      default:
        throw UnsupportedError('Unsupported provider type: ${provider.providerType}');
    }
  }

  /// Try multiple providers in priority order until one succeeds
  Future<String> sendPromptWithFallback({
    required List<AIProviderModel> providers,
    required String prompt,
    String? systemPrompt,
  }) async {
    if (providers.isEmpty) {
      throw Exception('No AI providers configured');
    }

    // Sort by priority (lower = higher priority)
    final sortedProviders = List<AIProviderModel>.from(providers)
      ..sort((a, b) => a.priority.compareTo(b.priority));

    List<String> errors = [];
    for (final provider in sortedProviders) {
      if (!provider.isEnabled) continue;
      try {
        debugPrint('Attempting with provider: ${provider.name} (${provider.providerType})');
        final response = await sendPrompt(
          provider: provider,
          prompt: prompt,
          systemPrompt: systemPrompt,
        );
        debugPrint('Success with provider: ${provider.name}');
        return response;
      } catch (e) {
        debugPrint('Provider ${provider.name} failed: $e');
        errors.add('${provider.name}: $e');
      }
    }
    throw Exception('All providers failed: ${errors.join('; ')}');
  }

  /// Test a provider connection by trying to fetch models.
  Future<bool> testConnection(AIProviderModel provider) async {
    try {
      final models = await fetchModels(provider);
      return models.isNotEmpty;
    } catch (e) {
      debugPrint('Connection test failed for ${provider.name}: $e');
      return false;
    }
  }

  /// Fetch available models from a provider
  Future<List<String>> fetchModels(AIProviderModel provider) async {
    final apiKey = provider.apiKey;
    final type = provider.providerType;
    final baseUrl = provider.baseUrl;

    switch (type) {
      case 'openai':
      case 'groq':
      case 'openrouter':
      case 'nvidia':
      case 'deepseek':
      case 'mistral':
      case 'xai':
        final resolvedUrl = baseUrl.isNotEmpty ? baseUrl : _getDefaultBaseUrl(type);
        final response = await _dio.get(
          '$resolvedUrl/models',
          options: Options(headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          }),
        );
        return _parseOpenAICompatibleModels(response.data);

      case 'gemini':
        final resolvedUrl = baseUrl.isNotEmpty ? baseUrl : _getDefaultBaseUrl(type);
        final response = await _dio.get(
          '$resolvedUrl/v1beta/models?key=$apiKey',
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
        final models = response.data['models'] as List?;
        if (models == null) return [];
        return models.map((m) {
          final name = m['name'] as String;
          return name.startsWith('models/') ? name.substring(7) : name;
        }).toList();

      case 'ollama':
        final resolvedUrl = baseUrl.isNotEmpty ? baseUrl : _getDefaultBaseUrl(type);
        final response = await _dio.get(
          '$resolvedUrl/api/tags',
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
        final models = response.data['models'] as List?;
        if (models == null) return [];
        return models.map((m) => m['name'] as String).toList();

      case 'cohere':
        final resolvedUrl = baseUrl.isNotEmpty ? baseUrl : _getDefaultBaseUrl(type);
        final response = await _dio.get(
          '$resolvedUrl/models',
          options: Options(headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          }),
        );
        final models = response.data['models'] as List?;
        if (models != null) {
          return models.map((m) => m['name'] as String).toList();
        }
        return _parseOpenAICompatibleModels(response.data);

      case 'anthropic':
        final resolvedUrl = baseUrl.isNotEmpty ? baseUrl : _getDefaultBaseUrl(type);
        final response = await _dio.get(
          '$resolvedUrl/v1/models',
          options: Options(headers: {
            'x-api-key': apiKey,
            'anthropic-version': '2023-06-01',
            'Content-Type': 'application/json',
          }),
        );
        final data = response.data['data'] as List?;
        if (data == null) return [];
        return data.map((m) => m['id'] as String).toList();

      case 'custom':
        if (baseUrl.isEmpty) {
          throw Exception('Custom provider requires a Base URL');
        }
        final headers = <String, dynamic>{'Content-Type': 'application/json'};
        if (apiKey.isNotEmpty) {
          headers['Authorization'] = 'Bearer $apiKey';
        }
        try {
          final url = baseUrl.endsWith('/models') ? baseUrl : '$baseUrl/models';
          final response = await _dio.get(url, options: Options(headers: headers));
          return _parseModelsFlexible(response.data);
        } catch (e) {
          final response = await _dio.get(baseUrl, options: Options(headers: headers));
          return _parseModelsFlexible(response.data);
        }

      default:
        throw UnsupportedError('Unsupported provider type for fetching models: $type');
    }
  }

  String _getDefaultBaseUrl(String type) {
    switch (type) {
      case 'openai': return 'https://api.openai.com/v1';
      case 'gemini': return 'https://generativelanguage.googleapis.com';
      case 'groq': return 'https://api.groq.com/openai/v1';
      case 'openrouter': return 'https://openrouter.ai/api/v1';
      case 'ollama': return 'http://127.0.0.1:11434';
      case 'nvidia': return 'https://integrate.api.nvidia.com/v1';
      case 'anthropic': return 'https://api.anthropic.com';
      case 'deepseek': return 'https://api.deepseek.com/v1';
      case 'mistral': return 'https://api.mistral.ai/v1';
      case 'cohere': return 'https://api.cohere.ai/v1';
      case 'xai': return 'https://api.x.ai/v1';
      default: return '';
    }
  }

  List<String> _parseOpenAICompatibleModels(dynamic data) {
    if (data is Map && data['data'] is List) {
      final list = data['data'] as List;
      return list.map((m) => m['id'] as String).toList();
    }
    return [];
  }

  List<String> _parseModelsFlexible(dynamic data) {
    if (data is Map) {
      if (data['data'] is List) {
        return (data['data'] as List).map((m) => (m['id'] ?? m['name'] ?? m.toString()) as String).toList();
      }
      if (data['models'] is List) {
        return (data['models'] as List).map((m) => (m['name'] ?? m['id'] ?? m.toString()) as String).toList();
      }
    }
    return [];
  }

  // ─── OpenAI ──────────────────────────────────────────────────────────

  Future<String> _sendOpenAI(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://api.openai.com/v1';
    final model = provider.model.isNotEmpty ? provider.model : 'gpt-4.1-mini';

    final messages = <Map<String, dynamic>>[];
    if (systemPrompt != null && systemPrompt.isNotEmpty) {
      messages.add({'role': 'system', 'content': systemPrompt});
    }
    messages.add({'role': 'user', 'content': prompt});

    final response = await _dio.post(
      '$baseUrl/chat/completions',
      options: Options(headers: {
        'Authorization': 'Bearer ${provider.apiKey}',
        'Content-Type': 'application/json',
      }),
      data: {
        'model': model,
        'messages': messages,
        'temperature': provider.temperature,
        'max_tokens': provider.maxTokens,
      },
    );

    return response.data['choices'][0]['message']['content'] as String;
  }

  // ─── Gemini ──────────────────────────────────────────────────────────

  Future<String> _sendGemini(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://generativelanguage.googleapis.com';
    final model = provider.model.isNotEmpty ? provider.model : 'gemini-2.5-flash';

    final contents = <Map<String, dynamic>>[
      {'parts': [{'text': prompt}]}
    ];

    if (systemPrompt != null && systemPrompt.isNotEmpty) {
      contents.insert(0, {
        'role': 'user',
        'parts': [{'text': 'System: $systemPrompt'}]
      });
    }

    final response = await _dio.post(
      '$baseUrl/v1beta/models/$model:generateContent?key=${provider.apiKey}',
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: {
        'contents': contents,
        'generationConfig': {
          'temperature': provider.temperature,
          'maxOutputTokens': provider.maxTokens,
        },
      },
    );

    final candidates = response.data['candidates'] as List?;
    if (candidates == null || candidates.isEmpty) {
      throw Exception('Gemini: No response candidates');
    }
    return candidates[0]['content']['parts'][0]['text'] as String;
  }

  // ─── Groq ────────────────────────────────────────────────────────────

  Future<String> _sendGroq(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://api.groq.com/openai/v1';
    final model = provider.model.isNotEmpty ? provider.model : 'llama-3.3-70b-versatile';

    final messages = <Map<String, dynamic>>[];
    if (systemPrompt != null && systemPrompt.isNotEmpty) {
      messages.add({'role': 'system', 'content': systemPrompt});
    }
    messages.add({'role': 'user', 'content': prompt});

    final response = await _dio.post(
      '$baseUrl/chat/completions',
      options: Options(headers: {
        'Authorization': 'Bearer ${provider.apiKey}',
        'Content-Type': 'application/json',
      }),
      data: {
        'model': model,
        'messages': messages,
        'temperature': provider.temperature,
        'max_tokens': provider.maxTokens,
      },
    );

    return response.data['choices'][0]['message']['content'] as String;
  }

  // ─── OpenRouter ──────────────────────────────────────────────────────

  Future<String> _sendOpenRouter(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://openrouter.ai/api/v1';
    final model = provider.model.isNotEmpty ? provider.model : 'openai/gpt-4.1-mini';

    final messages = <Map<String, dynamic>>[];
    if (systemPrompt != null && systemPrompt.isNotEmpty) {
      messages.add({'role': 'system', 'content': systemPrompt});
    }
    messages.add({'role': 'user', 'content': prompt});

    final response = await _dio.post(
      '$baseUrl/chat/completions',
      options: Options(headers: {
        'Authorization': 'Bearer ${provider.apiKey}',
        'Content-Type': 'application/json',
        'HTTP-Referer': 'https://aireply.app',
        'X-Title': 'AI Reply',
      }),
      data: {
        'model': model,
        'messages': messages,
        'temperature': provider.temperature,
        'max_tokens': provider.maxTokens,
      },
    );

    return response.data['choices'][0]['message']['content'] as String;
  }

  // ─── Ollama ──────────────────────────────────────────────────────────

  Future<String> _sendOllama(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'http://localhost:11434';
    final model = provider.model.isNotEmpty ? provider.model : 'llama3.2';

    String fullPrompt = prompt;
    if (systemPrompt != null && systemPrompt.isNotEmpty) {
      fullPrompt = 'System: $systemPrompt\n\nUser: $prompt';
    }

    final response = await _dio.post(
      '$baseUrl/api/generate',
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: {
        'model': model,
        'prompt': fullPrompt,
        'stream': false,
        'options': {
          'temperature': provider.temperature,
          'num_predict': provider.maxTokens,
        },
      },
    );

    return response.data['response'] as String;
  }

  // ─── NVIDIA ──────────────────────────────────────────────────────────

  Future<String> _sendNvidia(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://integrate.api.nvidia.com/v1';
    return _sendOpenAICompatible(provider, baseUrl, prompt, systemPrompt);
  }

  // ─── Anthropic ───────────────────────────────────────────────────────

  Future<String> _sendAnthropic(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://api.anthropic.com';
    final model = provider.model.isNotEmpty ? provider.model : 'claude-3-5-sonnet-20241022';

    final response = await _dio.post(
      '$baseUrl/v1/messages',
      options: Options(headers: {
        'x-api-key': provider.apiKey,
        'anthropic-version': '2023-06-01',
        'Content-Type': 'application/json',
      }),
      data: {
        'model': model,
        'messages': [
          {'role': 'user', 'content': prompt}
        ],
        if (systemPrompt != null && systemPrompt.isNotEmpty) 'system': systemPrompt,
        'temperature': provider.temperature,
        'max_tokens': provider.maxTokens,
      },
    );

    return response.data['content'][0]['text'] as String;
  }

  // ─── DeepSeek ────────────────────────────────────────────────────────

  Future<String> _sendDeepSeek(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://api.deepseek.com/v1';
    return _sendOpenAICompatible(provider, baseUrl, prompt, systemPrompt);
  }

  // ─── Mistral ─────────────────────────────────────────────────────────

  Future<String> _sendMistral(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://api.mistral.ai/v1';
    return _sendOpenAICompatible(provider, baseUrl, prompt, systemPrompt);
  }

  // ─── Cohere ──────────────────────────────────────────────────────────

  Future<String> _sendCohere(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://api.cohere.ai/v1';
    return _sendOpenAICompatible(provider, baseUrl, prompt, systemPrompt);
  }

  // ─── xAI ─────────────────────────────────────────────────────────────

  Future<String> _sendxAI(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    final baseUrl = provider.baseUrl.isNotEmpty ? provider.baseUrl : 'https://api.x.ai/v1';
    return _sendOpenAICompatible(provider, baseUrl, prompt, systemPrompt);
  }

  // ─── Custom REST API ─────────────────────────────────────────────────

  Future<String> _sendCustom(
      AIProviderModel provider,
      String prompt,
      String? systemPrompt,
      ) async {
    if (provider.baseUrl.isEmpty) {
      throw Exception('Custom provider requires a Base URL');
    }

    final headers = <String, dynamic>{
      'Content-Type': 'application/json',
    };
    if (provider.apiKey.isNotEmpty) {
      headers['Authorization'] = 'Bearer ${provider.apiKey}';
    }

    final messages = <Map<String, dynamic>>[];
    if (systemPrompt != null && systemPrompt.isNotEmpty) {
      messages.add({'role': 'system', 'content': systemPrompt});
    }
    messages.add({'role': 'user', 'content': prompt});

    final response = await _dio.post(
      provider.baseUrl,
      options: Options(headers: headers),
      data: {
        'model': provider.model,
        'messages': messages,
        'temperature': provider.temperature,
        'max_tokens': provider.maxTokens,
      },
    );

    // Try to extract response from common API formats
    final data = response.data;
    if (data is Map) {
      if (data['choices'] is List) {
        return data['choices'][0]['message']['content'] as String;
      }
      if (data['response'] is String) {
        return data['response'] as String;
      }
      if (data['candidates'] is List) {
        return data['candidates'][0]['content']['parts'][0]['text'] as String;
      }
      if (data['content'] is String) {
        return data['content'] as String;
      }
    }
    return data.toString();
  }

  // ─── Helper for OpenAI-Compatible endpoints ─────────────────────────

  Future<String> _sendOpenAICompatible(
      AIProviderModel provider,
      String baseUrl,
      String prompt,
      String? systemPrompt,
      ) async {
    final messages = <Map<String, dynamic>>[];
    if (systemPrompt != null && systemPrompt.isNotEmpty) {
      messages.add({'role': 'system', 'content': systemPrompt});
    }
    messages.add({'role': 'user', 'content': prompt});

    final response = await _dio.post(
      '$baseUrl/chat/completions',
      options: Options(headers: {
        'Authorization': 'Bearer ${provider.apiKey}',
        'Content-Type': 'application/json',
      }),
      data: {
        'model': provider.model,
        'messages': messages,
        'temperature': provider.temperature,
        'max_tokens': provider.maxTokens,
      },
    );

    return response.data['choices'][0]['message']['content'] as String;
  }
}

/// Global provider for [AIService]
final aiServiceProvider = Provider<AIService>((ref) {
  return AIService();
});
