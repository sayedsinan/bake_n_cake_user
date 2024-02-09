import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle normalstyling(double fontsize) {
  return GoogleFonts.aBeeZee(
    color: textColor,
    fontSize: fontsize,
  );
}

TextStyle normalsecondStyling(double fontsize) {
  return GoogleFonts.aBeeZee(
    color: secondColor,
    fontSize: fontsize,
  );
}

TextStyle heading(double fontsize) {
  return GoogleFonts.aBeeZee(
    color: textColor,
    fontSize: fontsize,
    fontWeight: FontWeight.bold,
  );
}

TextStyle headingSecondstyling(double fontsize) {
  return GoogleFonts.aBeeZee(
    color: secondColor,
    fontSize: fontsize,
    fontWeight: FontWeight.bold,
  );
}
