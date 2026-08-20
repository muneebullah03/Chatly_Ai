import 'package:chatly_ai/binding/onbaording_binding.dart';
import 'package:chatly_ai/helper/pref.dart';
import 'package:chatly_ai/screen/chat_screen.dart';
import 'package:chatly_ai/screen/home_screen.dart';
import 'package:chatly_ai/screen/image_generator_screen.dart';
import 'package:chatly_ai/screen/language_translation_screen.dart';
import 'package:chatly_ai/screen/onbaording_screen.dart';
import 'package:chatly_ai/screen/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Pref.initialize();
  runApp(const ChatlyAI());
}

class ChatlyAI extends StatelessWidget {
  const ChatlyAI({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatly AI',

      // Initial screen
      initialRoute: '/splash',

      // GetX routes
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),

        GetPage(
          name: '/onboarding',
          page: () => OnboardingScreen(),
          binding: OnboardingBinding(),
        ),
        GetPage(name: '/chat', page: () => const ChatScreen()),

        GetPage(
          name: '/image-generator',
          page: () => const ImageGeneratorScreen(),
        ),

        GetPage(
          name: '/translate',
          page: () => const LanguageTranslationScreen(),
        ),
      ],
    );
  }
}
