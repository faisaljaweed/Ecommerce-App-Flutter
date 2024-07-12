import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'person_screen.dart';
import 'heart_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    const PersonScreen(),
    const HeartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Home',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          )),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Image.asset(
                  "images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title: const Text('Support'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        // bottomNavigationBar: ClipRRect(
        //   borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(20.0),
        //     topRight: Radius.circular(20.0),
        //     bottomLeft: Radius.circular(20.0),
        //     bottomRight: Radius.circular(20.0),
        //   ),
        //   child: BottomNavigationBar(
        //     type: BottomNavigationBarType.fixed,
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.home,
        //         ),
        //         label: 'Home',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.search,
        //         ),
        //         label: 'Search',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.person,
        //         ),
        //         label: 'Person',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.heart_broken,
        //         ),
        //         label: "Heart",
        //       )
        //     ],
        //     backgroundColor: Colors.black,
        //     selectedItemColor: Colors.blue,
        //     unselectedItemColor: Colors.grey,
        //     currentIndex: _selectedIndex,
        //     onTap: _onItemTapped,
        //   ),
        // ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            backgroundColor:
                Colors.transparent, // Make sure the background is transparent
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            showSelectedLabels: false, // Hide labels
            showUnselectedLabels: false, // Hide labels
          ),
        ),
      ),
    );
  }
}
