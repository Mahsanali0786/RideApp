class RideHistoryData {
  const RideHistoryData({
    required this.pickupLocation,
    required this.destination,
    required this.location,
    required this.amount,
  });

  final String pickupLocation;
  final String destination;
  final String location;
  final String amount;
}