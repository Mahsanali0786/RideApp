import 'package:flutter/material.dart';

class CarDotLine extends StatelessWidget {
  const CarDotLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 2),
              padding: const EdgeInsets.all(4.5),
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            Container(
              margin: const EdgeInsets.only(left: 2),
              padding: const EdgeInsets.all(4.5),
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
          ],
        ),
        Container(
          width: 50,
          height: 3,
          margin: const EdgeInsets.only(bottom: 4),
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 2),
              padding: const EdgeInsets.all(4.5),
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            Container(
              margin: const EdgeInsets.only(left: 2),
              padding: const EdgeInsets.all(4.5),
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
          ],
        )
      ],
    );
  }
}