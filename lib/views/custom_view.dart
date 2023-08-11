import 'package:flutter/material.dart';

class CustomWeatherLogo extends CustomPainter {
  final double weatherInput;
  CustomWeatherLogo({required this.weatherInput});
  @override
  void paint(Canvas canvas, Size size) {
    final painterSun = Paint()
      ..color = Colors.amber.withOpacity(_getSunOpacity(weatherInput))
      ..style = PaintingStyle.fill;
    final painterCloud = Paint()
      ..color = Colors.blueGrey.withOpacity(_getCloudOpacity(weatherInput))
      ..style = PaintingStyle.fill;
    final painterDrops = Paint()
      ..color = Colors.blue.withOpacity(_getDropOpacity(weatherInput))
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;

    var pathCloud = Path()
      ..addArc(
          Rect.fromCircle(
              center: Offset(-600, size.height / 0.4),
              radius: size.width * 0.9),
          2.65,
          size.width / 3)
      ..addArc(
          Rect.fromCircle(
              center: Offset(-350, size.height / 0.428),
              radius: size.width * 1.3),
          2.67,
          size.width / 3)
      ..addArc(
          Rect.fromCircle(
              center: Offset(-70 / 0.5, size.height / 0.421),
              radius: size.width * 1.1),
          2.6,
          size.width / 3)
      ..addArc(
          Rect.fromCircle(
              center: Offset(20, size.height / 0.385),
              radius: size.width * 0.7),
          2.66,
          size.width / 3)
      ..close();

    canvas.drawCircle(const Offset(-250, 300), 200, painterSun);
    canvas.drawPath(pathCloud, painterCloud);
    canvas.drawLine(Offset(-550, size.height * 3.3),
        Offset(-600, size.height * 3.8), painterDrops);
    canvas.drawLine(Offset(-300, size.height * 3.3),
        Offset(-350, size.height * 3.8), painterDrops);
    canvas.drawLine(Offset(-50, size.height * 3.3),
        Offset(-100, size.height * 3.8), painterDrops);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

double _getDropOpacity(double value) {
  if (value < 0.7) {
    return 0;
  }

  return 10 / 3 * value - 7 / 3;
}

double _getCloudOpacity(double value) {
  if (value < 0.4) return 0;
  if (value > 0.6) return 1;

  return 10 / 3 * value - 3.5 / 3;
}

double _getSunOpacity(double value) {
  if (value > 0.6) return 0;
  if (value < 0.4) return 1;

  return 6 / 3 - 10 / 3 * value;
}
