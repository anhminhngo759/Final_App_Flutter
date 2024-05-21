import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_app_flutter/components/app_bar.dart';
import 'package:final_app_flutter/components/app_elevent_button.dart';
import 'package:final_app_flutter/components/app_text_field.dart';
import 'package:final_app_flutter/form_validator/form_validator.dart';
import 'package:final_app_flutter/page/login_page.dart';
import 'package:final_app_flutter/resources/app_color.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30.0),
              Text(
                'Create Account',
                style: TextStyle(
                    color: AppColor.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Text(
                "Let's Create Account Together",
                style: TextStyle(
                  color: AppColor.grey,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              Text(
                'Your Name',
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppTextField(
                controller: usernameController,
                hintText: 'Your Name',
                iconData: Icons.person,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 30.0),
              Text(
                'Email Address',
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppTextField(
                controller: emailAddressController,
                hintText: 'Email Address',
                iconData: Icons.email,
                textInputAction: TextInputAction.next,
                validator: (value) => provider.emailValidator(value!),
              ),
              const SizedBox(height: 30.0),
              Text(
                'Password',
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppTextField(
                iconData: Icons.lock,
                controller: passwordController,
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
                        builder: (context) => LoginPage(),
                      ),
                    );
                  } else {
                    // Otherwise show a message
                    provider.showSnackBar("Fix the error", context);
                  }
                },
                text: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
