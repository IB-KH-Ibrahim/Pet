import 'package:dio/dio.dart';
class ApiDio {
  final Dio _dio;

ApiDio(this._dio);


  Map<String, dynamic> _getHeaders({String? token}) {
    return {if (token != null) 'Authorization': 'Bearer $token'};
  }

  Future<dynamic> get({
    required String url,
    String? token,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: Options(headers: _getHeaders(token: token)),
    );
    return response.data;
  }

  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post(
      url,
      data: body,
      cancelToken: cancelToken,
      options: Options(headers: _getHeaders(token: token)),
    );

    return response.data;
  }

  Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.put(
      url,
      data: body,
      cancelToken: cancelToken,
      options: Options(headers: _getHeaders(token: token)),
    );

    return response.data;
  }

  Future<dynamic> patch({
    required String url,
    dynamic body,
    String? token,
    String? apiKey,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.patch(
      url,
      data: body,
      cancelToken: cancelToken,
      options: Options(headers: _getHeaders(token: token)),
    );

    return response.data;
  }

  Future<dynamic> delete({
    required String url,
    String? token,
    dynamic body,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete(
      url,
      data: body,
      cancelToken: cancelToken,
      options: Options(headers: _getHeaders(token: token)),
    );

    return response.data;
  }

  Future<Headers> head({required String url, String? token}) async {
    final response = await _dio.head(
      url,
      options: Options(headers: _getHeaders(token: token)),
    );

    return response.headers;
  }

  Future<dynamic> uploadFile({
    required String url,
    required String filePath,
    String fileFieldName = 'file',
    String? token,
    void Function(int sent, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    final formData = FormData.fromMap({
      fileFieldName: await MultipartFile.fromFile(filePath),
    });

    final response = await _dio.post(
      url,
      data: formData,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      options: Options(headers: _getHeaders(token: token)),
    );

    return response.data;
  }

  Future<dynamic> downloadFile({
    required String url,
    required String savePath,
    String? token,
    void Function(int received, int total)? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.download(
      url,
      savePath,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      options: Options(headers: _getHeaders(token: token)),
    );

    return response;
  }

  CancelToken createCancelToken() {
    return CancelToken();
  }

  void cancelRequest(CancelToken cancelToken, {String? reason}) {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel(reason ?? 'Request cancelled');
    }
  }

  void setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) {
          handler.next(error);
        },
      ),
    );
  }
}
