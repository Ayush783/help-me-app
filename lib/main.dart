import 'package:flutter/material.dart';
import 'package:help_me/injection.dart';
import 'package:help_me/presentation/core/app_widget.dart';
import 'package:help_me/ui/screens/authentication/intro_screen.dart';
import 'package:injectable/injectable.dart';

import 'ui/shared/theme_data.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  runApp((AppWidget()));
  //   MaterialApp(
  //     theme: kThemeData,
  //     debugShowCheckedModeBanner: false,
  //     home: IntroScreen(),
  //   ),
  // );
}
