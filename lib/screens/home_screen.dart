import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = ['./assets/q.jpg', './assets/r.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Defensa Civil')),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items:
                  imageList
                      .map(
                        (item) => Container(
                          child: Center(
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: 1000,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: [
                _buildMenuItem(context, 'Historia', Icons.history, '/historia'),
                _buildMenuItem(
                  context,
                  'Servicios',
                  Icons.miscellaneous_services,
                  '/servicios',
                ),
                _buildMenuItem(context, 'Noticias', Icons.article, '/noticias'),
                _buildMenuItem(
                  context,
                  'Videos',
                  Icons.video_library,
                  '/videos',
                ),
                _buildMenuItem(context, 'Albergues', Icons.home, '/albergues'),
                _buildMenuItem(
                  context,
                  'Medidas Preventivas',
                  Icons.health_and_safety,
                  '/medidas',
                ),
                _buildMenuItem(context, 'Miembros', Icons.people, '/miembros'),
                _buildMenuItem(
                  context,
                  'Quiero ser Voluntario',
                  Icons.volunteer_activism,
                  '/voluntario',
                ),
                _buildMenuItem(context, 'Acerca de', Icons.info, '/acerca'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    String ruta,
  ) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ruta);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: Colors.orange[800]),
            SizedBox(height: 8.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange[800]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Defensa Civil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Protegiendo a la población',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Historia'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/historia');
            },
          ),
          ListTile(
            leading: Icon(Icons.miscellaneous_services),
            title: Text('Servicios'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/servicios');
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Noticias'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/noticias');
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text('Videos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/videos');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Albergues'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/albergues');
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Mapa'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/mapa');
            },
          ),
          ListTile(
            leading: Icon(Icons.health_and_safety),
            title: Text('Medidas Preventivas'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/medidas');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Miembros'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/miembros');
            },
          ),
          ListTile(
            leading: Icon(Icons.volunteer_activism),
            title: Text('Quiero ser Voluntario'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/voluntario');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Acerca de'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/acerca');
            },
          ),
        ],
      ),
    );
  }
}
