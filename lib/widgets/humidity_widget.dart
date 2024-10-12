import 'package:flutter/material.dart';

class HumidityWidget extends StatefulWidget {
  final String humidity;
  const HumidityWidget({required this.humidity});

  @override
  _HumidityWidgetState createState() => _HumidityWidgetState();
}

class _HumidityWidgetState extends State<HumidityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.red, Colors.orangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 75,
            child: Column(
              children: [
                const Icon(
                  Icons.water_drop,
                  color: Colors.white,
                  size: 30,
                ), // Drop Icon
                SizedBox(height: 5),
                Text(
                  '${widget.humidity}%', // Humidity percentage
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OVER LAST 30 MIN',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
                SizedBox(height: 5),
                Text(
                  'Humidity level is low!',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(
                  'Low humidity level may cause dry skin',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
