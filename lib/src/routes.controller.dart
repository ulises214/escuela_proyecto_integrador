import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RouteController extends ChangeNotifier {
  final _router = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _router;
  bool canPop() {
    return _router.currentState?.canPop() ?? false;
  }

  void pop<T extends Object>([T? result]) {
    _router.currentState?.pop(result);
  }

  Future<T?>? to<T extends Object>(String route) {
    return _router.currentState?.pushNamed<T>(route);
  }

  void toAndReplace(String route) {
    _router.currentState?.pushReplacementNamed(route);
  }

  Future<T?>? toWithParams<T extends Object>(
      String route, Map<String, dynamic> params) {
    return _router.currentState?.pushNamed(route, arguments: params);
  }

  static RouteController of(BuildContext context) => context.watch();
  static RouteController read(BuildContext context) => context.read();
}
