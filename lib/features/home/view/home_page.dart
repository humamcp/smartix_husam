import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix_husam/features/device/cubit/device_cubit.dart';
import 'package:smartix_husam/features/device/view/device_page.dart';
import 'package:smartix_husam/features/routine/view/routine_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ### attributes ###
  int _index = 0; // the current viewed page

  // list of pages
  List<Widget> _pages = <Widget>[
    DevicePage(),
    RoutinePage(),
  ];

  // list of pages titles
  final List<String> _titles = ['Devices', 'Routines'];

  // ### Methods ###

  ///
  /// Change the current page to the indexed page
  ///
  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _index = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeviceCubit(),
      child: Scaffold(
        body: _pages.elementAt(_index),
        appBar: AppBar(
          title: Text(_titles.elementAt(_index)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.devices_other),
              label: 'Devices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_history_outlined),
              label: 'Routines',
            ),
          ],
          currentIndex: _index,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
