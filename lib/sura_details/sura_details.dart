import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
   const SuraDetailsScreen({super.key});

  static const String routeName = "SuraDetails";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraContent = '';

  @override
  Widget build(BuildContext context) {

    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(suraContent.isEmpty){
      loadSuraFile(model.fileName);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: Text(
          model.arName,
      ),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 32
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/details_bg.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child:
                model.index == 8 ?
                const SizedBox(height: 16) :
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Image.asset(
                    "assets/images/basmalah.png",
                    height: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 120),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                          child: Text(
                            suraContent,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 32
                            ),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                          ),
                        );
                        },
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemCount: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String file = await rootBundle.loadString("assets/files/Suras/$fileName");
    List<dynamic> suraLines = file.trim().split("\n");
    for(int i = 0 ; i < suraLines.length ; i++){
      suraLines[i] += '{${i+1}} ';
    }
    suraContent = suraLines.join();
    setState(() {});
  }
}
