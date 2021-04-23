import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF0F174A);
const kPrimaryColor2 = Color(0xFFFAD79E);
const kPrimaryColor3 = Color(0xFFFEB4566);

const kSubTitlesStyle = TextStyle(
  color: Colors.grey,
  fontSize: 12,
);

const kNumberTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.1,
);

void launchWebView() {
  print("1234");
}

class theme {
  static ThemeData themeData(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ThemeData(
      primaryColor: kPrimaryColor,
      textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
        headline5: GoogleFonts.poppins(
          textStyle: textTheme.headline5,
          fontWeight: FontWeight.normal,
        ),
        button: GoogleFonts.poppins(
          color: kPrimaryColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // enabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     color: kPrimaryColor.withOpacity(.4),
        //   ),
        // ),
      ),
    );
  }
}

const kGradientColor1 = Color(0xFF0F174A);
const kGradientColor2 = Color(0xFF0F174A);
const kGradientColor3 = Color(0xFF0F174A);
const kGradientColor4 = Color(0xFF1B4CA1);
const kBodyColor = Color(0xFFE5EDFA);
const kAccentColor = Color(0xFFEE7943);
const kCardName = Color(0xFF072249);
const kIconsColor = Color(0xFF9B9DB4);
const textColor = Color(0xFF5B5B5B);
