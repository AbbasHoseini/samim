import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samim/core/utils/constants.dart';

class PrimaryOutlineButton extends StatelessWidget {
  final String text;
  final Function myFunc;
  final bool isLoading;
  const PrimaryOutlineButton(
      {Key? key,
      required this.text,
      required this.myFunc,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          myFunc();
        },
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: Constants.colorPrimaryMain,
                )),
            backgroundColor: Constants.colorTextOnLightWhite),
        child: isLoading
            ? CupertinoActivityIndicator(color: Constants.colorTextOnLightWhite)
            : Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'PelakFa',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Constants.colorPrimaryMain),
              ),
      ),
    );
  }
}
