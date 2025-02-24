import 'package:flutter/material.dart';

class SubcribePage extends StatefulWidget {
  const SubcribePage({super.key});

  @override
  State<SubcribePage> createState() => _SubcribePageState();
}

class _SubcribePageState extends State<SubcribePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Premium Subscriptions',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "LexendDecaRegular",
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(constraints.maxWidth > 600 ? 40 : 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    _buildSubscriptionCard(
                      title: 'Free Trial',
                      subtitle: 'Experience Premium Features',
                      price: 'Free for 3 Days',
                      color: Colors.blue.shade50,
                      textColor: Colors.blue.shade700,
                      width: constraints.maxWidth,
                      image: 'icons/branding.png', // Add your image path
                    ),
                    SizedBox(height: 20),
                    _buildSubscriptionCard(
                      title: 'Monthly Plan',
                      subtitle: 'Flexible Monthly Access',
                      price: '₹299/Month',
                      color: Colors.green.shade50,
                      textColor: Colors.green.shade700,
                      width: constraints.maxWidth,
                      image: 'icons/bookmarks.png', // Add your image path
                    ),
                    SizedBox(height: 20),
                    _buildSubscriptionCard(
                      title: 'Yearly Plan',
                      subtitle: 'Best Value Subscription',
                      price: '₹3,000/Year',
                      extraInfo: '₹250/Month',
                      color: Colors.purple.shade50,
                      textColor: Colors.purple.shade700,
                      width: constraints.maxWidth,
                      image: 'icons/premium-account.png', // Add your image path
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubscriptionCard({
    required String title,
    required String subtitle,
    required String price,
    String? extraInfo,
    required Color color,
    required Color textColor,
    required double width,
    required String image,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: width > 600 ? 600 : width * 0.9,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Image on the left side
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontFamily: "LexendDecaRegular",
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontFamily: "LexendDecaRegular",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontFamily: "LexendDecaRegular",
                    ),
                  ),
                  if (extraInfo != null) ...[
                    SizedBox(height: 5),
                    Text(
                      extraInfo,
                      style: TextStyle(
                        color: textColor.withOpacity(0.7),
                        fontFamily: "LexendDecaRegular",
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
