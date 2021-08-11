import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final IconData iconData;
  final Color iconColor;
  final String label;
  final Color? labelColor;
  final Function()? onPressed;
  final bool iconInRight;
  const CustomButtons({
    Key? key,
    this.backgroundColor,
    this.borderColor,
    required this.iconData,
    required this.iconColor,
    required this.label,
    this.onPressed,
    this.labelColor,
    this.iconInRight = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor ?? Theme.of(context).buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: borderColor ?? Colors.transparent, width: 2.0),
          ),
        ),
      ),
      onPressed: onPressed,
      icon: iconInRight ? _buildLabel() : _buildIcon(),
      label: iconInRight ? _buildIcon() : _buildLabel(),
    );
  }

  Icon _buildIcon() {
    return Icon(
      iconData,
      color: iconColor,
    );
  }

  Padding _buildLabel() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 12.0),
      child: Text(
        label,
        style: TextStyle(color: labelColor ?? Colors.black),
      ),
    );
  }
}
