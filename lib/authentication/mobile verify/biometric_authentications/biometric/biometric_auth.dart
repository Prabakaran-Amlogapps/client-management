// import 'package:employee_client_management/subcription/subcribe_page.dart';
// import 'package:flutter/material.dart';

// class BiometricAuthScreen extends StatefulWidget {
//   @override
//   _BiometricAuthScreenState createState() => _BiometricAuthScreenState();
// }

// class _BiometricAuthScreenState extends State<BiometricAuthScreen> {
//   final LocalAuthentication auth = LocalAuthentication();

//   Future<void> authenticate() async {
//     bool authenticated = await auth.authenticate(
//         localizedReason: 'Scan your fingerprint to continue');

//     if (authenticated) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => SubcribePage()));
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     authenticate();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text("Authenticate with Biometrics")));
//   }
// }
