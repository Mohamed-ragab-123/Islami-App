import 'package:flutter/material.dart';

class SebihaTab extends StatefulWidget {
  const SebihaTab({super.key});

  @override
  State<SebihaTab> createState() => _SebihaTabState();
}

class _SebihaTabState extends State<SebihaTab> {
  int counter = 0;
  int index = 0;
  double turn = 0.0;

  List<String> azkar = [
    "سُبْحَانَ اللَّهِ",
    "الْحَمْدُ للّهِ",
    "الْلَّهُ أَكْبَرُ",
    "لَا إِلَهَ إِلَّا اللَّهُُ",
    "أستغفر الله",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِِ",
    "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ",
    "الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد",
  ];

  void _incrementCounter() {
    setState(() {
      turn += 1 / 33;
      counter++;
      if (counter == 100) {
        index++;
        counter = 0;
        if (index == azkar.length) {
          index = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            children: [
              Text(
                "{ سَبِّحِ ٱسۡمَ رَبِّكَ ٱلۡأَعۡلَى }",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 36,
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset("assets/images/SebhaBody1.png",fit: BoxFit.cover,),
                  Padding(
                    padding: const EdgeInsets.only(top: 72),
                    child: GestureDetector(
                      onTap: _incrementCounter,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedRotation(
                            turns: turn,
                            duration: const Duration(milliseconds: 500),
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/SebhaBody2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 65),
                                child: Text(
                                  azkar[index],
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: 36,
                                  ),
                                  textAlign: TextAlign.center,

                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$counter',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 36,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10)
            ],
          ),
        ],
      ),
    );
  }
}