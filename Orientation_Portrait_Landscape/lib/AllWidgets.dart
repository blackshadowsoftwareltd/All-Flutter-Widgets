import 'package:flutter/material.dart';

Widget KtmImage(BuildContext context) {
  return Container(
    height: 250,
    width: 300,
    alignment: Alignment.center,
    margin: EdgeInsets.all(10),
    color: Colors.grey[300],
    child: Image.network(
        'https://www.ktm.com/ktmgroup-storage/PHO_BIKE_90_RE_1290-sdr-21-or-90re_%23SALL_%23AEPI_%23V1.png',
        fit: BoxFit.cover),
  );
}

Widget Descriptions(BuildContext context) {
  return Expanded(
    child: SingleChildScrollView(
      child: Text(
        'Having shed its skin, the KTM 1290 SUPER DUKE R is now a leaner, meaner and an even more '
        'menacing hyper-naked bike than ever before. Mounted into an all-new chassis, beats an updated'
        ' version of the renowned 75 degree, 1301 cc LC8, V-Twin heart, taking THE BEAST to the next '
        'level. The illustrated vehicles may vary in selected details from the production models and '
        'some illustrations feature optional equipment available at additional cost. All information '
        'concerning the scope of supply, appearance, services, dimensions and weights is non-binding '
        'and specified with the proviso that errors, for instance in printing, setting and/or typing, '
        'may occur; such information is subject to change without notice. Please note that model '
        'specifications may vary from country to country. In the case of coated surfaces, there may '
        'be color differences due to the usual process fluctuations. The consumption values stated '
        'refer to the roadworthy series condition of the vehicles at the time of factory delivery.',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
