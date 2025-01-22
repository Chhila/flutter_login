import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPConfirmationPage extends StatefulWidget {
  const OTPConfirmationPage({super.key});

  @override
  State<OTPConfirmationPage> createState() => _OTPConfirmationPageState();
}

class _OTPConfirmationPageState extends State<OTPConfirmationPage> {
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
                height: _deviceHeight! * 0.75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm OTP",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Please enter OTP 6-digit code send via SMS to your registered Phone No.*********123",
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
                                Text(
                                  "Enter OTP Code",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: _deviceWidth! * 0.9,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: _deviceWidth! / 7,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1), // Limits input to 1 character
                                            FilteringTextInputFormatter.digitsOnly, // Allows only numeric input
                                          ],
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
                                      Container(
                                        width: _deviceWidth! / 7,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1), // Limits input to 1 character
                                            FilteringTextInputFormatter.digitsOnly, // Allows only numeric input
                                          ],
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
                                      Container(
                                        width: _deviceWidth! / 7,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1), // Limits input to 1 character
                                            FilteringTextInputFormatter.digitsOnly, // Allows only numeric input
                                          ],
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
                                      Container(
                                        width: _deviceWidth! / 7,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1), // Limits input to 1 character
                                            FilteringTextInputFormatter.digitsOnly, // Allows only numeric input
                                          ],
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
                                      Container(
                                        width: _deviceWidth! / 7,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1), // Limits input to 1 character
                                            FilteringTextInputFormatter.digitsOnly, // Allows only numeric input
                                          ],
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
                                      Container(
                                        width: _deviceWidth! / 7,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1), // Limits input to 1 character
                                            FilteringTextInputFormatter.digitsOnly, // Allows only numeric input
                                          ],
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      width: _deviceWidth! * 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.indigo,
                        ),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
