import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Function onClicked;
  final Color buttonColor;

  ButtonWidget(
      {@required this.buttonName,
      @required this.onClicked,
      this.buttonColor = Colors.blueAccent});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 75, vertical: 20),
      child: Material(
        color: Colors.black,
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: MaterialButton(
          onPressed: onClicked,
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
