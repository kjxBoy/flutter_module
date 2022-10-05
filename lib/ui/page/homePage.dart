import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/ui/controller/hot_search_request.dart';
import 'package:flutter_module/ui/model/hot_search_model.dart';
import 'package:flutter_module/ui/page/homePage_cotent_item.dart';
import 'package:get/get.dart';


class JXHomePage extends StatelessWidget {
  JXHomePage({Key? key}) : super(key: key);

  final logic = Get.put(JXHotSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(236, 99, 123, 1),
        title: const Text("bilibili 全区排行榜"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            BoostNavigator.instance.pop();
          },
        ),
      ),
      body: ListView.separated(
          itemCount: logic.models.length,
          itemBuilder: (context, index) {
            JXHotSearchModel model = logic.models[index];
            return ListTile(
              title: JXHomePageContentItem(model: model),
            );
      }, separatorBuilder: (BuildContext context, int index) {
            return const Divider();
      },)
    );
  }
}


// class homePage extends StatefulWidget {
//   const homePage({Key? key}) : super(key: key);
//   @override
//   _homePageState createState() => _homePageState();
// }
//
// class _homePageState extends State<homePage> with PageVisibilityObserver {
//   String testStr = '123213213';
//
//   final logic = Get.put(JXHotSearchController());
//
//   @override
//   void onBackground() {
//     super.onBackground();
//     print("LifecycleTestPage - onBackground");
//     testStr = '99999999999';
//     setState(() {
//       testStr = 'LifecycleTestPage - onBackground';
//     });
//   }
//
//   @override
//   void onForeground() {
//     super.onForeground();
//     print("LifecycleTestPage - onForeground");
//   }
//
//   @override
//   void onPageHide() {
//     super.onPageHide();
//     print("LifecycleTestPage - onPageHide");
//     setState(() {
//       testStr = 'LifecycleTestPage - onPageHide';
//     });
//   }
//
//   @override
//   void onPageShow() {
//     super.onPageShow();
//     print("LifecycleTestPage - onPageShow");
//     setState(() {
//       testStr = 'LifecycleTestPage - onPageShow';
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     print(logic.num);
//     ///请在didChangeDependencies中注册而不是initState中
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     ///注册监听器
//     PageVisibilityBinding.instance.addObserver(this, ModalRoute.of(context)!);
//   }
//
//   @override
//   void dispose() {
//     ///移除监听器
//     PageVisibilityBinding.instance.removeObserver(this);
//     super.dispose();
//   }
//
//   ///声明一个用来存回调的对象
//   VoidCallback removeListener = BoostChannel.instance
//       .addEventListener("eventToFlutter", (key, arguments) async {
//     String data = arguments['data'];
//     print(arguments);
//     Fluttertoast.showToast(msg: "我接收到了来自 native 的数据----$data");
//     return key;
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('首页'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             BoostNavigator.instance.pop();
//           },
//         ),
//       ),
//       body: GridView.builder(
//           itemCount: 20,
//           padding: const EdgeInsets.all(5),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 5,
//             crossAxisSpacing: 5,
//             childAspectRatio: 4 / 3,
//           ),
//           itemBuilder: (context, idx) {
//             return Container(
//               color: Colors.red,
//             );
//           }),
//     );
//   }
// }
