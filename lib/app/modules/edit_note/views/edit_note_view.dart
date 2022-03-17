import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:latihan_moor_db/app/modules/home/controllers/home_controller.dart';
// import '../../home/controllers/home_controller.dart';
import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  // final HomeController note = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT NOTE'),
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
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.update),
            label: Text("Update", style: TextStyle(fontSize: 20),),
            style: ElevatedButton.styleFrom(fixedSize: Size(double.infinity, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), primary: Colors.green[400])
          ),
        ],
      ),
    );
  }
}
