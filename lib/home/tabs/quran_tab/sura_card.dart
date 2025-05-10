import 'package:flutter/material.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/sura_details/sura_details.dart';


class SuraCard extends StatelessWidget {

  const SuraCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
          arguments: SuraModel.suraList[SuraModel.lastSura['indexOfLastSura'] ?? 0]
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration:
        BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/sura_card.png",
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    SuraModel.lastSura['arName'] ?? '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    SuraModel.lastSura['enName'] ?? '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${SuraModel.lastSura['ayaNum'] ?? ''} آية ",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
