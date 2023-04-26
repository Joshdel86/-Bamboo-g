import 'package:bamboo_g/app/presentation/snackbar.dart';
import 'package:bamboo_g/available_items.dart';
import 'package:bamboo_g/data/services/sign_in_service.dart';
import 'package:bamboo_g/data/token_data_storage.dart';
import 'package:bamboo_g/model/sign_in_request_model.dart/log_in_user.dart';
import 'package:bamboo_g/model/sign_in_request_model.dart/register_user.dart';
import 'package:bamboo_g/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'core/loading_widget.dart';
import 'data/services/sign_up_service.dart';
import 'model/sign_up_request_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign in screen'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: 'Enter email'),
                        validator: (value) =>
                            value!.isEmpty ? 'field required' : null,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            hintText: 'Enter password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: isVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            )),
                        validator: (value) =>
                            value!.isEmpty ? 'field required' : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        signInUser(); // SignInService().getSignInService(
                        //     context,
                        //     _emailController.text.trim(),
                        //     _passwordController.text);
                      },
                      child: Text('Sign In')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void signInUser() async {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();
      LogInUserRequestModel signIUser = LogInUserRequestModel(
          email: _emailController.text, password: _passwordController.text);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              ProgressDialog(message: 'Loading...'));
      var response = await LogInService.register(signIUser);
      if (response!.message == 'Login successful') {
        Navigator.pop(context);
        print(response.toString());
        print(response.toString());
        await TokenStorage.storeToken(response.token.toString());
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AvailableItemsScreen()));
      } else {
        Navigator.pop(context);
        showSnackBar(context, Colors.red, response.message);
        // print(response.Message);
      }
    }
  }
}
