/// Asset path registry for Memory Mentor.
///
/// Add assets to pubspec.yaml before referencing them here. Keeping paths in
/// one place prevents string drift across widgets and controllers.
abstract final class AppAssets {
  AppAssets._();

  static const String _assets = 'assets';
  static const String _images = '$_assets/images';
  static const String _icons = '$_assets/icons';
  static const String _logos = '$_assets/logos';
  static const String _animations = '$_assets/animations';
  static const String _illustrations = '$_assets/illustrations';

  // Logos.
  static const String logo = 'assets/icons/logo.png';
  static const String google = 'assets/icons/google.png';

  // Icons.
  static const String geminiIcon = '$_icons/gemini.svg';
  static const String memoryIcon = '$_icons/memory.svg';
  static const String documentIcon = '$_icons/document.svg';
  static const String sparkleIcon = '$_icons/sparkle.svg';

  // Images and illustrations.
  static const String onboardingHero = '$_illustrations/onboarding_hero.png';
  static const String emptyMemory = '$_illustrations/empty_memory.png';
  static const String emptyChat = '$_illustrations/empty_chat.png';
  static const String errorState = '$_illustrations/error_state.png';

  // Lottie animations.
  static const String aiThinking = '$_animations/ai_thinking.json';
  static const String memoryPulse = '$_animations/memory_pulse.json';
  static const String uploadProcessing = '$_animations/upload_processing.json';

  // Placeholder images.
  static const String avatarPlaceholder = '$_images/avatar_placeholder.png';
  static const String documentPlaceholder = '$_images/document_placeholder.png';
}
