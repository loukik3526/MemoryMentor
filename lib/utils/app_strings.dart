/// Centralized user-facing copy for Memory Mentor.
///
/// Keep repeated labels and messages here so the app remains easy to localize
/// and safe to update as product language evolves.
abstract final class AppStrings {
  AppStrings._();

  // Brand.
  static const String appName = 'Memory Mentor';
  static const String appSubtitle = 'Your AI tutor with persistent memory';
  static const String appDescription =
      'Learn faster with an AI mentor that remembers your goals, gaps, and progress.';

  // Common actions.
  static const String continueLabel = 'Continue';
  static const String cancel = 'Cancel';
  static const String close = 'Close';
  static const String retry = 'Retry';
  static const String save = 'Save';
  static const String delete = 'Delete';
  static const String edit = 'Edit';
  static const String done = 'Done';
  static const String next = 'Next';
  static const String back = 'Back';
  static const String skip = 'Skip';
  static const String search = 'Search';
  static const String send = 'Send';
  static const String attach = 'Attach';
  static const String upload = 'Upload';
  static const String download = 'Download';
  static const String clear = 'Clear';
  static const String refresh = 'Refresh';

  // Navigation.
  static const String home = 'Home';
  static const String chat = 'Chat';
  static const String memories = 'Memories';
  static const String library = 'Library';
  static const String progress = 'Progress';
  static const String settings = 'Settings';
  static const String profile = 'Profile';

  // Authentication.
  static const String signIn = 'Sign in';
  static const String signUp = 'Create account';
  static const String signOut = 'Sign out';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String displayName = 'Display name';
  static const String forgotPassword = 'Forgot password?';

  // Chat.
  static const String newChat = 'New chat';
  static const String askMentor = 'Ask Memory Mentor';
  static const String messageHint = 'Ask anything you want to understand...';
  static const String thinking = 'Thinking';
  static const String generatingAnswer = 'Generating answer';
  static const String emptyChatTitle = 'Start a learning thread';
  static const String emptyChatMessage =
      'Ask a question, upload material, or revisit something Memory Mentor already knows about you.';

  // Memory.
  static const String memoryGraph = 'Memory graph';
  static const String savedMemories = 'Saved memories';
  static const String learningProfile = 'Learning profile';
  static const String noMemoriesTitle = 'No memories yet';
  static const String noMemoriesMessage =
      'Important learning signals will appear here as you chat.';

  // Documents.
  static const String documents = 'Documents';
  static const String uploadDocument = 'Upload document';
  static const String documentProcessing = 'Processing document';
  static const String documentReady = 'Document ready';

  // States.
  static const String loading = 'Loading';
  static const String empty = 'Nothing here yet';
  static const String offline = 'You appear to be offline';
  static const String somethingWentWrong = 'Something went wrong';
  static const String sessionExpired = 'Your session expired. Please sign in again.';
  static const String noInternet =
      'Check your connection and try again.';

  // Validation.
  static const String requiredField = 'This field is required';
  static const String invalidEmail = 'Enter a valid email address';
  static const String shortPassword = 'Use at least 8 characters';
}
