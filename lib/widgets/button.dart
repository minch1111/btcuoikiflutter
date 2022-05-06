import 'package:flutter/material.dart';
import 'package:flutter_exam/screens/add_new_screen.dart';
import 'package:flutter_exam/theme.dart';

class ButtonNavigator extends StatelessWidget {
  const ButtonNavigator({
    Key? key,
    required this.fixedSize,
    required this.textStyle,
    required this.content,
    required this.route,
    this.args
  }) : super(key: key);

  final MaterialStateProperty<Size?> fixedSize;
  final MaterialStateProperty<TextStyle> textStyle;
  final String content;
  final String route;
  final Object? args;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route, arguments: args);
      },
      child: Text(content),
      style: ButtonStyle(
        fixedSize: fixedSize,
        textStyle: textStyle,
        backgroundColor: MaterialStateProperty.all(Colors.amber),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )
        ),
        elevation: MaterialStateProperty.all(0)
      ),
    );
  }
}