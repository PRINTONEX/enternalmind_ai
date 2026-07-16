class ProviderTypeInfo {
  final String name;
  final String icon;
  final String defaultModel;
  final String defaultBaseUrl;
  final String type;
  final String speed;
  final String security;

  const ProviderTypeInfo({
    required this.name,
    required this.icon,
    required this.defaultModel,
    required this.defaultBaseUrl,
    required this.type,
    required this.speed,
    required this.security,
  });
}

class AIProviderTypes {
  static const Map<String, ProviderTypeInfo> list = {
    'openai': ProviderTypeInfo(
      name: 'OpenAI',
      icon: '🤖',
      defaultModel: 'gpt-4.1-mini',
      defaultBaseUrl: 'https://api.openai.com/v1',
      type: 'Cloud',
      speed: 'Smart',
      security: 'Reliable',
    ),
    'gemini': ProviderTypeInfo(
      name: 'Google Gemini',
      icon: '✨',
      defaultModel: 'gemini-2.5-flash',
      defaultBaseUrl: 'https://generativelanguage.googleapis.com',
      type: 'Cloud',
      speed: 'Fast',
      security: 'Private',
    ),
    'groq': ProviderTypeInfo(
      name: 'Groq',
      icon: '⚡',
      defaultModel: 'llama-3.3-70b-versatile',
      defaultBaseUrl: 'https://api.groq.com/openai/v1',
      type: 'Cloud',
      speed: 'Blazing Fast',
      security: 'Reliable',
    ),
    'openrouter': ProviderTypeInfo(
      name: 'OpenRouter',
      icon: '🌐',
      defaultModel: 'openai/gpt-4.1-mini',
      defaultBaseUrl: 'https://openrouter.ai/api/v1',
      type: 'Cloud',
      speed: 'Variety',
      security: 'Affordable',
    ),
    'ollama': ProviderTypeInfo(
      name: 'Ollama',
      icon: '🦙',
      defaultModel: 'llama3.2',
      defaultBaseUrl: 'http://127.0.0.1:11434',
      type: 'Local Server',
      speed: 'Fast',
      security: 'Private',
    ),
    'nvidia': ProviderTypeInfo(
      name: 'NVIDIA',
      icon: '🟢',
      defaultModel: 'meta/llama-3.1-70b-instruct',
      defaultBaseUrl: 'https://integrate.api.nvidia.com/v1',
      type: 'Cloud',
      speed: 'High Performance',
      security: 'Reliable',
    ),
    'anthropic': ProviderTypeInfo(
      name: 'Anthropic',
      icon: '🎯',
      defaultModel: 'claude-3-5-sonnet-20241022',
      defaultBaseUrl: 'https://api.anthropic.com/v1',
      type: 'Cloud',
      speed: 'Smart',
      security: 'Reliable',
    ),
    'deepseek': ProviderTypeInfo(
      name: 'DeepSeek',
      icon: '🧠',
      defaultModel: 'deepseek-chat',
      defaultBaseUrl: 'https://api.deepseek.com/v1',
      type: 'Cloud',
      speed: 'Fast',
      security: 'Private',
    ),
    'mistral': ProviderTypeInfo(
      name: 'Mistral',
      icon: '🌪️',
      defaultModel: 'mistral-large-latest',
      defaultBaseUrl: 'https://api.mistral.ai/v1',
      type: 'Cloud',
      speed: 'Fast',
      security: 'Reliable',
    ),
    'cohere': ProviderTypeInfo(
      name: 'Cohere',
      icon: '🧬',
      defaultModel: 'command-r-plus',
      defaultBaseUrl: 'https://api.cohere.ai/v1',
      type: 'Cloud',
      speed: 'Community',
      security: 'Open Source',
    ),
    'xai': ProviderTypeInfo(
      name: 'xAI',
      icon: '𝕏',
      defaultModel: 'grok-2-1212',
      defaultBaseUrl: 'https://api.x.ai/v1',
      type: 'Cloud',
      speed: 'Smart',
      security: 'Reliable',
    ),
    'custom': ProviderTypeInfo(
      name: 'Custom API',
      icon: '🔗',
      defaultModel: 'custom-model',
      defaultBaseUrl: '',
      type: 'Custom',
      speed: 'Flexible',
      security: 'Advanced',
    ),
  };
}

class AIProviderModel {
  final String id;
  final String name;
  final String apiKey;
  final String baseUrl;
  final String model;
  final double temperature;
  final int maxTokens;
  final bool isEnabled; // maps to isActive
  final bool isConnected;
  final int priority;
  final String providerType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> availableModels;

  // Additional fields for styling tags compatibility
  final String type;
  final String speed;
  final String security;
  final String? iconAsset;

  AIProviderModel({
    required this.id,
    required this.name,
    this.apiKey = '',
    this.baseUrl = '',
    this.model = '',
    this.temperature = 0.7,
    this.maxTokens = 2048,
    this.isEnabled = true,
    this.isConnected = false,
    this.priority = 0,
    required this.providerType,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.availableModels = const [],
    this.type = 'Cloud',
    this.speed = 'Smart',
    this.security = 'Reliable',
    this.iconAsset,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // Getters for compatibility with other parts of the app
  bool get isActive => isEnabled;
  bool get isConfigured => apiKey.isNotEmpty || providerType == 'ollama';
  String get modelName => model;

  AIProviderModel copyWith({
    String? id,
    String? name,
    String? apiKey,
    String? baseUrl,
    String? model,
    double? temperature,
    int? maxTokens,
    bool? isEnabled,
    bool? isConnected,
    int? priority,
    String? providerType,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? availableModels,
    String? type,
    String? speed,
    String? security,
    String? iconAsset,
  }) {
    return AIProviderModel(
      id: id ?? this.id,
      name: name ?? this.name,
      apiKey: apiKey ?? this.apiKey,
      baseUrl: baseUrl ?? this.baseUrl,
      model: model ?? this.model,
      temperature: temperature ?? this.temperature,
      maxTokens: maxTokens ?? this.maxTokens,
      isEnabled: isEnabled ?? this.isEnabled,
      isConnected: isConnected ?? this.isConnected,
      priority: priority ?? this.priority,
      providerType: providerType ?? this.providerType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      availableModels: availableModels ?? this.availableModels,
      type: type ?? this.type,
      speed: speed ?? this.speed,
      security: security ?? this.security,
      iconAsset: iconAsset ?? this.iconAsset,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'providerName': name,
      'providerType': providerType,
      'baseUrl': baseUrl,
      'model': model,
      'temperature': temperature,
      'maxTokens': maxTokens,
      'isActive': isEnabled,
      'isConnected': isConnected,
      'priority': priority,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'availableModels': availableModels,
    };
  }

  factory AIProviderModel.fromJson(Map<String, dynamic> json, {String decryptedApiKey = ''}) {
    final pType = json['providerType'] as String? ?? 'custom';
    final info = AIProviderTypes.list[pType] ?? AIProviderTypes.list['custom']!;
    return AIProviderModel(
      id: json['id'] as String? ?? '',
      name: json['providerName'] as String? ?? json['name'] as String? ?? info.name,
      providerType: pType,
      apiKey: decryptedApiKey,
      baseUrl: json['baseUrl'] as String? ?? '',
      model: json['model'] as String? ?? '',
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
      maxTokens: json['maxTokens'] as int? ?? json['max_tokens'] as int? ?? 2048,
      isEnabled: json['isActive'] as bool? ?? json['isEnabled'] as bool? ?? false,
      isConnected: json['isConnected'] as bool? ?? false,
      priority: json['priority'] as int? ?? 0,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : DateTime.now(),
      availableModels: List<String>.from(json['availableModels'] as List? ?? []),
      type: info.type,
      speed: info.speed,
      security: info.security,
      iconAsset: pType == 'ollama'
          ? 'assets/avatars/ollama.png'
          : pType == 'openai'
              ? 'assets/avatars/openai.png'
              : pType == 'gemini'
                  ? 'assets/avatars/gemini.png'
                  : null,
    );
  }
}
