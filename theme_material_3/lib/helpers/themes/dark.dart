import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BorderRadius,
        BorderSide,
        BottomAppBarTheme,
        BoxDecoration,
        CardTheme,
        ColorScheme,
        DividerThemeData,
        EdgeInsets,
        ElevatedButton,
        ElevatedButtonThemeData,
        FloatingLabelBehavior,
        FontWeight,
        IconThemeData,
        InputDecorationTheme,
        OutlineInputBorder,
        Radius,
        RoundedRectangleBorder,
        SwitchThemeData,
        TextStyle,
        TextTheme,
        ThemeData,
        TimePickerThemeData,
        VisualDensity;
import 'package:flutter/services.dart' show Brightness, SystemUiOverlayStyle;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '../colors/methods.dart' show swColor;
import '../colors/colors.dart'
    show
        black,
        black87,
        blue400,
        blueGrey,
        blueGrey800,
        blueGrey900,
        deepOrange,
        green,
        grey800,
        indigo900,
        red,
        red400,
        teal,
        teal400,
        white,
        white70;

SystemUiOverlayStyle darkUiConfig = SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarColor: blueGrey800,
  statusBarIconBrightness: Brightness.light,
  statusBarColor: blueGrey800,
);

ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    primaryColor: blue400,
    dividerColor: white70,
    primaryColorLight: white.withOpacity(.85),
    primaryColorDark: black87,
    appBarTheme: appBarTheme,
    fontFamily: GoogleFonts.baloo2().fontFamily,
    iconTheme: iconThemeData,
    inputDecorationTheme: inputDecorationTheme,
    scaffoldBackgroundColor: blueGrey900,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textTheme,
    switchTheme: switchTheme,
    cardTheme: cardTheme,
    cardColor: grey800,
    timePickerTheme: timePickerThemeData,
    elevatedButtonTheme: elevatedButtonTheme,
    dividerTheme: dividerTheme,
    colorScheme: ColorScheme(
      background: blueGrey900,
      error: red400,
      brightness: Brightness.dark,
      onBackground: blueGrey800,
      onError: red400,
      onPrimary: blue400,
      onSecondary: blue400,
      onSurface: white,
      primary: blue400,
      secondary: blue400,
      surface: blueGrey800,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: blueGrey800));

AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0.0,
  iconTheme: IconThemeData(color: white),
  backgroundColor: blueGrey800,
  titleTextStyle: TextStyle(
    fontSize: 20,
    color: white,
    fontWeight: FontWeight.bold,
  ),
);

IconThemeData iconThemeData = IconThemeData(color: white70);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  border: outlineInputBorder,
  hintStyle: textTheme.titleMedium,
  labelStyle: textTheme.titleMedium,
  counterStyle: textTheme.titleMedium,
);

CardTheme cardTheme = CardTheme(
  elevation: 4,
  shadowColor: grey800,
  color: white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  gapPadding: 10,
  borderSide: BorderSide(color: white, width: .5),
);

const BoxDecoration darkTabDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(30)),
);

SwitchThemeData switchTheme = SwitchThemeData(
    trackColor: swColor(blueGrey),
    thumbColor: swColor(white),
    overlayColor: swColor(blue400));

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
      elevation: 4,
      // foregroundColor: getMaterialColorFromColor(blue400)[100],
      foregroundColor: blue400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
);

DividerThemeData dividerTheme = const DividerThemeData(space: 2, thickness: .2);

TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: teal,
  ),
  displayMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: blueGrey,
  ),
  displaySmall: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: green,
  ),
  headlineMedium: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: red,
  ),
  headlineSmall:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: indigo900),
  titleLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: white,
  ),
  titleMedium: TextStyle(color: white, fontSize: 14),
  titleSmall: TextStyle(color: black, fontSize: 14),
  bodyLarge:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: blueGrey800),
  bodyMedium:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: teal400),
  labelLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: white,
  ),
  bodySmall: TextStyle(fontSize: 11, color: deepOrange),
  labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: white,
      letterSpacing: 0),
);

TimePickerThemeData timePickerThemeData = TimePickerThemeData(
    dayPeriodTextColor: white,
    dialTextColor: blue400,
    hourMinuteTextColor: white,
    dayPeriodTextStyle: textTheme.titleMedium,
    hourMinuteTextStyle: textTheme.titleMedium);
