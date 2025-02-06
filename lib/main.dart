import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_lectory_3/service/net-status-checker.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:it_lectory_3/core/test-infomation-data.dart';
import 'package:it_lectory_3/core/topic-provider.dart';
import 'package:it_lectory_3/models/test-provider.dart';
import 'package:it_lectory_3/pages/lecture-theme-page.dart';
import 'package:it_lectory_3/pages/students/home-students.dart';
import 'package:it_lectory_3/pages/students/test-page.dart';
import 'package:it_lectory_3/service/network-check-page.dart';
import 'package:it_lectory_3/widgets/chats_page.dart';
import 'package:it_lectory_3/pages/home_teachers.dart';
import 'package:it_lectory_3/pages/onboard_1.dart';
import 'package:it_lectory_3/pages/page_register.dart';
import 'package:it_lectory_3/pages/profile_page.dart';
import 'package:it_lectory_3/pages/students.dart';
import 'package:it_lectory_3/widgets/authrise_switch_widget.dart';
import 'package:it_lectory_3/widgets/btb_logik.dart';
import 'package:it_lectory_3/widgets/sign_up.dart';
import 'package:it_lectory_3/widgets/splash.dart';
import 'package:it_lectory_3/widgets/teacher_signIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  bool isConnected = await checkInitialConnectivity(); // Проверяем интернет

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TestProvider()),
      ChangeNotifierProvider(create: (context) => WpfTestProvider()),
      ChangeNotifierProvider(create: (context) => TopicProvider()),
    ],
    child: MyApp(isConnected: isConnected), // Передаем статус подключения
  ));
}

/// Функция для проверки наличия подключения к интернету
Future<bool> checkInitialConnectivity() async {
  try {
    List<ConnectivityResult> connectivityResults =
        await Connectivity().checkConnectivity();
    ConnectivityResult connectivityResult = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    final bool hasInternet =
        await InternetConnectionChecker.createInstance().hasConnection;
    return hasInternet;
  } catch (e) {
    debugPrint("Ошибка проверки сети: $e");
    return false;
  }
}

class MyApp extends StatelessWidget {
  final bool isConnected;

  const MyApp({Key? key, required this.isConnected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkMonitor(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: isConnected ? '/splash' : '/checknet',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/th': (context) => THome(),
          '/onb1': (context) => OnBoard1(),
          '/sg': (context) => SignUpWidget(),
          '/pagt': (context) => RegisterPage(),
          '/logs': (context) => LoginWidget(),
          '/sgt': (context) => TeacherIn(),
          '/chat': (context) => ChatPage(),
          '/profile': (context) => ProfilePage(),
          '/students': (context) => StudentsPage(),
          '/thm': (context) => THomeContent(),
          '/lth': (context) => LectureThemePage(),
          '/shome': (context) => SHome(),
          '/test': (context) => TestPage(),
          '/checknet': (context) => CheckNetWork(),
        },
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(0, 137, 201, 1),
          scaffoldBackgroundColor: const Color.fromRGBO(21, 21, 21, 1),
        ),
      ),
    );
  }
}
