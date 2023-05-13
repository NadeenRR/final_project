import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _selectedItem = 'A';
  String _isChecked = '';

  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _textEditingController3 = TextEditingController();
  TextEditingController _textEditingController4 = TextEditingController();
  String _correctAnswer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _textEditingController2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _textEditingController3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _textEditingController4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'Select the correct answe: ',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedItem,
                    items: [
                      DropdownMenuItem(
                        child: Text("A"),
                        value: "A",
                      ),
                      DropdownMenuItem(
                        child: Text("B"),
                        value: "B",
                      ),
                      DropdownMenuItem(
                        child: Text("C"),
                        value: "C",
                      ),
                      DropdownMenuItem(
                        child: Text("D"),
                        value: "D",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value!;
                        if (_selectedItem == "A") {
                          _isChecked = _textEditingController1.text;
                        } else if (_selectedItem == "B") {
                          _isChecked = _textEditingController2.text;
                        } else if (_selectedItem == "C") {
                          _isChecked = _textEditingController3.text;
                        } else if (_selectedItem == "D") {
                          _isChecked = _textEditingController4.text;
                        }
                        _correctAnswer = _isChecked;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text("Checkbox value: $_correctAnswer"),
          ],
        ),
      ),
    );
  }
}
