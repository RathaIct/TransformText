import 'package:flutter/material.dart';

class TransformText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TransformTextType type;
  final Curve curves;
  final Duration duration;

  const TransformText(
    this.text, {
    Key? key,
    this.style,
    this.type = TransformTextType.scrollUp,
    this.curves = Curves.linear,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<TransformText> createState() => _TransformTextState();
}

class _TransformTextState extends State<TransformText> {
  late String oldText;

  @override
  void initState() {
    super.initState();
    oldText = widget.text;
  }

  @override
  void didUpdateWidget(covariant TransformText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      oldText = oldWidget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxLength = widget.text.length > oldText.length
        ? widget.text.length
        : oldText.length;
    final paddedNewText = widget.text.padLeft(maxLength);
    final paddedOldText = oldText.padLeft(maxLength);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        maxLength,
        (index) {
          String char = paddedNewText[index];
          String? oldChar =
              index < paddedOldText.length ? paddedOldText[index] : null;

          bool isNewChar = oldChar != char;
          TransformTextType animationType =
              isNewChar ? widget.type : TransformTextType.none;

          return AnimatedSwitcher(
            duration: widget.duration,
            transitionBuilder: (Widget child, Animation<double> animation) =>
                _buildTransition(child, animation, animationType, index, char),
            child: Text(
              char,
              key: ValueKey('$index-$char'),
              style: widget.style,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTransition(
    Widget child,
    Animation<double> animation,
    TransformTextType type,
    int index,
    String char,
  ) {
    final curvedAnimation =
        CurvedAnimation(parent: animation, curve: widget.curves);

    switch (type) {
      case TransformTextType.scrollUp:
        return _slideTransition(
            child, curvedAnimation, Offset(0, 1), Offset(0, -1), index, char);
      case TransformTextType.scrollDown:
        return _slideTransition(
            child, curvedAnimation, Offset(0, -1), Offset(0, 1), index, char);
      case TransformTextType.fallDown:
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
              .animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case TransformTextType.up:
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
              .animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case TransformTextType.fade:
        return FadeTransition(opacity: curvedAnimation, child: child);
      case TransformTextType.scaleOut:
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case TransformTextType.scaleIn:
        return ScaleTransition(
          scale: Tween<double>(begin: 2, end: 1.0).animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      case TransformTextType.none:
      default:
        return child;
    }
  }

  Widget _slideTransition(
    Widget child,
    Animation<double> curvedAnimation,
    Offset inOffset,
    Offset outOffset,
    int index,
    String char,
  ) {
    return SlideTransition(
      position: child.key == ValueKey('$index-$char')
          ? Tween<Offset>(begin: inOffset, end: Offset.zero)
              .animate(curvedAnimation)
          : Tween<Offset>(begin: outOffset, end: Offset.zero)
              .animate(curvedAnimation),
      child: FadeTransition(opacity: curvedAnimation, child: child),
    );
  }
}

enum TransformTextType {
  scrollUp,
  scrollDown,
  fallDown,
  up,
  fade,
  scaleOut,
  scaleIn,
  none, // Added a 'none' type for unchanged characters
}
