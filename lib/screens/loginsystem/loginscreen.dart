// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// import '../../constants/ImageString.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//     TextEditingController phoneNoController = TextEditingController();
//     String? phoneNo;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: [
//               SizedBox(
//                 height: double.infinity,
//                 width: double.infinity,
//                 child: Image.asset(
//                   ImageString.image1,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   height: height * 0.4,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20))),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 40),
//                           child: Text(
//                             "Enter Mobile Number",
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 40),
//                           child: Text(
//                               "We will send you a 4-digit verification code to register your mobile number"),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: SizedBox(
//                             height: 50,
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: const Color(0xff8C0944)),
//                                       borderRadius: BorderRadius.circular(10)),
//                                 ),
//                                 const SizedBox(
//                                   width: 20,
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: const Color(0xff8C0944)),
//                                         borderRadius: BorderRadius.circular(10)),
//                                     child: TextFormField(
//                                       controller: phoneNoController,
//                                       decoration: const InputDecoration(label: Text("Phone No"),prefixIcon: Icon(CupertinoIcons.phone)),
//                                       validator: (value) {
//                                         if (value == null || value.isEmpty) {
//                                           return 'Please enter your phone number';
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 50,
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Container(
//                               height: height * 0.07,
//                               width: width * 0.5,
//                               decoration: BoxDecoration(
//                                 gradient: const LinearGradient(
//                                   colors: [Colors.yellow, Colors.orange],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   stops: [0.0, 1.0],
//                                   tileMode: TileMode.clamp,
//                                 ),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: -34,
//                 bottom: -120,
//                 child: SizedBox(
//                   height: height * 0.4,
//                   width: width * 0.4,
//                   child: Image.asset(ImageString.image4),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:astro/screens/loginsystem/OTPScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../constants/ImageString.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController phoneNoController = TextEditingController();

    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Image.asset(
              ImageString.image1,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                            "Enter Mobile Number",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "We will send you a 4-digit verification code to register your mobile number",
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                     border: Border.all(color: const Color(0xff8C0944)),

                                    ),
                                    child: const Text("+91",style: TextStyle(color: Color(0xff8C0944),fontSize: 18),),
                                  ),

                                  Container(
                                    width: 250,
                                    child: TextFormField(
                                      controller: phoneNoController,
                                      decoration: const InputDecoration(
                                        labelText: "Phone No",
                                        prefixIcon: Icon(CupertinoIcons.phone),
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your phone number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () async{

                                if (_formKey.currentState!.validate()) {
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                      verificationCompleted: (PhoneAuthCredential credential ){

                                      },
                                      verificationFailed: (FirebaseAuthException ex){},
                                      codeSent: (String verification, int? resendtoken){
                                        Get.to( OTPScreen(vericationed: verification,));
                                      },
                                      codeAutoRetrievalTimeout: (String verification){},
                                    phoneNumber: "+91${phoneNoController.text}",
                                  );
                                  // Submit your form or perform any necessary action
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
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
                                  "Generate ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }
}
