import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/widgets/select_specialist/detail_sheet.dart';
import 'package:laprea/feature/appointment/widgets/widgets/search_input.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

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

class FavorRep {
  List<SpecialistData> fetchCategory() {
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
}

@RoutePage()
class SelectSpecialistPage extends StatelessWidget {
  const SelectSpecialistPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final favors = FavorRep().fetchCategory();
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(title: '${S.of(context).select_specialist}($title)'),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SearchInput()),
            SliverFillRemaining(
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                itemCount: favors.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = favors[index];
                  return InkWellNoSplash(
                    onTap: () {
                      showModalBottomSheet<void>(
                        useRootNavigator: true,
                        context: context,
                        builder: (BuildContext context) {
                          return DetailSheet(data: item);
                        },
                      );
                    },
                    child: Container(
                      height: 80,
                      margin: EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: UiColors.card,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Image.asset(item.image, fit: BoxFit.contain),
                          ),
                          Gap(16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.name,
                                        style: context.textSmRegular(),
                                      ),
                                    ),
                                    Text(
                                      item.rating,
                                      style: context.textXsRegular().copyWith(
                                        color:
                                            UiColors.specialistRatingTextColor,
                                      ),
                                    ),
                                    Gap(2),
                                    UiIcon(
                                      UiAssets.ratingStar,
                                      height: 15,
                                    ),
                                  ],
                                ),
                                Text(
                                  item.description + item.description,
                                  style: context.textXsRegular(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
