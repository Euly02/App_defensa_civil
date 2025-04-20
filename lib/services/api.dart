import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/modelos.dart';

class ApiService {
  static const String baseUrl = 'https://adamix.net/defensa_civil/def';

  Future<List<Servicio>> getServicios() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/servicios.php'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['exito'] == true && jsonResponse['datos'] != null) {
          final List<dynamic> datos = jsonResponse['datos'];

          return datos.map((item) => Servicio.fromJson(item)).toList();
        } else {
          throw Exception('No se encontraron datos en la respuesta');
        }
      } else {
        throw Exception('Error de servidor: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al cargar servicios: $e');
      throw Exception('Error al cargar servicios');
    }
  }

  // noticias
  Future<List<Noticia>> getNoticias() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/noticias.php'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['exito'] == true && jsonResponse['datos'] != null) {
          final List<dynamic> datos = jsonResponse['datos'];

          return datos.map((item) => Noticia.fromJson(item)).toList();
        } else {
          throw Exception('No se encontraron noticias en la respuesta');
        }
      } else {
        throw Exception('Error de servidor: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al cargar noticias: $e');
      throw Exception('Error al cargar noticias');
    }
  }

  Future<List<Video>> getVideos() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/videos.php'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['exito'] == true && jsonResponse['datos'] != null) {
          final List<dynamic> datos = jsonResponse['datos'];
          return datos.map((item) => Video.fromJson(item)).toList();
        } else {
          throw Exception('No se encontraron videos en la respuesta');
        }
      } else {
        throw Exception('Error de servidor: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al cargar videos: $e');
      throw Exception('Error al cargar videos');
    }
  }

  // Obtener albergues
  Future<List<Albergue>> getAlbergues() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/albergues.php'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<dynamic> alberguesData;
        alberguesData = jsonData['datos'];

        return alberguesData.map((data) => Albergue.fromJson(data)).toList();
      } else {
        throw Exception('Error de servidor: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al cargar albergues: $e');
      throw Exception('Error al cargar albergues');
    }
  }

  // Obtener medidas preventivas
  Future<List<MedidaPreventiva>> getMedidasPreventivas() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/medidas_preventivas.php'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<dynamic> medidasData;

        if (jsonData is Map && jsonData.containsKey('datos')) {
          medidasData = jsonData['datos'];
        } else {
          throw Exception('Formato de respuesta no reconocido');
        }

        return medidasData
            .map((data) => MedidaPreventiva.fromJson(data))
            .toList();
      } else {
        throw Exception('Error de servidor: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al cargar medidas: $e');
      throw Exception('Error al cargar medidas');
    }
  }

  Future<List<Miembro>> getMiembro() async {
    final response = await http.get(Uri.parse('$baseUrl/miembros.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['datos'] != null) {
        return List<Miembro>.from(
          data['datos'].map((miembroJson) => Miembro.fromJson(miembroJson)),
        );
      }
      return [];
    } else {
      throw Exception('Error al cargar los miembros');
    }
  }

  //voluntarios
  Future<bool> registrarvoluntario({
    required String cedula,
    required String nombre,
    required String apellido,
    required String clave,
    required String correo,
    required String telefono,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/registro.php'),
      body: {
        'cedula': cedula,
        'nombre': nombre,
        'apellido': apellido,
        'clave': clave,
        'correo': correo,
        'telefono': telefono,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['exito'] == true;
    } else {
      throw Exception('Error al registrar voluntario');
    }
  }
}
