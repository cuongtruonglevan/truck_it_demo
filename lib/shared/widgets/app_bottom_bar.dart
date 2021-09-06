import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckit_demo/shared/shared.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNavigationBar extends StatelessWidget {
  AppBottomNavigationBar({Key? key}) : super(key: key);

  final Color backgroundColor = Colors.white;
  final Color color = AppColor.ff505050;
  final Color selectedColor = AppColor.ff505050;
  final RxInt _selectedIndex = 0.obs;
  final List<AppBottomNavigationBarItem> items = [
    AppBottomNavigationBarItem(
        iconAsset: AppAsset.icDashboardAlerts, label: 'ALERTS'),
    AppBottomNavigationBarItem(
        iconAsset: AppAsset.icDashboardMyJobs, label: 'MY JOBS'),
    AppBottomNavigationBarItem(
        iconAsset: AppAsset.icDashboardAlerts, label: 'DASHBOARD'),
    AppBottomNavigationBarItem(
        iconAsset: AppAsset.icDashboardMyQuotes, label: 'MY QUOTES'),
    AppBottomNavigationBarItem(
        iconAsset: AppAsset.icDashboardMore, label: 'MORE'),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = List.generate(items.length, (int index) {
      return _buildTabItem(
        context,
        item: items[index],
        index: index,
      );
    });

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _items,
      ),
      color: backgroundColor,
    );
  }

  Widget _buildTabItem(
    BuildContext context, {
    AppBottomNavigationBarItem? item,
    int? index,
  }) {
    return Expanded(
      child: SizedBox(
        height: 75.w,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              if (_selectedIndex.value != index) {
                _selectedIndex.value = index!;
              } else {
                return;
              }
            },
            child: Obx(() {
              final _color =
                  _selectedIndex.value == index ? selectedColor : color;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10.w),
                  Expanded(
                    child: item!.label == 'DASHBOARD'
                        ? Icon(Icons.dashboard_outlined,
                            size: 20.w, color: AppColor.ff505050)
                        : Image.asset(
                            item.iconAsset,
                            color: _color,
                            width: getWidth(item.label),
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                  Text(
                    item.label,
                    style: AppTextStyle.normalSemiBold8
                        .copyWith(color: AppColor.ff838383),
                  ),
                  SizedBox(height: 20.w),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  double getWidth(String label) {
    switch (label) {
      case 'ALERTS':
        return 18.w;
      case 'MY QUOTES':
        return 16.w;
      default:
        return 22.w;
    }
  }
}

class AppBottomNavigationBarItem {
  AppBottomNavigationBarItem({required this.iconAsset, required this.label});

  String iconAsset;
  String label;
}
