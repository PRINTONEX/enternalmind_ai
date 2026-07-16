import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../providers/database_providers.dart';
import '../models/ai_provider_model.dart';
import '../services/ai_service.dart';

class AIProvidersNotifier extends StateNotifier<List<AIProviderModel>> {
  final Ref _ref;

  AIProvidersNotifier(this._ref) : super([]);

  String get _boxName => 'ai_providers_box';

  /// Loads AI Providers from Hive local database, or seeds them if empty.
  Future<void> loadProviders() async {
    try {
      final box = await Hive.openBox<String>(_boxName);
      final keys = box.keys.toList();

      if (keys.isEmpty) {
        await _seedDefaultProviders();
        return;
      }

      final storage = _ref.read(secureStorageProvider);
      final List<AIProviderModel> loaded = [];

      for (final key in keys) {
        final jsonStr = box.get(key);
        if (jsonStr != null) {
          final Map<String, dynamic> jsonMap = json.decode(jsonStr);
          final id = jsonMap['id'] as String;
          // Load API key from secure storage
          final secureKey = await storage.read(key: 'api_key_$id') ?? '';
          loaded.add(AIProviderModel.fromJson(jsonMap, decryptedApiKey: secureKey));
        }
      }

      // Sort by priority or name
      loaded.sort((a, b) => a.priority.compareTo(b.priority));
      state = loaded;
    } catch (e) {
      debugPrint('Error loading AI providers from Hive: $e');
    }
  }

  /// Seeds default pre-registered providers.
  Future<void> _seedDefaultProviders() async {
    final defaults = [
      AIProviderModel(
        id: 'groq',
        name: 'Groq',
        model: 'llama-3.3-70b-versatile',
        baseUrl: 'https://api.groq.com/openai/v1',
        providerType: 'groq',
        isEnabled: true, // Default active provider
        isConnected: false,
        priority: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      AIProviderModel(
        id: 'openai',
        name: 'OpenAI',
        model: 'gpt-4.1-mini',
        baseUrl: 'https://api.openai.com/v1',
        providerType: 'openai',
        isEnabled: false,
        isConnected: false,
        priority: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      AIProviderModel(
        id: 'gemini',
        name: 'Gemini',
        model: 'gemini-2.5-flash',
        baseUrl: 'https://generativelanguage.googleapis.com',
        providerType: 'gemini',
        isEnabled: false,
        isConnected: false,
        priority: 2,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      AIProviderModel(
        id: 'openrouter',
        name: 'OpenRouter',
        model: 'openai/gpt-4.1-mini',
        baseUrl: 'https://openrouter.ai/api/v1',
        providerType: 'openrouter',
        isEnabled: false,
        isConnected: false,
        priority: 3,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      AIProviderModel(
        id: 'ollama',
        name: 'Ollama',
        model: 'llama3.2',
        baseUrl: 'http://127.0.0.1:11434',
        providerType: 'ollama',
        isEnabled: false,
        isConnected: false,
        priority: 4,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    final box = await Hive.openBox<String>(_boxName);
    for (final p in defaults) {
      await box.put(p.id, json.encode(p.toJson()));
      // Ollama has no API key, others have empty API keys initially
    }

    state = defaults;
  }

  /// Toggles provider state, ensuring only one is active at a time.
  Future<void> toggleProvider(String id) async {
    final updatedProviders = state.map((p) {
      final nextEnabled = p.id == id ? !p.isEnabled : false;
      return p.copyWith(isEnabled: nextEnabled);
    }).toList();

    state = updatedProviders;

    final box = await Hive.openBox<String>(_boxName);
    for (final p in updatedProviders) {
      await box.put(p.id, json.encode(p.copyWith(updatedAt: DateTime.now()).toJson()));
    }
  }

  /// Saves or updates a provider in Hive and FlutterSecureStorage.
  Future<void> saveProvider(AIProviderModel provider) async {
    final storage = _ref.read(secureStorageProvider);

    // Save API key to secure storage
    if (provider.apiKey.isNotEmpty) {
      await storage.write(key: 'api_key_${provider.id}', value: provider.apiKey);
    } else {
      // Clear key if empty (e.g. Ollama)
      await storage.delete(key: 'api_key_${provider.id}');
    }

    final savedProvider = provider.copyWith(updatedAt: DateTime.now());
    final box = await Hive.openBox<String>(_boxName);
    await box.put(savedProvider.id, json.encode(savedProvider.toJson()));

    final exists = state.any((p) => p.id == provider.id);
    if (exists) {
      state = state.map((p) => p.id == provider.id ? savedProvider : p).toList();
    } else {
      state = [...state, savedProvider];
    }

    // Ensure single active provider if this one was set to enabled
    if (provider.isEnabled) {
      await _ensureSingleActive(provider.id);
    }
  }

  /// Helper to ensure only one provider is enabled/active.
  Future<void> _ensureSingleActive(String activeId) async {
    final updated = state.map((p) {
      return p.copyWith(isEnabled: p.id == activeId);
    }).toList();

    state = updated;
    final box = await Hive.openBox<String>(_boxName);
    for (final p in updated) {
      await box.put(p.id, json.encode(p.toJson()));
    }
  }

  /// Deletes a provider from Hive and secure storage.
  Future<void> deleteProvider(String id) async {
    final box = await Hive.openBox<String>(_boxName);
    await box.delete(id);

    final storage = _ref.read(secureStorageProvider);
    await storage.delete(key: 'api_key_$id');

    state = state.where((p) => p.id != id).toList();
  }

  /// Duplicates a provider, generating a new ID.
  Future<void> duplicateProvider(AIProviderModel provider) async {
    final newId = const Uuid().v4();
    final duplicated = provider.copyWith(
      id: newId,
      name: '${provider.name} Copy',
      isEnabled: false, // Don't auto-enable duplicate
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Copy secure API key
    final storage = _ref.read(secureStorageProvider);
    final keyVal = await storage.read(key: 'api_key_${provider.id}') ?? '';
    if (keyVal.isNotEmpty) {
      await storage.write(key: 'api_key_$newId', value: keyVal);
    }

    final box = await Hive.openBox<String>(_boxName);
    await box.put(newId, json.encode(duplicated.toJson()));

    state = [...state, duplicated];
  }

  /// Real connection test calling AIService.
  Future<bool> testProvider(AIProviderModel provider) async {
    try {
      final service = _ref.read(aiServiceProvider);
      
      // Update state to testing/loading if needed (UI will show loading spinner)
      final success = await service.testConnection(provider);
      
      List<String> models = [];
      if (success) {
        models = await service.fetchModels(provider);
      }

      final updated = provider.copyWith(
        isConnected: success,
        availableModels: models,
        updatedAt: DateTime.now(),
      );

      final box = await Hive.openBox<String>(_boxName);
      await box.put(provider.id, json.encode(updated.toJson()));

      state = state.map((p) => p.id == provider.id ? updated : p).toList();
      return success;
    } catch (e) {
      debugPrint('Connection test failed: $e');
      
      final updated = provider.copyWith(
        isConnected: false,
        updatedAt: DateTime.now(),
      );

      final box = await Hive.openBox<String>(_boxName);
      await box.put(provider.id, json.encode(updated.toJson()));

      state = state.map((p) => p.id == provider.id ? updated : p).toList();
      return false;
    }
  }

  /// Fetch and update available models for a provider.
  Future<List<String>> fetchModelsForProvider(String id) async {
    final provider = state.firstWhere((p) => p.id == id);
    final service = _ref.read(aiServiceProvider);
    
    try {
      final models = await service.fetchModels(provider);
      if (models.isNotEmpty) {
        final updated = provider.copyWith(
          availableModels: models,
          isConnected: true,
          updatedAt: DateTime.now(),
        );

        final box = await Hive.openBox<String>(_boxName);
        await box.put(provider.id, json.encode(updated.toJson()));

        state = state.map((p) => p.id == provider.id ? updated : p).toList();
      }
      return models;
    } catch (e) {
      debugPrint('Error fetching models: $e');
      rethrow;
    }
  }

  /// Exports AI providers config to JSON string (API keys redacted).
  String exportToJson() {
    final List<Map<String, dynamic>> exportList = [];
    for (final p in state) {
      final jsonMap = p.toJson();
      jsonMap['apiKey'] = '[KEY_EXCLUDED_FOR_SECURITY]';
      exportList.add(jsonMap);
    }
    return const JsonEncoder.withIndent('  ').convert(exportList);
  }

  /// Imports AI providers config from JSON string.
  Future<void> importFromJson(String jsonString) async {
    try {
      final List<dynamic> list = json.decode(jsonString);
      final box = await Hive.openBox<String>(_boxName);

      for (final item in list) {
        if (item is Map<String, dynamic>) {
          // Keep same ID if not conflicting, else make new one
          String id = item['id'] as String? ?? const Uuid().v4();
          if (state.any((p) => p.id == id)) {
            id = const Uuid().v4();
            item['id'] = id;
          }

          // Redact API key upon import (user must re-enter)
          item['apiKey'] = '';

          final model = AIProviderModel.fromJson(item, decryptedApiKey: '');
          await box.put(model.id, json.encode(model.toJson()));
        }
      }

      await loadProviders();
    } catch (e) {
      debugPrint('Error importing providers from JSON: $e');
      rethrow;
    }
  }
}

final aiProvidersProvider = StateNotifierProvider<AIProvidersNotifier, List<AIProviderModel>>((ref) {
  final notifier = AIProvidersNotifier(ref);
  notifier.loadProviders();
  return notifier;
});
