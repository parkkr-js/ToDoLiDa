import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note/screens/home_screen.dart';
import 'package:note/screens/note_reader.dart';
import 'package:note/style/app_style.dart';
import 'package:note/style/util.dart';
import 'package:note/widgets/note_card.dart';
import 'package:note/screens/task.dart';

class Play extends StatefulWidget {
  const Play({Key? key});

  @override
  State<Play> createState() => _Play();
}

class _Play extends State<Play> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppStyle.mainColor, // Set your custom color here
                blurRadius: 20.0,
                offset: Offset(5, 7),
              ),
            ],
          ),
          child: AppBar(
            elevation: 0.0,
            title: Text(
              "Play",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Cafe24OnePrettyNight',
              ),
            ),
            centerTitle: true,
            backgroundColor: AppStyle.mainColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('notes')
                    .where('color_id', isEqualTo: 6)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!.docs
                          .map((note) => noteCard(
                                () {
                                  //////////////////////////////////////
                                  ///수정모달///////////////////////////
                                  //////////////////
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(110),
                                        topRight: Radius.circular(110),
                                      ),
                                    ),
                                    builder: (BuildContext context) {
                                      String content = note['content'];
                                      int category = note['color_id'];

                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return SingleChildScrollView(
                                          child: Container(
                                            height: 700,
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom,
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  top: 0,
                                                  right: 20,
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration:
                                                        const BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: <Color>[
                                                          Color.fromARGB(255,
                                                              237, 101, 92),
                                                          Color.fromARGB(255,
                                                              237, 101, 92),
                                                        ],
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(50.0),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: CustomColors
                                                              .PurpleShadow,
                                                          blurRadius: 10.0,
                                                          spreadRadius: 5.0,
                                                          offset:
                                                              Offset(0.0, 0.0),
                                                        ),
                                                      ],
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Image.asset(
                                                          'assets/images/fab-delete.png'),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 60,
                                                  left: 0,
                                                  right: 0,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(16),
                                                              child: TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      content,
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: AppStyle
                                                                          .mainColor,
                                                                      width:
                                                                          4.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    content =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .center,
                                                              spacing: 30,
                                                              runSpacing: 30,
                                                              children: [
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      category =
                                                                          1;
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Personal',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Cafe24OnePrettyNight',
                                                                    ),
                                                                  ),
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<
                                                                            Color>(
                                                                        AppStyle
                                                                            .personalColor),
                                                                    shape: MaterialStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      category =
                                                                          2;
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Work',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Cafe24OnePrettyNight',
                                                                    ),
                                                                  ),
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<
                                                                            Color>(
                                                                        AppStyle
                                                                            .workColor),
                                                                    shape: MaterialStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      category =
                                                                          3;
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Shopping',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Cafe24OnePrettyNight',
                                                                    ),
                                                                  ),
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<
                                                                            Color>(
                                                                        AppStyle
                                                                            .shoppingColor),
                                                                    shape: MaterialStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      category =
                                                                          4;
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Meeting',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Cafe24OnePrettyNight',
                                                                    ),
                                                                  ),
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<
                                                                            Color>(
                                                                        AppStyle
                                                                            .meetingColor),
                                                                    shape: MaterialStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      category =
                                                                          5;
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Study',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Cafe24OnePrettyNight',
                                                                    ),
                                                                  ),
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<
                                                                            Color>(
                                                                        AppStyle
                                                                            .studyColor),
                                                                    shape: MaterialStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      category =
                                                                          6;
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    'Play',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Cafe24OnePrettyNight',
                                                                    ),
                                                                  ),
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<
                                                                            Color>(
                                                                        AppStyle
                                                                            .playColor),
                                                                    shape: MaterialStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 30,
                                                            ),
                                                            Column(
                                                              children: [
                                                                ElevatedButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty.all<
                                                                            Color>(
                                                                        AppStyle
                                                                            .mainColor),
                                                                    shape: MaterialStateProperty
                                                                        .all<
                                                                            RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                    note[
                                                                        'date'],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .white,
                                                                      fontFamily:
                                                                          'Cafe24OnePrettyNight',
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      pickDateTime,
                                                                ),
                                                                SizedBox(
                                                                  height: 50,
                                                                ),
                                                                Container(
                                                                  width: 200,
                                                                  height: 50,
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'notes')
                                                                          .doc(note
                                                                              .id)
                                                                          .update({
                                                                        'content':
                                                                            content,
                                                                        'color_id':
                                                                            category,
                                                                        'date':
                                                                            '${dateTime.year}/${dateTime.month}/${dateTime.day} $hours:$minutes',
                                                                      }).then(
                                                                              (value) {
                                                                        // ToDo saved successfully
                                                                        // Perform any necessary actions after saving
                                                                        Navigator.pop(
                                                                            context);
                                                                      }).catchError(
                                                                              (error) {});
                                                                    },
                                                                    style:
                                                                        ButtonStyle(
                                                                      backgroundColor: MaterialStateProperty.all<
                                                                              Color>(
                                                                          AppStyle
                                                                              .mainColor),
                                                                      shape: MaterialStateProperty
                                                                          .all<
                                                                              RoundedRectangleBorder>(
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: Text(
                                                                      'Edit Todo',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            30,
                                                                        fontWeight:
                                                                            FontWeight.w900,
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Cafe24OnePrettyNight',
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                  );
                                  //////////////////////////////////////
                                  ///수정모달///////////////////////////
                                  //////////////////
                                },
                                note,
                              ))
                          .toList(),
                    );
                  }
                  return const Text('No Notes');
                },
              ),
            )
          ],
        ),
      ),
      /////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppStyle.mainColor,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen()), // Navigate to the Task page
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'assets/images/home.png',
                    color: CustomColors.TextGrey,
                  ),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Task()), // Navigate to the Task page
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'assets/images/task.png',
                    color: CustomColors.TextGrey,
                  ),
                ),
              ),
              label: 'Task',
            ),
          ],
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          selectedItemColor: Colors.grey,
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() => this.dateTime = dateTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );
}
