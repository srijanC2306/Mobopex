import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/resources.dart';


class NotificationPage extends StatelessWidget {

  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text( 'Notification',style: BaseTextStyle(
            color: Colors.white,
              fontSize: 20,
            fontWeight: FontWeight.w700
          ),),
          centerTitle: true,
        ), 
        body: Container(
          child: Image.asset(AssetConstants.notification),
        ),
    
    );
  }
}
