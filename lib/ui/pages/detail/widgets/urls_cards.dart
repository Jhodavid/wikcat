import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import '../../../common/common.dart';

class URLsCards extends StatelessWidget {

  const URLsCards({
    super.key,
    required this.breed,
  });

  final BreedModel breed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 120,
      child: GridView.custom(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 60,
          crossAxisSpacing: 30,
        ),
        physics: const NeverScrollableScrollPhysics(),                        
        childrenDelegate: SliverChildListDelegate(
          [
            _UrlCard(
              name: 'CFA',
              url: breed.cfaUrl,
            ),
            _UrlCard(
              name: 'VCA Hospitals',
              url: breed.vcaHospitalsUrl,
            ),
            _UrlCard(
              name: 'Vetstreet',
              url: breed.vetStreetUrl,
            ),
            _UrlCard(
              name: 'Wikipedia',
              url: breed.wikipediaUrl,
            ),
          ]
        )
      ),
    );
  }
}

class _UrlCard extends StatelessWidget {

  const _UrlCard({
    required this.name,
    this.url,
  });

  final String name;
  final String? url;

  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;
    
    final isActive = url != null;

    return Card(
      color: !isActive ? Colors.grey : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextButton(
          onPressed: isActive ?
            () {
              if(url == null) {
                return;
              }
              final browserIntent = BrowserIntentUtil();
              browserIntent.startBrowserIntent(url!);
            } : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: textStylesTheme.bodySmall,
              ),
              const Icon(
                Icons.link_rounded,
                size: 20,
              )
            ],
          )
        ),
      ),
    );
  }
}