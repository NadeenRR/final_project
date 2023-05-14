import 'package:flutter/material.dart';

import '../constance.dart';
import '../widgets/custom_button.dart';

class ResultScreenCase3 extends StatelessWidget {
  const ResultScreenCase3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Quiz App'),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Oops!',
            style: TextStyle(
                color: KPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/fail.png',
            height: 230,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Your Score: 2/10',
            style: TextStyle(
                color: Colors.green, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const Text(
            'Sory, better luck next time',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 30,
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
