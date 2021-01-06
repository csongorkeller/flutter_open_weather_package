import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationViewWidget extends StatelessWidget {
  LocationViewWidget({
    this.title,
    this.color,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    final DateTime _now = DateTime.now();
    final String _currentDate = DateFormat('yyyy/MM/dd – kk:mm').format(_now);
    return Container(
      child: Column(
        children: [
          Text('${title.toUpperCase()}' ?? '',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w300,
                color: color,
              )),
          Text(_currentDate.toString() ?? '')
        ],
      ),
    );
  }
}
