import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/lottie.json',
      width: 50,
      height: 50,
      fit: BoxFit.cover,
    );
  }
}
