import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeatWithPosition extends StatelessWidget {
  SeatWithPosition(
      {required this.seatPath,
        super.key,
        required this.topPosition,
        required this.leftPosition,
        required this.size,
        required this.callBackFunction});

  final String seatPath;
  final double topPosition;
  final double leftPosition;
  final double size;
  var callBackFunction;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPosition,
      left: leftPosition,
      child: GestureDetector(
        onTap: callBackFunction,
        child: SvgPicture.asset(
          seatPath,
          alignment: Alignment.center,
          height: size,
        ),
      ),
    );
  }
}