import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'bindings/initial_binding.dart';
import 'routes/app_pages.dart';
import 'utils/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MemoryMentorApp());
}

class MemoryMentorApp extends StatelessWidget {
  const MemoryMentorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Memory Mentor',

          theme: AppTheme.darkTheme,

          initialBinding: InitialBinding(),

          initialRoute: AppPages.initial,

          getPages: AppPages.routes,
        );
      },
    );
  }
}