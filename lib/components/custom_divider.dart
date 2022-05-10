import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color dividerColor;
  double fontSize;
  double dividerThickness;
  Widget? icon;

  CustomDivider({
    Key? key,
    required this.text,
    required this.textColor,
    required this.dividerColor,
    this.fontSize = 14,
    this.dividerThickness = 0.5,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
              ),
            ),
          ),
          addIcon(),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: dividerColor,
        height: 1.5,
        thickness: dividerThickness,
      ),
    );
  }

  Padding addIcon() {
    if (icon != null) {
      return Padding(
        padding: EdgeInsets.only(right: 10),
        child: Container(height: 30, child: icon),
      );
    }
    return Padding(padding: EdgeInsets.all(0));
  }
}
