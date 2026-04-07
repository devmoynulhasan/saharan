import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:saharan/my_app.dart';

import 'app/data/network/ent_point.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialize
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// load environment variables from .env file
  await dotenv.load(fileName: ".env");
  EndPoint.init();

  /// Initialize GetStorage
  await GetStorage.init();

  runApp(const MyApp());
}


