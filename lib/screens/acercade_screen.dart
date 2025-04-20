import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AcercadeScreen extends StatelessWidget {
  const AcercadeScreen({Key? key}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('No se pudo abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Acerca de")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: const AssetImage('yo.png'),
                      backgroundColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Euly Reyes',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('+849-763-7389'),
                      onTap: () => _launchUrl('tel:+18497637389'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.telegram),
                      title: const Text('@Euly02'),
                      onTap: () => _launchUrl('https://t.me/euly02'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text('reyeseuli.o@gmail.com'),
                      onTap: () => _launchUrl('mailto:reyeseuli.o@gmail.com'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24.0),
            const Text(
              '© 2025 Todos los derechos reservados',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
