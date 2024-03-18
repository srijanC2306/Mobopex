import 'package:cached_network_image/cached_network_image.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/color_constants.dart';
import 'package:MoboPex/utils/string_util.dart';

class AppCircularAvatar extends BaseStatelessWidget {
  /// The url of the image to be loaded
  final String? imageUrl;

  /// The text to be displayed in place of the image as a fallback.
  /// Usually a single captial character.
  /// This takes precedence over [placeholder]
  final String? text;

  /// The placeholder to be displayed in place of the image as a fallback.
  /// If [text] is not null and not empty, this is ignored.
  final Widget? placeholder;

  /// Radius of the avatar. The height and width of the avtar are 2 * [radius]
  final double radius;

  /// The background color of the avtar. Visible in case of a fallback.
  final Color color;

  final Map<String, String>? headers;

  final bool isGroupImageUrl;

  final BoxFit fit;

  const AppCircularAvatar({
    Key? key,
    this.imageUrl,
    this.text,
    this.placeholder,
    this.radius = 24,
    this.color = ColorConstants.greyScaleDark2,
    this.headers,
    this.isGroupImageUrl = false,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  Widget _imageView(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      httpHeaders: headers,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: fit),
        ),
      ),
      placeholder: (context, url) {
        return _placeHolder;
      },
      errorWidget: (context, url, error) {
        return _placeHolder;
      },
    );
  }

  Widget get _placeHolder {
    Widget? c;
    if (placeholder != null) c = placeholder;
    if (text.isNotNullOrEmpty) {
      c = Text(
        text!,
        style: TextStyle(
          color: Colors.white,
          fontSize: radius,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(child: c),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return _placeHolder;
    }

    // var url = Uri.encodeComponent(imageUrl!);
    var url = imageUrl.transformedUrl!;
    // url = Uri.encodeFull(url);
    // final url = imageUrl == null ? "" : imageUrl!.trim().replaceAll(" ", "%20");

    return ((isGroupImageUrl && url.isNotNullOrEmpty) || url.isValidUrl)
        ? _imageView(url)
        : _placeHolder;
  }
}
