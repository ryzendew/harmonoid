// ignore_for_file: implementation_imports
import 'dart:io';
import 'package:adaptive_layouts/adaptive_layouts.dart';
import 'package:dynamic_color/src/corepalette_to_colorscheme.dart';
import 'package:dynamic_color/src/dynamic_color_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template theme_notifier}
///
/// ThemeNotifier
/// -------------
/// Implementation to notify widget tree about various theme attributes.
///
/// {@endtemplate}
class ThemeNotifier extends ChangeNotifier {
  /// Singleton instance.
  static late final ThemeNotifier instance;

  /// Whether the [instance] is initialized.
  static bool initialized = false;

  /// {@macro theme_notifier}
  ThemeNotifier._({
    required this.themeMode,
    required this.materialVersion,
    required this.systemColorScheme,
    required this.animationDuration,
    required this.systemLightColorScheme,
    required this.systemDarkColorScheme,
    required this.systemLightColor,
    required this.systemDarkColor,
  });

  /// Initializes the [instance].
  static Future<void> ensureInitialized({
    required ThemeMode themeMode,
    required int materialVersion,
    required bool systemColorScheme,
    required AnimationDuration animationDuration,
  }) async {
    if (initialized) return;
    initialized = true;

    ColorScheme? systemLightColorScheme;
    ColorScheme? systemDarkColorScheme;
    Color? systemLightColor;
    Color? systemDarkColor;
    await () async {
      try {
        final corePalette = await DynamicColorPlugin.getCorePalette();
        if (corePalette != null) {
          systemLightColorScheme = corePalette.toColorScheme(brightness: Brightness.light);
          systemDarkColorScheme = corePalette.toColorScheme(brightness: Brightness.dark);
          systemLightColor = systemLightColorScheme?.primary;
          systemDarkColor = systemDarkColorScheme?.primary;
        }
        return;
      } catch (exception, stacktrace) {
        debugPrint(exception.toString());
        debugPrint(stacktrace.toString());
      }
      try {
        final accentColor = await DynamicColorPlugin.getAccentColor();
        if (accentColor != null) {
          systemLightColorScheme = ColorScheme.fromSeed(seedColor: accentColor, brightness: Brightness.light);
          systemDarkColorScheme = ColorScheme.fromSeed(seedColor: accentColor, brightness: Brightness.dark);
          systemLightColor = systemLightColorScheme?.primary;
          systemDarkColor = systemDarkColorScheme?.primary;
          return;
        }
      } catch (exception, stacktrace) {
        debugPrint(exception.toString());
        debugPrint(stacktrace.toString());
      }
    }();

    instance = ThemeNotifier._(
      themeMode: themeMode,
      materialVersion: materialVersion,
      systemColorScheme: systemColorScheme,
      animationDuration: animationDuration,
      systemLightColorScheme: systemLightColorScheme,
      systemDarkColorScheme: systemDarkColorScheme,
      systemLightColor: systemLightColor,
      systemDarkColor: systemDarkColor,
    );
  }

  ThemeData get theme => {
        3: createM3Theme(
          context: context!,
          lightColorScheme: _lightColorScheme,
          darkColorScheme: _darkColorScheme,
          mode: ThemeMode.light,
          animationDuration: animationDuration,
        ),
        2: createM2Theme(
          context: context!,
          color: _lightColor,
          mode: ThemeMode.light,
          animationDuration: animationDuration,
        )
      }[materialVersion]!;

  ThemeData get darkTheme => {
        3: createM3Theme(
          context: context!,
          lightColorScheme: _lightColorScheme,
          darkColorScheme: _darkColorScheme,
          mode: ThemeMode.dark,
          animationDuration: animationDuration,
        ),
        2: createM2Theme(
          context: context!,
          color: _darkColor,
          mode: ThemeMode.dark,
          animationDuration: animationDuration,
        )
      }[materialVersion]!;

  ThemeMode themeMode;
  int materialVersion;
  bool systemColorScheme;
  BuildContext? context;
  AnimationDuration animationDuration;

  final Color? systemLightColor;
  final Color? systemDarkColor;
  final ColorScheme? systemLightColorScheme;
  final ColorScheme? systemDarkColorScheme;

  Future<void> update({
    BuildContext? context,
    ThemeMode? themeMode,
    int? materialVersion,
    AnimationDuration? animationDuration,
  }) async {
    this.context = context ?? this.context;
    this.themeMode = themeMode ?? this.themeMode;
    this.materialVersion = materialVersion ?? this.materialVersion;
    this.animationDuration = animationDuration ?? this.animationDuration;
    context ??= this.context;
    themeMode ??= this.themeMode;
    materialVersion ??= this.materialVersion;
    animationDuration ??= this.animationDuration;
    if (context != null) {
      if (Platform.isAndroid || Platform.isIOS) {
        final theme = Theme.of(context);
        final brightness = theme.brightness == Brightness.dark ? Brightness.light : Brightness.dark;
        switch (materialVersion) {
          case 3:
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarBrightness: brightness,
                statusBarIconBrightness: brightness,
                statusBarColor: Colors.transparent,
                // Edge-to-edge.
                systemNavigationBarIconBrightness: brightness,
                systemNavigationBarColor: theme.navigationBarTheme.backgroundColor,
                systemNavigationBarDividerColor: theme.navigationBarTheme.backgroundColor,
              ),
            );
            break;
          case 2:
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarBrightness: brightness,
                statusBarIconBrightness: brightness,
                statusBarColor: Colors.transparent,
                // Black.
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.black,
                systemNavigationBarDividerColor: Colors.black,
              ),
            );
            break;
          default:
            throw ArgumentError.value(
              materialVersion,
              'standard',
              'Only valid values are 2 & 3.',
            );
        }
      }
    }
    notifyListeners();
  }

  ColorScheme get _lightColorScheme {
    if (systemColorScheme) {
      return systemLightColorScheme ?? kDefaultLightColorSchemeM3;
    }
    return kDefaultLightColorSchemeM3;
  }

  ColorScheme get _darkColorScheme {
    if (systemColorScheme) {
      return systemDarkColorScheme ?? kDefaultDarkColorSchemeM3;
    }
    return kDefaultDarkColorSchemeM3;
  }

  Color get _lightColor {
    if (systemColorScheme) {
      return systemLightColor ?? kDefaultLightPrimaryColorM2;
    }
    return kDefaultLightPrimaryColorM2;
  }

  Color get _darkColor {
    if (systemColorScheme) {
      return systemDarkColor ?? kDefaultDarkPrimaryColorM2;
    }
    return kDefaultDarkPrimaryColorM2;
  }

  /// Default light theme color scheme in Material Design 3.
  static final kDefaultLightColorSchemeM3 = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6750A4),
    brightness: Brightness.light,
  );

  /// Default dark theme color scheme in Material Design 3.
  static final kDefaultDarkColorSchemeM3 = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6750A4),
    brightness: Brightness.dark,
  );

  /// Default light theme color in Material Design 2.
  static const kDefaultLightPrimaryColorM2 = Color(0xFF651FFF);

  /// Default dark theme color in Material Design 2.
  static const kDefaultDarkPrimaryColorM2 = Color(0xFF7C4DFF);
}
