import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.value,
    required this.funct,
  }) : super(key: key);

  final String value;
  final Function funct;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Container(
            alignment: Alignment.center,
            width: 90,
            height: 90,
            child: Text(
              value,
              style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.w400),
            )),
        onPressed: () => value == '=' ? funct() : funct(value));
  }
}
