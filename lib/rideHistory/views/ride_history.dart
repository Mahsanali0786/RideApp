import 'package:flutter/material.dart';
import 'package:rideapp/rideHistory/widgets/ride_history_card.dart';
import '../../core/constants/constants.dart';
import '../models/ride_history_model.dart';

class RideHistory extends StatefulWidget {
  const RideHistory({super.key});

  @override
  State<RideHistory> createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  List<RideHistoryData> rideHistoryData = [
    const RideHistoryData(
        pickupLocation: 'Grozow',
        destination: 'Berlin Airport',
        location: 'Germany',
        amount: '45.99'),
    const RideHistoryData(
        pickupLocation: 'Newyork',
        destination: 'Airport',
        location: 'England',
        amount: '50.00'),
    const RideHistoryData(
        pickupLocation: 'Islamabad',
        destination: 'Airport',
        location: 'Pakistan',
        amount: '1.99'),
    const RideHistoryData(
        pickupLocation: 'Grozow',
        destination: 'Berlin Airport',
        location: 'Germany',
        amount: '45.99'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Ride History",
          style: pageTitleStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: rideHistoryData.length,
          itemBuilder: (BuildContext context, int index) {
            RideHistoryData rideHistory = rideHistoryData[index];
            return  RisdeHistoryCard(
              pickupLocation: rideHistory.pickupLocation,
              destination: rideHistory.destination,
              location: rideHistory.location,
              amount: rideHistory.amount,
            );
          },
        ),
      ),
    );
  }
}




