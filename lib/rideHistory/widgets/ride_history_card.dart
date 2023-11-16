import 'package:flutter/material.dart';

class RisdeHistoryCard extends StatelessWidget {
  const RisdeHistoryCard({
    super.key,
    required this.pickupLocation,
    required this.destination,
    required this.location,
    required this.amount,
  });

  final String pickupLocation;
  final String destination;
  final String location;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 00),
              height: 120,
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 120,
                    margin: const EdgeInsets.only(left: 05),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent.shade100,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                            BorderRadius.all(Radius.circular(100))),
                      ),
                      Container(
                        width: 1,
                        height: 50,
                        color: Colors.black,
                      ),
                      const Icon(Icons.arrow_drop_down_sharp,
                          color: Colors.red, size: 22)
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 04),
                    height: 110,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pickupLocation,
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(destination,
                            style: TextStyle(
                                color: Colors.grey.shade800, fontSize: 14))
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 35,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "\$ $amount",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 16,
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(
          bottom: 5,
          left: 5,
          child: Image.asset(
            'assets/van.png',
            width: 120,
            height: 50,
          )),
    ]);
  }
}