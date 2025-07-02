import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/presentation/select_favor_category/select_favor_category_page.dart';
import 'package:laprea/feature/appointment/widgets/select_favor/favor_item.dart';
import 'package:laprea/feature/appointment/widgets/widgets/search_input.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

@RoutePage()
class SelectFavorPage extends StatefulWidget {
  const SelectFavorPage({super.key, required this.title});

  final String title;

  @override
  State<SelectFavorPage> createState() => _SelectFavorPageState();
}

class _SelectFavorPageState extends State<SelectFavorPage> {
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
          title: '${S.of(context).select_favor}(${widget.title})',
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
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
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
