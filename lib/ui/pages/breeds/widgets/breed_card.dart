import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../config/config.dart';
import '../../../../domain/domain.dart';
import '../../../common/common.dart';
import '../../detail/detail_page.dart';

class BreedCard extends StatelessWidget {

  final BreedModel breed;

  const BreedCard({
    super.key,
    required this.breed
  });

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Theme.of(context).secondaryHeaderColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    breed.name,
                    style: textStylesTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  icon: const Icon( Icons.read_more_rounded),
                  label: Text(
                    locale.breeds_read_more,
                    style: textStylesTheme.bodyMedium,
                  ),
                  onPressed: () => context.push(DetailPage.route, extra: breed)
                )
              ],
            ),

            BreedsImagesCarousel(
              height: 240,
              width: MediaQuery.of(context).size.width-30,
              imagesUrls: breed.imagesUrls,
              status: breed.imagesRequestStatus,
              fit: BoxFit.fill,
            ),

            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      breed.origin,
                      style: textStylesTheme.titleSmall,
                    ),
                    const Spacer(),
                    Text(
                      locale.breeds_intelligence,
                      style: textStylesTheme.titleSmall,
                    ),
                    const SizedBox(width: 10),
                    Tooltip(
                      message: LocaleUtils.parseRateMessage(
                        breed.intelligence,
                        message: locale.breeds_intelligence_tooltip_message
                      ),
                      child: Container(
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(7),
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: breed.intelligence*0.2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}