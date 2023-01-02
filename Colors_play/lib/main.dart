import 'package:colors_c/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    printer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Color Shades'),
      ),
      body: Center(
        child: Column(
          children: const [
            PrimaryColorOptions(),
            MaterialColorShades(),
            PrimaryColorOptions(),
          ],
        ),
      ),
    );
  }
}

class PrimaryColorOptions extends StatelessWidget {
  const PrimaryColorOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey, width: 2),
      ),
      child: Row(
        children: List.generate(
          AppColors.primaryColors.length,
          (i) => Expanded(
            child: Container(
              height: 50,
              color: AppColors.primaryColors[i],
            ),
          ),
        ),
      ),
    );
  }
}

class MaterialColorShades extends StatelessWidget {
  const MaterialColorShades({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Row(
        children: List.generate(
          AppColors.materialColors.length,
          (i) {
            return Expanded(
              child: Column(
                children: _buildShadesContainers(AppColors.materialColors[i]),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildShadesContainers(MaterialColor materialColor) {
    List<Widget> shadesContainers = [];
    AppColors.getMaterialColorShades(materialColor).forEach(
      (materialColorShadeIndex, materialColorShade) {
        shadesContainers.add(Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: materialColorShade,
              border: materialColorShadeIndex == 500
                  ? const Border(
                      top: BorderSide(width: 2, color: Colors.blueGrey),
                      bottom: BorderSide(width: 2, color: Colors.blueGrey),
                    )
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (materialColorShadeIndex == 500) const Text('MAIN'),
                Text('$materialColorShadeIndex'),
              ],
            ),
          ),
        ));
      },
    );
    return shadesContainers;
  }
}

class AppColors {
  static List<String> hexColors = [
    'd23156',
    '16b9fd',
    '13d0c1',
    'e5672f',
    'b73d99',
  ];

  static List<Color> get primaryColors {
    List<Color> primaryColors = [];

    for (String hexColor in hexColors) {
      Color color = Color(int.parse('0xff$hexColor'));
      primaryColors.add(color);
    }
    return primaryColors;
  }

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color,
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }

  static List<MaterialColor> get materialColors {
    List<MaterialColor> materialColors = [];
    for (Color primaryColor in primaryColors) {
      materialColors.add(getMaterialColorFromColor(primaryColor));
    }
    return materialColors;
  }

  static Map<int, Color> getMaterialColorShades(MaterialColor materialColor) {
    return {
      50: materialColor.shade50,
      100: materialColor.shade100,
      200: materialColor.shade200,
      300: materialColor.shade300,
      400: materialColor.shade400,
      500: materialColor.shade500,
      600: materialColor.shade600,
      700: materialColor.shade700,
      800: materialColor.shade800,
      900: materialColor.shade900,
    };
  }
}
