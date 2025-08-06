import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laprea/feature/favors/presentation/cubit/favors_cubit.dart';
import 'package:laprea/feature/favors/widgets/favor/favor_item.dart';
import 'package:laprea/navigation/router/router.gr.dart';
import 'package:laprea/ui_kit/ui_kit.dart';
import 'package:laprea/ui_kit/widget/error_button.dart';
import 'package:laprea/ui_kit/widget/search_input.dart';

class FavorsMainWidget extends StatefulWidget {
  const FavorsMainWidget({super.key, required this.title});

  final String title;

  @override
  State<FavorsMainWidget> createState() => _FavorsMainWidgetState();
}

class _FavorsMainWidgetState extends State<FavorsMainWidget> {
  var _query = '';

  @override
  void initState() {
    super.initState();
    context.read<FavorsCubit>().fetchFavors();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(16, 0, 16, 0);
    return SafeArea(
      child: Scaffold(
        appBar: UiAppBar(title: widget.title, hasBackButton: false),
        body: BlocBuilder<FavorsCubit, FavorsState>(
          builder: (context, state) {
            if (state.favorsStatus.isLoading()) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.favorsStatus.isFailure()) {
              return ErrorButton(
                onPressed: context.read<FavorsCubit>().fetchFavors,
                text: state.exception?.errorText,
              );
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SearchInput(
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
                      context.read<FavorsCubit>().searched(value);
                    },
                  ),
                ),
                if (_query.isEmpty)
                  SliverPadding(
                    padding: padding,
                    sliver: SliverList.builder(
                      itemCount: state.favors.length,
                      itemBuilder: (context, index) {
                        final item = state.favors[index];
                        return SizedBox(
                          height: 56,
                          child: InkWellNoSplash(
                            onTap: () {
                              context.pushRoute(
                                ServiceListRoute(
                                  title: item.categoryName,
                                  list: item.services,
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.categoryName,
                                    style: context.textBaseMedium(),
                                  ),
                                ),
                                const Gap(16),
                                const Icon(Icons.arrow_right),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                else
                  SliverFillRemaining(
                    child: ListView.builder(
                      padding: padding,
                      itemCount: state.searched.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FavorItem(item: state.searched[index]);
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
