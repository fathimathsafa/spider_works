import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_spider/core/constants/colors.dart';

// textStyles refactored here

class GLTextStyles {
  static loraStyle({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lora(
      fontSize: size ?? 22,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? ColorConstants.black,
    );
  }

  static nunitoStyle({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.nunito(
      fontSize: size ?? 20,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? ColorConstants.black,
    );
  }
}
