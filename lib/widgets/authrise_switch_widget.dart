import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/databbase_helper.dart';
import 'package:it_lectory_3/pages/students/bt_logik.dart';
import 'package:it_lectory_3/widgets/all_button.dart';
import 'package:it_lectory_3/widgets/style_text.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}


class _LoginWidgetState extends State<LoginWidget> {
  final _recordBook = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      String name = _recordBook.text;
      int id = await DatabaseHelper.instance.insertUser(name);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Btlogick()),
      );
      _recordBook.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 55),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Регистрация', style: TextStylesMain.title),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: TextFormField(
                      controller: _recordBook,
                      style: TextStylesMain.labeltxt,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                        labelStyle: TextStylesMain.labeltxt,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 134, 201, 1),
                            width: 2.0,
                          ),
                        ),
                        labelText: '№ зачетной книжки',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 134, 201, 1),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 134, 201, 1),
                            width: 2.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 134, 201, 1),
                            width: 2.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(0, 134, 201, 1),
                            width: 2.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите номер зачетной книжки';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Scrollable area for additional content (if needed)
          Expanded(
            child: SingleChildScrollView(
              padding:
              EdgeInsets.only(bottom: keyboardHeight), // Adjust for keyboard height
              child: Container(), // You can add more scrollable content here if needed
            ),
          ),

          // Button at the bottom of the screen
          Container(
            margin:
            EdgeInsets.only(bottom: keyboardHeight > 0 ? keyboardHeight : 20), // Adjust for keyboard height
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 154, 222, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 45,
                width: 280, // Use double.infinity for full width
                child: AllButton(
                  onPressed: _register,
                  buttonText: 'Зарегистрироваться',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}