import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/widgets/widgets/search_input.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/navigation/router/router.gr.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

class CategoryData {
  CategoryData({required this.title});

  final String title;
}

class CategoryRep {
  List<CategoryData> fetchCategory() {
    return [
      CategoryData(title: 'Массаж'),
      CategoryData(title: 'Косметология'),
      CategoryData(title: 'Омоложение'),
      CategoryData(title: 'Релакс'),
    ];
  }
}

@RoutePage()
class SelectSpecialistCategoryPage extends StatelessWidget {
  const SelectSpecialistCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryRep().fetchCategory();
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(title: S.of(context).select_specialist),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SearchInput()),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = categories[index];
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
                }, childCount: categories.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
