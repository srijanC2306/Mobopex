import 'package:flutter/material.dart';
import 'package:MoboPex/src/model/data/result_model.dart';
import 'package:MoboPex/src/view/ui/widgets/common/app_error_states.dart';
import 'package:MoboPex/src/view/ui/widgets/common/app_loader.dart';

mixin BaseContentWidget {
  Widget contentWidget({
    required ApiStatus apiStatus,
    VoidCallback? onRetry,
    required Widget successWidget,
    VoidCallback? onRetryNoData,
    VoidCallback? onRetryNetwork,
    VoidCallback? onRetryServer,
  }) {
    switch (apiStatus) {
      case ApiStatus.loading:
        return loaderWidget;
      case ApiStatus.empty:
        return emptyWidget(onTap: onRetryNoData ?? onRetry);
      case ApiStatus.networkError:
        return networkErrorWidget(onTap: onRetryNetwork ?? onRetry);
      case ApiStatus.serverError:
        return serverErrorWidget(onTap: onRetryServer ?? onRetry);
      case ApiStatus.success:
        return successWidget;
      default:
        return defaultWidget;
    }
  }

  Widget get loaderWidget => const AppLoader();

  Widget emptyWidget({VoidCallback? onTap}) => AppError.noData(onTap: onTap);

  Widget networkErrorWidget({VoidCallback? onTap}) =>
      AppError.network(onTap: onTap);

  Widget serverErrorWidget({VoidCallback? onTap}) =>
      AppError.server(onTap: onTap);

  Widget get defaultWidget => const SizedBox.shrink();
}
