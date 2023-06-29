import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './views/genderpage.dart';
import './views/toolboxpage.dart';
import './views/agepage.dart';
import './views/aboutpage.dart';
import './views/universitiespage.dart';
import './views/weatherpage.dart';
import './views/newspage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de herramientas',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    switch (currentIndex) {
      case 0:
        currentScreen = ToolboxPage();
        break;
      case 1:
        currentScreen = GenderPage();
        break;
      case 2:
        currentScreen = AgePage();
        break;
      case 3:
        currentScreen = UniversitiesPage();
        break;
      case 4:
        currentScreen = WeatherPage();
        break;
      case 5:
        currentScreen = NewsPage();
        break;
      case 6:
        currentScreen = AboutPage();
        break;
      default:
        currentScreen = ToolboxPage();
    }

    return Scaffold(
    
      body: currentScreen,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black, // Establece el color negro para el BottomNavigationBar
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabTapped,
          selectedItemColor: const Color.fromARGB(255, 47, 139, 19), // Establece el color blanco para los íconos y etiquetas seleccionados
          unselectedItemColor: const Color.fromARGB(255, 29, 122, 236), // Establece el color gris para los íconos y etiquetas no seleccionados
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Genero',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Edad',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Universidades',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Clima',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Noticias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Sobre Mi',
            ),
          ],
        ),
      ),
    );
  }
}