import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPages extends StatefulWidget {
  const SupportPages({super.key});

  @override
  State<SupportPages> createState() => _SupportPagesState();
}

class _SupportPagesState extends State<SupportPages>
    with SingleTickerProviderStateMixin {
  // Use late final for controllers and constants
  late final TabController _tabController;
  final TextEditingController _feedbackController = TextEditingController();

  // Constants
  static const String playStoreUrl = 'market://details?id=your.package.name';
  static const String fallbackPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=your.package.name';

  int _rating = 0;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Add listener to handle tab changes
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  // Handle tab changes efficiently
  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      setState(() {
        // Reset state when switching tabs
        _rating = 0;
        _isSubmitting = false;
      });
    }
  }

  // Optimized URL launcher
  Future<void> _launchPlayStore() async {
    try {
      final Uri url = Uri.parse(playStoreUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        final Uri fallbackUrl = Uri.parse(fallbackPlayStoreUrl);
        await launchUrl(fallbackUrl);
      }
    } catch (e) {
      // Show error dialog instead of silent failure
      if (mounted) {
        _showErrorDialog('Unable to open Play Store. Please try again later.');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSuccessDialog() async {
    if (_isSubmitting) return; // Prevent multiple submissions

    setState(() => _isSubmitting = true);

    // Simulate network request
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "images/success.png",
                height: 180,
                fit: BoxFit.contain,
              ),
              const Text(
                "Thank You",
                style: TextStyle(
                  fontFamily: "LexendDecaRegular",
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          content: const Text(
            "By making your voice heard, you help us improve our company.",
            style: TextStyle(fontFamily: "LexendDecaRegular"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _rating = 0;
                  _feedbackController.clear();
                  _isSubmitting = false;
                });
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontFamily: "LexendDecaRegular",
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Separated star rating widget for better performance
  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => GestureDetector(
          onTap: () => setState(() => _rating = index + 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              index < _rating ? Icons.star : Icons.star_border,
              size: 40,
              color: index < _rating ? Colors.amber : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDirectFeedbackTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Give Feedback",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "How did we do?",
              style: TextStyle(
                fontFamily: "LexendDecaRegular",
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            _buildStarRating(),
            const SizedBox(height: 40),
            const Text(
              "Care to share more about it?",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "LexendDecaRegular",
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _feedbackController,
              style: const TextStyle(fontFamily: "LexendDecaRegular"),
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Tell us your experience...",
                hintStyle: const TextStyle(fontFamily: "LexendDecaRegular"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                fillColor: Colors.grey[50],
                filled: true,
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _showSuccessDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isSubmitting
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Submit Feedback",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "LexendDecaRegular",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayStoreTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/playstore.png',
              height: 120,
              width: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            const Text(
              "Rate Us on Play Store",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "LexendDecaRegular",
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Your feedback helps us improve and reach more users.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "LexendDecaRegular",
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _launchPlayStore,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Open Play Store",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "LexendDecaRegular",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Support",
              style: TextStyle(
                fontFamily: "LexendDecaRegular",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 7),
            Container(
              height: 1,
              color: Colors.black,
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(text: "Direct Feedback"),
            Tab(text: "Play Store Review"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDirectFeedbackTab(),
          _buildPlayStoreTab(),
        ],
      ),
    );
  }
}
