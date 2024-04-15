import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';

class TypeSelection extends StatefulWidget {
  const TypeSelection({super.key});

  @override
  _TypeSelectionState createState() => _TypeSelectionState();
}

class _TypeSelectionState extends State<TypeSelection> {
  int _selectedType = 0; // assuming first type is selected by default

  Widget _buildChoiceChip(int index, String label) {
    return ChoiceChip(
      side: _selectedType == index
          ? const BorderSide(color: ColorConstants.primaryColor, width: 1)
          : const BorderSide(color: Colors.black),
      label: Text(label),
      labelStyle: BaseTextStyle(
          color: _selectedType == index ? Colors.red : Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w400),
      selected: _selectedType == index,
      onSelected: (bool selected) {
        setState(() {
          _selectedType = (selected ? index : null)!;
        });
      },
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
          "Type",
          style: BaseTextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: List<Widget>.generate(6, (int index) {
            return _buildChoiceChip(index, 'Type ${index + 1}');
          }),
        ),
      ],
    );
  }
}
