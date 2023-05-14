import 'package:final_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../constance.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Quiz App'),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: KPrimaryColor),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'NR',
                  style: TextStyle(
                      fontSize: 25,
                      color: KPrimaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              accountName: Text(
                'Nadeen Radwan',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              accountEmail: Text(
                'nadeenradwan@gmail.com',
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Create Quiz'),
              onTap: () => Navigator.pushNamed(context, 'create-quiz'),
            ),
            const ListTile(
              leading: Icon(Icons.quiz),
              title: Text('Statr Quiz'),
            ),
            const Divider(thickness: 1),
            const ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz.png',
              width: 350,
              height: 350,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              heightButton: 40,
              widthButton: 200,
              text: 'Let\'s Start!',
              onTap: () => Navigator.pushNamed(context, 'start-quiz'),
            )
          ],
        ),
      ),
    );
  }
}
