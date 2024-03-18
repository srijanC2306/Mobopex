import 'package:MoboPex/src/view/ui/screens/navigation/home/home_page.dart';
import 'package:MoboPex/src/view/ui/screens/navigation/home/top_pick_details.dart';
import 'package:MoboPex/src/view/ui/widgets/dashboard/dashboard_tab.dart';
import 'package:flutter/material.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<DashboardTab> pages = [] ;

  int selectedPageIndex = 0 ;

  @override
  void initState() {
   pages = [
     DashboardTab(
      icon: Icons.home,
         selectedIcon: Icons.home_filled,
         widget:  HomePage()),
     DashboardTab(
         icon: Icons.window,
         selectedIcon: Icons.window_outlined,
         widget: Container(
           color: Colors.orange,
         )),
     DashboardTab(
         icon: Icons.notifications,
         selectedIcon: Icons.notifications_active,
         widget: Container(
           color: Colors.green,
         )),
     DashboardTab(
         icon: Icons.shopping_cart_outlined,
         selectedIcon: Icons.shopping_cart_rounded,
         widget: Container(
           color: Colors.yellow,
         )),
     DashboardTab(
         icon: Icons.person,
         selectedIcon: Icons.person,
         widget: Container(
           color: Colors.pink,
         )),
   ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        body: TabBarView(
          children: pages.map((page) => page.widget).toList(),
        ),
        bottomNavigationBar: DashboardTabs(
          tabs: pages ,
            selectedIndex: selectedPageIndex,
            onSelectedPage: (index){
            setState(() {
              selectedPageIndex = index ;
            });
            },
           ),

      ),
    );
  }
}
