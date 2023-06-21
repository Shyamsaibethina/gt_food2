import 'package:flutter/material.dart';
import 'package:gt_food/constants.dart';

class BottomTab extends StatelessWidget {
  BottomTab(this.diningHall, {super.key});
  ValueNotifier<String> diningHall;

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 3;

    return DefaultTabController(
        length: tabsCount,
        child: Scaffold(
          backgroundColor: const Color(0xFF5FA8D3),
          bottomNavigationBar: TabBar(
            indicator: const BoxDecoration(color: Color(0xFFFCD0A1)),
            tabs: [
              Tab(
                  icon: Image.asset(
                'assets/images/brittain-transparent.png',
                width: 80,
                height: 80,
              )),
              Tab(
                  icon: Image.asset(
                'assets/images/nav-transparent.png',
                width: 80,
                height: 80,
              )),
              Tab(
                  icon: Image.asset(
                'assets/images/willage-transparent.png',
                width: 80,
                height: 80,
              )),
            ],
            onTap: (value) => {
              if (value == 0)
                {diningHall.value = DiningHall.brittain}
              else if (value == 1)
                {diningHall.value = DiningHall.northAve}
              else
                {diningHall.value = DiningHall.westVillage}
            },
          ),
        ));
  }
}
