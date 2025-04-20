import 'package:flutter/material.dart';
import '../models/modelos.dart';
import '../services/api.dart';

class MedidasScreen extends StatefulWidget {
  const MedidasScreen({super.key});

  @override
  _MedidasScreenState createState() => _MedidasScreenState();
}

class _MedidasScreenState extends State<MedidasScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<MedidaPreventiva>> _futureMedidas;

  @override
  void initState() {
    super.initState();
    _futureMedidas = _apiService.getMedidasPreventivas();
  }

  void _showMedidaDetails(MedidaPreventiva medida) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MedidaDetalleScreen(medida: medida),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medidas Preventivas')),
      body: FutureBuilder<List<MedidaPreventiva>>(
        future: _futureMedidas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No hay medidas preventivas disponibles'),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final medida = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16.0),
                  elevation: 4.0,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange[800],
                      child: Icon(Icons.health_and_safety, color: Colors.white),
                    ),
                    title: Text(
                      medida.titulo,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      _showMedidaDetails(medida);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class MedidaDetalleScreen extends StatelessWidget {
  final MedidaPreventiva medida;

  const MedidaDetalleScreen({super.key, required this.medida});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Medida Preventiva')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            medida.imagen.isNotEmpty
                ? Image.network(
                  medida.imagen,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: Icon(Icons.error),
                    );
                  },
                )
                : Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported),
                ),
            SizedBox(height: 16.0),
            Text(
              medida.titulo,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(medida.descripcion, style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
