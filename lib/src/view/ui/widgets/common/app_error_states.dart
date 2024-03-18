import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/asset_constants.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:MoboPex/src/view/resources/localization/translation_keys.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MoboPex/utils/string_util.dart';
import 'button/primary_elevated_btn.dart';

class AppError extends BaseStatelessWidget {
  final String assetName;
  final VoidCallback? onTap;
  final String? actionTitle;
  final String primaryText;
  final Color primaryTextColor;
  final VoidCallback? onSecondaryTap;
  final String? secondaryText;
  final TextStyle? secondaryTextStyle;
  final bool center;

  const AppError({
    Key? key,
    required this.assetName,
    this.onTap,
    this.actionTitle,
    required this.primaryText,
    this.primaryTextColor = ColorConstants.greyColor,
    this.onSecondaryTap,
    this.secondaryText,
    this.secondaryTextStyle,
    this.center = true,
  }) : super(key: key);

  AppError.network({
    Key? key,
    VoidCallback? onTap,
    String? primaryText,
    String? secondaryText,
  }) : this(
          key: key,
          assetName: AssetConstants.icErrorNetwork,
          onTap: onTap,
          primaryText:
              primaryText ?? TranslationKeys.noInternetConnectionTitle.tr,
          primaryTextColor: ColorConstants.statusColoursRed0,
          secondaryText:
              secondaryText ?? TranslationKeys.noInternetConnection.tr,
          actionTitle: TranslationKeys.retry.tr,
        );

  AppError.noData({
    Key? key,
    VoidCallback? onTap,
    String? primaryText,
    String? secondaryText,
  }) : this(
          key: key,
          assetName: AssetConstants.icErrorNoData,
          onTap: onTap,
          primaryText: primaryText ?? TranslationKeys.noDataTitle.tr,
          secondaryText: secondaryText ?? TranslationKeys.noData.tr,
          actionTitle: TranslationKeys.retry.tr,
        );

  AppError.server({
    Key? key,
    VoidCallback? onTap,
    String? primaryText,
    String? secondaryText,
    String? actionTitle,
  }) : this(
          key: key,
          assetName: AssetConstants.icErrorServer,
          onTap: onTap,
          primaryText: primaryText ?? TranslationKeys.serverErrorTitle.tr,
          primaryTextColor: ColorConstants.statusColoursRed0,
          secondaryText: secondaryText ?? TranslationKeys.somethingWentWrong.tr,
          actionTitle: actionTitle ?? TranslationKeys.retry.tr,
        );

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetName,
          color: ColorConstants.greyScaleDark4,
          height: 180,
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            primaryText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: primaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        if (secondaryText.isNotNullOrEmpty) const SizedBox(height: 8),
        if (secondaryText.isNotNullOrEmpty)
          GestureDetector(
            onTap: onSecondaryTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                secondaryText!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                        color: ColorConstants.greyScaleDark3, fontSize: 17)
                    .copyWith(
                  color: secondaryTextStyle?.color,
                  fontSize: secondaryTextStyle?.fontSize,
                ),
              ),
            ),
          ),
        if (onTap != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: PrimaryElevatedBtn(
                actionTitle ?? TranslationKeys.retry.tr, onTap!),
          ),
      ],
    );

    return center ? Center(child: content) : content;
  }
}
