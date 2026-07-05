import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            children: [
              Container(
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.red),
                // ),
                child: Image.asset(
                  'assets/images/intro_first_image.png',
                  // fit: BoxFit.cover,
                  // width: double.infinity,
                  // height: 50,
                ),
              ),
              Container(color: Colors.blue, child: Text('data')),
              Container(color: Colors.green, child: Text('data')),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,

        padding: EdgeInsets.all(16),
        height: 350,

        child: Column(
          children: [
            Text(
              'Need Help Today? We\'ve Got You ✨',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 20),
            Text('description'),
            SizedBox(height: 20),
            Center(
              child: SmoothPageIndicator(controller: controller, count: 3),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text('skip')),

                TextButton(onPressed: () {}, child: Text('next')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
