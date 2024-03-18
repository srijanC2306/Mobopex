import 'package:MoboPex/src/model/data/api_error_model.dart';
import 'package:MoboPex/src/model/networking/api_error_response.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/resources.dart';

class ApiErrorWidget extends BaseStatelessWidget {
  final ApiErrorModel error;
  final Function() onRetry;

  const ApiErrorWidget(
      {Key? key, required this.error, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error.message,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20.0),
        Icon(error.httpStatusCode ==
                ApiResponseListener.noInternetConnection
            ? Icons.signal_wifi_connected_no_internet_4_outlined
            : Icons.error_outline_rounded),
        const SizedBox(height: 20.0),
        ElevatedButton(
            onPressed: onRetry,
            style:
                ElevatedButton.styleFrom(backgroundColor: ColorConstants.primaryColor),
            child: Text(
              TranslationKeys.retry.tr,
              style: const TextStyle(color: Colors.white),
            ))
      ],
    ));
  }
}
