import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transform_text/transform_text_animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? timer;
  String currentTimer = "";
  DateFormat f = DateFormat("yyyy-MM-dd h:mm:ss a");
  int counter = 0;
  bool isIncrement = true;
  bool isCheckin = true;

  void toggleCheckin() {
    setState(() {
      isCheckin = !isCheckin;
    });
  }

  void increment() {
    setState(() {
      isIncrement = true;
      counter++;
    });
  }

  void decrement() {
    setState(() {
      isIncrement = false;
      counter--;
    });
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(), (timer) {
      setState(() {
        currentTimer = f.format(DateTime.now());
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TransformText"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildRow(
                  "TransformTextType.scrollUp",
                  child: TransformText(currentTimer),
                ),
                _buildRow(
                  "TransformTextType.scaleIn",
                  child: TransformText(
                    currentTimer,
                    type: TransformTextType.scaleIn,
                  ),
                ),
                _buildRow(
                  "TransformTextType.scaleOut",
                  child: TransformText(
                    currentTimer,
                    type: TransformTextType.scaleOut,
                  ),
                ),
                _buildRow(
                  "TransformTextType.scrollDown",
                  child: TransformText(
                    currentTimer,
                    type: TransformTextType.scrollDown,
                  ),
                ),
                _buildRow(
                  "TransformTextType.fade",
                  child: TransformText(
                    currentTimer,
                    type: TransformTextType.fade,
                  ),
                ),
                _buildRow(
                  "TransformTextType.fallDown",
                  child: TransformText(
                    currentTimer,
                    type: TransformTextType.fallDown,
                  ),
                ),
                _buildRow(
                  "TransformTextType.up",
                  child: TransformText(
                    currentTimer,
                    type: TransformTextType.up,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        TransformText(
                          isIncrement ? "Increment" : "Decrement",
                          type: TransformTextType.fallDown,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TransformText(
                              "$counter",
                              type: !isIncrement
                                  ? TransformTextType.scrollUp
                                  : TransformTextType.scrollDown,
                            ),
                            IconButton(
                              onPressed: decrement,
                              icon: const Icon(Icons.remove),
                            ),
                            IconButton(
                              onPressed: increment,
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, {required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("$label: "),
          child,
        ],
      ),
    );
  }
}
