import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../../../domain/domain.dart';

import 'progresive_info_card.dart';

class CharacteristicsCard extends StatelessWidget {

  const CharacteristicsCard({
    super.key,
    required this.breed,
  });

  final BreedModel breed;

  @override
  Widget build(BuildContext context) {

    final locale = AppLocalizations.of(context);
    final textStylesTheme = Theme.of(context).textTheme;
    
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locale.detail_characteristics_title,
              style: textStylesTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor
              )
            ),
            const SizedBox(height: 5),
            ProgressiveInfo(keyName: 'adaptability', title: locale.detail_characteristic_adaptability, value: breed.adaptability),
            ProgressiveInfo(keyName: 'affectionLevel', title: locale.detail_characteristic_affection_level, value: breed.affectionLevel),
            ProgressiveInfo(keyName: 'childFriendly', title: locale.detail_characteristic_child_friendly, value: breed.childFriendly),
            ProgressiveInfo(keyName: 'dogFriendly', title: locale.detail_characteristic_dog_friendly, value: breed.dogFriendly),
            ProgressiveInfo(keyName: 'energyLevel', title: locale.detail_characteristic_energy_level, value: breed.energyLevel),
            ProgressiveInfo(keyName: 'grooming', title: locale.detail_characteristic_grooming, value: breed.grooming),
            ProgressiveInfo(keyName: 'healthIssues', title: locale.detail_characteristic_health_issues, value: breed.healthIssues),
            ProgressiveInfo(keyName: 'intelligence', title: locale.detail_characteristic_intelligence, value: breed.intelligence),
            ProgressiveInfo(keyName: 'sheddingLevel', title: locale.detail_characteristic_shedding_level, value: breed.sheddingLevel),
            ProgressiveInfo(keyName: 'socialNeeds', title: locale.detail_characteristic_social_needs, value: breed.socialNeeds),
            ProgressiveInfo(keyName: 'strangerFriendly', title: locale.detail_characteristic_stranger_friendly, value: breed.strangerFriendly),
            ProgressiveInfo(keyName: 'vocalisation', title: locale.detail_characteristic_vocalisation, value: breed.vocalisation),
            ProgressiveInfo(keyName: 'experimental', title: locale.detail_characteristic_experimental, value: breed.experimental),
            ProgressiveInfo(keyName: 'hairless', title: locale.detail_characteristic_hairless, value: breed.hairless),
            ProgressiveInfo(keyName: 'natural', title: locale.detail_characteristic_natural, value: breed.natural),
            ProgressiveInfo(keyName: 'rare', title: locale.detail_characteristic_rare, value: breed.rare),
            ProgressiveInfo(keyName: 'rex', title: locale.detail_characteristic_rex, value: breed.rex),
            ProgressiveInfo(keyName: 'suppressedTail', title: locale.detail_characteristic_suppressed_tail, value: breed.suppressedTail),
            ProgressiveInfo(keyName: 'shortLegs', title: locale.detail_characteristic_short_legs, value: breed.shortLegs),
            ProgressiveInfo(keyName: 'hypoallergenic', title: locale.detail_characteristic_hypoallergenic, value: breed.hypoallergenic)
          ],
        ),
      ),
    );
  }
}
