import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      initialRoute: '/',
      routes: {
        '/': (context) => BMICalculatorInputScreen(),
        '/result': (context) => BMIResultScreen(),
      },
    );
  }
}

class BMICalculatorInputScreen extends StatefulWidget {
  @override
  _BMICalculatorInputScreenState createState() =>
      _BMICalculatorInputScreenState();
}

class _BMICalculatorInputScreenState extends State<BMICalculatorInputScreen> {
  double height = 0; // Initial height in centimeters
  double weight = 0; // Initial weight in kilograms

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter your height (cm):',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  height = double.parse(value) ;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter your weight (kg):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  weight = double.parse(value);
                });
              },
            ),
             const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: {'height': height, 'weight': weight},
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 36),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Calculate BMI',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BMIResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    double height = arguments['height'];
    double weight = arguments['weight'];
    double bmi = weight / ((height / 100) * (height / 100));
    String bmiCategory = getBMICategory(bmi);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your BMI:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$bmi',
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 10),
            const Text(
              'BMI Category:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              bmiCategory,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Text(
                  'Go Back to Input',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}

