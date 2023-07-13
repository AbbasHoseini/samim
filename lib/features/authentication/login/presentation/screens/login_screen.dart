import 'package:flutter/material.dart';
import 'package:samim/core/utils/constants.dart';
import 'package:samim/core/utils/email_validator.dart';
import 'package:samim/core/utils/password_validator.dart';
import 'package:samim/core/widgets/buttons/buttons.dart';
import 'package:provider/provider.dart';
// import 'package:samim/features/authentication/login/data/data_source/local/api_provider.dart';
import 'package:samim/features/authentication/login/data/data_source/remote/api_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isButtonActive = false;

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
                        // AppLocalizations.of(context)!.loginTitle,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4.0, top: 15),
                          child: Text(
                            'ایمیل',
                          ),
                        ),
                        Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.always,
                          onChanged: () {
                            setState(() {
                              _isButtonActive =
                                  _formKey.currentState?.validate() ?? false;
                            });
                          },
                          child: Column(
                            children: [
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
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'لطفاً ایمیل خود را وارد کنید';
                                      }
                                      if (!EmailValidator.validate(value)) {
                                        return 'لطفا یک ایمیل معتبر وارد کنید';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      // _email = value;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'abbas@gmail.com',
                                      hintStyle: TextStyle(
                                          color: Constants
                                              .colorActionOnlightActive),
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
                                      cursorColor: Constants.colorPrimaryMain),
                                ),
                                child: TextFormField(
                                  // controller: loginVM.phone,
                                  textAlign: TextAlign.start,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'لطفاً پسورد خود را وارد کنید';
                                    }
                                    if (value.length < 8) {
                                      return 'پسورد باید بیش از ۸ کاراکتر باشد';
                                    }
                                    if (!PasswordValidator.validate(value)) {
                                      return 'باید از حروف لاتین و حروف بزرگ و کوچک استفاده کنید';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    // _email = value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Abbas123',
                                    hintStyle: TextStyle(
                                      color: Constants.colorActionOnlightActive,
                                    ),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 30.0, bottom: 20.0),
                          child: PrimaryButton(
                            text: 'ادامه',
                            myFunc: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Future.delayed(Duration(seconds: 3), () async{
                                  // ApiProvider? apiProvider = ApiProvider();
                                  // final res = apiProvider.getUserData();
                                  ApiProvider apiProvider = ApiProvider();
                                  final res = await apiProvider.getCountries();
                                  print(' data statusCode ${res.statusCode}');
                                });
                              }
                            },
                            isLoading: false,
                            isActive: _isButtonActive,
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
