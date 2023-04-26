import 'package:flight_app/utils/exports.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() => ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: MyColors.primary,
        onPrimary: MyColors.onPrimary,
        secondary: MyColors.secondary,
        onSecondary: MyColors.onSecondary,
        error: MyColors.cardColor3,
        onError: MyColors.background,
        background: MyColors.background,
        onBackground: MyColors.darkBackground,
        surface: MyColors.background,
        onSurface: MyColors.darkBackground,
      ),
      textTheme: TextTheme(
        bodyLarge: const TextTheme()
            .bodyLarge
            ?.copyWith(color: MyColors.darkBackground),
        bodyMedium: const TextTheme()
            .bodyMedium
            ?.copyWith(color: MyColors.darkBackground),
        bodySmall: const TextTheme()
            .bodySmall
            ?.copyWith(color: MyColors.darkBackground),
      ));
}
