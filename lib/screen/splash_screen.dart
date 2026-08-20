import 'dart:math' as math;

import 'package:chatly_ai/controllor/splash_screen_controlor.dart';
import 'package:chatly_ai/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF050816),
      body: Stack(
        children: [
          // ─────────────────────────────────────────────
          // BACKGROUND GLOW
          // ─────────────────────────────────────────────
          Positioned(
            top: mq.height * 0.15,
            left: -80,
            child: _glowCircle(size: 280, color: const Color(0xFF6C63FF)),
          ),

          Positioned(
            bottom: mq.height * 0.12,
            right: -70,
            child: _glowCircle(size: 250, color: const Color(0xFF00D9FF)),
          ),

          Positioned(
            top: mq.height * 0.35,
            right: -100,
            child: _glowCircle(size: 200, color: const Color(0xFF8B5CF6)),
          ),

          // ─────────────────────────────────────────────
          // CENTER CONTENT
          // ─────────────────────────────────────────────
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGO
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: math.pi * 2),
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeInOut,
                  builder: (context, rotation, child) {
                    return Transform.rotate(angle: rotation, child: child);
                  },
                  child: Container(
                    width: 145,
                    height: 145,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFF00D9FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C63FF).withOpacity(0.35),
                          blurRadius: 45,
                          spreadRadius: 8,
                        ),
                        BoxShadow(
                          color: const Color(0xFF00D9FF).withOpacity(0.20),
                          blurRadius: 80,
                          spreadRadius: 15,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 118,
                        height: 118,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF080B1C),
                        ),
                        child: appLogo,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 38),

                // APP NAME
                const Text(
                  'Chatly AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 10),

                // TAGLINE
                Text(
                  'Your intelligent AI companion',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.55),
                    fontSize: 15,
                    letterSpacing: 0.5,
                  ),
                ),

                const SizedBox(height: 45),

                // LOADING
                SizedBox(
                  width: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const LinearProgressIndicator(
                      minHeight: 3,
                      backgroundColor: Color(0x1AFFFFFF),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF6C63FF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ─────────────────────────────────────────────
          // BOTTOM
          // ─────────────────────────────────────────────
          Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'POWERED BY AI',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.25),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glowCircle({required double size, required Color color}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.03),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.12),
            blurRadius: 120,
            spreadRadius: 40,
          ),
        ],
      ),
    );
  }
}
