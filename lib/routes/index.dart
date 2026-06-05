
import 'package:flutter/material.dart';
import 'package:he_shop/pages/Login/index.dart';
import 'package:he_shop/pages/Main/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    // 命名路由
    initialRoute: '/',
    routes:getRootRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => const MainPage(), // 默认路由
    '/login': (context) => const LoginPage(), // 登录页路由
  };
}