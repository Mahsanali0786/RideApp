

import 'package:flutter/material.dart';
import 'package:rideapp/core/constants/constants.dart';

import '../models/earning_bar_data.dart';
import '../widgets/driver_info_button.dart';
import '../widgets/earning_graph.dart';

class DriverInfo extends StatefulWidget {
  const DriverInfo({super.key});

  @override
  State<DriverInfo> createState() => _DriverInfoState();
}

class _DriverInfoState extends State<DriverInfo> {
  //------------------------List of earning to show in graph
  List<double> weeklyEarning = [100.0, 200, 300, 500, 50.0, 100, 250];
  late EarningBarData barData;
  int focusChanger = 1;
  void callBackFunction(int number) {
    setState(() {
      focusChanger = number;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    barData = EarningBarData(
        weeklyEarning[0],
        weeklyEarning[1],
        weeklyEarning[2],
        weeklyEarning[3],
        weeklyEarning[4],
        weeklyEarning[5],
        weeklyEarning[6]);
    barData.getBarData();
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
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
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
              ),
              const Text(
                'Driver Info.',
                style: pageTitleStyle,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(vertical: 0),
            decoration: BoxDecoration(color: Colors.pink.shade50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DriverInfoButton(
                  callBackFunction: () {
                    callBackFunction(1);
                  },
                  buttonName: 'Earnings',
                  isFocused: focusChanger == 1 ? true : false,
                ),
                DriverInfoButton(
                  callBackFunction: () {
                    callBackFunction(2);
                  },
                  buttonName: 'No. Rides',
                  isFocused: focusChanger == 2 ? true : false,
                ),
                DriverInfoButton(
                  callBackFunction: () {
                    callBackFunction(3);
                  },
                  buttonName: 'Billings',
                  isFocused: focusChanger == 3 ? true : false,
                ),
                DriverInfoButton(
                  callBackFunction: () {
                    callBackFunction(4);
                  },
                  buttonName: 'Reviews',
                  isFocused: focusChanger == 4 ? true : false,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your earnings',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blueGrey.shade100),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up,
                          color: Colors.red,
                          size: 20,
                        ),
                        Text(
                          'this week',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.red),
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 40),
                  child: SizedBox(
                    height: 250,
                    child: EarningGraph(barData: barData.barData),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '200.68.00 zl',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30)),
                        onPressed: () {},
                        child: Text(
                          'withdraw',
                          style: TextStyle(color: Colors.grey.shade50),
                        ))
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
