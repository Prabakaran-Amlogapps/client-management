// subscription_screen.dart
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:aws_sdk/aws_sdk.dart';

class SubscriptionPlan {
  final String title;
  final String duration;
  final double price;
  final String description;
  final bool isFreeTrial;

  SubscriptionPlan({
    required this.title,
    required this.duration,
    required this.price,
    required this.description,
    this.isFreeTrial = false,
  });
}

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late Razorpay _razorpay;
  final String razorpayKey = "rzp_test_JDsXimAMENWZ4Y";

  final List<SubscriptionPlan> plans = [
    SubscriptionPlan(
      title: 'Free Trial',
      duration: '3 Days',
      price: 0,
      description: 'Try all premium features for 3 days',
      isFreeTrial: true,
    ),
    SubscriptionPlan(
      title: 'Monthly Plan',
      duration: '1 Month',
      price: 299,
      description: 'Full access to all features',
    ),
    SubscriptionPlan(
      title: 'Yearly Plan',
      duration: '1 Year',
      price: 3000,
      description: 'Best value, save more annually',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializePayment();
  }

  void _initializePayment() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Save subscription details to AWS
    try {
      await saveSubscriptionToAWS(response.paymentId!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment Successful!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving subscription: $e')),
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment Failed: ${response.message}')),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('External Wallet Selected: ${response.walletName}')),
    );
  }

  Future<void> saveSubscriptionToAWS(String paymentId) async {
    // AWS DynamoDB integration code here
    // This is a placeholder for AWS implementation
  }

  void _startSubscription(SubscriptionPlan plan) {
    if (plan.isFreeTrial) {
      // Handle free trial activation
      _activateFreeTrial();
      return;
    }

    var options = {
      'key': razorpayKey,
      'amount': (plan.price * 100).toInt(), // Convert to paise
      'name': 'Your App Name',
      'description': '${plan.title} Subscription',
      'prefill': {'contact': '1234567890', 'email': 'user@example.com'}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void _activateFreeTrial() async {
    try {
      // Implement free trial activation logic
      await saveSubscriptionToAWS('free_trial');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Free Trial Activated!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error activating free trial: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'Choose Your Plan',
          style: TextStyle(
              fontFamily: "LexendDecaRegular", fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return Container(
            child: Column(
              children: [
                Card(
                  color: const Color.fromARGB(255, 202, 185, 232),
                  margin: EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          plan.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8),
                        Text(
                          plan.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              plan.isFreeTrial ? 'FREE' : '₹${plan.price}',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.blue),
                              onPressed: () => _startSubscription(plan),
                              child: Text(
                                plan.isFreeTrial ? 'Start Trial' : 'Subscribe',
                                style: TextStyle(
                                    fontFamily: "LexendDecaRegular",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
