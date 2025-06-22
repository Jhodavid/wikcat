import 'package:flutter/material.dart';

import '../../../../config/config.dart';

class BreedsAppBar extends StatelessWidget {

  final String searchTextValue;
  final void Function(String searchValue) onChangeSearch;

  const BreedsAppBar({
    super.key,
    required this.searchTextValue,
    required this.onChangeSearch
  });

  @override
  Widget build(BuildContext context) {

    final locale = AppLocalizations.of(context);
    final statusBarPadding = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(
        top: statusBarPadding
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10
                    ),
                    child: Text(
                      locale.breeds_title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              _SearchInput(
                value: searchTextValue,
                onChangeSearch: onChangeSearch
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {

  final String value;
  final void Function(String searchValue) onChangeSearch;

  const _SearchInput({
    required this.onChangeSearch,
    required this.value
  });

  @override
  Widget build(BuildContext context) {

    final locale = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Container(
        height: 45,
        width: width-20,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10)
        ),
        child: TextFormField(
          initialValue: value,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: locale.breeds_search_input_hint,
            prefixIcon: const Icon(Icons.search_rounded)
          ),
          onChanged: onChangeSearch,
        )
      )
    );
  }
}