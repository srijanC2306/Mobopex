import 'package:MoboPex/src/view/base_stateless_widget.dart';

class PriceWidget extends StatelessWidget {
  final String wrongPrice ;
  final String rightPrice  ;
  const PriceWidget({
    required this.rightPrice ,
    required this.wrongPrice ,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('₹${wrongPrice}' ,
        style:  const TextStyle(
          fontSize: 12 ,
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.w200,
            color: Colors.black
        ),
        ),
        const SizedBox(width: 8.0) ,
        Text('₹${rightPrice}' ,
          style: const BaseTextStyle(
              fontSize: 12 ,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
        )
      ],
    );
  }
}
