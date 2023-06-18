import 'package:flutter/material.dart';

class BottomTab extends StatelessWidget {
  const BottomTab({Key? key}) : super(key: key);

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
          ),
        ));
  }
}
