import 'package:get/get.dart';
import '../../core/services/http_hot_list_request.dart';
import '../model/hot_search_model.dart';


class JXHotSearchController extends GetxController {

  List<JXHotSearchModel> models = [];

  @override
  void onReady() {
    // TODO: implement onReady
    print("onReady");
    JXHotListRequest.requestMealModels("bilibili").then((value){
      models = value;
    });
    super.onReady();
  }
}

