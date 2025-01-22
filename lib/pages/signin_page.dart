import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  double? _deviceWidth, _deviceHeight;

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
          // Main Content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: _deviceHeight! * 0.25),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: _deviceHeight! * 0.02,
                  horizontal: _deviceWidth! * 0.05,
                ),
                width: _deviceWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Let's create your account to find your Vehicle",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    // First Name Field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "First Name",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "*",
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: _deviceWidth! * 0.43,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "",
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
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Last Name",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "*",
                                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: _deviceWidth! * 0.43,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "",
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
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "*",
                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: _deviceWidth! * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "",
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "*",
                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: _deviceWidth! * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "",
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Address",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "*",
                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: _deviceWidth! * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "",
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Date of Birth",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "*",
                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: _deviceWidth! * 0.9,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "",
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: _deviceWidth! * 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, "/otp");
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.indigo,
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, "/login");
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _deviceHeight! * 0.05),
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
                    SizedBox(height: 20),
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
        ],
      ),
    );
  }
}
