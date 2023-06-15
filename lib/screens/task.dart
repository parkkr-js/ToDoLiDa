import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note/screens/home_screen.dart';
import 'package:note/style/app_style.dart';
import 'package:note/style/util.dart';
import 'package:note/screens/personal.dart';
import 'package:note/screens/work.dart';
import 'package:note/screens/shopping.dart';
import 'package:note/screens/meeting.dart';
import 'package:note/screens/study.dart';
import 'package:note/screens/play.dart';

class Task extends StatefulWidget {
  const Task({Key? key});

  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final bottomNavigationBarIndex = 1;
  void _navigateToPersonalPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Personal()),
    );
  }

  void _navigateToWorkPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Work()),
    );
  }

  void _navigateToSoppingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Shopping()),
    );
  }

  void _navigateToMeetingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Meeting()),
    );
  }

  void _navigateToStudyPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Study()),
    );
  }

  void _navigateToPlayPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Play()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: const Text(
          'Category',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontFamily: 'Cafe24OnePrettyNight',
          ),
        ),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Container(
                        margin: EdgeInsets.only(left: 10, top: 50, bottom: 0),
                      ),
                  childCount: 1),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                Container(
                    child: GestureDetector(
                      onTap: _navigateToPersonalPage,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: Lottie.network(
                                'https://assets1.lottiefiles.com/packages/lf20_SgQLT9.json',
                                width: 100,
                                height: 100,
                              ),
                              // decoration: const BoxDecoration(
                              //   color: CustomColors.PurpleBackground,
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(50.0),
                              //   ),
                              // ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Personal',
                              style: TextStyle(
                                fontSize: 20,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Cafe24OnePrettyNight',
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppStyle.personalColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppStyle.mainColor,
                          blurRadius: 15.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                Container(
                    child: GestureDetector(
                      onTap: _navigateToWorkPage,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: Lottie.network(
                                'https://assets10.lottiefiles.com/packages/lf20_cmaqoazd.json',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Work',
                              style: TextStyle(
                                fontSize: 20,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Cafe24OnePrettyNight',
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppStyle.workColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppStyle.mainColor,
                          blurRadius: 15.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                Container(
                    child: GestureDetector(
                      onTap: _navigateToSoppingPage,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: Lottie.network(
                                'https://assets1.lottiefiles.com/packages/lf20_00t0kwns.json',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Shopping',
                              style: TextStyle(
                                fontSize: 20,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Cafe24OnePrettyNight',
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppStyle.shoppingColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppStyle.mainColor,
                          blurRadius: 15.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                Container(
                    child: GestureDetector(
                      onTap: _navigateToMeetingPage,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: Lottie.network(
                                'https://assets8.lottiefiles.com/packages/lf20_8pturyty.json',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Meeting',
                              style: TextStyle(
                                fontSize: 20,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Cafe24OnePrettyNight',
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppStyle.meetingColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppStyle.mainColor,
                          blurRadius: 15.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                Container(
                    child: GestureDetector(
                      onTap: _navigateToStudyPage,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: Lottie.network(
                                'https://assets10.lottiefiles.com/packages/lf20_arirrjzh.json',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Study',
                              style: TextStyle(
                                fontSize: 20,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Cafe24OnePrettyNight',
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppStyle.studyColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppStyle.mainColor,
                          blurRadius: 15.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
                Container(
                    child: GestureDetector(
                      onTap: _navigateToPlayPage,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              child: Lottie.network(
                                'https://assets7.lottiefiles.com/packages/lf20_wjGXUyYZSf.json',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Play',
                              style: TextStyle(
                                fontSize: 20,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Cafe24OnePrettyNight',
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppStyle.playColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppStyle.mainColor,
                          blurRadius: 15.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    height: 150.0),
              ],
            ),
          ],
        ),
      ),
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
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
              icon: Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  'assets/images/task.png',
                  color: AppStyle.mainColor,
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
          unselectedItemColor: AppStyle.mainColor,
        ),
      ),
    );
  }
}
