import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A widget that displays a location view with a title and the current date.
///
/// The [LocationViewWidget] is a stateless widget that takes a [title] and a [color]
/// as required parameters. It displays the [title] in uppercase with a specified
/// [color] and the current date and time in the format 'yyyy/MM/dd – kk:mm'.
///
/// {@tool snippet}
/// This example shows how to use the [LocationViewWidget] with a title and color:
///
/// ```dart
/// LocationViewWidget(
///   title: 'New York',
///   color: Colors.blue,
/// )
/// ```
/// {@end-tool}
///
/// The [title] is displayed in uppercase with a font size of 40 and a font weight
/// of 300. The current date and time are displayed below the title.
///
/// See also:
///  * [DateFormat], which is used to format the current date and time.
class LocationViewWidget extends StatelessWidget {
  /// Creates a [LocationViewWidget].
  ///
  /// The [title] and [color] parameters must not be null.
  const LocationViewWidget({
    super.key,
    required this.title,
    required this.color,
  });

  /// The color to use for the title text.
  final Color color;

  /// The title to display in the widget.
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
