import 'package:flutter/material.dart';
import '../models/modelos.dart';
import '../services/api.dart';

class AlberguesScreen extends StatefulWidget {
  const AlberguesScreen({super.key});

  @override
  _AlberguesScreenState createState() => _AlberguesScreenState();
}

class _AlberguesScreenState extends State<AlberguesScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Albergue>> _futureAlbergues;
  List<Albergue> _alberguesList = [];
  List<Albergue> _filteredAlberguesList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadAlbergues();
    _searchController.addListener(_filterAlbergues);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadAlbergues() {
    _futureAlbergues = _apiService.getAlbergues();
    _futureAlbergues.then((albergues) {
      setState(() {
        _alberguesList = albergues;
        _filteredAlberguesList = albergues;
      });
    });
  }

  void _filterAlbergues() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAlberguesList =
          _alberguesList.where((albergue) {
            return albergue.ciudad.toLowerCase().contains(query) ||
                albergue.codigo.toLowerCase().contains(query) ||
                albergue.edificio.toLowerCase().contains(query);
          }).toList();
    });
  }

  void _showAlbergueDetails(Albergue albergue) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                albergue.ciudad,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              _detailRow(Icons.location_on, 'Edificio', albergue.edificio),
              _detailRow(Icons.code, 'Codigo', albergue.codigo),
              _detailRow(Icons.person, 'Coordinador', albergue.coordinador),
              _detailRow(Icons.phone, 'Teléfono', albergue.telefono),
              _detailRow(Icons.people, 'Capacidad', '${albergue.capacidad}'),
              SizedBox(height: 16.0),
            ],
          ),
        );
      },
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.orange[800]),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(value, style: TextStyle(fontSize: 16.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Albergues')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar albergue',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Albergue>>(
              future: _futureAlbergues,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    _filteredAlberguesList.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (_filteredAlberguesList.isEmpty) {
                  return Center(child: Text('No se encontraron albergues'));
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: _filteredAlberguesList.length,
                    itemBuilder: (context, index) {
                      final albergue = _filteredAlberguesList[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 16.0),
                        elevation: 4.0,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16.0),
                          title: Text(
                            albergue.ciudad,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 4.0),
                              Text('Provincia: ${albergue.edificio}'),
                              Text('Capacidad: ${albergue.capacidad} personas'),
                            ],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            _showAlbergueDetails(albergue);
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
