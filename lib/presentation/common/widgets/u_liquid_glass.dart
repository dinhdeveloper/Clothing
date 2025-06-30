import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class ULiquidGlass extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double? borderRadius;
  final double? blur;
  final VoidCallback? onTap;

  const ULiquidGlass({
    super.key,
    this.borderRadius,
    this.blur,
    required this.child,
    required this.width,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: LiquidGlass(
          //blur: blur ?? 0.0,
          glassContainsChild: false,
          settings: const LiquidGlassSettings(
            thickness: 25.0,
            lightIntensity: .8,
            ambientStrength: 3,
            chromaticAberration: 2.0,
          ),
          shape: LiquidRoundedSuperellipse(
            borderRadius: Radius.circular(borderRadius ?? 20.0),
          ),
          child: SizedBox(width: width, height: height, child: child),
        ),
      ),
    );
  }
}