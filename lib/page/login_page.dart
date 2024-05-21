import 'package:final_app_flutter/components/app_elevent_button.dart';
import 'package:final_app_flutter/form_validator/form_validator.dart';
import 'package:final_app_flutter/page/home_page.dart';
import 'package:final_app_flutter/page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_app_flutter/components/app_bar.dart';
import 'package:final_app_flutter/components/app_text_field.dart';
import 'package:final_app_flutter/resources/app_color.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = true;
  final provider = FormValidator();
  final _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('🌗 Exit!'),
          content: const Text('Do you want to exit?'),
          actions: [
            TextButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                Navigator.pop(context);
              },
              child: const Text('Yes 😭'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No 🥰'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TdAppBar(
        showAvatar: false,
        leftPressed: _showExitDialog,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 40.0).copyWith(top: 20.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Hello Again!',
                    style: TextStyle(
                        fontSize: 28.0,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Welcome Back You've Been Missed!",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: AppColor.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Email Address',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppTextField(
                    onChanged: (value) => {},
                    iconData: Icons.email,
                    controller: _emailAddressController,
                    hintText: 'Email Address',
                    textInputAction: TextInputAction.next,
                    validator: (value) => provider.emailValidator(value!),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppTextField(
                    iconData: Icons.lock,
                    controller: _passwordController,
                    hintText: 'Password',
                    isPassword: _isPasswordVisible,
                    iconPass: _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPass: _togglePasswordVisibility,
                    validator: (value) => provider.passwordValidator(value!),
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 40.0),
                  AppEleventButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If form is validated do this
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      } else {
                        // Otherwise show a message
                        provider.showSnackBar("Fix the error", context);
                      }
                    },
                    text: 'Log In',
                  ),
                  const SizedBox(height: 60.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have An Account?"),
                      GestureDetector(
                        child: Text(
                          'Sign Up For Free',
                          style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
