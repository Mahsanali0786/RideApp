import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rideapp/rideHistory/views/ride_history.dart';
import '../../core/constants/constants.dart';
import '../widgets/additional_seats.dart';
import '../widgets/card_dot_line.dart';
import '../widgets/seat_with_position.dart';

class BookSeat extends StatefulWidget {
  const BookSeat({super.key, required this.numberOfSeats});
  final int numberOfSeats;

  @override
  State<BookSeat> createState() => _BookSeatState();
}

class _BookSeatState extends State<BookSeat> {
  List positions = [];
  double heightOfContainer = 150;

  int newSeats(int numberOfseats) {
    if (numberOfseats <= 6) {
      return 0;
    } else {
      return numberOfseats - 6;
    }
  }

  void callBackFunction(int seatNumber) {
    print(seatNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(left: 30, right: 55),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            color: Colors.grey)
                      ]),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.red,
                    size: 15,
                  )),
              const Text(
                'Select Seat',
                style: pageTitleStyle,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(17),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    const Text(
                      'Available',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(17),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    const Text(
                      'UnAvailable',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(17),
                      margin: const EdgeInsets.only(right: 5),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    const Text(
                      'Selected',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                  height: 241,
                  child: Stack(
                    children: [
                      Positioned(
                          child: Image.asset(
                        "assets/car.png",
                        fit: BoxFit.contain,
                        height: 250,
                        width: 180,
                      )),
                      SeatWithPosition(
                        seatPath: greySeatPath,
                        topPosition: 150,
                        leftPosition: 20,
                        size: 45,
                        callBackFunction: () {
                          callBackFunction(1);
                        },
                      ),
                      SeatWithPosition(
                        seatPath: redSeatPath,
                        topPosition: 158,
                        leftPosition: 67,
                        size: 38,
                        callBackFunction: () {
                          callBackFunction(2);
                        },
                      ),
                      SeatWithPosition(
                        seatPath: greenSeatPath,
                        topPosition: 150,
                        leftPosition: 108,
                        size: 45,
                        callBackFunction: () {
                          callBackFunction(3);
                        },
                      ),
                      Positioned(
                        top: 200,
                        left: 22,
                        child: Container(
                          height: 10,
                          width: 130,
                          color: Colors.black,
                          child: CarDotLine(),
                        ),
                      ),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: 174,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border(
                        right: BorderSide(color: Colors.red.shade600, width: 4),
                        left: BorderSide(color: Colors.red.shade600, width: 4),
                        bottom:
                            BorderSide(color: Colors.red.shade600, width: 4))),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 2,
                  children: List.generate(
                      newSeats(widget.numberOfSeats),
                      (index) => AdditionalSeats(
                            callBackFunction: () {
                              callBackFunction(index + 4);
                            },
                          )),
                ),
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>const RideHistory()));

              },
              child: const Text(
                "Select Seat",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))
        ],
      ),
    );
  }
}






