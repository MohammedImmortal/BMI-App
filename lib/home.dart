import 'package:flutter/material.dart';
import 'dart:math';
import '../result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Body Mass Index',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).canvasColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m1Expanded(context, 'male'),
                      const SizedBox(width: 15),
                      m1Expanded(context, 'female'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height',
                            style: Theme.of(context).textTheme.displayMedium),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(heightVal.toStringAsFixed(1),
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                            const SizedBox(width: 5),
                            Text('CM',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Slider(
                          activeColor: Theme.of(context).primaryColor,
                          min: 90,
                          max: 220,
                          value: heightVal,
                          onChanged: (newValue) =>
                              setState(() => heightVal = newValue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m2Expanded(context, 'weight'),
                      const SizedBox(width: 15),
                      m2Expanded(context, 'age'),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    var result = weight / pow(heightVal / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Result(result: result, isMale: isMale, age: age),
                      ),
                    );
                  },
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isMale = (type == 'male') ? true : false),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'male' ? Icons.male : Icons.female, size: 90),
              const SizedBox(height: 12),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
