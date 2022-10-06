import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationViewWidget extends StatelessWidget {
  const LocationViewWidget({
    super.key,
    required this.title,
    required this.color,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String currentDate = DateFormat('yyyy/MM/dd – kk:mm').format(now);
    return Column(
      children: [
        Text(title.toUpperCase(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color: color,
            )),
        Text(currentDate.toString())
      ],
    );
  }
}
