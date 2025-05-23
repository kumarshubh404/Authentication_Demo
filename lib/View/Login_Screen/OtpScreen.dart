import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Home/Home_Screen.dart';

class Otpscreen extends StatefulWidget {
  final String verificationId;

  // Constructor
  const Otpscreen({super.key, required this.verificationId});

  @override
  State<StatefulWidget> createState() => _Otp_Screen();
}

class _Otp_Screen extends State<Otpscreen> {
  final TextEditingController _otpController = TextEditingController();

  void _verifyOtp() {
    String otp = _otpController.text.trim();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter all 6 digits")),
      );
      return;
    }
    signInWithOTP(widget.verificationId, otp);
  }

  void signInWithOTP(String verificationId, String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      print('User signed in!');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      print('Login failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 81.0, left: 20),
                child: SizedBox(
                    height: 46,
                    width: 46,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/Back.png',
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      // adjust size as needed
                      splashRadius: 24, // optional
                    )),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, bottom: 16),
            child: Text(
              'OTP Verification',
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            'Enter the verification code we just sent on your\n email address.',
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 34,
          ),
          PinCodeTextField(
            appContext: context,
            length: 6,
            controller: _otpController,
            keyboardType: TextInputType.number,
            animationType: AnimationType.fade,
            validator: (value) {
              if (value == null || value.length != 6) {
                return "Please enter 6 digits";
              }
              return null;
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(12),
              fieldHeight: 50,
              fieldWidth: 50,
              activeColor: Colors.white,
              selectedColor: Colors.white,
              inactiveColor: Colors.white,
              activeFillColor: Colors.white,
              selectedFillColor: Colors.white,
              inactiveFillColor: Colors.white,
              errorBorderColor: Colors.red,
              disabledColor: Colors.grey,
              fieldOuterPadding: const EdgeInsets.only(right: 16, left: 16),
            ),
            enableActiveFill: true,
            onChanged: (value) {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16, top: 34),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _verifyOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  foregroundColor: Colors.white, // Text/icon color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'VERIFY',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
