import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = false;
  bool isFemale = false;
  final double _iconsize = 40.0;
  int ageValue = 0;
  double weightValue = 0;
  double sliderValue = 0;
  final Color myPrimaryColor = const Color(0xFF13193B);
  final Color buttonColor = const Color(0xFFFFFFFF);
  Color originalColor = Colors.black;
  Color selectedColor = Colors.white;
  Color currentColor = Colors.black;

  double resultBMI = 0;

  @override
  Widget build(BuildContext context) {
    double genderSize = MediaQuery.of(context).size.width * 0.4;

    return Scaffold(
      backgroundColor: const Color(0xFF090C22),
      appBar: AppBar(
        backgroundColor: myPrimaryColor,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Card(
                    color: const Color(0xFF282C4F),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = true;
                                isFemale = false;
                                if (currentColor == originalColor) {
                                  currentColor = selectedColor;
                                } else {
                                  currentColor = originalColor;
                                  isMale = false;
                                }
                              });
                            },
                            child: Icon(
                              Icons.male,
                              size: genderSize,
                              color: isMale ? currentColor : originalColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Card(
                    color: const Color(0xFF282C4F),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFemale = true;
                                isMale = false;
                                if (currentColor == originalColor) {
                                  currentColor = selectedColor;
                                } else {
                                  currentColor = originalColor;
                                  isFemale = false;
                                }
                              });
                            },
                            child: Icon(
                              Icons.female,
                              size: genderSize,
                              color: isFemale ? currentColor : originalColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                const Text(
                  'Height',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF858690),
                  ),
                ),
                Text(
                  "${sliderValue.toStringAsFixed(1)} m",
                  style: const TextStyle(
                    fontSize: 34,
                    color: Color(0xffffffff),
                  ),
                ),
                Slider(
                  value: sliderValue,
                  min: 0,
                  max: 3,
                  divisions: 30,
                  activeColor: const Color(0xFFEA1556),
                  inactiveColor: const Color(0xFF858690),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Card(
                    color: myPrimaryColor,
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF858690),
                            ),
                          ),
                          Text(
                            "${weightValue.toStringAsFixed(1)} KG",
                            style: const TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    weightValue = weightValue - 10;
                                  });
                                },
                                iconSize: _iconsize,
                                icon: const Icon(Icons.remove_circle),
                                color: buttonColor,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    weightValue = weightValue + 10;
                                  });
                                },
                                iconSize: _iconsize,
                                icon: const Icon(Icons.add_circle),
                                color: buttonColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Card(
                    color: myPrimaryColor,
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF858690),
                            ),
                          ),
                          Text(
                            ageValue.toString(),
                            style: const TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    ageValue = ageValue - 1;
                                  });
                                },
                                icon: const Icon(Icons.remove_circle),
                                iconSize: _iconsize,
                                color: buttonColor,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    ageValue = ageValue + 1;
                                  });
                                },
                                icon: const Icon(Icons.add_circle),
                                iconSize: _iconsize,
                                color: buttonColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFEA1556))),
              onPressed: () {
                setState(() {
                  if (isMale == true || isFemale == true) {
                    resultBMI = weightValue / (sliderValue * sliderValue);
                    debugPrint(resultBMI.toStringAsFixed(2));
                  } else {
                    debugPrint("Error");
                  }
                });
              },
              child: const Text("CALCULATE YOUR BMI"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                "Your BMI is ${resultBMI.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
