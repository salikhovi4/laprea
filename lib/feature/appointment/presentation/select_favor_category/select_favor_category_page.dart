import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/widgets/select_favor/favor_item.dart';
import 'package:laprea/feature/appointment/widgets/widgets/search_input.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/navigation/router/router.gr.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class CategoryData {
  CategoryData({required this.title});

  final String title;
}

class FavorData {
  FavorData({
    required this.name,
    required this.description,
    required this.duration,
    required this.price,
    required this.bonus,
    required this.image,
  });

  final String name;
  final String duration;
  final String price;
  final String description;
  final String bonus;
  final String image;
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

@RoutePage()
class SelectFavorCategoryPage extends StatefulWidget {
  const SelectFavorCategoryPage({super.key});

  @override
  State<SelectFavorCategoryPage> createState() =>
      _SelectFavorCategoryPageState();
}

class _SelectFavorCategoryPageState extends State<SelectFavorCategoryPage> {
  final _categories = FavorRep().fetchCategory();
  var _query = '';

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = EdgeInsets.fromLTRB(16, 0, 16, 0);
    final searched = FavorRep().searchFavors(_query);
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(title: S.of(context).select_favor),
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
                          context.pushRoute(
                            SelectFavorRoute(title: item.title),
                          );
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                style: context.textBaseMedium(),
                              ),
                            ),
                            Gap(16),
                            Icon(Icons.arrow_right),
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
