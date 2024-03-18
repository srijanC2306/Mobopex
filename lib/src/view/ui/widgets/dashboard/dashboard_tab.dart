import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:MoboPex/utils/iterable.dart';
import 'package:flutter/material.dart';


class DashboardTab{
  final Widget widget ;
  final IconData icon ;
  final IconData selectedIcon ;

  DashboardTab({
    required this.icon,
    required this.selectedIcon ,
    required this.widget,

});

}

class DashboardTabs extends StatelessWidget {
  final int selectedIndex ;
  final Function(int) onSelectedPage ;
  final List<DashboardTab> tabs ;

  const DashboardTabs({
    required this.selectedIndex ,
    required this.onSelectedPage ,
    required this.tabs ,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: AnimatedContainer(
        height: 70,
        duration: const Duration(milliseconds:200 ),
        decoration:  BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border:  Border.all(color: Colors.pink.shade200 , width: 1),
            boxShadow:  [BoxShadow(color: Colors.grey.withOpacity(0.5) , blurRadius: 4  ,spreadRadius: 4, offset: Offset(1,3))]
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TabBar(
              indicatorPadding:
              const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            indicator: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),

                ),
            ),
            dividerColor: Colors.transparent,
            onTap: onSelectedPage,
            tabs: tabs.mapIndexed((tab,index ) {
              return TabItem(
                  asset: tab.icon,
                  selectedAsset: tab.selectedIcon,
                  isSelected: selectedIndex == index);
            }).toList()
          ),
        ),

      ),
    );
  }
}

class TabItem extends StatelessWidget{
  final IconData asset ;
  final IconData selectedAsset ;
  final bool isSelected ;


  const TabItem({
    required this.asset ,
    required this.selectedAsset ,
    required this.isSelected ,
    super.key});


  @override
  Widget build(BuildContext context) {
   return Icon(
        isSelected ? selectedAsset :asset ,
        size: 30,
       color: isSelected? ColorConstants.primaryColor : Colors.black,

   );
  }
}
