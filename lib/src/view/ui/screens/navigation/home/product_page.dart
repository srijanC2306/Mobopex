import 'package:MoboPex/src/core/theme/custom_theme_extension.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/ui/widgets/home/rating_and_price.dart';
import 'package:MoboPex/src/view/ui/widgets/home/type_selection.dart';
import 'package:flutter/services.dart';

import '../../../../resources/color_constants.dart';
import '../../../widgets/home/color_selection.dart';
import '../../../widgets/home/product_details.dart';

class ProductPage extends StatefulWidget {
  final String productName;
  final String productType;
  final String productColor;
  final String specification;
  final List<String> imageUrls;

  const ProductPage({
    required this.productName,
    required this.productType,
    required this.productColor,
    required this.specification,
    required this.imageUrls,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          if (widget.imageUrls.isNotEmpty)
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
              expandedHeight: 300.0,
              pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: Container(
                  height: 30.0,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: Container(
                    width: 40.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: buildImageSlider(),
              ),
            ),
          SliverToBoxAdapter(
            child: bodyWidget(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  SizedBox(
                    child: IconButton(
                      onPressed: () {},
                      icon:  Icon(Icons.shopping_cart_outlined , size: 30,),
                      color: ColorConstants.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Button onPressed callback
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                            ColorConstants
                                .primaryColor, // Set color based on condition
                          ),
                        ),
                        child: const Text(
                          'Buy Now',
                          style: BaseTextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildImageSlider() {
    return Stack(
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
            key: UniqueKey(),
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index) {
              return Image.network(
                widget.imageUrls[index],
                fit: BoxFit.cover,
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 46,
          left: 0,
          right: 0,
          child: buildDotsIndicator(),
        )
      ],
    );
  }

  Widget buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.imageUrls.length,
        (index) => buildDot(index),
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        shape: BoxShape.circle,
        color: index == _currentPageIndex ? Colors.black : Colors.transparent,
      ),
    );
  }

  Widget bodyWidget() {
    return Container(
        padding:  const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                "${widget.productName} - ${widget.productColor}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const BaseTextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 48,
                child: const RatingAndPriceRow(
                    rating: "4.8", productPrice: "300", review: "100"),
              ),
              TypeSelection(),
              const SizedBox(height: 24),
              ColorSelection(),
              const SizedBox(height: 24),
              ProductDetails(
                productName: widget.productName,
                productType: widget.productType,
                productColor: widget.productColor,
                specifications: widget.specification,
                manufacturer: "Manufacturer no Added",
              ),
              SizedBox(height: 24),
            ],
          ),
        ));
  }
}
