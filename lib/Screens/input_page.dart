import 'package:bmi_tt9/Screens/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Modal/person.dart';
import '../widgets/containerInfo.dart';
import '../widgets/expended_container.dart';
import '../widgets/navigetor_bar.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Person person = Person(height: 70, weight: 50, age: 20, isMale: false);

  getInitData() {
    person = Person(height: 70, weight: 50, age: 20, isMale: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('BMI CALCULATOR', style: TextStyle(fontSize: 24)),
        ),
        body: Column(
          children: [
            Row(
              children: [
                ExpendedContainer(
                  text: 'Male',
                  icon: Icons.male,
                  gender: () {
                    setState(() {
                      person.isMale = true;
                    });
                  },
                  color:
                      person.isMale == true ? Colors.blueAccent : Colors.grey,
                ),
                ExpendedContainer(
                  text: 'Female',
                  icon: Icons.female,
                  gender: () {
                    setState(() {
                      person.isMale = false;
                    });
                  },
                  color:
                      person.isMale == false ? Colors.pinkAccent : Colors.grey,
                ),
              ],
            ),
            ContainerInfo(
              isCenterWidget: true,
              text: 'HEIGHT',
              sizeFontFirstText: 24,
              sizeFontSecText: 54,
              secText: person.height,
              onChangedValue: (heightValue) {
                person.height = heightValue;
              },
              sliderValue: person.height,
            ),
            Row(
              children: [
                ContainerInfo(
                  text: 'Weight',
                  sizeFontFirstText: 16,
                  sizeFontSecText: 40,
                  onChangedValue: (newWeight) {
                    person.weight = newWeight;
                  },
                  secText: person.weight,
                  sliderValue: person.height,
                ),
                ContainerInfo(
                  text: 'Age',
                  sliderValue: person.height,
                  sizeFontFirstText: 16,
                  sizeFontSecText: 40,
                  secText: person.age,
                  onChangedValue: (newAge) {
                    ///notify the parent on the edit on age
                    setState(() {
                      person.age = newAge;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            NavigetorBar(
              text: "Calculate",
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        gender: person.isMale,
                        bmiResult: calcBmi(),
                        weightResult: calcResult(),
                        advise: showAdvise(),
                      ),
                    )).then((value) {
                  setState(() {
                    getInitData();
                  });
                });
              },
            ),
          ],
        ));
  }

  late double result;
  late String weightResult;
  late String advise;

  String calcBmi() {
    double heightInMeters = person.height / 100.0; // Convert height to meters
    result = person.weight / (heightInMeters * heightInMeters);
    return result.toStringAsFixed(2);
  }

  String calcResult() {
    if (result < 18.5) {
      weightResult = "Underweight";
    } else if (result >= 18.5 && result <= 24.9) {
      weightResult = "Healthy Weight";
    } else if (result >= 25.0 && result <= 29.9) {
      weightResult = "Overweight";
    } else {
      weightResult = "Obesity";
    }
    return weightResult;
  }

  String showAdvise() {
    if (weightResult == "Underweight") {
      advise = "You Must eat very good!. keep going !";
    } else if (weightResult == "Healthy Weight") {
      advise = "You have a Healthy body weight. Great Job";
    } else if (weightResult == "Overweight") {
      advise = "Obs, You must maintain your body. play sport";
    } else {
      advise = "You have an over body weight. Follow a diet ";
    }
    return advise;
  }
}
