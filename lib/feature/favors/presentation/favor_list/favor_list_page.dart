import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/favors/presentation/main/favors_main_widget.dart';
import 'package:laprea/feature/favors/widgets/favor/favor_item.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';
import 'package:laprea/ui_kit/widget/search_input.dart';

@RoutePage()
class FavorListPage extends StatefulWidget {
  const FavorListPage({super.key, required this.title});

  final String title;

  @override
  State<FavorListPage> createState() => _FavorListPageState();
}

class _FavorListPageState extends State<FavorListPage> {
  var _query = '';

  @override
  Widget build(BuildContext context) {
    final favors =
    _query.isEmpty
        ? FavorRep().fetchFavors()
        : FavorRep().searchFavors(_query);
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(
          title: '${S.of(context).favor}(${widget.title})',
        ),
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
            SliverFillRemaining(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                itemCount: favors.length,
                itemBuilder: (BuildContext context, int index) {
                  return FavorItem(item: favors[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
