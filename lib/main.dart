import 'package:flutter/material.dart';
import 'package:islami/cache/cache_helper.dart';
import 'package:islami/hadith_details/hadith_details.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/onboarding_screen.dart';
import 'package:islami/sura_details/sura_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute:
      CacheHelper.getEligibility() == true
          ?HomeScreen.routeName
          :OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        SuraDetailsScreen.routeName: (context) =>  const SuraDetailsScreen(),
        HadithDetailsScreen.routeName: (context) =>  const HadithDetailsScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
