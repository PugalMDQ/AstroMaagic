import 'package:astromaagic/Components/LocaleString.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
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

      theme: ThemeData.light().copyWith(
        textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context)
            .textTheme
            .apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            )
            .copyWith(
              headline6: const TextStyle(
                color: Color(0xff252525),
                fontWeight: FontWeight.bold,
              ),
              subtitle1: const TextStyle(color: Color(0xffA4A4A4)),
              bodyText1: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
      //
      // ThemeData(
      //   textSelectionTheme: const TextSelectionThemeData(
      //       //       selectionHandleColor: Colors.transparent),
      //       // ),
      initialRoute: AppRoutes.root.toName,
      getPages: AppPages.list,
      home: const SplashScreen(),
    );
  }
}
