import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samim/core/utils/constants.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Function myFunc;
  final bool isLoading;
  const ActionButton(
      {Key? key,
      required this.text,
      required this.myFunc,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21, bottom: 20),
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => myFunc(),
          child: isLoading
              ? CupertinoActivityIndicator(
                  color: Constants.colorPrimaryMain)
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'PelakFa',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Constants.colorTextOnlinght800),
                ),
          // style: ButtonStyle(
          //   textStyle: MaterialStateProperty.all<TextStyle>(
          //       TextStyle(color: colorTextOnlinght800)),
          //       elevation: 0.0,
          //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          //   ),
          //   foregroundColor:
          //       MaterialStateProperty.all<Color>(colorTextOnlinght800),
          //   backgroundColor: MaterialStateProperty.all<Color>(colorTextOnDarkWhite),
          // ),
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                  )),
              backgroundColor: Constants.colorTextOnLightWhite),
        ),
      ),
    );
  }
}
