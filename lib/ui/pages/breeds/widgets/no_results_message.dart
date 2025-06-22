import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class NoResultsMessage extends StatelessWidget {

  const NoResultsMessage({super.key});

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context);

    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: height*0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search_off_rounded,
            color: Color(0xff019d91),
            size: 36,
          ),
          const SizedBox(height: 5),
          Text(
            locale.breeds_no_result,
            style: textStylesTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}