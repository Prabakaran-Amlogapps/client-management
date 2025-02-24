// import 'package:employee_client_management/authentication/mobile%20verify/screen/otp_screen.dart';
// import 'package:employee_client_management/authentication/mobile%20verify/services/services_aws.dart';
// import 'package:flutter/material.dart';

// import 'package:intl_phone_field/intl_phone_field.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final AuthService _authService = AuthService();

//   String completePhoneNumber = '';

//   Future<void> sendOTP() async {
//     bool success = await _authService.signIn(completePhoneNumber);

//     if (success) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) =>
//                   OTPVerificationScreen(phoneNumber: completePhoneNumber)));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to send OTP. Try again.')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             IntlPhoneField(
//               decoration: InputDecoration(labelText: 'Phone Number'),
//               initialCountryCode: 'IN',
//               onChanged: (phone) => completePhoneNumber = phone.completeNumber,
//             ),
//             ElevatedButton(onPressed: sendOTP, child: Text('Send OTP')),
//           ],
//         ),
//       ),
//     );
//   }
// }
