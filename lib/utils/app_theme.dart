import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

ThemeData buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    dividerColor: Colors.transparent,
    textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
    scaffoldBackgroundColor: kWhiteColor,
    colorScheme: ThemeData().colorScheme.copyWith(primary: kPrimaryColor),
  );

}
