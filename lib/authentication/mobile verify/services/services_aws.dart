// import 'package:amazon_cognito_identity_dart_2/cognito.dart';
// import 'package:employee_client_management/authentication/mobile%20verify/config/configurations.dart';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class AuthService {
//   final userPool = CognitoUserPool(AWSConfig.userPoolId, AWSConfig.clientId);

//   final storage = FlutterSecureStorage();

//   Future<CognitoUser?> getUser() async {
//     String? phone = await storage.read(key: "phone");

//     if (phone == null) return null;

//     return CognitoUser(phone, userPool);
//   }

//   Future<bool> signIn(String phoneNumber) async {
//     try {
//       String formattedPhone =
//           phoneNumber.startsWith("+") ? phoneNumber : "+$phoneNumber";

//       await storage.write(key: "phone", value: formattedPhone);

//       await userPool.signUp(formattedPhone, 'Temp@123#', userAttributes: [
//         AttributeArg(name: 'phone_number', value: formattedPhone)
//       ]);

//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<bool> verifyOTP(String phoneNumber, String otp) async {
//     try {
//       CognitoUser cognitoUser = CognitoUser(phoneNumber, userPool);

//       bool confirmed = await cognitoUser.confirmRegistration(otp);

//       if (confirmed) {
//         final authDetails =
//             AuthenticationDetails(username: phoneNumber, password: 'Temp@123#');

//         final session = await cognitoUser.authenticateUser(authDetails);

//         await storage.write(
//             key: "token", value: session!.getAccessToken().getJwtToken());

//         return true;
//       }

//       return false;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<void> logout() async {
//     await storage.deleteAll();
//   }

//   Future<bool> isTokenValid() async {
//     String? token = await storage.read(key: "token");

//     return token != null;
//   }
// }
