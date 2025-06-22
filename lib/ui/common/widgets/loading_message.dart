import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../config/config.dart';

class LoadingBreedsMessage extends StatelessWidget {

  const LoadingBreedsMessage({super.key});

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 180,
            child: Lottie.asset('assets/cat_walking.json'),
          ),
          Text(
            locale.breeds_search_cat_breeds,
            style: textStylesTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}