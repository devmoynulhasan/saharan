import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:saharan/my_app.dart';

import 'app/data/network/ent_point.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  /// load environment variables from .env file
  await dotenv.load(fileName: ".env");
  EndPoint.init();

  /// Initialize GetStorage
  await GetStorage.init();

  runApp(const MyApp());
}


