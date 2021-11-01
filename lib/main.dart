import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/app/my_app.dart';
import 'package:flutter_application_2/widgets/app/my_app_model.dart';

//import 'package:spider/spider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  final app = MyApp(model: model);
  runApp(app);
}
