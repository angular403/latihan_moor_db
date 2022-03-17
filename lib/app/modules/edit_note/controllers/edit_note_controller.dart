import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditNoteController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();
}
