import 'package:final_project/constance.dart';
import 'package:final_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ResultScreenCase1 extends StatelessWidget {
  const ResultScreenCase1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Quiz App'),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Congratulations!',
            style: TextStyle(
                color: KPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/result.jpg',
            height: 230,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Your Score: 9/10',
            style: TextStyle(
                color: Colors.green, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const Text(
            'You\'re a superstar!',
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
