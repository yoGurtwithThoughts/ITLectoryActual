import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_lectory_3/core/data_user.dart';
import 'package:it_lectory_3/core/databbase_helper.dart';
import 'package:it_lectory_3/pages/students/bt_logik.dart';
import 'package:it_lectory_3/pages/students/home_page.dart';
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
  List<Map<String, dynamic>> database = [];

  @override
  void initState() {
    super.initState();

    _register();
  }



//register nev users
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 55, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Регистрация', style: TextStylesMain.title),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      height: 50,
                      width: 355,
                      child: TextFormField(
                        controller: _recordBook,
                        style: TextStylesMain.labeltxt,
                        decoration: InputDecoration(
                          labelStyle: TextStylesMain.labeltxt,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(0, 134, 201, 1),
                              width: 2.0,
                            ),
                          ),
                          labelText: '№ зачетки',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(0, 134, 201, 1),
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) { // Проверка на null
                            return 'Please enter your number of record book';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 550),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 154, 222, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 45,
                    width: 256,
                    child: AllButton(
                      onPressed: _register,
                      buttonText: 'Зарегистрироваться',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







