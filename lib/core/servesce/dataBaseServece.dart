abstract class DataBaseServese {
  Future<void> addData(
      {required String endPoint,
        required Map<String, dynamic> body});

  Future<dynamic> getData({required String endPoint,  String? token});
}
