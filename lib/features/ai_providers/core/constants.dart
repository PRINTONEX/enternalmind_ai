/// Application-wide constants
class AppConstants {
  AppConstants._();

  static const String appName = 'AI Reply';
  static const String appVersion = '1.0.0';

  // ─── Supported Apps ───────────────────────────────────────────────────
  static const List<Map<String, String>> supportedApps = [
    {'name': 'WhatsApp', 'package': 'com.whatsapp', 'icon': '💬'},
    {'name': 'WhatsApp Business', 'package': 'com.whatsapp.w4b', 'icon': '💼'},
    {'name': 'Messages (SMS)', 'package': 'com.google.android.apps.messaging', 'icon': '✉️'},
    {'name': 'Telegram', 'package': 'org.telegram.messenger', 'icon': '📱'},
    {'name': 'Messenger', 'package': 'com.facebook.orca', 'icon': '💙'},
    {'name': 'Instagram', 'package': 'com.instagram.android', 'icon': '📷'},
    {'name': 'Slack', 'package': 'com.slack', 'icon': '🔧'},
    {'name': 'Discord', 'package': 'com.discord', 'icon': '🎮'},
    {'name': 'X (Twitter)', 'package': 'com.twitter.android', 'icon': '🐦'},
  ];

  // ─── Delay Options ────────────────────────────────────────────────────
  static const List<int> delayOptions = [0, 5, 10, 15, 30, 60];

  // ─── Cooldown Options ─────────────────────────────────────────────────
  static const List<int> cooldownOptions = [0, 1, 5, 10, 15, 30, 60];

  // ─── AI Provider Types ────────────────────────────────────────────────
  static const Map<String, AIProviderInfo> providerTypes = {
    'openai': AIProviderInfo(
      name: 'OpenAI',
      defaultModel: 'gpt-4.1-mini',
      defaultBaseUrl: 'https://api.openai.com/v1',
      icon: '🤖',
      description: 'GPT-4, GPT-3.5 models',
    ),
    'gemini': AIProviderInfo(
      name: 'Gemini',
      defaultModel: 'gemini-2.5-flash',
      defaultBaseUrl: 'https://generativelanguage.googleapis.com',
      icon: '✨',
      description: 'Google Gemini models',
    ),
    'groq': AIProviderInfo(
      name: 'Groq',
      defaultModel: 'llama-3.3-70b-versatile',
      defaultBaseUrl: 'https://api.groq.com/openai/v1',
      icon: '⚡',
      description: 'Fast inference with open models',
    ),
    'openrouter': AIProviderInfo(
      name: 'OpenRouter',
      defaultModel: 'openai/gpt-4.1-mini',
      defaultBaseUrl: 'https://openrouter.ai/api/v1',
      icon: '🌐',
      description: 'Multi-model router',
    ),
    'ollama': AIProviderInfo(
      name: 'Ollama',
      defaultModel: 'llama3.2',
      defaultBaseUrl: 'http://127.0.0.1:11434',
      icon: '🦙',
      description: 'Local models',
    ),
    'nvidia': AIProviderInfo(
      name: 'NVIDIA',
      defaultModel: 'meta/llama-3.1-70b-instruct',
      defaultBaseUrl: 'https://integrate.api.nvidia.com/v1',
      icon: '🟢',
      description: 'NVIDIA NIM endpoints',
    ),
    'anthropic': AIProviderInfo(
      name: 'Anthropic',
      defaultModel: 'claude-3-5-sonnet-20241022',
      defaultBaseUrl: 'https://api.anthropic.com/v1',
      icon: '🎯',
      description: 'Claude models',
    ),
    'deepseek': AIProviderInfo(
      name: 'DeepSeek',
      defaultModel: 'deepseek-chat',
      defaultBaseUrl: 'https://api.deepseek.com/v1',
      icon: '🧠',
      description: 'DeepSeek Chat & Coder',
    ),
    'mistral': AIProviderInfo(
      name: 'Mistral',
      defaultModel: 'mistral-large-latest',
      defaultBaseUrl: 'https://api.mistral.ai/v1',
      icon: '🌪️',
      description: 'Mistral AI models',
    ),
    'cohere': AIProviderInfo(
      name: 'Cohere',
      defaultModel: 'command-r-plus',
      defaultBaseUrl: 'https://api.cohere.ai/v1',
      icon: '🧬',
      description: 'Cohere enterprise models',
    ),
    'xai': AIProviderInfo(
      name: 'xAI',
      defaultModel: 'grok-2-1212',
      defaultBaseUrl: 'https://api.x.ai/v1',
      icon: '𝕏',
      description: 'Grok models',
    ),
    'custom': AIProviderInfo(
      name: 'Custom API',
      defaultModel: 'custom-model',
      defaultBaseUrl: '',
      icon: '🔗',
      description: 'Any OpenAI-compatible API',
    ),
  };
}

class AIProviderInfo {
  final String name;
  final String defaultModel;
  final String defaultBaseUrl;
  final String icon;
  final String description;

  const AIProviderInfo({
    required this.name,
    required this.defaultModel,
    required this.defaultBaseUrl,
    required this.icon,
    required this.description,
  });
}
