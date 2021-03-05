import 'package:flutter/material.dart';
import 'package:open_weather_client/models/weather_data.dart';
import 'package:transparent_image/transparent_image.dart';

class WeatherSummary extends StatelessWidget {
  /// Built in widget to support easy integration.
  /// The widget lists current temperature and feels-like value. Also shows the default image from OpenWeather API
  /// With the help of [color] you specify the overall color scheme.
  /// Please note, in order to use the widget [weatherData] should not be null.
  /// For more info, read the documentation.
  final WeatherData weatherData;
  final Color color;

  WeatherSummary({Key key, @required this.weatherData, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            Text(
              '${_formatTemperature(this.weatherData.temperature.currentTemperature)}°' ??
                  '',
              style: TextStyle(
                fontSize: 50,
                color: color,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Feels like ${_formatTemperature(this.weatherData.temperature.feelsLike)}°' ??
                  '',
              style: TextStyle(
                fontSize: 18,
                color: color,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 5),
            // child: CachedNetworkImage(
            //   imageUrl:
            //       'https://openweathermap.org/img/wn/${this.weatherData.details.first.icon}@2x.png',
            //   /* placeholder: (context, url) => CircularProgressIndicator(
            //     valueColor: AlwaysStoppedAnimation<Color>(color),
            //   ), */
            //   errorWidget: (context, url, error) => Column(
            //     children: [
            //       Icon(
            //         Icons.error,
            //         color: color,
            //       ),
            //       Text(
            //         'Error loading icon',
            //         style: TextStyle(
            //           color: color,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            child: Center(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    'https://openweathermap.org/img/wn/${this.weatherData.details.first.icon}@2x.png',
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
                  ); //do something
                },
              ),
            ))
      ]),
    );
  }

  String _formatTemperature(double t) {
    var temp = (t == null ? '' : t.round().toString());
    return temp;
  }
}
