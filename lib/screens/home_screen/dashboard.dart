import 'package:flutter/material.dart';
import 'package:panaux_customer/commons/constants.dart';
import 'package:panaux_customer/screens/orders/orders_management.dart';
import 'package:panaux_customer/screens/prescription/prescription_screen.dart';
import 'package:panaux_customer/screens/settings_screen/settings_screen.dart';

import '../pharmacy/pharmacy_screen.dart';
import 'home_screen.dart';

class DashBoard extends StatefulWidget {
  final int index;
  const DashBoard({Key? key,this.index=0}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
    currentIndex=widget.index;
  }
  int currentIndex=0;
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    PharmacyScreen(),
    OrdersManagement(),
    PrescriptionScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(currentIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Pharmacy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: 'Prescription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _onItemTapped(index),
        currentIndex: currentIndex,
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
