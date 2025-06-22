import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/config.dart';
import '../../../domain/domain.dart';
import '../../common/common.dart';
import 'widgets/characteristics_card.dart';
import 'widgets/description_card.dart';
import 'widgets/simple_info_card.dart';
import 'widgets/urls_cards.dart';

class DetailPage extends StatelessWidget {
  static final route = '/detail';

  final BreedModel breed;

  const DetailPage({
    super.key,
    required this.breed
  });

  @override
  Widget build(BuildContext context) {

    final locale = AppLocalizations.of(context);
    final textStylesTheme = Theme.of(context).textTheme;

    final height = MediaQuery.of(context).size.height - (
      MediaQuery.of(context).padding.top +
      MediaQuery.of(context).padding.bottom +
      50
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: TextButton(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Text(
          breed.name,
          style: textStylesTheme.displaySmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BreedsImagesCarousel(
              height: height*0.4,
              width: MediaQuery.of(context).size.width-30,
              imagesUrls: breed.imagesUrls,
              status: breed.imagesRequestStatus,
              fit: BoxFit.cover,
            ),
            Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DescriptionCard(breed: breed),

                    SimpleInfoCard(title: locale.detail_country_origin, value: breed.origin),
                    SimpleInfoCard(title: locale.detail_lifetime, value: '${breed.lifeSpan} ${locale.detail_years}'),
                    SimpleInfoCard(title: locale.detail_weight, value: '${breed.weight} kg'),

                    CharacteristicsCard(breed: breed),

                    URLsCards(breed: breed),

                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}