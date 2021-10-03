import 'package:flutter/material.dart';
import 'package:flutter_application_2/tema/app_colors.dart';
import 'package:flutter_application_2/widgets/auth/auth_widget.dart';
import 'package:flutter_application_2/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_application_2/widgets/movie_details/movie_details_widget.dart';
//import 'package:spider/spider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      routes: {
        '/auth': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return MovieDetailsWidget(movieId: 0);
          }
        }
      },
      initialRoute: '/auth',
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
