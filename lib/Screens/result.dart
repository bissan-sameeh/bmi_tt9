import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contants.dart';
import '../widgets/navigetor_bar.dart';

class Result extends StatefulWidget {
  final bool gender;
  final String bmiResult;
  final String weightResult;
  final String advise;

  Result({
    Key? key,
    required this.gender,
    required this.bmiResult,
    required this.weightResult,
    required this.advise,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_outlined),
        centerTitle: true,
        title: const Text('BMI CALCULATOR', style: TextStyle(fontSize: 24)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                width: double.infinity,
                decoration: decoration2,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.weightResult,
                        style: const TextStyle(
                            color: Color(0xff14F38F), fontSize: 24),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        widget.bmiResult,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 70),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Normal Bmi range:",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff868791)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "18,4 - 25 kg/m2",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        widget.advise,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: decoration,
                        padding: const EdgeInsets.all(24),
                        margin: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 16),
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: const Text(
                          "Save Result",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            NavigetorBar(
                text: "Re-calculate Your Bmi",
                function: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
