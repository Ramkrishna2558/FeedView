import 'package:feedx/newhome.dart';
import 'package:feedx/testpage.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'login.dart';

/*class feedx extends StatefulWidget {
  const feedx({Key? key}) : super(key: key);

  @override
  _feedxState createState() => _feedxState();
}

class _feedxState extends State<feedx> {
 // int _selectedIndex = 0;
  int currentIndex = 0;
 // PageController pageController = PageController();
  final screens = [

    profile(), testpage()];
 /* void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(child: const Text('FeedView')),
          backgroundColor: Colors.black38,
        ),
        body:
            screens[currentIndex],

        /*
            Page view contains all the widgets for all the respective pages
             */
        //    PageView(
        //  controller: pageController,
        /*  children: [
            Center(
              child: Text(
                'body comes here',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ], */
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.blueGrey,
            backgroundColor: Colors.black45,
            type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(()
          => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.waves),
                  label: 'Test',
                  backgroundColor: Colors.redAccent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'home',
                  backgroundColor: Colors.greenAccent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  label: 'account',
                  backgroundColor: Colors.teal),
            ],

        );
        ),
      ),
    );
  }
}
*/

class feedx extends StatefulWidget {
  const feedx({Key? key}) : super(key: key);

  @override
  _feedxState createState() => _feedxState();
}

class _feedxState extends State<feedx> {
  int _currentIndex = 0;
  final screens = [
    testpage(),
    newhome(),
    profile(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        /* appBar: AppBar(
          title: Center(child: const Text('FeedView')),
          backgroundColor: Colors.black38,
        ),  */
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.waves),
                label: 'testpage',
                backgroundColor: Colors.redAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'newhome',
                backgroundColor: Colors.greenAccent),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'profile',
                backgroundColor: Colors.teal),
          ],
        ),
      );
}
