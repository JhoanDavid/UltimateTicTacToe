import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_tic_tac_toe/ui/Pet/home_pet_ui.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _options() {
    return <Widget>[
      //Pet scaffold
      HomePetPage(),

      //Profile scaffold
      Text(
        'Usuarios',
      )
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackgroundWidget(),
          Center(
            child: _options().elementAt(_selectedIndex),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_outlined),
            label: 'Mascota',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: '<EMPTY>',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue[600],
        onTap: _onItemTapped,
      ),
    );
  }
}
