import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laprea/feature/favors/data/favors_rep.dart';
import 'package:laprea/feature/favors/data/models/service_data.dart';
import 'package:laprea/feature/favors/widgets/favor/favor_item.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';
import 'package:laprea/ui_kit/widget/search_input.dart';

@RoutePage()
class ServiceListPage extends StatefulWidget {
  const ServiceListPage({super.key, required this.title, required this.list});

  final String title;
  final List<ServiceData> list;

  @override
  State<ServiceListPage> createState() => _ServiceListPageState();
}

class _ServiceListPageState extends State<ServiceListPage> {
  var _query = '';

  @override
  Widget build(BuildContext context) {
    final favors =
        _query.isEmpty
            ? widget.list
            : context.read<FavorsRep>().searched(_query);
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(title: '${S.of(context).favor}(${widget.title})'),
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
