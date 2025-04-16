import 'package:flutter/material.dart';
import 'package:pdslab/providers/theme_provider.dart';
import 'dart:ui';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? opacity;
  final double? blur;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.alignment,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.opacity,
    this.blur,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTheme = theme.extension<CustomTheme>();

    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      child: ClipRRect(
        borderRadius: borderRadius ??
            BorderRadius.circular(customTheme?.glassBorderRadius ?? 12),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: blur ?? customTheme?.glassBlur ?? 10,
            sigmaY: blur ?? customTheme?.glassBlur ?? 10,
          ),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: (backgroundColor ?? theme.colorScheme.primary)
                  .withOpacity(opacity ?? customTheme?.glassOpacity ?? 0.7),
              borderRadius: borderRadius ??
                  BorderRadius.circular(customTheme?.glassBorderRadius ?? 12),
              border: Border.all(
                color:
                    borderColor ?? theme.colorScheme.onPrimary.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
