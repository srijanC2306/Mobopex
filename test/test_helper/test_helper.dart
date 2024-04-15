import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([

],
    customMocks: [
  MockSpec<Dio>(as: #MockDioClint),
  MockSpec<SharedPreferences>(as: #MockSharedPreferences),
  MockSpec<Connectivity>(as: #MockConnectivity)
])
void main() {}