import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samim/core/utils/constants.dart';


class PrimaryButton extends StatelessWidget {
  final String text;
  final Function myFunc;
  final bool isLoading;
  final bool isActive;
  Color? color;
  PrimaryButton({
    Key? key,
    required this.text,
    required this.myFunc,
    required this.isLoading,
    required this.isActive,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (isActive) {
            myFunc();
          } else {
            return;
          }
        },
        child: isLoading
            ? CupertinoActivityIndicator(color: Constants.colorTextOnLightWhite)
            : Text(
                text,
                style: TextStyle(
                    fontFamily: 'PelakFa',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(color: Constants.colorTextOnLightWhite)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(isActive
              ? Constants.colorTextOnLightWhite
              : Constants.colorActionOnlighDisabled),
          backgroundColor: MaterialStateProperty.all<Color>(isActive
              ? color != null
                  ? color!
                  : Constants.colorPrimaryMain
              : Constants.colorActionOnlightSelected),
          shadowColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      ),
    );
  }
}
