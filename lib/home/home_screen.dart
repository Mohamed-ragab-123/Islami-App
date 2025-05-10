import 'package:flutter/material.dart';
import 'package:islami/home/tabs/hadith_tab.dart';
import 'package:islami/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/home/tabs/sebiha_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/${getBackgroundName(selectedIndex)}.png"
            ),
            fit: BoxFit.fill,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex=value;
              setState(() {});
              },
            items: [
              BottomNavigationBarItem(icon:_buildNavItem("ic_quran",0),label: "Quran"),
              BottomNavigationBarItem(icon: _buildNavItem("ic_hadith",1),label: "Hadith"),
              BottomNavigationBarItem(icon: _buildNavItem("ic_sebiha",2),label: "Sebiha"),
            ]),
        body: Column(
          children: [
              Image.asset("assets/images/onboarding_header.png"),
              Expanded(
                  child:
                  tabs[selectedIndex],
              ),
            ],
          ),
      ),
    );
  }

  List<Widget> tabs=[
    const QuranTab(),
    const HadithTab(),
    const SebihaTab(),
  ];

  String getBackgroundName(int index){
    switch(index){
      case 0:
        return "home_bg";
      case 1:
        return "hadith_bg";
      case 2:
        return "sebiha_bg";
      default:
        return "home_bg";
    }
  }

  Widget _buildNavItem(String imageName,int index){
    return selectedIndex == index ?
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: const Color(0x99202020),
      ),
      child: ImageIcon(
        AssetImage("assets/images/$imageName.png",),
      ),
    ) :
    ImageIcon(
      AssetImage("assets/images/$imageName.png"),
    );
  }
}