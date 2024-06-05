import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '_colors_theme.dart';

part '_theme_extensions.dart';

// part '_dimension_themes.dart';

final lightTheme = ThemeData(
  fontFamily: 'Sofia Pro',
  extensions: [
    // Dimensions(
    //   spaces: _spaceDimensions,
    //   insets: _insetsDimensions,
    //   borderWidths: _borderWidthDimensions,
    //   radii: _radiiDimensions,
    // ),
    myColorsExtension,
  ],
  appBarTheme: AppBarTheme(backgroundColor: _colorScheme.background),
  // elevatedButtonTheme: _elevatedButton,
  // textButtonTheme: _textButton,
  // outlinedButtonTheme: _outlinedButton,
  // dividerTheme: _divider,
  scaffoldBackgroundColor: _colorScheme.background,
);
