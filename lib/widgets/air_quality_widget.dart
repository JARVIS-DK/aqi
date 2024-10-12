import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AirQualityWidget extends StatefulWidget {
  final DateTime time;
  const AirQualityWidget({required this.time});

  @override
  _AirQualityWidgetState createState() => _AirQualityWidgetState();
}

class _AirQualityWidgetState extends State<AirQualityWidget> {
  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('HH:mm').format(widget.time);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SfRadialGauge(
            enableLoadingAnimation: true,
            animationDuration: 5000,
            axes: <RadialAxis>[
              RadialAxis(
                showLabels: false,
                radiusFactor: 0.9,
                startAngle: 160,
                endAngle: 20,
                axisLineStyle: AxisLineStyle(
                    thickness: 23,
                    cornerStyle: CornerStyle.bothCurve,
                    gradient: SweepGradient(colors: <Color>[
                      Colors.red.shade900,
                      Colors.red,
                      Colors.orange,
                      Colors.yellow,
                      Colors.green,
                      Colors.greenAccent,
                      Colors.blue
                    ])),
                showTicks: false,
                minimum: 0,
                maximum: 100,
                interval: 10,
                pointers: const <GaugePointer>[
                  MarkerPointer(
                      borderColor: Colors.white,
                      color: Colors.black,
                      markerHeight: 16,
                      markerWidth: 16,
                      borderWidth: 2,
                      markerType: MarkerType.circle,
                      value: 70), // Air quality score
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    axisValue: 50,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 90),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '70',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              '/100',
                              style:
                                  TextStyle(fontSize: 34, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Air quality score',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'UPDATED $formattedTime',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        const SizedBox(height: 27),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.green, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.timer, color: Colors.white, size: 18),
                              SizedBox(width: 8),
                              Text(
                                "SCAN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    angle: 90,
                    positionFactor: 0,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Air Quality Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              airQualityDetail('PM10', '28.2'),
              airQualityDetail('PM2.5', '53.2'),
              airQualityDetail('O3', '21.0'),
              airQualityDetail('NO2', '50.0'),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red[700],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.warning, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'The air quality level is poor and you may begin to experience symptoms such as coughing and throat irritation.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget airQualityDetail(String type, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(type, style: TextStyle(color: Colors.white70)),
        Text(value, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
