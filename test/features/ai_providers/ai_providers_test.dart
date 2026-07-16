import 'package:flutter_test/flutter_test.dart';
import 'package:enternalmind_ai/features/ai_providers/models/ai_provider_model.dart';

void main() {
  group('AIProviderModel Serialization Tests', () {
    test('toJson converts model correctly and excludes apiKey reference from JSON', () {
      final model = AIProviderModel(
        id: 'test-groq-id',
        name: 'My Groq Provider',
        apiKey: 'gsk-xyz123',
        baseUrl: 'https://api.groq.com/openai/v1',
        model: 'llama-3.3-70b-versatile',
        temperature: 0.5,
        maxTokens: 1000,
        isEnabled: true,
        isConnected: true,
        providerType: 'groq',
        availableModels: ['llama-3.3-70b-versatile', 'llama3-8b-8192'],
      );

      final jsonMap = model.toJson();

      expect(jsonMap['id'], 'test-groq-id');
      expect(jsonMap['providerName'], 'My Groq Provider');
      expect(jsonMap['providerType'], 'groq');
      expect(jsonMap['baseUrl'], 'https://api.groq.com/openai/v1');
      expect(jsonMap['model'], 'llama-3.3-70b-versatile');
      expect(jsonMap['temperature'], 0.5);
      expect(jsonMap['maxTokens'], 1000);
      expect(jsonMap['isActive'], true);
      expect(jsonMap['isConnected'], true);
      expect(jsonMap['availableModels'], contains('llama3-8b-8192'));
      // Verify apiKey is not stored inside the JSON Map (stored securely instead)
      expect(jsonMap.containsKey('apiKey'), isFalse);
    });

    test('fromJson deserializes JSON map to AIProviderModel correctly', () {
      final jsonMap = {
        'id': 'test-openai-id',
        'providerName': 'My OpenAI',
        'providerType': 'openai',
        'baseUrl': 'https://api.openai.com/v1',
        'model': 'gpt-4.1-mini',
        'temperature': 0.7,
        'maxTokens': 2048,
        'isActive': false,
        'isConnected': false,
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
        'availableModels': ['gpt-4.1-mini', 'gpt-4o-mini'],
      };

      final model = AIProviderModel.fromJson(jsonMap, decryptedApiKey: 'sk-proj-xyz');

      expect(model.id, 'test-openai-id');
      expect(model.name, 'My OpenAI');
      expect(model.providerType, 'openai');
      expect(model.apiKey, 'sk-proj-xyz');
      expect(model.baseUrl, 'https://api.openai.com/v1');
      expect(model.model, 'gpt-4.1-mini');
      expect(model.temperature, 0.7);
      expect(model.maxTokens, 2048);
      expect(model.isEnabled, isFalse);
      expect(model.isConnected, isFalse);
      expect(model.availableModels, contains('gpt-4o-mini'));
      expect(model.isConfigured, isTrue);
    });
  });

  group('AIProviderModel copyWith Tests', () {
    test('copyWith copies all fields and overrides specified fields', () {
      final model = AIProviderModel(
        id: 'original-id',
        name: 'Original Provider',
        providerType: 'openai',
        temperature: 0.7,
        maxTokens: 2048,
        isEnabled: false,
      );

      final updated = model.copyWith(
        name: 'New Provider Name',
        temperature: 1.2,
        isEnabled: true,
        isConnected: true,
      );

      expect(updated.id, 'original-id');
      expect(updated.name, 'New Provider Name');
      expect(updated.providerType, 'openai');
      expect(updated.temperature, 1.2);
      expect(updated.maxTokens, 2048);
      expect(updated.isEnabled, isTrue);
      expect(updated.isConnected, isTrue);
    });
  });
}
