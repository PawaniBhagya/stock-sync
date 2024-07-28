import 'package:get/get.dart';
import 'package:stock_sync/screens/BillsRef.dart';
import 'package:stock_sync/screens/Login.dart';
import 'package:stock_sync/screens/Register.dart';
import 'package:stock_sync/screens/Users/ref.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/login', page: () => LogIn()),
    GetPage(name: '/register', page: () => Register()),
    GetPage(name: '/ref', page : () => Ref()),
    GetPage(name: '/ref/bill', page: () => BillsRef() )
  ];
}
