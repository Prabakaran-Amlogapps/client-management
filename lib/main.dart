import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:employee_client_management/authentication/create_account/Mobile_login.dart';
import 'package:employee_client_management/authentication/mobile%20verify/biometric_authentications/biometric/biometric_auth.dart';
import 'package:employee_client_management/authentication/mobile%20verify/screen/login_screen.dart';
import 'package:employee_client_management/authentication/mobile%20verify/services/services_aws.dart';
import 'package:employee_client_management/dashboard/Dash_board.dart';
import 'package:employee_client_management/employee_content/employee_components/employee/services/service_locator.dart';
import 'package:employee_client_management/subcription/subcription_page/subscrip_pages.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

// Razorpay configuration
const String RAZORPAY_KEY = 'rzp_test_JDsXimAMENWZ4Y';
const String RAZORPAY_SECRET = 'Hlrb9YJhhmvHF6TRDH3qy4Df';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure both Amplify and Razorpay
  await Future.wait([
    configureAmplify(),
    initializeRazorpay(),
  ]);
    setupServiceLocator();


  runApp( MyApp());
}

Future<void> configureAmplify() async {
  try {
    // Initialize Amplify plugins
    final dataStorePlugin = AmplifyDataStore(
      modelProvider: ModelProvider.instance,
    );

    final apiPlugin = AmplifyAPI();

    await Future.wait([
      Amplify.addPlugin(dataStorePlugin),
      Amplify.addPlugin(apiPlugin),
    ]);

    // Configure Amplify
    await Amplify.configure(amplifyconfig);
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
    print('Amplify configured successfully');
  } catch (e) {
    print('Error configuring Amplify: $e');
    // In production, you might want to show a user-friendly error message
  }
}

Future<void> initializeRazorpay() async {
  try {
    // Initialize Razorpay configuration
    // Note: Most Razorpay setup is handled in the SubscriptionScreen widget
    // This is just for any global configuration if needed
    print('Razorpay initialized successfully');
  } catch (e) {
    print('Error initializing Razorpay: $e');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Subscription App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // You can change this to your initial route/screen
        home: DashBoard()
        // Add your routes here
        // routes: {
        //   '/subscription': (context) => SubscriptionScreen(),
        //   // Add other routes as needed
        // },
        );
  }
}

// Optional: Add a loading screen widget while initialization is in progress
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
