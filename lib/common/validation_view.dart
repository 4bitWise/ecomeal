import 'package:ecomeal/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class Validation_v extends StatefulWidget {

  const Validation_v({super.key});

  @override
  State<Validation_v> createState() {
    return _ValidatepageState();
  }
}

class _ValidatepageState extends State<Validation_v> {

  double _currentValue = 100;
  final double _minValue = 50;
  String? _errorText;
  double get deposit => _currentValue - (_currentValue * 0.10);
  double get advance => _currentValue + (_currentValue * 0.10);

  void _onValueChanged(double value) {
    setState(() {
      _currentValue = value;
      if (value < _minValue) {
        _errorText = 'Minimum 50 €';
      } else {
        _errorText = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),

            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 10,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // end Icon

            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            const Text("Mon budget alimentaire(€)",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.04),


            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.05,
              child: SpinBox(
                min: 50,
                max: 10000,
                value: 100,
                step: 1,
                decimals: 0,
                onChanged: _onValueChanged,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),

            if (_errorText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorText!,
                  style: TextStyle(color: Colors.red),
                ),
              ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              // height: MediaQuery.of(context).size.height * 0.05,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'La liste de course sera générée dans la tranche allant de ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    TextSpan(
                      text: '${deposit.toStringAsFixed(0)}€',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    TextSpan(
                      text: ' à ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    TextSpan(
                      text: '${advance.toStringAsFixed(0)}€',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.15),

            ElevatedButton(onPressed: (_currentValue >= _minValue) ? () {
              Navigator.pushNamed(context, RoutePaths.startup);
            } : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.6, MediaQuery.of(context).size.height*0.05),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.blue, width: 2),
                ),
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              child: Text("Valider", style: TextStyle(color: Colors.blue, fontSize: 20),),)

          ],
        ),
      ),
    );
  }
}