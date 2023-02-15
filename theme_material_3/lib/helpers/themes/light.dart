import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BorderRadius,
        BorderSide,
        BottomAppBarTheme,
        BoxDecoration,
        Brightness,
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
        VisualDensity;
import 'package:flutter/services.dart' show Brightness, SystemUiOverlayStyle;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import '../colors/methods.dart' show swColor;
import '../colors/colors.dart'
    show
        black,
        black54,
        black87,
        blue400,
        blueGrey,
        blueGrey800,
        deepOrange,
        green,
        green200,
        indigo100,
        red,
        red400,
        teal,
        teal400,
        white;

SystemUiOverlayStyle lightUiConfig = SystemUiOverlayStyle(
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: white,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: white,
);

ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: blue400,
    dividerColor: black87,
    primaryColorLight: black87,
    primaryColorDark: white.withOpacity(.85),
    appBarTheme: appBarTheme,
    fontFamily: GoogleFonts.baloo2().fontFamily,
    iconTheme: iconThemeData,
    inputDecorationTheme: inputDecorationTheme,
    scaffoldBackgroundColor: white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textTheme,
    switchTheme: switchTheme,
    cardTheme: cardTheme,
    cardColor: white,
    timePickerTheme: null,
    elevatedButtonTheme: elevatedButtonTheme,
    dividerTheme: dividerTheme,
    colorScheme: ColorScheme(
      error: red400,
      background: white,
      brightness: Brightness.light,
      onBackground: white,
      onError: red400,
      onPrimary: blue400,
      onSecondary: blue400,
      onSurface: blueGrey800,
      primary: blue400,
      secondary: blue400,
      surface: white,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: white));

AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0.0,
  iconTheme: IconThemeData(color: black87),
  backgroundColor: white,
  titleTextStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: black87,
  ),
);

IconThemeData iconThemeData = IconThemeData(color: black87);

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
  shadowColor: black54,
  color: white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  gapPadding: 10,
  borderSide: BorderSide(color: black87, width: .5),
);

const BoxDecoration lightTabDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(30)),
);

SwitchThemeData switchTheme = SwitchThemeData(
    trackColor: swColor(green200),
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
  ///headline1
  displayLarge: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: teal,
  ),

  /// headline2
  displayMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: blueGrey,
  ),

  /// headline3
  displaySmall: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: green,
  ),

  /// headline4
  headlineMedium: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: red,
  ),

  /// headline5
  headlineSmall:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: indigo100),

  /// headline6
  titleLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: black,
  ),

  /// subtitle1
  titleMedium: TextStyle(color: black, fontSize: 14),

  /// subtitle2
  titleSmall: TextStyle(color: white, fontSize: 14),

  /// bodyText1
  bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: white),

  /// bodyText2
  bodyMedium:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: teal400),

  /// button
  labelLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: black,
  ),

  ///caption
  bodySmall: TextStyle(fontSize: 11, color: deepOrange),

  ///overline
  labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: white,
      letterSpacing: 0),
);
// SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
//       statusBarIconBrightness: brightness,
//       statusBarColor: Colors.transparent,
//       systemNavigationBarIconBrightness: brightness,
//       systemNavigationBarColor: surfaceWithOverlay(2.0),
//       systemNavigationBarDividerColor: Colors.transparent,
//     );

// Color surfaceWithOverlay(double e) => ElevationOverlay.applySurfaceTint(
//       surface.toColor,
//       surfaceTint.toColor,
//       e,
//     );
