import 'package:flutter/material.dart';
import '../models/modelos.dart';
import '../services/api.dart';

class MiembrosScreen extends StatefulWidget {
  const MiembrosScreen({Key? key}) : super(key: key);

  @override
  State<MiembrosScreen> createState() => _miembrosScreenState();
}

class _miembrosScreenState extends State<MiembrosScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Miembro>> _miembros;

  @override
  void initState() {
    super.initState();
    _miembros = _apiService.getMiembro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Miembros')),
      body: FutureBuilder<List<Miembro>>(
        future: _miembros,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay miembros disponibles'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final miembro = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          miembro.foto != null && miembro.foto!.isNotEmpty
                              ? NetworkImage(miembro.foto!)
                              : null,
                      child:
                          miembro.foto == null || miembro.foto!.isEmpty
                              ? Text(miembro.nombre[0])
                              : null,
                    ),
                    title: Text('${miembro.nombre}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Cargo: ${miembro.cargo}')],
                    ),
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
