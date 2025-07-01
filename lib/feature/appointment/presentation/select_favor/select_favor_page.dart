import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/widgets/select_favor/detail_sheet.dart';
import 'package:laprea/feature/appointment/widgets/widgets/search_input.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

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
  List<FavorData> fetchCategory() {
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
}

@RoutePage()
class SelectFavorPage extends StatelessWidget {
  const SelectFavorPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final favors = FavorRep().fetchCategory();
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(title: '${S.of(context).select_favor}($title)'),
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
                                      item.duration,
                                      style: context.textXsRegular(),
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
                          Gap(8),
                          Text(item.price, style: context.textBaseMedium()),
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
