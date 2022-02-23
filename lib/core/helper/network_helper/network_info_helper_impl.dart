import 'package:bloc_architecture_learning/core/helper/network_helper/network_info_helper.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

class NetworkInfoHelperImpl implements NetworkInfoHelper {
  final DataConnectionChecker connectionChecker;

  NetworkInfoHelperImpl(this.connectionChecker);
  @override
  Future<bool> get isConnected =>
      connectionChecker.hasConnection;
}
