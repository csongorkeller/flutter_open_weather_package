import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class WeatherSummary extends StatelessWidget {
  const WeatherSummary({
    super.key,
    required this.imageUrl,
    required this.currentTemperature,
    required this.color,
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidity,
    required this.pressure,
  });

  final Color color;
  final String currentTemperature;
  final String humidity;
  final String imageUrl;
  final String maxTemperature;
  final String minTemperature;
  final String pressure;

  Widget _buildMinMaxRow({
    required IconData icon,
    required String temperature,
  }) {
    return Row(
      children: [
        Icon(icon),
        Text('$temperature°',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: color,
            )),
      ],
    );
  }

  Widget _buildHumidutyAndPressureRow({
    required String humidity,
    required String pressure,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('$pressure hPa',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: color,
            )),
        Text('$humidity %',
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
    return Column(
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: imageUrl,
          imageErrorBuilder: (context, error, stackTrace) {
            return Column(
              children: [
                Icon(
                  Icons.error,
                  color: color,
                ),
                Text(
                  'Error loading icon',
                  style: TextStyle(
                    color: color,
                  ),
                )
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('${currentTemperature.toUpperCase()}°',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w300,
                color: color,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
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
          padding: const EdgeInsets.only(top: 20),
          child: _buildHumidutyAndPressureRow(
              humidity: humidity, pressure: pressure),
        )
      ],
    );
  }
}
