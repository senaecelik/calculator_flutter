import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteButton extends StatelessWidget {
  DeleteButton({Key? key, required this.value, required this.funct})
      : super(key: key);

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
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.green[300]),
            )),
        onPressed: () => value == 'C' ? funct() : funct(value));
  }
}
