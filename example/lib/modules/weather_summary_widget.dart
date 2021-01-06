import 'package:flutter/material.dart';

class WeatherSummary extends StatelessWidget {
  WeatherSummary({
    this.imageUrl,
    this.currentTemperature,
    this.color,
    this.maxTemperature,
    this.minTemperature,
    this.humidity,
    this.pressure,
  });

  final Color color;
  final String currentTemperature;
  final String humidity;
  final String imageUrl;
  final String maxTemperature;
  final String minTemperature;
  final String pressure;

  Widget _buildMinMaxRow({IconData icon, String temperature}) {
    return Row(
      children: [
        Icon(icon),
        Text('$temperature°' ?? '',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: color,
            )),
      ],
    );
  }

  Widget _buildHumidutyAndPressureRow({String humidity, String pressure}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('$pressure hPa' ?? '',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: color,
            )),
        Text('$humidity %' ?? '',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: color,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('${currentTemperature.toUpperCase()}°' ?? '',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: color,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: _buildMinMaxRow(
                      icon: Icons.arrow_drop_up_sharp,
                      temperature: maxTemperature),
                ),
                Container(
                  child: _buildMinMaxRow(
                      icon: Icons.arrow_drop_down_sharp,
                      temperature: minTemperature),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: _buildHumidutyAndPressureRow(
                humidity: humidity, pressure: pressure),
          )
        ],
      ),
    );
  }
}
