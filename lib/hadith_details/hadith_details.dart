import 'package:flutter/material.dart';
import 'package:islami/model/hadith_model.dart';

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  static const String routeName = "HadithDetails";

  @override
  Widget build(BuildContext context) {

    var model = ModalRoute.of(context)?.settings.arguments as HadithModel;

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: Text(model.title),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 64, 20, 120),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                        child: Text(
                          "${model.content[index]} ",
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.rtl,

                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemCount: model.content.length,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
