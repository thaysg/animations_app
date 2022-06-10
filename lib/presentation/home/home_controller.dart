import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  StreamController<int> selected = StreamController<int>.broadcast();

  @override
  void onInit() {
    super.onInit();
    selected.stream.listen((_) {});
  }

  @override
  void onClose() {
    super.onClose();
    selected.close();
  }

  int? selectedValue;

  int teste = 0;

  seletcStream() async {
    selected.stream.listen((_) {
      selectedValue = _;
    });
    update();
    // return selectedValue ?? 0;
    /* await for (var i in selected.stream) {
      if (selectedValue != null) {
        selectedValue = i;
      }

      selected.stream.listen((_) {
      selectedValue = _;
    }).onDone(() { }); 
      update();
    } */
  }

  final colors = <Color>[
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.grey,
    Colors.orange,
    Colors.purple,
    Colors.brown,
    Colors.pink,
  ];

  final List<String> participants = <String>[];
  final TextEditingController controller = TextEditingController();

  selectdParticpant() async {
    selected.add(
      Fortune.randomInt(0, participants.length),
    );
    update();
  }

  String validateString(String? value) {
    if (value!.isEmpty) {
      return 'Please enter some text';
    }
    update();
    return value;
  }

  String onChangeString(String value) {
    if (value.substring(value.length - 1) == ',') {
      participants.add(value.substring(0, value.length - 1));

      Future<void>.delayed(
        const Duration(milliseconds: 10),
        controller.clear,
      );
      update();
    }
    return value;
  }

  void clearParticipants() {
    controller.text = '';
    participants.clear();
    update();
  }
}
