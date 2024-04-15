import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'test_helper/test_helper.mocks.dart';

// Assuming MockConnectivity is generated correctly

void main() {
  group('Internet Connection Test', () {
    late MockConnectivity mockConnectivity;

    setUp(() {
      mockConnectivity = MockConnectivity();
    });

    test('should indicate internet connection is available when on WiFi', () async {
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async =>  ConnectivityResult.wifi);

      print('Before calling checkConnectivity');
      final result = await mockConnectivity.checkConnectivity();
      print('After calling checkConnectivity: $result');

      expect(result, ConnectivityResult.wifi);
    });

    // Other tests...
  });
}
