import 'package:flutter/material.dart';
import 'package:flutter_application_2/library/widget/inherited/provider.dart';

import 'package:flutter_application_2/widgets/auth/auth_model.dart';
import 'package:flutter_application_2/widgets/auth/auth_widget.dart';
import 'package:flutter_application_2/widgets/main_screen/main_screen_model.dart';
import 'package:flutter_application_2/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_application_2/widgets/movie_details/movie_details_widget.dart';

abstract class MainNavigationRouteNams {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNams.mainScreen
      : MainNavigationRouteNams.auth;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNams.auth: (context) => NotifierProvider(
          model: AuthModel(),
          child: const AuthWidget(),
        ),
    MainNavigationRouteNams.mainScreen: (context) => NotifierProvider(
          model: MainScreenModel(),
          child:  MainScreenWidget(),
        ),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNams.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => MovieDetailsWidget(movieId: movieId),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
