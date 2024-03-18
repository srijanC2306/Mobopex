import 'package:MoboPex/app.dart';
import 'package:MoboPex/environment.dart';

void main() async {
  //Change environment during production release
  await app(Environment.userAcceptance);
}
