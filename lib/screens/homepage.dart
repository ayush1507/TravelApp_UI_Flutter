import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/hotel_model.dart';
import 'package:travel_app/widgets/destination.dart';
import 'package:travel_app/widgets/hotel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected = 0;
  int _currentIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  Widget _builtIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: _selected == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7BEE)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selected == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 45.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry map) => _builtIcon(map.key))
                  .toList(),
            ),
            SizedBox(
              height: 25.0,
            ),
            Destination(),
            SizedBox(
              height: 20.0,
            ),
            HotelPart(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int value) {
            setState(() {
              _currentIndex = value; 
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_pizza,
                  size: 30.0,
                ),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 30.0,
                ),
                title: SizedBox.shrink())
          ]),
    );
  }
}
