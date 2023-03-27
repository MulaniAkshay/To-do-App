import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  final _addName = RxList().obs;
  RxList get addName => _addName.value;
  set addName(RxList value) => _addName.value = value;

  final _selectName = RxList().obs;
  RxList get selectName => _selectName.value;
  set selectName(RxList value) => _selectName.value = value;

  final _val = false.obs;
  bool get val => _val.value;
  set val(bool value) => _val.value = value;

}
