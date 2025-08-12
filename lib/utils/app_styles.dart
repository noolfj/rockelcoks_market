import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle getAppTextStyle({
  required String fontFamily,
  required Color color,
  required double fontSize,
  double letterSpacing = 0,
  required FontWeight fontWeight,
  FontStyle fontStyle = FontStyle.normal,
  required BuildContext context,
  bool isStrikethrough = false, 
  double? lineHeight,           
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double adjustedFontSize = fontSize;

  if (screenWidth <= 360) {
    adjustedFontSize = fontSize * 0.85;
  } else if (screenWidth <= 420) {
    adjustedFontSize = fontSize * 0.95;
  }

  adjustedFontSize = adjustedFontSize.clamp(8.0, fontSize + 10.0);
  TextStyle Function({TextStyle? textStyle}) fontGetter;

  switch (fontFamily.toLowerCase()) {
    case 'nunito':
      fontGetter = GoogleFonts.nunito;
      break;
    case 'afacad':
      fontGetter = GoogleFonts.afacad;
      break;
    case 'ibmplexsans':
      fontGetter = GoogleFonts.ibmPlexSans;
      break;
    case 'ibmplexmono':
      fontGetter = GoogleFonts.ibmPlexMono;
      break;
    case 'inter':
      fontGetter = GoogleFonts.inter;
      break;
    case 'agdasima':
      fontGetter = GoogleFonts.agdasima;
      break;
    case 'roboto':
      fontGetter = GoogleFonts.roboto;
      break;
    case 'worksans':
      fontGetter = GoogleFonts.workSans;
      break;
    case 'poppins':
      fontGetter = GoogleFonts.poppins;
      break;
    default:
      fontGetter = GoogleFonts.manrope;
  }

  return fontGetter(
    textStyle: TextStyle(
      fontStyle: fontStyle,
      color: color,
      fontSize: adjustedFontSize,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      decoration: isStrikethrough ? TextDecoration.lineThrough : TextDecoration.none,
      decorationColor: Color(0xff8BBCA6),
      height: lineHeight,
    ),
  );
}
}
