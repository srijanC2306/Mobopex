import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/ui/widgets/home/heading.dart';
import 'package:MoboPex/src/view/ui/widgets/price/price_widget.dart';
import 'package:MoboPex/src/view_model/dashboard/home/top_pick/top_pick_controller.dart';

class TopPickPageDetails extends StatelessWidget {
  TopPickPageDetails({super.key});

  final topPickController = Get.put(TopPickController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Heading(
              headingTxt: "Top Picks",
              onPressedBackBtn: () {},
              isSearching: topPickController.searchController.isSearching.value,
              onChanged: (value) {},
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 0,
                      childAspectRatio: 9 / 16),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return HomeFeedItem(
                      imageSrc:
                          "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png",
                      heading: "Product X",
                      description: 'A description ...',
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}

class HomeFeedItem extends StatelessWidget {
  final String imageSrc;

  final String heading;

  final String description;

  const HomeFeedItem(
      {required this.imageSrc,
      required this.heading,
      required this.description,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(
          imageSrc,
          fit: BoxFit.cover,
          width: 180,
          height: 180,
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
              size: 20,
              color: Colors.green.shade900,
            ),
            Text(
              "10%",
              style: BaseTextStyle(
                  color: Colors.green.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 8.0),
            PriceWidget(rightPrice: "300", wrongPrice: "400")
          ],
        )
      ],
    );
  }
}
