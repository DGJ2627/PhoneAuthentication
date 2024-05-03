// import 'dart:developer';
//
// import 'package:astro/screens/HomeScreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_field_style.dart';
// import 'package:otp_text_field/style.dart';
// import '../../constants/ImageString.dart';
// class OTPScreen extends StatefulWidget {
//   final String vericationed;
//
//
//   const OTPScreen({super.key,required this.vericationed});
//
//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }
//
// class _OTPScreenState extends State<OTPScreen> {
//   @override
//   Widget build(BuildContext context) {
//
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     TextEditingController _otpControler = TextEditingController();
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SizedBox(
//         child: Stack(
//           children: [
//             Image.asset(
//               ImageString.image2,
//               fit: BoxFit.cover,
//               height: double.infinity,
//               width: double.infinity,
//               alignment: Alignment.center,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text(
//                         "Enter 6 Digit verification ",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w600),
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         "We will send you a 6-digit verification code to register your mobile number",
//                       ),
//                       const SizedBox(height: 20),
//                       Form(
//                         key: _formKey,
//                         child: SizedBox(
//                           height: 50,
//                           child: OTPTextField(
//                             length: 6,
//                             otpFieldStyle: OtpFieldStyle(),
//                             width: MediaQuery.of(context).size.width,
//                             fieldWidth: 30,
//
//                             style: const TextStyle(
//                                 fontSize: 17,
//                             ),
//                             textFieldAlignment: MainAxisAlignment.spaceAround,
//                             fieldStyle: FieldStyle.underline,
//                             onCompleted: (pin) {
//                               print("Completed: $pin");
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: GestureDetector(
//                           onTap: () async{
//                             FocusScope.of(context).unfocus();
//                             try  {
//                               PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: widget.vericationed,
//                                   smsCode: _otpControler.text.toString());
//                               FirebaseAuth.instance.signInWithCredential(credential).then((value) => Get.to(HomeScreen()));
//                             }
//                                 catch (ex){
//                                    log(ex.toString());
//                                 }
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 50,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               gradient: const LinearGradient(
//                                 colors: [Colors.yellow, Colors.orange],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                                 stops: [0.0, 1.0],
//                                 tileMode: TileMode.clamp,
//                               ),
//                             ),
//                             child: const Text(
//                               "Verify ",
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 18),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               left: -90,
//               bottom: -60,
//               child: SizedBox(
//                 height: 150,
//                 width: 200,
//                 child: Image.asset(ImageString.image4),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../constants/ImageString.dart';
import '../HomeScreen.dart';

class OTPScreen extends StatefulWidget {
  final String vericationed;

  const OTPScreen({Key? key, required this.vericationed}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _otpControler = TextEditingController();

  void initState() {
    super.initState();
    _otpControler = TextEditingController(); // Initialize _otpControler here
  }
  @override
  void dispose() {
    _otpControler.dispose(); // Dispose _otpControler to free up resources
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            ImageString.image2,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Enter 6 Digit verification ",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "We will send you a 6-digit verification code to register your mobile number",
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: SizedBox(
                        height: 50,
                        child: OTPTextField(
                          length: 6,
                          otpFieldStyle: OtpFieldStyle(),
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 30,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            print("Completed: $pin");
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) { // Check if form is valid
                            try {
                              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                                verificationId: widget.vericationed,
                                smsCode: _otpControler.text.toString(),
                              );
                              FirebaseAuth.instance.signInWithCredential(credential).then((value) => Get.to(const HomeScreen()));
                            } catch (ex) {
                              print(ex.toString());
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              colors: [Colors.yellow, Colors.orange],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          child: const Text(
                            "Verify ",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom, // Keyboard height
              ),
            ],
          ),
          Positioned(
            left: -90,
            bottom: -60,
            child: SizedBox(
              height: 150,
              width: 200,
              child: Image.asset(ImageString.image4),
            ),
          ),
        ],
      ),
    );
  }
}
