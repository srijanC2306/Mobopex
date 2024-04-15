import 'package:MoboPex/src/view/base_stateless_widget.dart';
import '../../../resources/color_constants.dart';
import '../search/search_widget.dart';

class Heading extends StatelessWidget {
  final VoidCallback onPressedBackBtn;

  final String headingTxt;

  final String subHeading ;

  final bool isSearching;

  final bool isIcon ;

  final Function(String)? onChanged;

  const Heading(
      {this.headingTxt = "",
      required this.isSearching,
      required this.onPressedBackBtn,
        this.subHeading = "" ,
        this.isIcon = true ,
      required this.onChanged,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isSearching) ...[
            if(isIcon)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorConstants.primaryColor)),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: onPressedBackBtn,
                ),
              ),
            ),
            if (headingTxt != "")
              Expanded(
                  flex: 3,
                  child: isIcon?Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          headingTxt,
                          style: const BaseTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ColorConstants.primaryColor),
                        ),
                        if(subHeading !="")
                          Text(subHeading ,
                          style: const BaseTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: ColorConstants.textColor),
                          )
                      ],
                    ),
                  ): Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        headingTxt,
                        style: const BaseTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ColorConstants.primaryColor),
                      ),
                      if(subHeading !="")
                        Text(subHeading ,
                          style: const BaseTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: ColorConstants.textColor),
                        )
                    ],
                  ),
              ),

          ],
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: size.width * .90,
              minWidth: 40,
            ),
            child: SearchWidgets(
              isSearching: isSearching,
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
