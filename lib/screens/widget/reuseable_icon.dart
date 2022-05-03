import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ReuseableIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ReuseableIcon(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Colors.black.withOpacity(0.6))
                ]),
            height: 60,
            width: 60,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(text, style: TextStyle(color: Colors.grey))
      ],
    );
  }
}
