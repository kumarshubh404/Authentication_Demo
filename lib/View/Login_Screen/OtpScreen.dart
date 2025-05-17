import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<StatefulWidget> createState() => _Otp_Screen();

}

class _Otp_Screen extends State<Otpscreen> {

  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateOtp() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP is valid: ${_otpController.text}")),
      );
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
                child: SizedBox (
                    height: 46,
                    width: 46,
                    child:
                    IconButton(
                      icon: Image.asset(
                        'assets/images/Back.png',
                        fit: BoxFit.cover,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      // adjust size as needed
                      splashRadius: 24, // optional
                    )


                    ),
              ),
            ],
          ),
           const Padding(
             padding: EdgeInsets.only(top: 18.0, bottom: 16),
             child: Text('OTP Verification', style: TextStyle(
               fontFamily: "Poppins",
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),),
           ),
           const Text('Enter the verification code we just sent on your\n email address.',
             style: TextStyle(
             fontFamily: "Poppins",
             fontSize: 14,
             fontWeight: FontWeight.normal,
           ),textAlign: TextAlign.center,),
            const SizedBox(height: 34,),
          PinCodeTextField(
        appContext: context,
        length: 4,
        controller: _otpController,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        validator: (value) {
          if (value == null || value.length != 4) {
            return "Please enter 4 digits";
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
          fieldOuterPadding: const EdgeInsets.only(right: 20, left: 20),
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
                onPressed: _validateOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  foregroundColor: Colors.white, // Text/icon color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                child: const Text('VERIFY', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Colors.white,
                ),
                ),
              ),
            ),
          ),        ],
      ),
    );
  }

}