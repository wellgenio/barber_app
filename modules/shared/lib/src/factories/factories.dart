import 'package:shared/shared.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../adapters/local_storage.dart';

Future<Talker> talkerFactory() async {
  return TalkerFlutter.init(
    settings: TalkerSettings(
      /// You can enable/disable all talker processes with this field
      enabled: true,

      /// You can enable/disable saving logs data in history
      useHistory: true,

      /// Length of history that saving logs data
      maxHistoryItems: 100,

      /// You can enable/disable console logs
      useConsoleLogs: true,
      colors: {
        // Colors for default log types can be defined with AnsiPen
        TalkerLogType.error.key: AnsiPen()..red(),
        TalkerLogType.info.key: AnsiPen()..blue(),
        TalkerLogType.warning.key: AnsiPen()..yellow(),
      },
    ),
    logger: TalkerLogger(),
  );
}

Future<Dio> dioFactory({
  required String baseUrl,
  List<Interceptor> interceptors = const [],
}) async {
  final dio = Dio();

  dio.options.baseUrl = baseUrl;
  dio.interceptors.addAll(interceptors);
  dio.interceptors.add(
    TalkerDioLogger(
      settings: TalkerDioLoggerSettings(
        // All http responses enabled for console logging
        printResponseData: true,
        // All http requests disabled for console logging
        printRequestData: false,
        // Response logs including http - headers
        printResponseHeaders: true,
        // Request logs without http - headers
        printRequestHeaders: false,
        // Blue http requests logs in console
        requestPen: AnsiPen()..blue(),
        // Green http responses logs in console
        responsePen: AnsiPen()..green(),
        // Error http logs in console
        errorPen: AnsiPen()..red(),
      ),
    ),
  );

  return dio;
}

Future<ILocalStorage> localStorageFactory() async {
  final shared = await SharedPreferences.getInstance();
  return SharedPreferencesAdapter(shared);
}
