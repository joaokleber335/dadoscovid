import 'package:dadoscovid/shared/models/datawrapper.dart';

abstract class DataWrapperRepository {
  Future<DataWrapper> get(String url);
}
