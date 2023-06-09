import 'package:flutter/material.dart';

class SdSecondaryButtonStyle extends ThemeExtension<SdSecondaryButtonStyle> {
  const SdSecondaryButtonStyle({
    required this.borderColor,
    required this.textColor,
    required this.backgroundColor,
    required this.overlayColor,
  });

  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final Color overlayColor;

  @override
  ThemeExtension<SdSecondaryButtonStyle> lerp(
      ThemeExtension<SdSecondaryButtonStyle>? other, double t) {
    if (other is! SdSecondaryButtonStyle) {
      return this;
    }
    return SdSecondaryButtonStyle(
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
      overlayColor:
          Color.lerp(overlayColor, other.overlayColor, t) ?? overlayColor,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ??
          backgroundColor,
    );
  }

  @override
  SdSecondaryButtonStyle copyWith({
    Color? borderColor,
    Color? textColor,
    Color? backgroundColor,
    Color? overlayColor,
  }) =>
      SdSecondaryButtonStyle(
        borderColor: borderColor ?? this.borderColor,
        textColor: textColor ?? this.textColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        overlayColor: overlayColor ?? this.overlayColor,
      );
}
