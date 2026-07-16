import 'package:flutter_riverpod/flutter_riverpod.dart';

class AIProviderModel {
  final String id;
  final String name;
  final String modelName;
  final bool isActive;
  final bool isConfigured;
  final String type; // Local Server, Cloud, Custom
  final String speed; // Fast, Smart, Variety, Flexible
  final String security; // Private, Reliable, Affordable, Advanced
  final String? iconAsset;

  AIProviderModel({
    required this.id,
    required this.name,
    required this.modelName,
    this.isActive = false,
    this.isConfigured = false,
    required this.type,
    required this.speed,
    required this.security,
    this.iconAsset,
  });

  AIProviderModel copyWith({
    String? id,
    String? name,
    String? modelName,
    bool? isActive,
    bool? isConfigured,
    String? type,
    String? speed,
    String? security,
    String? iconAsset,
  }) {
    return AIProviderModel(
      id: id ?? this.id,
      name: name ?? this.name,
      modelName: modelName ?? this.modelName,
      isActive: isActive ?? this.isActive,
      isConfigured: isConfigured ?? this.isConfigured,
      type: type ?? this.type,
      speed: speed ?? this.speed,
      security: security ?? this.security,
      iconAsset: iconAsset ?? this.iconAsset,
    );
  }
}

class AIProvidersState {
  final List<AIProviderModel> providers;

  AIProvidersState({required this.providers});

  AIProviderModel? get activeProvider {
    try {
      return providers.firstWhere((p) => p.isActive);
    } catch (_) {
      return null;
    }
  }

  AIProvidersState copyWith({List<AIProviderModel>? providers}) {
    return AIProvidersState(
      providers: providers ?? this.providers,
    );
  }
}

class AIProvidersNotifier extends StateNotifier<AIProvidersState> {
  AIProvidersNotifier() : super(AIProvidersState(providers: [])) {
    state = AIProvidersState(
      providers: [
        AIProviderModel(
          id: 'ollama',
          name: 'Ollama (Local)',
          modelName: 'llama3:latest',
          isActive: true,
          isConfigured: true,
          type: 'Local Server',
          speed: 'Fast',
          security: 'Private',
          iconAsset: 'assets/avatars/ollama.png',
        ),
        AIProviderModel(
          id: 'openai',
          name: 'OpenAI',
          modelName: 'gpt-4o-mini',
          isActive: false,
          isConfigured: true,
          type: 'Cloud',
          speed: 'Smart',
          security: 'Reliable',
          iconAsset: 'assets/avatars/openai.png',
        ),
        AIProviderModel(
          id: 'openrouter',
          name: 'OpenRouter',
          modelName: 'mixtral-8x7b-instruct',
          isActive: false,
          isConfigured: true,
          type: 'Cloud',
          speed: 'Variety',
          security: 'Affordable',
        ),
        AIProviderModel(
          id: 'huggingface',
          name: 'Hugging Face',
          modelName: 'mistralai/Mixtral-8x7b',
          isActive: false,
          isConfigured: false,
          type: 'Cloud',
          speed: 'Community',
          security: 'Open Source',
        ),
        AIProviderModel(
          id: 'custom',
          name: 'Custom API',
          modelName: 'Add your own API endpoint',
          isActive: false,
          isConfigured: false,
          type: 'Custom',
          speed: 'Flexible',
          security: 'Advanced',
        ),
      ],
    );
  }

  void toggleProvider(String id, bool enabled) {
    state = AIProvidersState(
      providers: state.providers.map((p) {
        if (p.id == id) {
          // If enabling, configure if not already configured
          final isConfigured = enabled ? true : p.isConfigured;
          // Toggle active state
          return p.copyWith(
            isActive: enabled,
            isConfigured: isConfigured,
          );
        } else if (enabled && p.isActive) {
          // If enabling one, deactivate other active ones to ensure only one active
          return p.copyWith(isActive: false);
        }
        return p;
      }).toList(),
    );
  }

  void addProvider(AIProviderModel provider) {
    state = AIProvidersState(
      providers: [...state.providers, provider],
    );
  }
}

final aiProvidersProvider = StateNotifierProvider<AIProvidersNotifier, AIProvidersState>((ref) {
  return AIProvidersNotifier();
});
