import 'earning_bar.dart';

class EarningBarData {
  final double sunEarning;
  final double monEarning;
  final double tueEarning;
  final double wedEarning;
  final double thuEarning;
  final double friEarning;
  final double satEarning;

  EarningBarData(this.sunEarning, this.monEarning, this.tueEarning,
      this.wedEarning, this.thuEarning, this.friEarning, this.satEarning);

  List<EarningBar> barData = [];

  void getBarData() {
    barData = [
      EarningBar(x: 0, y: sunEarning),
      EarningBar(x: 1, y: monEarning),
      EarningBar(x: 2, y: tueEarning),
      EarningBar(x: 3, y: wedEarning),
      EarningBar(x: 4, y: thuEarning),
      EarningBar(x: 5, y: friEarning),
      EarningBar(x: 6, y: satEarning),
    ];
  }
}
