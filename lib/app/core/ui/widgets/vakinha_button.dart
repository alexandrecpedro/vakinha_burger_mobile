// Component = Button
import 'package:flutter/material.dart';

class VakinhaButton extends StatelessWidget {
  // clicked function (onPressed)
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? height;
  final Color? color;

  const VakinhaButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 50, // not defined? height will be 50
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setting width and height for our button
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: color,
        ),
      ),
    );
  }
}
