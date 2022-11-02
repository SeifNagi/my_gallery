import '../endpoints.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDg4ZTM4Njg5ZDYyM2U3N2RjMGNmYzZjNmYzMTUwZThhNDUzMDE4YmFjNWE3ODhmOGQyZmQ0MjJiMzE4NDNmMTE2NjJlYzAxN2M5M2MyYWUiLCJpYXQiOjE2NjczODc1NTMuNDg4MjQ3LCJuYmYiOjE2NjczODc1NTMuNDg4MjUzLCJleHAiOjE2OTg5MjM1NTMuNDY1ODA5LCJzdWIiOiI4MyIsInNjb3BlcyI6W119.Aaj2tAHnKCNpMKzL3DMsgLbJJjwVdyuiDTkS8ox_7q82jTIW9_SGdKbvi9BJF5Euo-1PmKZgrUW_11BwzeD3Jq7kls6515kTK_w2mulaL-vkWX-kreha7g5K3dXyZ2uIa9exyqOc2TxYlgQZLuD9UZq2f13owitMnmY-fg2wFhEBdhbV3XzpdBodWm1PVPhnucnO8ZZJOzMRU41VnEn1oNKHPhTLHsLT9QKjh4EB2QRD4qb3tuHK06jJ64rt7i9ydMXMguFilF1A8Avl9A3Y-OxP4B9IcC_c9uMRN0tOFQLgb9BWg50vyCGltXBR0ZlMo7jXRF9VAgzspHMmI1QE5L5Mb6kEaIPVsvXJtyy5-PAygSW3wsw7R5mdlU31ZcMmphYTE-FFaO07Vqr7P1vwujJFaI1MmIrEcqlg4VR4-fzoswrPOy312eJcTYwfRFLU5ES2QDIXdwosqQAuLw_CkI6zDkIUucdYOLC_-yIQNOusgbKZpW2pb7d8Jrch1_Ns61YwGT_vlFLD0gxmjY5BaMLyw_81qZPbieUPuICrBw3Sdxb6ezFns_fA27OH79C-ccLVEvDqXAmVjhBsQTjnnGDKyExRPID-aeXs3SMHKypp8MxSPGO2pVUvNFodB9s6Ufeq5DsnxJByGThp5e5-sNnYsjv9U-YuiLYmHwkVH4U',
    required Map<String, dynamic> query,
  }) async {
    dio.options = BaseOptions(headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print(baseUrl);
    return await dio.get(baseUrl, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDg4ZTM4Njg5ZDYyM2U3N2RjMGNmYzZjNmYzMTUwZThhNDUzMDE4YmFjNWE3ODhmOGQyZmQ0MjJiMzE4NDNmMTE2NjJlYzAxN2M5M2MyYWUiLCJpYXQiOjE2NjczODc1NTMuNDg4MjQ3LCJuYmYiOjE2NjczODc1NTMuNDg4MjUzLCJleHAiOjE2OTg5MjM1NTMuNDY1ODA5LCJzdWIiOiI4MyIsInNjb3BlcyI6W119.Aaj2tAHnKCNpMKzL3DMsgLbJJjwVdyuiDTkS8ox_7q82jTIW9_SGdKbvi9BJF5Euo-1PmKZgrUW_11BwzeD3Jq7kls6515kTK_w2mulaL-vkWX-kreha7g5K3dXyZ2uIa9exyqOc2TxYlgQZLuD9UZq2f13owitMnmY-fg2wFhEBdhbV3XzpdBodWm1PVPhnucnO8ZZJOzMRU41VnEn1oNKHPhTLHsLT9QKjh4EB2QRD4qb3tuHK06jJ64rt7i9ydMXMguFilF1A8Avl9A3Y-OxP4B9IcC_c9uMRN0tOFQLgb9BWg50vyCGltXBR0ZlMo7jXRF9VAgzspHMmI1QE5L5Mb6kEaIPVsvXJtyy5-PAygSW3wsw7R5mdlU31ZcMmphYTE-FFaO07Vqr7P1vwujJFaI1MmIrEcqlg4VR4-fzoswrPOy312eJcTYwfRFLU5ES2QDIXdwosqQAuLw_CkI6zDkIUucdYOLC_-yIQNOusgbKZpW2pb7d8Jrch1_Ns61YwGT_vlFLD0gxmjY5BaMLyw_81qZPbieUPuICrBw3Sdxb6ezFns_fA27OH79C-ccLVEvDqXAmVjhBsQTjnnGDKyExRPID-aeXs3SMHKypp8MxSPGO2pVUvNFodB9s6Ufeq5DsnxJByGThp5e5-sNnYsjv9U-YuiLYmHwkVH4U',
    required Map<String, dynamic> dataTobody,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    return dio.post(baseUrl + url, data: dataTobody);
  }
}
