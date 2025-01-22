import 'package:flutter/material.dart';

import '../services/http_services.dart';
import '../services/token_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceWidth, _deviceHeight;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: _deviceHeight! * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/moto.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login Form
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: _deviceHeight! * 0.2), // Adjusted top padding to bring the form closer
              child: Container(
                width: _deviceWidth,
                height: _deviceHeight! * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _deviceWidth! * 0.05,
                    vertical: _deviceHeight! * 0.02,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Welcome back, please login to your account",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      _loginFormField(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      _loginButton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(context, '/signin');
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: _deviceHeight! * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: _deviceWidth! * 0.25,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          const Text(
                            "Or Connect With",
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: _deviceWidth! * 0.25,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/facebook.png'),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/google.png'),
                            iconSize: 40,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/apple.png'),
                            iconSize: 40,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/instagram.png'),
                            iconSize: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: _deviceWidth! * 0.9,
      child: ElevatedButton(
        onPressed: () {
          _loginUser();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.indigo,
        ),
        child: const Text(
          "Log In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _loginFormField() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _phoneNumberTextForm(),
          SizedBox(height: 20),
          Text(
            "Password",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          _passwordFormField(),
        ],
      ),
    );
  }

  Widget _phoneNumberTextForm() {
    return TextFormField(
      controller: _emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter an email address";
        } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
          return "Please enter a valid email address";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "example@gmail.com",
        filled: true,
        fillColor: Color.fromRGBO(235, 243, 246, 1.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _passwordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_showPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter a password";
        } else if (value.length < 8) {
          return "Your password must be at least 8 characters";
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
        ),
        hintText: "12345678",
        filled: true,
        fillColor: Color.fromRGBO(235, 243, 246, 1.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  void _loginUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String email = _emailController.text;
      String password = _passwordController.text;

      // Show a loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      String? token = await HttpService.userLogin(email, password);
      Navigator.of(context).pop();
      if (token != null) {
        // Navigate to the home page on successful login
        await TokenManager.saveCredentials(email, token);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please check your credentials.')),
        );
      }
    }
  }
}
