import 'package:flutter/material.dart';
import 'package:samim/core/utils/constants.dart';
import 'package:samim/core/widgets/buttons/buttons.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('vivvvview model: ');
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(backgroundColor: Constants.colorPrimaryMain),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: [
                    FittedBox(
                      child: Text(
                        'ورود',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: Constants.fontHeadline1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'لطفا شماره موبایل خود را وارد کنید',
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // Consumer<LoginScreenModel>(
                    //   builder: (context, loginVM, child) => 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 4.0, top: 15),
                            child: Text(
                              'شماره موبایل',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                textSelectionTheme: TextSelectionThemeData(
                                    cursorColor:
                                        Constants.colorPrimaryMain),
                              ),
                              child: TextFormField(
                                // controller: loginVM.phone,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '09191234567',
                                  hintStyle: TextStyle(
                                      color: Constants.colorActionOnlightActive),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        // color: loginVM.textFieldBorderColor
                                        ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        // color: loginVM.textFieldBorderColor
                                        ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        width: 1,
                                        // color: loginVM.textFieldBorderColor
                                        ),
                                  ),
                                ),
                                cursorColor: Constants.colorPrimaryMain,
                              ),
                            ),
                          ),
                         Theme(
                            data: Theme.of(context).copyWith(
                              textSelectionTheme: TextSelectionThemeData(
                                  cursorColor:
                                      Constants.colorPrimaryMain),
                            ),
                            child: TextFormField(
                              // controller: loginVM.phone,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'username@mail.com',
                                hintStyle: TextStyle(
                                    color: Constants.colorActionOnlightActive),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      // color: loginVM.textFieldBorderColor
                                      ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      // color: loginVM.textFieldBorderColor
                                      ),

                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      // color: loginVM.textFieldBorderColor
                                      ),
                                ),
                              ),
                              cursorColor: Constants.colorPrimaryMain,
                            ),
                          ),
                          
                          // if (_loginVM.errorText != '')
                          //   Padding(
                          //     padding:
                          //         const EdgeInsets.only(bottom: 8.0, top: 4),
                          //     child: ErrorText(text: _loginVM.errorText),
                          //   ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, bottom: 20.0),
                            child: PrimaryButton(
                              text: 'ادامه',
                              myFunc: () async {
                               
                              },
                              isLoading: false,
                              isActive: true,
                            ),
                          ),
                        ],
                      ),
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
