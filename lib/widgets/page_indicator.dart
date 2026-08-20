// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class ModernPageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const ModernPageIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = currentPage == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: isActive ? 28 : 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: isActive
                ? const LinearGradient(
                    colors: [Color(0xFF7C4DFF), Color(0xFF00D9FF)],
                  )
                : null,
            color: isActive ? null : Colors.white24,
          ),
        );
      }),
    );
  }
}
