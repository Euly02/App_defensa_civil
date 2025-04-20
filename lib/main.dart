import 'package:flutter/material.dart';
import 'screens/voluntario_screen.dart';
import 'screens/home_screen.dart';

import 'screens/historia_screen.dart';
import 'screens/servicios_screen.dart';
import 'screens/noticias_screen.dart';
import 'screens/videos_screen.dart';
import 'screens/albergues_screen.dart';
import 'screens/medidas_screen.dart';
import 'screens/miembros_screen.dart';
import 'screens/acercade_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Defensa Civil App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[800],
          foregroundColor: Colors.white,
        ),
      ),

      home: HomeScreen(),
      routes: {
        '/historia': (context) => HistoriaScreen(),
        '/servicios': (context) => ServiciosScreen(),
        '/noticias': (context) => NoticiasScreen(),
        '/videos': (context) => VideosScreen(),
        '/albergues': (context) => AlberguesScreen(),
        '/medidas': (context) => MedidasScreen(),
        '/miembros': (context) => MiembrosScreen(),
        '/voluntario': (context) => VoluntarioScreen(),
        '/acerca': (context) => AcercadeScreen(),
      },
    );
  }
}
