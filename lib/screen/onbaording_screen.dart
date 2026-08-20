import 'package:chatly_ai/controllor/onbaording_controller.dart';
import 'package:chatly_ai/widgets/custom_button.dart';
import 'package:chatly_ai/widgets/onbaord_page_widget.dart';
import 'package:chatly_ai/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050816),
      body: SafeArea(
        child: Stack(
          children: [
            // Background glow
            Positioned(
              top: -120,
              right: -100,
              child: _GlowCircle(size: 320, color: const Color(0xFF6C63FF)),
            ),

            Positioned(
              bottom: 80,
              left: -180,
              child: _GlowCircle(size: 350, color: const Color(0xFF00D9FF)),
            ),

            Column(
              children: [
                // ------------------------------------------------
                // TOP BAR
                // ------------------------------------------------
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo
                      Row(
                        children: [
                          Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF7C4DFF), Color(0xFF00D9FF)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF6C63FF,
                                  ).withOpacity(0.4),
                                  blurRadius: 18,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.auto_awesome_rounded,
                              color: Colors.white,
                              size: 21,
                            ),
                          ),

                          const SizedBox(width: 10),

                          const Text(
                            'Chatly',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),

                      // Skip
                      TextButton(
                        onPressed: controller.skip,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white70,
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ------------------------------------------------
                // PAGE VIEW
                // ------------------------------------------------
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.pages.length,
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      return OnboardingPage(data: controller.pages[index]);
                    },
                  ),
                ),

                // ------------------------------------------------
                // BOTTOM SECTION
                // ------------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
                  child: Column(
                    children: [
                      // Page indicator
                      Obx(
                        () => ModernPageIndicator(
                          currentPage: controller.currentPage.value,
                          pageCount: controller.pages.length,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // CTA
                      NextButton(controller: controller),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowCircle({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              color.withOpacity(0.16),
              color.withOpacity(0.04),
              Colors.transparent,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }
}
