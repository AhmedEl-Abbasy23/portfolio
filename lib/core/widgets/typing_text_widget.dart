import 'package:flutter/material.dart';
import 'package:portfolio/exports.dart';

class TypingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int? milliseconds;

  const TypingText({
    super.key,
    required this.text,
    required this.style,
    this.milliseconds,
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  String _displayedText = '';
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    Future.delayed(
      Duration(milliseconds: widget.milliseconds ?? 100),
      () {
        if (_index < widget.text.length) {
          setState(() {
            _displayedText += widget.text[_index];
            _index++;
          });
          _startTyping();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(_displayedText, style: widget.style);
  }
}

class TypingTwoTexts extends StatefulWidget {
  final String text1;
  final TextStyle style1;
  final String text2;
  final TextStyle style2;

  const TypingTwoTexts({
    super.key,
    required this.text1,
    required this.style1,
    required this.text2,
    required this.style2,
  });

  @override
  State<TypingTwoTexts> createState() => _TypingTwoTextsState();
}

// Two Texts Typing --------****** |||| ****** \\

class _TypingTwoTextsState extends State<TypingTwoTexts> {
  String _displayedText1 = '';
  String _displayedText2 = '';
  int _index1 = 0;
  int _index2 = 0;

  @override
  void initState() {
    super.initState();
    _startTypingFirst();
  }

  void _startTypingFirst() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_index1 < widget.text1.length) {
        setState(() {
          _displayedText1 += widget.text1[_index1];
          _index1++;
        });
        _startTypingFirst();
      } else {
        _startTypingSecond();
      }
    });
  }

  void _startTypingSecond() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_index2 < widget.text2.length) {
        setState(() {
          _displayedText2 += widget.text2[_index2];
          _index2++;
        });
        _startTypingSecond();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(_displayedText1, style: widget.style1),
        20.pw,
        Text(_displayedText2, style: widget.style2),
      ],
    );
  }
}
