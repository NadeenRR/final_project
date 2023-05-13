import 'package:flutter/material.dart';

import '../constance.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar('Quiz App'));
  }
}
