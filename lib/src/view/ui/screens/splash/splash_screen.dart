import 'package:MoboPex/routes/route_constants.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/asset_constants.dart';
import 'package:MoboPex/src/view/resources/resources.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color backgroundColor = const Color(0xff931b1b);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   // _sampleImageColor() ;
    Future.delayed(const Duration(seconds: 8) , (){

      Get.offAllNamed(RouteConstants.welcomeGuideRoute ) ;
    });
  }
  Future<void> _sampleImageColor() async {
    final ByteData data = await rootBundle.load(AssetConstants.splashGIF);
    final Uint8List bytes = data.buffer.asUint8List();
    final img.Image? image = img.decodeGif(bytes); // Make sure to handle the nullable Image object

    if (image != null) {
      // Sample the color from the center of the image
      final img.Pixel pixel = image.getPixel(image.width ~/ 2, image.height ~/ 2);
      final int red = (pixel.r as int).toInt();
      final int green = (pixel.g as int).toInt();
      final int blue = (pixel.b as int).toInt();

      final Color color = Color.fromRGBO(red, green, blue, 1.0);

      debugPrint("The Color Value is ::$color");

      // Set the background color to the sampled color
      setState(() {
        backgroundColor = Color.fromRGBO(red, green, blue, 1.0);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, // Background color for the splash screen
      body:  SizedBox(
        width: double.infinity,
          height: double.infinity,
          child: Image.asset(AssetConstants.splashGIF , width: double.infinity ,height: double.infinity,)), // Display the GIF image
      );

  }
}