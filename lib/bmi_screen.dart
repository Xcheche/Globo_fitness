import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  late List<bool> isSelected;
  TextEditingController txtHeight = TextEditingController();
  TextEditingController txtWeight = TextEditingController();
  double fontsize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BmiCalculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              isSelected: isSelected,
              onPressed: (int index) {
                setState(() {
                  if (index == 0) {
                    isMetric = true;
                    isImperial = false;
                  } else {
                    isMetric = false;
                    isImperial = true;
                  }
                  isSelected = [isMetric, isImperial];
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Metric',
                    style: TextStyle(fontSize: fontsize),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Imperial',
                    style: TextStyle(fontSize: fontsize),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: isMetric ? 'Height (meters)' : 'Height (inches)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: isMetric ? 'Weight (kilos)' : 'Weight (pounds)',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Calculate BMI and show result
                double height = double.tryParse(txtHeight.text) ?? 0;
                double weight = double.tryParse(txtWeight.text) ?? 0;
                double bmi = calculateBMI(height, weight);
                setState(() {
                  result = 'Your BMI: ${bmi.toStringAsFixed(2)}';
                });
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: fontsize),
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate BMI
  double calculateBMI(double height, double weight) {
    if (isMetric) {
      return weight / (height * height);
    } else {
      return (weight / (height * height)) * 703;
    }
  }
}
