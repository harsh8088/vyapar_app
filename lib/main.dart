import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vyapar_app/profile/profile.dart';

import 'config/constants.dart';
import 'config/session_manager.dart';
import 'home/home.dart';
import 'login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ); // To turn off landscape mode

  final isLogin = await SessionManager().isLogin();

  var iRoute = "/login";
  if (isLogin != null) iRoute = "/home";

  runApp(MyApp(
    iRoute: iRoute,
  ));
}

/// This widget is the root of your application.
/// Using MultiBlocProvider for Dependency Injection.
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.iRoute});

  final String iRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          textSelectionTheme: Theme.of(context).textSelectionTheme.copyWith(
                cursorColor: Colors.blueAccent,
              ),
          inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
              fillColor: Colors.grey,
              floatingLabelStyle: TextStyle(color: Colors.grey, fontSize: 20),
              labelStyle: TextStyle(color: Colors.grey),
              focusColor: Colors.grey,
              hintStyle: TextStyle(color: Colors.grey)),
          // fontFamily: 'MyriadPro',
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black //here you can give the text color
              )),
      initialRoute: iRoute,
      routes: {
        // '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/home': (context) => HomeScreen(),
      },
      builder: (context, child) {
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}
