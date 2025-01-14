import 'package:flutter/material.dart';
import 'package:it_lectory_3/core/lection_theme_data.dart';
import 'package:it_lectory_3/widgets/chats_page.dart';
import 'package:it_lectory_3/pages/profile_page.dart';
import 'package:it_lectory_3/pages/students.dart';
import 'package:it_lectory_3/widgets/bottom_bar_view.dart';
import 'package:it_lectory_3/widgets/btb_logik.dart';


class THome extends StatefulWidget {
  @override
  _THomeState createState() => _THomeState();
}

class _THomeState extends State<THome> {
  int selectedIndex = 0;
  String _selectedItem = StartWPF[0];

  static  List<Widget> _widgetOptions = <Widget>[
    THomeContent(),
    ChatPage(),
    ProfilePage(),
    StudentsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomBarr(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}


