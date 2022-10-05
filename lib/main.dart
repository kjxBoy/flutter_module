import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'ui/page//mine.dart';
import 'ui/page/homePage.dart';

//这里要特别注意，如果你的工程里已经有一个继承自WidgetsFlutterBinding的自定义Binding，则只需要将其with上BoostFlutterBinding
//如果你的工程没有自定义的Binding，则可以参考这个CustomFlutterBinding的做法
//BoostFlutterBinding用于接管Flutter App的生命周期，必须得接入的
class CustomFlutterBinding extends WidgetsFlutterBinding
    with BoostFlutterBinding {}

void main() {
  ///添加全局生命周期监听类
  PageVisibilityBinding.instance.addGlobalObserver(AppLifecycleObserver());
  CustomFlutterBinding();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ///路由表
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'homePage': (settings, uniqueId) {
      return MaterialPageRoute(
          settings: settings,
          builder: (ctx) {
            return JXHomePage();
          });
    },
    'minePage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) {
            final data = settings.arguments as Map<String, dynamic>;
            return minePage(
              data: data["data"] ?? "",
            );
          });
    },
  };

  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  Widget appBuilder(Widget home) {
    return MaterialApp(home: home, debugShowCheckedModeBanner: false);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      routeFactory,
      appBuilder: appBuilder,
    );
  }
}

///全局生命周期监听示例
class AppLifecycleObserver with GlobalPageVisibilityObserver {
  @override
  void onBackground(Route route) {
    super.onBackground(route);
    print("AppLifecycleObserver - onBackground");
  }

  @override
  void onForeground(Route route) {
    super.onForeground(route);
    print("AppLifecycleObserver - onForground");
  }

  @override
  void onPagePush(Route route) {
    super.onPagePush(route);
    print("AppLifecycleObserver - onPagePush");
  }

  @override
  void onPagePop(Route route) {
    super.onPagePop(route);
    print("AppLifecycleObserver - onPagePop");
  }

  @override
  void onPageHide(Route route) {
    super.onPageHide(route);
    print("AppLifecycleObserver - onPageHide");
  }

  @override
  void onPageShow(Route route) {
    super.onPageShow(route);
    print("AppLifecycleObserver - onPageShow");
  }
}
