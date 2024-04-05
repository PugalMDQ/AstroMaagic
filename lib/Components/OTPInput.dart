import 'package:astromaagic/Components/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController? controller;
  final bool? autoFocus;
  final bool? isNextFocus;

  OtpInput({
    this.controller,
    this.isNextFocus = true,
    this.autoFocus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 55,
      child: TextField(
        style: TextStyle(
          color: AppTheme.textColor,
          fontWeight: FontWeight.w400,
          // fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 14,
        ),
        autofocus: autoFocus!,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.labelColor),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onChanged: (value) {
          if (isNextFocus!) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          }
        },
      ),
    );
  }
}
