// import 'package:employee_client_management/authentication/mobile%20verify/biometric_authentications/biometric/biometric_auth.dart';
// import 'package:employee_client_management/authentication/mobile%20verify/services/services_aws.dart';
// import 'package:flutter/material.dart';

// import 'package:pin_code_fields/pin_code_fields.dart';

// class OTPVerificationScreen extends StatefulWidget {
//   final String phoneNumber;

//   OTPVerificationScreen({required this.phoneNumber});

//   @override
//   _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
// }

// class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
//   final AuthService _authService = AuthService();

//   String otp = '';

//   Future<void> verify() async {
//     bool verified = await _authService.verifyOTP(widget.phoneNumber, otp);

//     if (verified) {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) => BiometricAuthScreen()));
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Invalid OTP')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           PinCodeTextField(
//               appContext: context,
//               length: 6,
//               onChanged: (value) => otp = value),
//           ElevatedButton(onPressed: verify, child: Text('Verify OTP')),
//         ],
//       ),
//     );
//   }
// }
