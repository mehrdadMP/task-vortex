import 'package:flutter/material.dart';
import 'package:task_vortex/core/constants/app_colors.dart';
import 'package:task_vortex/core/constants/app_styles.dart';

final lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  textTheme: TextTheme(
    displayLarge: AppTextStyles.headline1,
    bodyLarge: AppTextStyles.bodyText1,
  ),
  // ...
);

final darkTheme = ThemeData();