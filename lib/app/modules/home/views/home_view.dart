import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_moor_db/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../../../data/db/note_database.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL DATA '),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Note>>(
          stream: controller.noteM.StreamAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.red[900]),
              );
            }
            if (snapshot.data?.length == 0 || snapshot.data == null) {
              return Center(
                child: Text("Tidak ada data...."),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Note note = snapshot.data![index];
                return ListTile(
                  onTap: () {
                    Get.toNamed(
                      Routes.EDIT_NOTE,
                      arguments: note
                    );
                  },
                  leading: CircleAvatar(
                    child: Text("${note.id}"),
                  ),
                  title: Text("${note.title}"),
                  subtitle: Text("${note.desc}"),
                  trailing: IconButton(
                    onPressed: () {
                      controller.noteM.deleteNote(note);
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.green,
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_NOTE);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
