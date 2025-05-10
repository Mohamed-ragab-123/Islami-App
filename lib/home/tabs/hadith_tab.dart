import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadith_details/hadith_details.dart';
import 'package:islami/model/hadith_model.dart';

class HadithTab extends StatefulWidget {
   const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadithModel> hadith = [];

  @override
  Widget build(BuildContext context) {
    loadHadithFile();

    return  Column(
      children: [
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              enlargeCenterPage: true
            ),
            items: hadith.map((hadith) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushNamed(context, HadithDetailsScreen.routeName,
                        arguments: hadith,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            "assets/images/Hadith_Card.png",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 42),
                                padding: const EdgeInsets.symmetric(horizontal: 48),
                                child: Text(
                                  hadith.title,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24),
                                child: Text(
                                  hadith.content.toString(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 6,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  loadHadithFile() {
    rootBundle.loadString("assets/files/Hadith/ahadeth.txt").then((file) {
      List<String> ahadith = file.split("#");
      for (String data in ahadith) {
        List<String> lines = data.trim().split("\n");
        String hadithTitle = lines[0];
        lines.removeAt(0);
        List<String> content = lines;
        HadithModel hadithModel = HadithModel(
            title: hadithTitle,
            content: content);
        hadith.add(hadithModel);
      }
      setState(() {});
    });
  }
}
