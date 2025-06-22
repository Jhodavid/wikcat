import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import '../../../../config/config.dart';
import '../../../../domain/domain.dart';
import '../../../common/common.dart';
import '../../detail/detail_page.dart';

class BreedCard extends ConsumerWidget {

  final BreedModel breed;

  const BreedCard({
    super.key,
    required this.breed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breedsStateProvider = ref.read(Providers.breedsPresenterProvider);

    final textStylesTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final locale = AppLocalizations.of(context);

    BreedModel breedData = breed;

    return FutureBuilder(
      future: breedsStateProvider.getCatBreedImageUrls(breed),
      builder: (context, snapshot) {
        if(snapshot.data != null) {
          breedData = snapshot.data!;
        }

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
                        breedData.name,
                        style: textStylesTheme.titleMedium,
                      ),
                    ),
                    TextButton.icon(
                        icon: const Icon( Icons.read_more_rounded),
                        label: Text(
                          locale.breeds_read_more,
                          style: textStylesTheme.bodyMedium,
                        ),
                        onPressed: () => context.push(DetailPage.route, extra: breedData)
                    )
                  ],
                ),

                BreedsImagesCarousel(
                  height: 240,
                  width: MediaQuery.of(context).size.width-30,
                  imagesUrls: breedData.imagesUrls,
                  status: breedData.imagesRequestStatus,
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
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: colorScheme.secondary,
                            ),
                            Text(
                              breedData.origin,
                              style: textStylesTheme.titleSmall,
                            ),
                          ],
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
                              value: breedData.intelligence*0.2,
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
      },
    );
  }
}