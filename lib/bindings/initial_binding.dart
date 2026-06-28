import 'package:get/get.dart';

/// App-level dependency container.
///
/// Keep this binding for global services that should be available when the app
/// starts. It is intentionally empty until shared dependencies are introduced.
class InitialBinding extends Bindings {
  @override
  void dependencies() {}
}
