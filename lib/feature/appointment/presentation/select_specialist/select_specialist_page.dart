import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:laprea/feature/appointment/presentation/select_specialist_category/select_specialist_category_page.dart';
import 'package:laprea/feature/appointment/widgets/select_specialist/specialist_item.dart';
import 'package:laprea/ui_kit/widget/search_input.dart';
import 'package:laprea/generated/localization/l10n.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

@RoutePage()
class SelectSpecialistPage extends StatefulWidget {
  const SelectSpecialistPage({super.key, required this.title});

  final String title;

  @override
  State<SelectSpecialistPage> createState() => _SelectSpecialistPageState();
}

class _SelectSpecialistPageState extends State<SelectSpecialistPage> {
  var _query = '';

  @override
  Widget build(BuildContext context) {
    final specialists =
        _query.isEmpty
            ? SpecialistsRep().fetchSpecialists()
            : SpecialistsRep().searchSpecialists(_query);
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(
          title: '${S.of(context).select_specialist}(${widget.title})',
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
                itemCount: specialists.length,
                itemBuilder: (BuildContext context, int index) {
                  return SpecialistItem(item: specialists[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
