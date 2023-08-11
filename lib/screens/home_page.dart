import 'package:flutter/material.dart';
import 'package:flutter_application_pw14/theme/custom_theme.dart';
import 'package:flutter_application_pw14/views/custom_view.dart';
import 'package:flutter_application_pw14/widgets/custom_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Alignment _alignment = Alignment.topRight;
  late AnimationController _controllerA;
  late String weatherInfo;
  var squareScaleA = 0.1;
  double weather = 0.8;

  @override
  void initState() {
    if (weather < 0.4) {
      weatherInfo = 'Солнечно';
    } else if (weather < 0.7) {
      weatherInfo = 'Облачно';
    } else {
      weatherInfo = 'Дождь';
    }
    _controllerA = AnimationController(
        vsync: this,
        lowerBound: 0.1,
        upperBound: 0.3,
        duration: const Duration(milliseconds: 200));
    _controllerA.addListener(() {
      setState(() {
        squareScaleA = _controllerA.value;
        _alignment = squareScaleA == _controllerA.upperBound
            ? Alignment.centerRight
            : Alignment.topRight;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerA.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Weather',
          style:
              TextStyle(color: ApplicationTheme.of(context).appBarTitleColor),
        ),
        backgroundColor: ApplicationTheme.of(context).appBarColor,
      ),
      body: Container(
        color: ApplicationTheme.of(context).bodyBackgroundColor,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (_controllerA.isCompleted) {
                _controllerA.reverse();
              } else {
                _controllerA.forward(from: 0.0);
              }
            });
          },
          child: Column(
            children: [
              Expanded(
                child: Align(
                  heightFactor: 20,
                  alignment: _alignment,
                  child: Transform.scale(
                    scale: squareScaleA,
                    alignment: _alignment,
                    transformHitTests: false,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 257.4,
                        height: 300.0,
                        child: CustomPaint(
                          painter: CustomWeatherLogo(weatherInput: weather),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (squareScaleA == _controllerA.upperBound)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomRender(
                    color: ApplicationTheme.of(context).blurColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: ApplicationTheme.of(context).decorationColor,
                      ),
                      height: 100,
                      child: Center(
                        child: Text(
                          '$weatherInfo, 25 градусов',
                          style: TextStyle(
                              fontSize: ApplicationTheme.of(context).fontSize,
                              letterSpacing:
                                  ApplicationTheme.of(context).letterSpacing,
                              color:
                                  ApplicationTheme.of(context).bodyTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
