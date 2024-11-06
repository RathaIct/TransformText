# TransformText

[TransformText](https://www.pub.dev/packages/transform_text) helps you to animate transform text when text change.

<hr />
<p align="center">
  <img src="https://raw.githubusercontent.com/RathaIct/TransformText/main/thumbnail.gif"/>
</p>
<p align="center">
  <a href="https://flutter.io">  
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"  
      alt="Platform" />  
  </a> 
   <a href="https://pub.dev/packages/transform_text">  
    <img src="https://img.shields.io/pub/v/transform_text.svg"  
      alt="Pub Package" />  
  </a>
   <a href="https://opensource.org/licenses/MIT">  
    <img src="https://img.shields.io/badge/License-MIT-red.svg"  
      alt="License: MIT" />  
  </a>
   <a href="https://github.com/RathaIct/TransformText/issues">  
    <img src="https://img.shields.io/github/issues/RathaIct/TransformText"  
      alt="Issue" />  
  </a> 
   <a href="https://github.com/RathaIct/TransformText/network">  
    <img src="https://img.shields.io/github/forks/RathaIct/TransformText"  
      alt="Forks" />  
  </a> 
   <a href="https://github.com/RathaIct/TransformText/stargazers">  
    <img src="https://img.shields.io/github/stars/RathaIct/TransformText"  
      alt="Stars" />  
  </a>
</p>
<br />

## Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  transform_text: ^1.0.0
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```bash
$ pub get
```

with `Flutter`:

```bash
$ flutter pub get
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:transform_text/transform_text.dart';
```

## Usage

`TransformText` is a _Stateful Widget_ that produces text animations.
Include it in your `build` method like:

```dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transform_text/transform_text.dart';

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
  String currentTime = "";
  DateFormat f = DateFormat("yyyy-MM-dd h:mm:ss a");

  @override
  void initState() {
    timer = Timer.periodic(const Duration(), (timer) {
      setState(() {
        currentTime = f.format(DateTime.now());
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
        body: TransformText(currentTime)// When current time update animation will update too.
      ),
    );
  }
}

```

### Configurable properties, including:

- `style` – custom text style what you want use TextStyle.
- `type` – default `TransformTextType.scrollUp` other options:
  - `TransformTextType.scrollDown` - animation transform scroll down
  - `TransformTextType.fallDown` - animation transform fall down
  - `TransformTextType.up` - animation transform up
  - `TransformTextType.fade` - animation transform fade
  - `TransformTextType.scaleOut` - animation transform scale out
  - `TransformTextType.scaleIn` - animation transform scale in
  - `TransformTextType.none` - none
- `curve`- The curve to use in the forward direction.

<br />

### Noted

TransformText allow you to use for only one line of text.

## អ្នកបង្កើត

<img src="https://raw.githubusercontent.com/RathaIct/TransformText/main/ratha.jpeg" width="150" />
<hr />
លោក ហ៊ិន រដ្ឋា
Mr. Hin Ratha
<br />
ជំនាញ បង្កើតកម្មវិធីទូរស័ព្ទ
Mobile Apps Developer
<br />
បទពិសោធន៍ Flutter, ReactNative
<br />
ទូរស័ព្ទ 096 659 2250

### គេហទំព័រ

<a href="https://rathadev.site"  target="_blank">Ratha Dev</a>
