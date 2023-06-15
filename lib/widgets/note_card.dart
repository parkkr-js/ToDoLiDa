import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  Color boxColor;
  switch (doc['color_id']) {
    case 1:
      boxColor = AppStyle.personalColor;
      break;
    case 2:
      boxColor = AppStyle.workColor;
      break;
    case 3:
      boxColor = AppStyle.shoppingColor;
      break;
    case 4:
      boxColor = AppStyle.meetingColor;
      break;
    case 5:
      boxColor = AppStyle.studyColor;
      break;
    default:
      boxColor = AppStyle.playColor;
  }

  bool isChecked =
      doc['checked'] == true; // Determine if the checkbox is checked

  return Dismissible(
    key: Key(doc.id),
    direction: DismissDirection.endToStart,
    background: Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: AppStyle.mainColor,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    ),
    onDismissed: (_) {
      doc.reference.delete();
    },
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), // Left padding set to 0
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: AppStyle.mainColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: SizedBox(
                width: 10,
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              value: isChecked,
              onChanged: (newValue) {
                doc.reference.update({'checked': newValue ?? false});
              },
              activeColor: AppStyle.mainColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doc['date'],
                  style: TextStyle(
                    color: isChecked ? Colors.grey : Colors.grey.shade700,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cafe24OnePrettyNight',
                    decoration: isChecked ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  doc['content'],
                  style: TextStyle(
                    color: isChecked ? Colors.grey : AppStyle.mainColor,
                    fontFamily: 'Cafe24OnePrettyNight',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    decoration: isChecked ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
