import 'package:chatly_ai/controllor/onbaording_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class NextButton extends StatelessWidget {
  final OnboardingController controller;

  const NextButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLast = controller.isLastPage;

      return GestureDetector(
        onTap: controller.nextPage,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 58,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              colors: [Color(0xFF7C4DFF), Color(0xFF00C6FF)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C63FF).withOpacity(0.35),
                blurRadius: 25,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLast ? 'Get Started' : 'Continue',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),

              const SizedBox(width: 12),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Icon(
                  isLast
                      ? Icons.arrow_forward_rounded
                      : Icons.arrow_forward_rounded,
                  key: ValueKey(isLast),
                  color: Colors.white,
                  size: 21,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
