import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monify/src/core/app/app.dart';
import 'package:monify/src/utils/dependency_injection.dart';
import 'package:monify/src/utils/user_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await UserPreferences.init();
  initDependency();
  runApp(App());
}


