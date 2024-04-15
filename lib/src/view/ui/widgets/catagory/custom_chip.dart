import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:flutter/cupertino.dart';

class CustomChip extends StatefulWidget {
  final List<String> chips;
  final List<Widget> pages;

  const CustomChip({required this.chips, required this.pages, super.key});

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  int _selectedIndex = 0; // No chip is selected initially

  Widget _buildChip(int index) {
    bool isSelected = _selectedIndex == index;
    return ChoiceChip(
      elevation: 5,
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedIndex = selected ? index : index; // Update selected index
        });
      },
      label: Text(
        widget.chips[index],
        style: BaseTextStyle(
          color: isSelected ? Colors.white :ColorConstants.primaryColor,
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
      backgroundColor: isSelected ? Colors.green : Colors.white,
      showCheckmark: false,
      selectedColor: ColorConstants.primaryColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? Colors.transparent : ColorConstants.primaryColor,
          width: 1.5, // Adjust the border width as needed
        ),
        borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8.0,
              direction: Axis.horizontal,
              children: List.generate(5, (index) => _buildChip(index)),
            ),
          ),
          SizedBox(height: 16),
          widget.pages[_selectedIndex]
        ],
      ),
    );
  }
}
