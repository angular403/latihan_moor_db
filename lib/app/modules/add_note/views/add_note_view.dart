import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';
import '../../../data/db/note_database.dart';
import '../../home/controllers/home_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  final HomeController homeC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD NOTE'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.titleC,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Title",
              hintText: "Filled Your title",
              prefix: Icon(Icons.accessibility_new_sharp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller.descC,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Desc",
              hintText: "Filled Your Desc",
              prefix: Icon(Icons.account_balance_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(() => ElevatedButton.icon(
                onPressed: () async {
                  if (controller.isLoading.isFalse) {
                    controller.isLoading.value = true;
                    await homeC.noteM.insertNote(
                      Note(
                        title: controller.titleC.text,
                        desc: controller.descC.text,
                      ),
                    );
                    controller.isLoading.value = false;
                    Get.back();
                  }
                },
                icon: Icon(Icons.save_as_outlined),
                label: Text(
                    controller.isLoading.isFalse ? "ADD NOTE" : "LOADING...."),
              )),
        ],
      ),
    );
  }
}
