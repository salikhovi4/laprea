import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:laprea/navigation/bottom_bar/bottom_bar_item.dart';
import 'package:laprea/navigation/router/router.gr.dart';
import 'package:laprea/ui_kit/theme/app_style.dart';
import 'package:laprea/ui_kit/ui_kit.dart';

const _bottomBarRoutes = [HomeRouteRoot(), FavorsRouteRoot(), AppointmentRouteRoot(), ProfileRouteRoot()];

final _bottomBarMenuItems = <BottomBarItemModel>[
  BottomBarItemModel(label: 'Главная', assetPath: UiAssets.home24),
  BottomBarItemModel(label: 'Услуги', assetPath: UiAssets.favors24),
  BottomBarItemModel(label: 'Запись', assetPath: UiAssets.appointment24),
  BottomBarItemModel(label: 'Профиль', assetPath: UiAssets.account24),
];

@RoutePage(name: 'BottomBar')
class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomNavigationBarState();
}

TabsRouter? bottomTabsRouter;
ValueNotifier<int> currentIndex = ValueNotifier(0);

class _BottomNavigationBarState extends State<BottomBar> {
  void _initListener(TabsRouter router) {
    router.addListener(() {
      currentIndex.value = router.activeIndex;
    });
  }

  BottomNavigationBarItem _buildBottomBarItem(BottomBarItemModel model) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SizedBox(
          width: 56,
          height: 32,
          child: Center(child: UiIcon(model.assetPath, color: context.themePrimaryColor, box: 24)),
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SizedBox(
          width: 56,
          height: 32,
          child: DecoratedBox(
            decoration: BoxDecoration(color: UiColors.accentSecondary, borderRadius: BorderRadius.circular(16)),
            child: Center(child: UiIcon(model.assetPath, box: 24)),
          ),
        ),
      ),
      label: model.label,
    );
  }

  void _onBottomBarIconPressed(int index) {
    bottomTabsRouter?.setActiveIndex(index);
    currentIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = AppStyle(context);
    return AutoTabsScaffold(
      backgroundColor: context.themeBgColor,
      routes: _bottomBarRoutes,
      bottomNavigationBuilder: (_, tabsRouter) {
        bottomTabsRouter ??= tabsRouter;
        _initListener(tabsRouter);

        return ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, index, child) {
            return BottomNavigationBar(
              currentIndex: index,
              type: BottomNavigationBarType.fixed,
              backgroundColor: context.themeBgColor,
              selectedItemColor: UiColors.accent,
              unselectedItemColor: UiColors.accent,
              selectedLabelStyle: textStyles.textXsMedium.copyWith(color: UiColors.accent),
              unselectedLabelStyle: textStyles.textXsMedium.copyWith(color: UiColors.accent),
              items: _bottomBarMenuItems.map((el) => _buildBottomBarItem(el)).toList(),
              onTap: (index) => _onBottomBarIconPressed(index),
            );
          },
        );
      },
    );
  }
}
