import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/cache/cache_helper.dart';
import 'package:islami/home/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = "OnboardingScreen";

  Widget _buildImage(String assetName) {
    return Image.asset('assets/images/$assetName.png',);
  }

  @override
  Widget build(BuildContext context) {

    var bodyStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      fontSize: 24,
    );

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
      titlePadding: const EdgeInsets.only(top: 32 ,bottom: 16),
      bodyTextStyle: bodyStyle!,
      bodyPadding: const EdgeInsets.all(16.0),
      pageColor: Theme.of(context).secondaryHeaderColor,
      imagePadding: EdgeInsets.zero,
      imageFlex: 2,
    );

    return IntroductionScreen(
      dotsDecorator:  DotsDecorator(
        color: const Color(0xFF707070),
        activeColor: Theme.of(context).primaryColor,
      ),
      dotsFlex: 2,
      globalBackgroundColor: Theme.of(context).secondaryHeaderColor,
      showDoneButton: true,
      onDone: () {
        CacheHelper.saveEligibility();
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      done: Text(
        "لنبدأ",
        style: Theme.of(context).textTheme.titleSmall
      ),
      showNextButton: true,
      next: Text(
        "التالي",
        style: Theme.of(context).textTheme.titleSmall
      ),
      showBackButton: true,
      back: Text(
        "السابق",
        style: Theme.of(context).textTheme.titleSmall
      ),
      pages: [
        PageViewModel(
          title: "مرحباً بك في تطبيق إسلامي",
          body: " نحن متحمسون جداً لوجودك في مجتمعنا ",
          image: _buildImage('onboarding1',),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "قراءة القرآن الكريم",
          body: "اقْرَأْ بِاسْمِ رَبِّكَ الَّذِي خَلَقَ",
          image: _buildImage('onboarding3',),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "قراءة الأحاديث الشريفة",
          body: "الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد",
          image: _buildImage('onboarding2',),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "سبحة",
          body: " سَبِّحِ ٱسۡمَ رَبِّكَ ٱلۡأَعۡلَى ",
          image: _buildImage('onboarding4',),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
