import 'package:chatly_ai/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 10),
          // Lottie
          Expanded(
            flex: 6,
            child: Center(
              child: Container(
                height: 330,
                width: 330,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF6C63FF).withOpacity(0.18),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Lottie.asset(
                  data.animation,
                  fit: BoxFit.contain,
                  repeat: true,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Title
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [Colors.white, Color(0xFFB9B3FF)],
              ).createShader(bounds);
            },
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                height: 1.1,
                letterSpacing: -0.8,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Description
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 15.5,
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
