import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle displayLarge(BuildContext context, {Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.2,
    );
  }

  static TextStyle displayMedium(BuildContext context, {Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.2,
    );
  }

  static TextStyle headlineLarge(BuildContext context, {Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.25,
    );
  }

  static TextStyle headlineMedium(BuildContext context, {Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.3,
    );
  }

  static TextStyle titleLarge(BuildContext context, {Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.35,
    );
  }

  static TextStyle titleMedium(BuildContext context, {Color? color}) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.4,
    );
  }

  static TextStyle bodyLarge(BuildContext context, {Color? color}) {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.5,
    );
  }

  static TextStyle bodyMedium(BuildContext context, {Color? color}) {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.5,
    );
  }

  static TextStyle bodySmall(BuildContext context, {Color? color}) {
    return GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.4,
    );
  }

  static TextStyle label(BuildContext context, {Color? color}) {
    return GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.2,
    );
  }

  static TextStyle bengali({
    required BuildContext context,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return GoogleFonts.hindSiliguri(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).colorScheme.onSurface,
      height: 1.4,
    );
  }
}
