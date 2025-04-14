import 'dart:math';
import 'package:flutter/material.dart';

class colorChanger extends StatefulWidget {
  const colorChanger({super.key});

  @override
  State<colorChanger> createState() => _colorChangerState();
}

class _colorChangerState extends State<colorChanger> {

  Color edgeColor = Colors.red;
  Color midColor = Color.fromARGB(255, 241, 236, 236);

  List<Color> colors = [
    Colors.red,
    Color.fromARGB(255, 241, 236, 236),
    Colors.red,
  ];

  final List<Map<String, Alignment>> directions = [
    {'begin': Alignment.topCenter, 'end': Alignment.bottomCenter},
    {'begin': Alignment.centerLeft, 'end': Alignment.centerRight},     
    {'begin': Alignment.topLeft, 'end': Alignment.bottomRight,},   
    {'begin': Alignment.bottomLeft, 'end': Alignment.topRight},
  ];

  List<String> dir = [
    'Vertical',
    'Horizontal',
    'Left-Right',
    'Right-Left',
  ];

  int dirIndex = 0;

  changeDirection() {
    setState(() {
      if (dirIndex + 1 == directions.length) {
        dirIndex = 0;
      } else {
        dirIndex++;
      }
    });
  }


  changeColor()
  {
    setState(() {
      edgeColor = Color.fromARGB(
        255,
        Random().nextInt(256), 
        Random().nextInt(256),
        Random().nextInt(256), 
        );

        colors= [ edgeColor, midColor, edgeColor];  
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,
      height: double.infinity,
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: directions[dirIndex]['begin']!,
          end: directions[dirIndex]['end']!,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide(
                color: Colors.white,
                width: 2,
                )
              ),
            ),
            onPressed: changeColor, 
            child: Text(
              "Change Color",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Red: ${edgeColor.red} Green: ${edgeColor.green} Blue: ${edgeColor.blue}",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          TextButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(BorderSide(
                color: Colors.white,
                width: 2,
                )
              ),
            ),
            onPressed: changeDirection, 
            child: Text(
              "Change Direction",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Direction: ${dir[dirIndex]}",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black, 
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      ),
    );
  }
}