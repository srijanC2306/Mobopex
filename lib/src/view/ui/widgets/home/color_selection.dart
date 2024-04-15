import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../base_stateless_widget.dart';

class ColorSelection extends StatefulWidget {
  const ColorSelection({super.key});

  @override
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  int _selectedColorIndex = 0; // assuming first color is selected by default
  final List<Color> _colors = [
    Colors.white,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.black, // Add more colors if needed
  ];

  Widget _buildColorChoice(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColorIndex = index;
        });
      },
      child: Container(
        width: 40, // Diameter of the color choice
        height: 40, // Diameter of the color choice
        decoration: BoxDecoration(
          color: _colors[index],
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectedColorIndex == index ? Colors.red : Colors.transparent,
            width: 2, // Width of the border
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Color",
          style: BaseTextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8.0, // gap between adjacent color choices
          runSpacing: 8.0, // gap between lines
          children: List<Widget>.generate(_colors.length, (int index) {
            return _buildColorChoice(index);
          }),
        ),
      ],
    );
  }
}
