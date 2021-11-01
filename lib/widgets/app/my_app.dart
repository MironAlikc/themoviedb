import 'package:flutter/material.dart';
import 'package:flutter_application_2/tema/app_colors.dart';
import 'package:flutter_application_2/ui/navigation/main_navigation.dart';
import 'package:flutter_application_2/widgets/app/my_app_model.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      onGenerateRoute: mainNavigation.onGenerateRoute,

      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute<void>(builder: (context) {
      //     return const Scaffold(
      //       body: Center(
      //         child: Text('Произошла ошибка навигации'),
      //       ),
      //     );
      //   });
      // },
    );
  }
}

// '/main_screen/movi_details': // Зарегестрировали новый маршрут и указали его имя 







// class ExampleWidget extends StatefulWidget {
//   const ExampleWidget({Key? key}) : super(key: key);

//   @override
//   _ExampleWidgetState createState() => _ExampleWidgetState();
// }

// class _ExampleWidgetState extends State<ExampleWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TMDB'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             //Navigator.of(context).pop();
//           },
//           child: Text('Жми'),
//         ),
//       ),
//     );
//   }
// }
