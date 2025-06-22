import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikcat/config/provider/providers.dart';

import '../../../domain/domain.dart';
import '../../common/common.dart';

import 'widgets/breed_card.dart';
import 'widgets/breeds_app_bar.dart';
import 'widgets/no_results_message.dart';

class BreedsPage extends ConsumerStatefulWidget {
  static final route = '/breeds';

  const BreedsPage({super.key});

  @override
  ConsumerState createState() => _BreedsPageState();
}

class _BreedsPageState extends ConsumerState<BreedsPage> {

  String filterText = '';
  late List<BreedModel> filteredBreedList;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final breedsStateNotifier = ref.read(Providers.breedsPresenterProvider);
      breedsStateNotifier.onInit();
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final breedsStateProvider = ref.watch(Providers.breedsPresenterProvider);

    if(
      breedsStateProvider.breedsLoadingStatus == RequestStatusEnum.none
      || breedsStateProvider.breedsLoadingStatus == RequestStatusEnum.isLoading
    ) {

      return const Scaffold(body: LoadingBreedsMessage());
    }

    if(breedsStateProvider.breedsLoadingStatus == RequestStatusEnum.error) {

      return Scaffold(
        body: NetworkErrorMessage(onAction: breedsStateProvider.getCatsBreeds)
      );
    }

    if(filterText.isEmpty) {
      filteredBreedList = breedsStateProvider.catsBreedsList;
    } else {
      filteredBreedList = breedsStateProvider.catsBreedsList.where(
          (breed) => breed.name.toLowerCase().contains(
          filterText.toLowerCase()
        )
      ).toList();
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
        child: Scrollbar(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).secondaryHeaderColor,
                  systemNavigationBarIconBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark
                ),
                floating: true,
                toolbarHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  title: BreedsAppBar(
                    searchTextValue: filterText,
                    onChangeSearch: (searchValue) {
                      setState(() {
                        filterText = searchValue;
                      });
                    }
                  ),
                  centerTitle: true,
                  titlePadding: const EdgeInsets.all(0),
                ),
                backgroundColor: Colors.transparent,
              ),
          
              SliverList(
                delegate: filteredBreedList.isEmpty
                ? SliverChildBuilderDelegate(
                    (context, index) => NoResultsMessage(),
                    childCount: 1
                  )
                : SliverChildBuilderDelegate(
                  childCount: filteredBreedList.length, (_, index) {
                    final breed = filteredBreedList[index];

                    return Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: BreedCard(breed: breed)
                    );
                  },
                )
              )
            ],
          ),
        ),
      )
    );
  }
}