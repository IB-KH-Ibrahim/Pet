import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/bg_pet.png', fit: BoxFit.cover),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,

          color: const Color.fromARGB(
            255,
            255,
            255,
            255,
          ).withValues(alpha: 0.5),
        ),
        child,
      ],
    );
  }
}
