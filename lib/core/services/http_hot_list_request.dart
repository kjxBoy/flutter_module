
import '../../ui/model/hot_search_model.dart';
import 'http_request.dart';

class JXHotListRequest {
  static Future<List<JXHotSearchModel>> requestMealModels(String type) async {
    // 1.发送网络请求
    final result = await HttpRequest.request("", params: {"type" : type});

    // 2.json 转 model
    final mealArray = result["data"];
    List<JXHotSearchModel> meals = [];
    for(final json in mealArray) {
      JXHotSearchModel model = JXHotSearchModel.fromJson(json);
      meals.add(model);
    }
    return meals;
  }
}