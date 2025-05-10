import 'package:flutter/material.dart';
import 'package:islami/model/sura_model.dart';

class SuraNameItem extends StatelessWidget {

  SuraModel model;

  SuraNameItem({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.enName,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${model.ayaNum} أية",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          model.arName,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 24),
        Stack(
          alignment: Alignment.center,
          children: [
            const ImageIcon(
              AssetImage(
                "assets/images/sura_num.png",
              ),
              color: Colors.white,
              size: 52,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "${model.index+1}",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 14
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
