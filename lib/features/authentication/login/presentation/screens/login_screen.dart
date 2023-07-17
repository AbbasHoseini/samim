import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:samim/core/app_route.dart';
import 'package:samim/core/utils/constants.dart';
import 'package:samim/core/utils/email_validator.dart';
import 'package:samim/core/utils/password_validator.dart';
import 'package:samim/core/widgets/buttons/buttons.dart';
// import 'package:samim/features/authentication/login/data/data_source/local/api_provider.dart';
import 'package:samim/features/authentication/login/data/data_source/remote/remote_api_provider.dart';
import 'package:samim/features/authentication/login/data/models/email_password_params_model.dart';
import 'package:samim/features/authentication/login/presentation/bloc/home_bloc.dart';
import 'package:samim/features/authentication/login/presentation/bloc/login_status.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();

  bool _isButtonActive = false;
  late FToast fToast;

  _showToast(String errorMessage) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.close,
            color: Constants.colorOnLightWhite,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            errorMessage,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Constants.colorOnLightWhite),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fToast = FToast();
    fToast.init(context);
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // showToast() {
  //   Widget toast = Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  //       decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(25.0),
  //       color: Colors.greenAccent,
  //       ),
  //       child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //           Icon(Icons.check),
  //           SizedBox(
  //           width: 12.0,
  //           ),
  //           Text("This is a Custom Toast"),
  //       ],
  //       ),
  //   );
  // }

  // fToast.showToast(
  //     child: toast,
  //     gravity: ToastGravity.BOTTOM,
  //     toastDuration: Duration(seconds: 2),
  // );

  // // Custom Toast Position
  // fToast.showToast(
  //     child: toast,
  //     toastDuration: Duration(seconds: 2),
  //     positionedToastBuilder: (context, child) {
  //       return Positioned(
  //         child: child,
  //         top: 16.0,
  //         left: 16.0,
  //       );
  //     });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                                    controller: email,
                                    key: const Key('email'),
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (email) =>
                                        EmailValidator.validate(email!),
                                    onSaved: (value) {
                                      // email = value;
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
                                  controller: password,
                                  textAlign: TextAlign.start,
                                  key: const Key('password'),
                                  validator: (password) => PasswordValidator.validate(password!),
                                  onSaved: (value) {
                                    // password = value;
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
                          child: BlocConsumer<HomeBloc, HomeBlocState>(
                            builder: (context, state) {
                              return PrimaryButton(
                                text: 'ادامه',
                                myFunc: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    BlocProvider.of<HomeBloc>(context).add(
                                      LoadLoginEvent(EmailPasswordParams(
                                          email.text, password.text)),
                                    );
                                  }
                                },
                                isLoading: state.loginStatus is LoginLoading,
                                isActive: _isButtonActive,
                              );
                            },
                            listener: (context, state) {
                              if (state.loginStatus is LoginError) {
                                final loginError =
                                    state.loginStatus as LoginError;
                                _showToast(loginError.message);
                              } else if (state.loginStatus is LoginCompleted) {
                                context.pushNamed(Routes.root.name);
                              }
                            },
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
