import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rideapp/core/constants/constants.dart';

class AdditionalSeats extends StatelessWidget {
  AdditionalSeats({
    required this.callBackFunction,
    super.key,
  });
  var callBackFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBackFunction,
      child: SvgPicture.asset(
        redSeatPath,
        alignment: Alignment.center,
        height: 40,
      ),
    );
  }
}