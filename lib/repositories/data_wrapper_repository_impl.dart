import 'package:dadoscovid/shared/http_provider/http_provider.dart';
import 'package:dadoscovid/shared/models/datawrapper.dart';

import 'data_wrapper_repository.dart';

class DataWrapperRepositoryImpl implements DataWrapperRepository {
  final HttpProvider httpProvider;

  DataWrapperRepositoryImpl({
    required this.httpProvider,
  });

  @override
  Future<DataWrapper> get(String url) async {
    final result = await this.httpProvider.get(url);
    return DataWrapper.fromMap(result);
  }
}
