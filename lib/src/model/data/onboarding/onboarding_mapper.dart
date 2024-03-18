
import 'package:MoboPex/src/model/data/mapper.dart';
import 'package:MoboPex/src/model/data/onboarding/mock_list_model.dart';

void registerOnBoardingConstructors() {
  MapperFactory.registerConstructor<MockListModel>(
          (map) => MockListModel.fromString(map));

  // List of registers
}
