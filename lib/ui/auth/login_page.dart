import 'package:codeland_task/controller/auth_controller.dart';
import 'package:codeland_task/route.dart';
import 'package:codeland_task/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/functions.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});


  final RxBool showPassword = false.obs;
  final AuthController authController = Get.find<AuthController>();
  final _loginFormKey = GlobalKey<FormState>(); // Declare outside build method

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    String? fieldValidator(String? text) {
      if (text == null || text.isEmpty) {
        return "Field can't be empty";
      }
      return null;
    }

    onLogin() {
      if (_loginFormKey.currentState!.validate()) {
        authController.login();

      }
    }

    showPasswordPressed() {
      showPassword.value = !showPassword.value;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _loginFormKey,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Image.asset(
                          codeLandTextLogoPath,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          codeLandLogoPath,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Biomedical  Kiosk",
                            style: getTextStyle(fw: FontWeight.w500, fs: 20)),
                        Text("for HCE’s",
                            style: getTextStyle(
                                fw: FontWeight.w500, fs: 10, fc: focusColor)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getLRTBPadding(),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: getInputDecoration(
                        labelText: 'Username',
                      ),
                      validator: fieldValidator,
                    ),
                  ),
                  Padding(
                    padding: getLRTBPadding(),
                    child: Obx(
                      () => TextFormField(
                        obscureText: showPassword.value,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: getInputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: showPasswordPressed,
                                icon: Icon(showPassword.value
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined))),
                        validator: fieldValidator,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getLRTBPadding(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          onPressed: onLogin,
                          style: getElevatedButtonStyle(),
                          child: Padding(
                            padding: getLRTBPadding(),
                            child: Text(
                              "Login",
                              style: getTextStyle(
                                  fw: FontWeight.w600, fs: 24, fc: Colors.white),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: getLRTBPadding(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "For Assistance & Login Details Contact: ",
                          style: getTextStyle(),
                        ),
                        RichText(
                          text: TextSpan(
                            style: getTextStyle(),
                            children: [
                              const TextSpan(
                                text: "English, Kannada & Telugu :  ",
                              ),
                              TextSpan(
                                text: "7406333800",
                                style: getTextStyle(
                                    fc: focusColor,
                                    decor: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                        // TextSpan(
                        //  text: "  ",
                        //  children: [Text("English, Kannada & Telugu :  7406333800", ),]),
                        RichText(
                          text: TextSpan(
                            style: getTextStyle(),
                            children: [
                              const TextSpan(
                                text: "English, Kannada & Hindi    :  ",
                              ),
                              TextSpan(
                                text: "9071386515",
                                style: getTextStyle(
                                    fc: focusColor,
                                    decor: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                        // const Text("English, Kannada & Hindi    :  9071386515"),
                        SizedBox(
                          height: height * 0.1,
                        ),
                      ],
                    ),
                  ),
                   Center(
                      child:
                          Text("v1.7 © 2023 Copeland Info-solutions Pvt Ltd.", style: getTextStyle(),)),
                ]),
          ),
        ),
      ),
    );
  }
}
