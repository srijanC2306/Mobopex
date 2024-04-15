import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';

class RatingAndPriceRow extends StatelessWidget {
  final String productPrice;

  final String review;

  final String rating;

  const RatingAndPriceRow(
      {required this.rating,
      required this.productPrice,
      required this.review,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 18.0),
        SizedBox(width: 8),
        Text(
          rating,
          style: const BaseTextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(width: 8),

        Text('($review Reviews)'),

        const Spacer(),

        // Price Text
        Text(
          '₹ $productPrice',
          style: const BaseTextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
