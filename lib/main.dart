import 'package:astromaagic/Components/LocaleString.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Components/theme.dart';
import 'Routes/app_pages.dart';
import 'Routes/app_routes.dart';
import 'UI/SplashScreen/SplashScreen.dart';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppTheme.screenBackground,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale('en', 'US'),
      title: 'astromaagic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent),
      ),
      initialRoute: AppRoutes.root.toName,
      getPages: AppPages.list,
      home: const SplashScreen(),
    );
  }
}
