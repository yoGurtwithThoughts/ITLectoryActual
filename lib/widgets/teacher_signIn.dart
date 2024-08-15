import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/data_user_teacher.dart';
import 'package:it_lectory_3/pages/home_teachers.dart';
import 'package:it_lectory_3/widgets/all_button.dart';
import 'package:it_lectory_3/widgets/style_text.dart';
class TeacherIn extends StatefulWidget {
  const TeacherIn({super.key});

  @override
  State<TeacherIn> createState() => _TeacherInState();
}

class _TeacherInState extends State<TeacherIn> {

  final _logtxt = TextEditingController();
  final _pastxt=TextEditingController();
  var isObsText = true;

  void _login() {
    final String inputV = _logtxt.text;
    final String inputP= _pastxt.text;

    if (inputV == login && inputP == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => THome()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid input value')),
      );
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
                  Text('Авторизация', style: TextStylesMain.title),
                  SizedBox(height: 20),
                  Form(
                    child: SizedBox(
                      height: 50,
                      width: 355,
                      child: TextFormField(
                        controller: _logtxt,
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
                          labelText: 'Логин',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(0, 134, 201, 1),
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty) { // Проверка на null
                            return 'Please enter your number of record book';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Form(
                    child: SizedBox(
                      height: 50,
                      width: 355,
                      child: TextFormField(
                        controller: _pastxt,
                        obscureText: isObsText,
                        style: TextStylesMain.labeltxt,
                        decoration: InputDecoration(
                          labelStyle: TextStylesMain.labeltxt,
                          suffixIcon: InkWell(
                            onTap: () {
                              isObsText = !isObsText;
                              setState(() {});
                            },
                            child: Icon(
                              isObsText ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(0, 134, 201, 1),
                              width: 2.0,
                            ),
                          ),
                          labelText: 'Пароль',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(0, 134, 201, 1),
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty) { // Проверка на null
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
                  const  SizedBox(height: 400),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 154, 222, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 45,
                    width: 256,
                    child: AllButton(
                      onPressed: _login,
                      buttonText: 'Войти',
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

