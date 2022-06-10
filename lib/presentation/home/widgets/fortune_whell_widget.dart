import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class FortuneWhellWidget extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onFling;
  final List<FortuneItem> items;
  final Stream<int> selected;
  final Function() onAnimationEnd;
  const FortuneWhellWidget({
    Key? key,
    required this.onTap,
    required this.onFling,
    required this.selected,
    required this.items,
    required this.onAnimationEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: GestureDetector(
        onTap: onTap,
        child: FortuneWheel(
          animateFirst: false,
          onFling: onFling,
          selected: selected,
          onAnimationEnd: onAnimationEnd,
          physics: CircularPanPhysics(
            duration: const Duration(seconds: 5),
            curve: Curves.decelerate,
          ),
          items: items,
        ),
      ),
    );
  }
}
