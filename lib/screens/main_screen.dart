import 'package:flutter/material.dart';
import 'package:newsapp/modles/bn_model.dart';
import 'package:newsapp/screens/health_screen.dart';
import 'package:newsapp/screens/profile_screen.dart';
import 'package:newsapp/screens/technology_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<BnItem> _bnitem = <BnItem>[
    BnItem(title: 'Home', widget: const HomeScreen(), icon: Icons.home),
    BnItem(
        title: 'Technology',
        widget: const TechnologyScreen(),
        icon: Icons.computer),
    BnItem(
        title: 'Health',
        widget: const HealthScreen(),
        icon: Icons.health_and_safety),
    BnItem(title: 'Profile', widget: ProfileScreen(), icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'News APP',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: _bnitem[_currentIndex].widget,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: BottomNavigationBar(
              selectedFontSize: 16,
              currentIndex: _currentIndex,
              unselectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(color: Colors.red),
              showSelectedLabels: false,
              elevation: 0,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                for (int i = 0; i < _bnitem.length; i++)
                  BottomNavigationBarItem(
                    label: '',
                    icon: _currentIndex == i
                        ? containerOfBar(
                            page: _bnitem[i].title,
                            icon: _bnitem[i].icon,
                          )
                        : Icon(_bnitem[i].icon),
                    backgroundColor: Colors.white,
                  ),
              ],
              type: BottomNavigationBarType.shifting,
            ),
          ),
        ));
  }
}

Container containerOfBar({required String page, required IconData icon}) {
  return Container(
    decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black87,
            Colors.black87,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15))),
    height: 50,
    width: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon),
        Expanded(
          child: Center(
            child: Text(
              page,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        )
      ],
    ),
  );
}
// Container(
//   margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
//   child: BottomNavigationBar(
//     type: BottomNavigationBarType.fixed,
//     elevation: 10,
//     showSelectedLabels: true,
//     showUnselectedLabels: true,
//     onTap: (int index) {
//       setState(() {
//         _currentIndex = index;
//       });
//     },
//     backgroundColor: Colors.white,
//     currentIndex: _currentIndex,
//     selectedIconTheme: const IconThemeData(
//       color: Colors.red,
//     ),
//     selectedItemColor: Colors.redAccent,
//     unselectedItemColor: Colors.grey,
//     selectedLabelStyle: const TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 12,
//       letterSpacing: 2,
//     ),
//     unselectedLabelStyle: const TextStyle(
//       fontWeight: FontWeight.normal,
//       fontSize: 12,
//       letterSpacing: 0,
//     ),
//     items: const [
//       BottomNavigationBarItem(
//         icon: Icon(Icons.home_outlined),
//         activeIcon: Icon(Icons.home),
//         label: 'Home',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.computer_outlined),
//         activeIcon: Icon(Icons.computer),
//         label: 'technology',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.health_and_safety_outlined),
//         activeIcon: Icon(Icons.health_and_safety),
//         label: 'Health',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.person_outline),
//         activeIcon: Icon(Icons.person),
//         label: 'Profile',
//       ),
//     ],
//   ),
// ),
