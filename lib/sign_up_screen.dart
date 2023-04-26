import 'package:bamboo_g/core/loading_widget.dart';
import 'package:bamboo_g/data/services/sign_up_service.dart';
import 'package:bamboo_g/model/sign_up_request_model.dart';
import 'package:bamboo_g/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool isVisible = true;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(hintText: 'Enter first name'),
                validator: (value) => value!.isEmpty ? 'field require' : null,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(hintText: 'Enter last name'),
                validator: (value) => value!.isEmpty ? 'field require' : null,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(hintText: 'Enter age'),
                validator: (value) => value!.isEmpty ? 'field require' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Enter email'),
                validator: (value) => value!.isEmpty ? 'field require' : null,
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
                validator: (value) => value!.isEmpty ? 'field require' : null,
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(hintText: 'Enter phone number'),
                validator: (value) => value!.isEmpty ? 'field require' : null,
              ),
              SizedBox(
                height: 300,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      signUp();
                    },
                    child: Text('Submit')
                    ),
              ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?? ',
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
                                builder: (context) => SignInScreen()));
                      },
                      child: Text(
                        'Login',
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
      ),
    );
  }

  void signUp() async {
    SignUpModel signUp = SignUpModel(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        age: _ageController.text,
        phoneNumber: _phoneNumberController.text,
        email: _emailController.text,
        password: _passwordController.text);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            ProgressDialog(message: 'Loading...'));
    var response = await RegisterUserService.register(signUp);
    if (response!.message == 'user created successfully') {
      
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SignInScreen()));
    } else {
      Navigator.pop(context);
      print(response.message);
    }
  }
}
