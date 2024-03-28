import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';

import '../../../../base_stateless_widget.dart';
import '../../../widgets/home/heading_with_time.dart';

class FestiveSale extends StatelessWidget {
  const FestiveSale({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context) ;
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           HeadingWithTimer(heading: "Festive Sale" , endTime:
          DateTime.now().add( const Duration(days: 5 , hours: 3 , minutes: 30)),),
           SizedBox(height: 12,),
          SizedBox(
            height: 200,
            child: ListView.builder(
               scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const FestiveSaleItem(
                    imageSrc:
                        "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
                    heading: "Product X",
                    description: 'A description ...',
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class FestiveSaleItem extends StatelessWidget {
  final String imageSrc;

  final String heading;

  final String description;

  const FestiveSaleItem(
      {required this.imageSrc,
      required this.heading,
      required this.description,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              imageSrc,
              fit: BoxFit.cover,
              width: 180,
              height: 120,
            ),
            Text(heading,
                style: const BaseTextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
            Text(description,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const BaseTextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.green,
                ),
                Text(
                  "10%",
                  style: BaseTextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                )
              ],
            )
          ]),
    );
  }
}
