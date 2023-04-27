import 'package:flutter/material.dart';

class CustomCounter extends StatefulWidget {
  final double iconSize;
  final Color iconColor;
  final double counterTextFontSize;
  final Color counterTextColor;
  final double borderRadius;
  final Color borderColor;
  final Color counterColor;
  final ValueSetter<int> callback;

  const CustomCounter({
    super.key,
    this.iconSize = 30,
    this.iconColor = Colors.red,
    this.counterTextFontSize = 30,
    this.counterTextColor = Colors.black,
    this.borderRadius = 30,
    this.borderColor = Colors.red,
    this.counterColor = const Color(0xFFEEEEEE),
    required this.callback,
  });

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
      widget.callback(counter);
    });
  }

  void _decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
        widget.callback(counter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: widget.borderColor, width: 1.0),
          color: widget.counterColor,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: _incrementCounter,
              child: Icon(
                Icons.add,
                size: widget.iconSize,
                color: widget.iconColor,
              ),
            ),
            Text(
              '$counter',
              maxLines: 1,
              overflow: TextOverflow.clip,
              softWrap: false,
              style: TextStyle(
                fontSize: widget.counterTextFontSize,
                color: widget.counterTextColor,
              ),
            ),
            InkWell(
              onTap: _decrementCounter,
              child: Icon(
                Icons.remove,
                size: widget.iconSize,
                color: widget.iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
