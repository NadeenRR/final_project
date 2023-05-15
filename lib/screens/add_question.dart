import 'package:final_project/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../constance.dart';
import '../helper/database_helper.dart';
import '../model/questions.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(handleFocusChange);
  }

  String _selectedItem = 'A';
  String _isChecked = '';
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerAController = TextEditingController();
  final TextEditingController _answerBController = TextEditingController();
  final TextEditingController _answerCController = TextEditingController();
  final TextEditingController _answerDController = TextEditingController();
  String? _correctAnswer;

  // final List<String> list = <String>['A', 'B', 'C', 'D'];
  // String dropdownValue = 'A';

  // List<String> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('Add new question'),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        controller: _questionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a question';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // if (_formKey.currentState!.validate()) {}
                          setState(() {});
                        },
                        cursorColor: Colors.teal,
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(color: Colors.grey),
                            border: buildBorder(Colors.teal),
                            focusedBorder: buildBorder(Colors.teal),
                            labelText: 'Question',
                            hintText: 'Enter the question',
                            prefixIcon: Icon(
                              Icons.question_mark,
                              color: _isFocused ? Colors.teal : Colors.grey,
                            )),
                        focusNode: _focusNode,
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      TextFormField(
                          controller: _answerAController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an answer';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            // if (_formKey.currentState!.validate()) {}
                            setState(() {});
                          },
                          // onSaved: (value) {
                          //   data.add(value!);
                          // },
                          cursorColor: KPrimaryColor,
                          decoration: inputDecoration(
                              'First Answer', 'A', Colors.yellow)),

                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _answerBController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an answer';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //  if (_formKey.currentState!.validate()) {}
                          setState(() {});
                        },
                        // onSaved: (value) {
                        //   data.add(value!);
                        // },
                        cursorColor: KPrimaryColor,
                        decoration: inputDecoration(
                            'Seconde Answer', 'B', Colors.green),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _answerCController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an answer';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // if (_formKey.currentState!.validate()) {}
                          setState(() {});
                        },
                        // onSaved: (value) {
                        //   data.add(value!);
                        // },
                        cursorColor: KPrimaryColor,
                        decoration:
                            inputDecoration('Third Answer', 'C', Colors.grey),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _answerDController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an answer';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // if (_formKey.currentState!.validate()) {}
                          setState(() {});
                        },
                        // onSaved: (value) {
                        //   data.add(value!);
                        // },
                        cursorColor: KPrimaryColor,
                        decoration: inputDecoration(
                            'Fourth Answer', 'D', Colors.pinkAccent),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Select the correct answe: ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedItem,
                              focusColor: Colors.teal,
                              style: const TextStyle(
                                  fontSize: 22, color: Colors.teal),
                              items: const [
                                DropdownMenuItem(
                                  value: "A",
                                  child: Text("A"),
                                ),
                                DropdownMenuItem(
                                  value: "B",
                                  child: Text("B"),
                                ),
                                DropdownMenuItem(
                                  value: "C",
                                  child: Text("C"),
                                ),
                                DropdownMenuItem(
                                  value: "D",
                                  child: Text("D"),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _selectedItem = value!;
                                  if (_selectedItem == "A") {
                                    _isChecked = _answerAController.text;
                                  } else if (_selectedItem == "B") {
                                    _isChecked = _answerBController.text;
                                  } else if (_selectedItem == "C") {
                                    _isChecked = _answerCController.text;
                                  } else if (_selectedItem == "D") {
                                    _isChecked = _answerDController.text;
                                  }
                                  _correctAnswer = _isChecked;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomButton(
                          heightButton: 50,
                          widthButton: double.infinity,
                          text: 'Add question',
                          onTap: _submitForm)
                      // InkWell(
                      //   onTap: _submitForm,
                      //   child: Container(
                      //     margin: const EdgeInsets.all(10),
                      //     height: 50,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //         color: Colors.teal,
                      //         borderRadius: BorderRadius.circular(8)),
                      //     child: const Center(
                      //       child: Text(
                      //         'Add question',
                      //         style:
                      //             TextStyle(color: Colors.white, fontSize: 18),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ])))));
  }

  void _submitForm() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // print(data);
      debugPrint('save');

      Question question = Question(
        question: _questionController.text,
        answerA: _answerAController.text,
        answerB: _answerBController.text,
        answerC: _answerCController.text,
        answerD: _answerDController.text,
        correctAnswer: _correctAnswer,
      );
      await DatabaseHelper.instance.insertQuestion(question.toMap());
      // debugPrint(_questionController.text);
      // debugPrint(_answerAController.text);
      // debugPrint(_answerBController.text);
      // debugPrint(_answerCController.text);
      // debugPrint(_answerDController.text);
      // debugPrint(_correctAnswer);

      debugPrint(question.id.toString());

      Navigator.pop(context);
    }
  }
}
