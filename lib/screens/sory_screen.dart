import 'package:flutter/material.dart';

import '../constance.dart';
import '../widgets/custom_button.dart';

class SoryScreen extends StatelessWidget {
  const SoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: customAppBar('Quiz App'),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Sory!',
            style: TextStyle(
                color: KPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'You must add at least 5 quesrions to start',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/images/faq.png',
            height: 230,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              heightButton: 40,
              widthButton: 200,
              text: 'Back to home',
              onTap: () => Navigator.pushNamed(context, '/'))
        ]),
      ),
    );
  }
}
