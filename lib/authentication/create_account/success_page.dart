// import 'package:flutter/material.dart';

// class MembershipSuccessPage extends StatelessWidget {
//   const MembershipSuccessPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200, // Background color of the page
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.9, // Responsive width
//           height: MediaQuery.of(context).size.height * 0.6,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20), // Rounded edges
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 spreadRadius: 3,
//                 blurRadius: 10,
//                 offset: const Offset(0, 3), // Shadow effect
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Top graphic (use any custom asset or shape)
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Colors.blueAccent, Colors.purpleAccent],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.star,
//                   size: 60,
//                   color: Colors.white,
//                 ), // Placeholder for the star shape
//               ),
//               const SizedBox(height: 30),
//               // "You are member now!" text
//               const Text(
//                 "You are\nmember now!",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Description text
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Text(
//                   "All investments will be subject to approval by the fund manager.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               // "I accept" button
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to the next page or perform action
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 ),
//                 child: const Text(
//                   "I accept",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
