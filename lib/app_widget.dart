import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/home/home_controller.dart';
import 'presentation/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.dark().copyWith(
            primaryColor: Colors.deepPurple,
            scaffoldBackgroundColor: const Color(0xFF5C30F2),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
