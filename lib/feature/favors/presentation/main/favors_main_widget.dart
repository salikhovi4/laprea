import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/presentation/select_favor_category/select_favor_category_page.dart';
import 'package:laprea/feature/favors/widgets/favor/favor_item.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/navigation/router/router.gr.dart';
import 'package:laprea/ui_kit/ui_kit.dart';
import 'package:laprea/ui_kit/widget/search_input.dart';

class CategoryData {
  CategoryData({required this.title});

  final String title;
}

class FavorRep {
  List<CategoryData> fetchCategory() {
    return [
      CategoryData(title: 'Массаж'),
      CategoryData(title: 'Косметология'),
      CategoryData(title: 'Омоложение'),
      CategoryData(title: 'Релакс'),
    ];
  }

  List<FavorData> fetchFavors() {
    return List.generate(
      20,
      (_) => FavorData(
        name: 'Расслабляющий массаж',
        description:
            'Расслабляющий массаж спиныи всего тела оздоровляет органи',
        price: '2987 ₽',
        duration: '60 мин',
        bonus: '+35 бонусов',
        image: UiAssets.favor4,
      ),
    );
  }

  List<FavorData> searchFavors(String query) {
    return List.generate(
      2,
      (_) => FavorData(
        name: 'Расслабляющий массаж',
        description:
            'Расслабляющий массаж спиныи всего тела оздоровляет органи',
        price: '2987 ₽',
        duration: '60 мин',
        bonus: '+35 бонусов',
        image: UiAssets.favor4,
      ),
    );
  }
}

class FavorsMainWidget extends StatefulWidget {
  const FavorsMainWidget({super.key});

  @override
  State<FavorsMainWidget> createState() => _FavorsMainWidgetState();
}

class _FavorsMainWidgetState extends State<FavorsMainWidget> {
  final _categories = FavorRep().fetchCategory();
  var _query = '';

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(16, 0, 16, 0);
    final searched = FavorRep().searchFavors(_query);
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(title: S.of(context).favor, hasBackButton: false),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SearchInput(
                onChanged: (value) {
                  setState(() {
                    _query = value;
                  });
                },
              ),
            ),
            if (_query.isEmpty)
              SliverPadding(
                padding: padding,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = _categories[index];
                    return SizedBox(
                      height: 56,
                      child: InkWellNoSplash(
                        onTap: () {
                          context.pushRoute(FavorListRoute(title: item.title));
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                style: context.textBaseMedium(),
                              ),
                            ),
                            const Gap(16),
                            const Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    );
                  }, childCount: _categories.length),
                ),
              )
            else
              SliverFillRemaining(
                child: ListView.builder(
                  padding: padding,
                  itemCount: searched.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FavorItem(item: searched[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
