import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/splash/screen/splash_screen.dart';

import 'app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      getPages: routes,
      initialRoute: AppRoutes.SPLASHSCREEN,
    );
  }
}
