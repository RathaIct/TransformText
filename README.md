# TransformText

[TransformText](https://www.pub.dev/packages/animate_text) ជួយលោកអ្នក ក្នុងការធ្វើតួរអក្សរឲ្យមានចលនាតាមការចង់បាន
<br />

[TransformText](https://www.pub.dev/packages/animate_text) helps you to animate text easy with scale, opacity, transform, blur.

<hr />
<p align="center">
  <img src="https://raw.githubusercontent.com/RathaIct/TransformText/main/thumbnail.gif"/>
</p>
<p align="center">
  <a href="https://flutter.io">  
    <img src="https://img.shields.io/badge/Platform-Flutter-yellow.svg"  
      alt="Platform" />  
  </a> 
   <a href="https://pub.dev/packages/animate_text">  
    <img src="https://img.shields.io/pub/v/animate_text.svg"  
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
  animate_text: ^1.0.0
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
import 'package:animate_text/animate_text.dart';
```

## Usage

`TransformText` is a _Stateful Widget_ that produces text animations.
Include it in your `build` method like:

```dart
TransformText(
  "Hello World!",
  style: TextStyle(fontSize: 20),
  type: TransformTextType.bottomToTop,
)
```

### Configurable properties, including:

- `style` – custom text style what you want use TextStyle.
- `type` – default `TransformTextType.bottomToTop` other options:
  - `TransformTextType.none` - no animation transform
  - `TransformTextType.bottomToTop` - animation transform text from bottom to top
  - `TransformTextType.topToBottom` - animation transform text from top to bottom
  - `TransformTextType.leftToRight` - animation transform text from left to right
  - `TransformTextType.bottomLeftToTopRight` - animation transform text from bottom left to top right
  - `TransformTextType.bottomRightToTopLeft` - animation transform text from bottom right to top left
  - `TransformTextType.topLeftToBottomRight` - animation transform text from top left to bottom right
  - `TransformTextType.topRightToBottomLeft` - animation transform text from top right to bottom left
- `withOpacity`- default `false` joint animation opacity if set `true`
- `withBlur`- default `false` joint animation blur if set `true`
- `withRotate`- default `false` joint animation rotate if set `true`
- `withScale`- default `false` joint animation scale if set `true`
- `isScaleOut`- default `false` this option work with `withScale` option if it set to `true`
- `seconds`- default `5` duration run animation
- `isRepeat`- default `true` repeat animation if set `false` it will run only first time.
- `curve`- The curve to use in the forward direction.
- `speed`- default `TransformTextSpeed.medium` other options:
  - `TransformTextSpeed.verySlow` - speed animation run text each character speed very slow
  - `TransformTextSpeed.slow` - speed animation run text each character speed slow
  - `TransformTextSpeed.medium` - speed animation run text each character speed medium
  - `TransformTextSpeed.fast` - speed animation run text each character speed fast
  - `TransformTextSpeed.veryFast` - speed animation run text each character speed very fast

<p align="center">
  <img src="https://raw.githubusercontent.com/RathaIct/TransformText/main/animated_text.gif"/>
</p>
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
