import 'package:flutter/material.dart';
import 'package:it_lectory_3/widgets/style_text.dart';

class ButtonInkwell extends StatelessWidget {
  final String buttonTxt;
  final VoidCallback onTap;

  const ButtonInkwell({super.key, required this.onTap, required this.buttonTxt});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap, // вызываем onTap
      child: ClipRect(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          width: 300,
          height: 50,
          color: Color.fromRGBO(32, 32, 32, 1.0),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    width: 5,
                    color: Color.fromRGBO(16, 64, 99, 1),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 5,
                    color: Color.fromRGBO(16, 64, 99, 1),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonTxt,
                      style: TextStylesMain.apptxt,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void _showProgressDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Запрещаем закрытие при клике вне диалога
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.black.withOpacity(0.8), // Темный фон
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Скругленные углы
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Прогресс: 15%',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                value: 0.15, // Прогресс 15%
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ],
          ),
        ),
      );
    },
  );
}