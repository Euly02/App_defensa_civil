import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HistoriaScreen extends StatefulWidget {
  const HistoriaScreen({super.key});

  @override
  _HistoriaScreenState createState() => _HistoriaScreenState();
}

class _HistoriaScreenState extends State<HistoriaScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'QGgO9v6dg4I', // ID de un video de la Defensa Civil
      flags: YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historia')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Historia de la Defensa Civil',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.orange,
            ),
            SizedBox(height: 16.0),
            Text(
              'La Defensa Civil en la República Dominicana tiene sus orígenes en los años 60s, cuando fue creada como respuesta a la necesidad de contar con un organismo que coordinara las acciones de prevención, mitigación y respuesta ante situaciones de emergencia y desastres.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Desde su fundación, la Defensa Civil ha sido una institución fundamental para la protección de la población dominicana, trabajando constantemente en la prevención y atención de emergencias causadas por fenómenos naturales y antrópicos.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'A lo largo de su historia, ha enfrentado diversos desafíos, como huracanes, inundaciones, terremotos y otras situaciones de emergencia, demostrando su capacidad de organización y respuesta para proteger a la población y minimizar los daños.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'En la actualidad, la Defensa Civil cuenta con una estructura organizada, con presencia en todo el territorio nacional, y está integrada por personal capacitado y voluntarios comprometidos con la misión de salvar vidas y proteger a la comunidad.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Su labor preventiva incluye la educación a la población sobre medidas de seguridad, la identificación de zonas de riesgo, la planificación de evacuaciones y la preparación constante para actuar de manera eficiente en situaciones de emergencia.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
