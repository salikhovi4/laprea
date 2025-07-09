import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/widgets/select_specialist/specialist_item.dart';
import 'package:laprea/ui_kit/widget/search_input.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/navigation/router/router.gr.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class CategoryData {
  CategoryData({required this.title});

  final String title;
}

class SpecialistData {
  SpecialistData({
    required this.name,
    required this.description,
    required this.experience,
    required this.rating,
    required this.image,
  });

  final String name;
  final String experience;
  final String description;
  final String rating;
  final String image;
}

class SpecialistsRep {
  List<CategoryData> fetchCategory() {
    return [
      CategoryData(title: 'Массаж'),
      CategoryData(title: 'Косметология'),
      CategoryData(title: 'Омоложение'),
      CategoryData(title: 'Релакс'),
    ];
  }

  List<SpecialistData> fetchSpecialists() {
    return List.generate(
      20,
      (_) => SpecialistData(
        name: 'Журавлёва Виктория',
        description:
            'Специалист по коррекции фигуры, Ваккумный массаж с липолазером',
        experience: '10 лет',
        rating: '4.8',
        image: UiAssets.specialist1,
      ),
    );
  }

  List<SpecialistData> searchSpecialists(String query) {
    return List.generate(
      2,
      (_) => SpecialistData(
        name: 'Журавлёва Виктория',
        description:
            'Специалист по коррекции фигуры, Ваккумный массаж с липолазером',
        experience: '10 лет',
        rating: '4.8',
        image: UiAssets.specialist1,
      ),
    );
  }
}

@RoutePage()
class SelectSpecialistCategoryPage extends StatefulWidget {
  const SelectSpecialistCategoryPage({super.key});

  @override
  State<SelectSpecialistCategoryPage> createState() =>
      _SelectSpecialistCategoryPageState();
}

class _SelectSpecialistCategoryPageState
    extends State<SelectSpecialistCategoryPage> {
  final _categories = SpecialistsRep().fetchCategory();

  var _query = '';

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = EdgeInsets.fromLTRB(16, 0, 16, 0);
    final searched = SpecialistsRep().searchSpecialists(_query);
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(title: S.of(context).select_specialist),
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
                            SelectSpecialistRoute(title: item.title),
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
                    return SpecialistItem(item: searched[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
