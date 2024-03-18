
import '../../../base_stateless_widget.dart';
import '../../../resources/color_constants.dart';
import '../../screens/navigation/home/top_pick_details.dart';
class HeadingWithView extends StatelessWidget {
  final String heading  ;

  HeadingWithView({
    required this.heading ,
    super.key});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=> TopPickPageDetails()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading ,
              style: const BaseTextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorConstants.primaryColor)

          ) ,
          Text('See Alls' ,
          style: BaseTextStyle(
            color: ColorConstants.textColor ,
            fontSize: 15  ,
            fontWeight: FontWeight.w400
          ),
          )

        ],
      ),
    );
  }

}
