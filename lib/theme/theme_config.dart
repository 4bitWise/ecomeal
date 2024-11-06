import 'package:flutter/material.dart';

import 'colors.dart';
import 'sizes.dart';
import 'styles.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Radii.medium),
    ),
  ),
);

FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Radii.medium),
    ),
  ),
);

OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    side: const BorderSide(color: AppColors.primary),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Radii.medium),
    ),
  ),
);

TextTheme textTheme = TextTheme(
  // display
  displayLarge: TextStyles.displayLarge,
  displayMedium: TextStyles.displayMedium,
  displaySmall: TextStyles.displaySmall,
  // headline
  headlineLarge: TextStyles.headlineLarge,
  headlineMedium: TextStyles.headlineMedium,
  headlineSmall: TextStyles.headlineSmall,
  // title
  titleLarge: TextStyles.titleLarge,
  titleMedium: TextStyles.titleMedium,
  titleSmall: TextStyles.titleSmall,
  // label
  labelLarge: TextStyles.labelLarge,
  labelMedium: TextStyles.labelMedium,
  labelSmall: TextStyles.labelSmall,
  // body
  bodyLarge: TextStyles.bodyLarge,
  bodyMedium: TextStyles.bodyMedium,
  bodySmall: TextStyles.bodySmall,
);