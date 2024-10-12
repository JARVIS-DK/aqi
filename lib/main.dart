import 'package:aqi/widgets/air_quality_widget.dart';
import 'package:aqi/widgets/app_bar.dart';
import 'package:aqi/widgets/humidity_widget.dart';
import 'package:aqi/widgets/weather_widget.dart';
import 'package:fl_chart/fl_chart.dart'; // For line chart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AirQualityApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class AirQualityApp extends StatefulWidget {
  @override
  _AirQualityAppState createState() => _AirQualityAppState();
}

class _AirQualityAppState extends State<AirQualityApp> {
  DateTime now = DateTime.now();
  Future<void> _refreshData() async {
    // Simulate fetching data from an API or refreshing the state
    await Future.delayed(Duration(seconds: 2));

    // You can update the state here to reflect new data
    setState(() {
      now = DateTime.now(); // Update the time or other values
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: buildCustomAppBar(),
        backgroundColor: Colors.black,
        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Air Quality Section
                  AirQualityWidget(
                    time: now,
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey[900],
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   padding: EdgeInsets.all(16),
                  //   child: Column(
                  //     children: [
                  //       SfRadialGauge(
                  //         // backgroundColor: Color(0x2E2E363F),
                  //         enableLoadingAnimation: true,
                  //         animationDuration: 5000,
                  //         axes: <RadialAxis>[
                  //           RadialAxis(
                  //             showLabels: false,
                  //             radiusFactor: 0.9,
                  //             startAngle: 160,
                  //             endAngle: 20,
                  //             axisLineStyle: AxisLineStyle(
                  //                 thickness: 23,
                  //                 cornerStyle: CornerStyle.bothCurve,
                  //                 gradient: SweepGradient(colors: <Color>[
                  //                   Colors.red.shade900,
                  //                   Colors.red,
                  //                   Colors.orange,
                  //                   Colors.yellow,
                  //                   Colors.green,
                  //                   Colors.greenAccent,
                  //                   Colors.blue
                  //                 ])),
                  //             showTicks: false,
                  //             minimum: 0,
                  //             maximum: 100,
                  //             interval: 10,
                  //
                  //             // ranges: [
                  //             //   GaugeRange(
                  //             //       startValue: 0,
                  //             //       endValue: 50,
                  //             //       color: Colors.green),
                  //             //   GaugeRange(
                  //             //       startValue: 50,
                  //             //       endValue: 100,
                  //             //       color: Colors.red),
                  //             // ],
                  //             pointers: const <GaugePointer>[
                  //               MarkerPointer(
                  //                   borderColor: Colors.white,
                  //                   color: Colors.black,
                  //                   markerHeight: 16,
                  //                   markerWidth: 16,
                  //                   borderWidth: 2,
                  //                   markerType: MarkerType.circle,
                  //                   value: 70), // Air quality score
                  //             ],
                  //             annotations: <GaugeAnnotation>[
                  //               GaugeAnnotation(
                  //                 //verticalAlignment: GaugeAlignment.far,
                  //                 axisValue: 50,
                  //                 widget: Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     const SizedBox(height: 90),
                  //                     const Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.end,
                  //                       children: [
                  //                         Text(
                  //                           '70',
                  //                           style: TextStyle(
                  //                               fontSize: 50,
                  //                               fontWeight: FontWeight.w900,
                  //                               color: Colors.blueAccent),
                  //                         ),
                  //                         // Text(
                  //                         //   '/',
                  //                         //   style: TextStyle(
                  //                         //       fontSize: 42,
                  //                         //       // fontWeight: FontWeight.bold,
                  //                         //       color: Colors.grey),
                  //                         // ),
                  //                         Text(
                  //                           '/100',
                  //                           style: TextStyle(
                  //                               fontSize: 34,
                  //                               // fontWeight: FontWeight.bold,
                  //                               color: Colors.grey),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     const SizedBox(height: 20),
                  //                     const Text(
                  //                       'Air quality score',
                  //                       style: TextStyle(
                  //                           fontSize: 22,
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.white),
                  //                     ),
                  //                     Text(
                  //                       'UPDATED ${DateFormat('HH:mm').format(now)}',
                  //                       style: const TextStyle(
                  //                           fontSize: 14,
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.grey),
                  //                     ),
                  //                     const SizedBox(height: 27),
                  //                     OutlinedButton(
                  //                       style: OutlinedButton.styleFrom(
                  //                         side: BorderSide(
                  //                             color: Colors.green,
                  //                             width: 2), // Green border
                  //                         shape: RoundedRectangleBorder(
                  //                           borderRadius: BorderRadius.circular(
                  //                               30), // Rounded corners
                  //                         ),
                  //                         padding: EdgeInsets.symmetric(
                  //                             horizontal: 20,
                  //                             vertical:
                  //                                 10), // Padding inside button
                  //                       ),
                  //                       onPressed: () {
                  //                         // Define what happens when the button is pressed
                  //                       },
                  //                       child: Row(
                  //                         mainAxisSize: MainAxisSize.min,
                  //                         children: [
                  //                           Icon(Icons.timer,
                  //                               color: Colors.white,
                  //                               size:
                  //                                   18), // Circular timer icon
                  //                           SizedBox(width: 8),
                  //                           Text(
                  //                             "SCAN",
                  //                             style: TextStyle(
                  //                                 color: Colors.white,
                  //                                 fontSize: 16,
                  //                                 fontWeight: FontWeight.bold),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 angle: 90,
                  //                 positionFactor: 0,
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //
                  //       SizedBox(height: 10),
                  //       // Air Quality Details
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           airQualityDetail('PM10', '28.2'),
                  //           airQualityDetail('PM2.5', '53.2'),
                  //           airQualityDetail('O3', '21.0'),
                  //           airQualityDetail('NO2', '50.0'),
                  //         ],
                  //       ),
                  //       SizedBox(height: 10),
                  //       // Warning Text
                  //       Container(
                  //         padding: EdgeInsets.all(8),
                  //         decoration: BoxDecoration(
                  //           color: Colors.red[700],
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         child: Row(
                  //           children: [
                  //             Icon(Icons.warning, color: Colors.white),
                  //             SizedBox(width: 10),
                  //             Expanded(
                  //               child: Text(
                  //                 'The air quality level is poor and you may begin to experience symptoms such as coughing and throat irritation.',
                  //                 style: TextStyle(color: Colors.white),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  // Humidity Section
                  HumidityWidget(humidity: "27"),
                  //humidityDetail("30"),

                  SizedBox(height: 20),

                  // Location and Date Section
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey[900],
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   padding: EdgeInsets.all(16),
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           const Icon(
                  //             Icons.location_on,
                  //             size: 30,
                  //             color: Colors.white,
                  //           ),
                  //           Column(
                  //             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               const Text(
                  //                 'Coimbatore',
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //                 textAlign: TextAlign.start,
                  //               ),
                  //               Text(
                  //                 DateFormat('EEEE, d MMMM y').format(now),
                  //                 style: const TextStyle(
                  //                     color: Colors.grey, fontSize: 10),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //       const SizedBox(height: 20),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         children: [
                  //           forecastDetail(FontAwesomeIcons.umbrella, '30%',
                  //               'Precipitation'),
                  //           forecastDetail(Icons.wb_sunny, '20%', 'Sunshine'),
                  //           forecastDetail(Icons.cloud, '50%', 'Cloudiness'),
                  //         ],
                  //       ),
                  //       const SizedBox(height: 35),
                  //       Container(
                  //         height: 100,
                  //         child: ListView(
                  //           scrollDirection: Axis.horizontal,
                  //           children: [
                  //             buildWeatherCard("11:00", "sunny", "22°"),
                  //             buildWeatherCard("12:00", "sunny", "22°"),
                  //             buildWeatherCard("1:00", "Cloudy", "22°"),
                  //             buildWeatherCard("2:00", "rainy", "22°"),
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  WeatherWidget(now: now),
                  SizedBox(height: 20),

                  // Weather Forecast for Today
                  // Container(
                  //     height: 130,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey[900],
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     padding: EdgeInsets.all(16),
                  //     child: Column(
                  //       children: [
                  //         Expanded(
                  //           child: ListView(
                  //             scrollDirection: Axis.horizontal,
                  //             children: [
                  //               buildWeatherCard(
                  //                   "11:00", FontAwesomeIcons.sun, "22°"),
                  //               buildWeatherCard(
                  //                   "12:00", FontAwesomeIcons.sun, "22°"),
                  //               buildWeatherCard(
                  //                   "1:00", FontAwesomeIcons.sun, "22°"),
                  //               buildWeatherCard(
                  //                   "2:00", FontAwesomeIcons.cloudSun, "22°"),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     )
                  //     // Row(
                  //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     //   children: [
                  //     //     forecastIcon('10:00', Icons.wb_sunny),
                  //     //     forecastIcon('12:00', Icons.wb_sunny),
                  //     //     forecastIcon('14:00', Icons.cloud),
                  //     //     forecastIcon('16:00', Icons.wb_cloudy),
                  //     //   ],
                  //     // ),
                  //     ),
                  SizedBox(height: 20),
                  // Graph Section
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(16),
                    child: LineChart(LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 1),
                            FlSpot(1, 2.5),
                            FlSpot(2, 1.5),
                            FlSpot(3, 3),
                          ],
                          isCurved: true,
                          color: Colors.orange,
                          barWidth: 4,
                          isStrokeCapRound: true,
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget humidityDetail(String humidity) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900], // Background color
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Humidity Indicator (Red with icon and percentage)
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 75,
            child: Column(
              children: [
                Icon(Icons.water_drop,
                    color: Colors.white, size: 30), // Drop Icon
                SizedBox(height: 5),
                Text(
                  humidity + "%", // Humidity percentage
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          // Humidity Text Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'OVER LAST 30 MIN',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Humidity level is low !',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Recommendations',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget airQualityDetail(String type, String value) {
    return Column(
      children: [
        Text(type, style: TextStyle(color: Colors.white70)),
        Text(value, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget buildWeatherCard(String time, String icon, String temperature) {
    Map<String, String> emojis = {'sunny': "☀️", 'rainy': "🌧️", 'cloudy': "⛅"};
    String? emoji = "🌞";
    if (emojis.containsKey(icon)) emoji = emojis[icon];
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigoAccent, Colors.blue.shade200],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            emoji!,
            style: TextStyle(fontSize: 20),
          ),
          // Icon(icon, color: Colors.white, size: 24),
          SizedBox(height: 5),
          Text(
            temperature,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget forecastDetail(IconData icon, String value, String label) {
    return Container(
      width: 90,
      // margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade800, Colors.grey.shade900],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 5),
          Text(value, style: TextStyle(color: Colors.white)),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget forecastIcon(String time, IconData icon) {
    return Column(
      children: [
        Text(time, style: TextStyle(color: Colors.white70)),
        SizedBox(height: 10),
        Icon(icon, color: Colors.orange, size: 32),
      ],
    );
  }
}
