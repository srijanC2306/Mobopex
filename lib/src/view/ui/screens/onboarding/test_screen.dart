import 'package:MoboPex/src/model/data/onboarding/mock_list_model.dart';
import 'package:MoboPex/src/view/base_stateless_widget.dart';
import 'package:MoboPex/src/view/resources/resources.dart';
import 'package:MoboPex/src/view/ui/base_stateless_mixin.dart';
import 'package:MoboPex/src/view_model/onboarding/test_view_model.dart';

class TestScreen extends BaseStatelessWidget with StatelessPageWithAppBar {
  TestScreen({Key? key}) : super(key: key);

  TestViewModel get _viewModel => Get.find<TestViewModel>();

  @override
  String? get title => TranslationKeys.mobileTechnologiesTitle.tr;

  @override
  Widget get content => Obx(() => contentWidget(
        apiStatus: _viewModel.apiStatus.value,
        onRetry: _viewModel.getMockList,
        successWidget: _myListWidget,
      ));

  Widget get _myListWidget => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _viewModel.myList.length,
          itemBuilder: (context, index) {
            Mylist item = _viewModel.myList[index];

            return ListTile(
                title: Text(item.title ?? ""),
                subtitle: Text(
                  item.subTitle ?? "",
                ));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      );
}
