import 'package:bloc_architecture_learning/core/helper/network_helper/network_info_helper_impl.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoHelperImpl networkInfoImpl;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl =  NetworkInfoHelperImpl(mockDataConnectionChecker);
  });
  mockDataConnectionChecker = MockDataConnectionChecker();
  networkInfoImpl =  NetworkInfoHelperImpl(mockDataConnectionChecker);

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.has connection',
        () async {
      //arrange
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      //act
      final result = networkInfoImpl.isConnected;
      //assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
