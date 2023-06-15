// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:note/style/app_style.dart';

// import 'home_screen.dart';

// class NoteReaderScreen extends StatefulWidget {
//   NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
//   QueryDocumentSnapshot doc;

//   @override
//   State<NoteReaderScreen> createState() => _NoteReaderScreenState();
// }

// class _NoteReaderScreenState extends State<NoteReaderScreen> {
//   final CollectionReference _notes =
//       FirebaseFirestore.instance.collection('notes');
//   TextEditingController titleController = TextEditingController();
//   TextEditingController mainController = TextEditingController();
//   Future<void> _update(DocumentSnapshot documentSnapshot) async {
//     titleController.text = documentSnapshot['note_title'];
//     mainController.text = documentSnapshot['note_content'];
//     showBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: titleController,
//                   decoration: const InputDecoration(labelText: 'Title'),
//                 ),
//                 TextField(
//                   controller: mainController,
//                   decoration: const InputDecoration(
//                     labelText: 'Content',
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton.icon(
//                     onPressed: () async {
//                       final String title = titleController.text;
//                       final String notecon = mainController.text;
//                       await _notes.doc(documentSnapshot.id).update({
//                         'note_title': title,
//                         'note_content': notecon,
//                       });
//                       titleController.text = "";
//                       mainController.text = "";
//                       Navigator.of(context).pop();
//                     },
//                     icon: const Icon(Icons.edit),
//                     label: const Text('Update'))
//               ],
//             ),
//           );
//         });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _update(widget.doc);
//   }

//   @override
//   Widget build(BuildContext context) {
//     int colorId = widget.doc['color_id'];
//     return Scaffold(
//         backgroundColor: AppStyle.cardsColor[colorId],
//         appBar: AppBar(
//           iconTheme: const IconThemeData(color: Colors.black),
//           backgroundColor: AppStyle.cardsColor[colorId],
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   _update(widget.doc);
//                 },
//                 icon: const Icon(Icons.edit)),
//             const SizedBox(width: 30),
//           ],
//           elevation: 0.0,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.doc['note_title'],
//                 style: AppStyle.mainTitle,
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Text(
//                 widget.doc['note_content'],
//                 style: AppStyle.mainTitle,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () async {
//             await widget.doc.reference.delete();
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const HomeScreen()));
//           },
//           label: const Icon(Icons.delete_forever),
//           backgroundColor: AppStyle.accentColor,
//         ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note/style/app_style.dart';

import 'home_screen.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  final CollectionReference _notes =
      FirebaseFirestore.instance.collection('notes');
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();

  Future<void> _update(DocumentSnapshot documentSnapshot) async {
    titleController.text = documentSnapshot['note_title'];
    mainController.text = documentSnapshot['note_content'];
    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: mainController,
                decoration: const InputDecoration(
                  labelText: 'Content',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  final String title = titleController.text;
                  final String notecon = mainController.text;
                  await _notes.doc(documentSnapshot.id).update({
                    'note_title': title,
                    'note_content': notecon,
                  });
                  titleController.text = "";
                  mainController.text = "";
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.edit),
                label: const Text('Update'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _update(widget.doc);
  }

  @override
  Widget build(BuildContext context) {
    int colorId = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: AppStyle.cardsColor[colorId],
        actions: [
          IconButton(
            onPressed: () {
              _update(widget.doc);
            },
            icon: const Icon(Icons.edit),
          ),
          const SizedBox(width: 30),
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['note_title'],
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              widget.doc['note_content'],
              style: AppStyle.mainTitle,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await widget.doc.reference.delete();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        label: const Icon(Icons.delete_forever),
        backgroundColor: AppStyle.accentColor,
      ),
    );
  }
}
