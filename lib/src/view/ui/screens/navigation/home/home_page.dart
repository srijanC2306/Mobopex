import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';
import 'package:MoboPex/src/view/base_stateful_widget.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';

import '../../../../../view_model/dashboard/home/home_controller.dart';
import '../../../widgets/carousel/carousel_with_dot.dart';
import '../../../widgets/home/heading.dart';
import '../../../widgets/navigator/base_navigator.dart';
import 'festive_sale.dart';
import 'top_pick.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());

  int currentIndex = 0;

  List<String> imageUrls = [
    'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dGVtcGVyZWQlMjBnbGFzcyUyMG1vYmlsZXxlbnwwfHwwfHx8MA%3D%3D',
    'https://as2.ftcdn.net/v2/jpg/02/29/73/01/1000_F_229730166_H5mfxAoOCDUKTB2I43b7DTk2U8yAvwy3.jpg'
        'https://t3.ftcdn.net/jpg/07/20/22/66/240_F_720226639_w4KjXArjPUssDbSx8B5PyDvGHOxBb2bN.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseNavigator(
      builder: (navKey) => Obx(
        () => Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsets.all(16),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Heading(
                            isSearching: homeController
                                .searchController.isSearching.value,
                            headingTxt: "New Here ?",
                            isIcon: false,
                            subHeading: "Find the best tempered glasses",
                            onPressedBackBtn: () {},
                            onChanged: (value) {}),
                        SizedBox(height: 24),
                        CarouselWithDot(imageUrl: imageUrls),
                        SizedBox(height: 24),
                       FestiveSale(),
                        TopPick(
                          navKey: navKey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
