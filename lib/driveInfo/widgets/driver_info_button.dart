import 'package:flutter/material.dart';

class DriverInfoButton extends StatelessWidget {
  DriverInfoButton({
    required this.callBackFunction,
    required this.buttonName,
    super.key,
    required this.isFocused,
  });

  final bool isFocused;
  var callBackFunction;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0.0),
      decoration: BoxDecoration(
          boxShadow: null,
          border: Border(
              right: const BorderSide(width: 0, color: Colors.transparent),
              left: const BorderSide(width: 0, color: Colors.transparent),
              top: const BorderSide(width: 0, color: Colors.transparent),
              bottom: BorderSide(
                  width: isFocused ? 3 : 0,
                  color: isFocused ? Colors.red : Colors.transparent))),
      child: TextButton(
        onPressed: callBackFunction,
        child: Text(
          buttonName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isFocused == true ? Colors.redAccent : Colors.green),
        ),
      ),
    );
  }
}