// lib/models/models.dart
class Servicio {
  final int id;
  final String nombre;
  final String descripcion;
  final String imagen;

  Servicio({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return Servicio(
      id: int.parse(json['id'] ?? '0'),
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      imagen: json['foto'] ?? '',
    );
  }
}

class Noticia {
  final int id;
  final String titulo;
  final String contenido;
  final String imagen;
  final String fecha;

  Noticia({
    required this.id,
    required this.titulo,
    required this.contenido,
    required this.imagen,
    required this.fecha,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      id: int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      titulo: json['titulo'] ?? '',
      contenido: json['contenido'] ?? '',
      imagen: json['foto'] ?? '',
      fecha: json['fecha'] ?? '',
    );
  }
}

class Video {
  final int id;
  final String fecha;
  final String titulo;
  final String descripcion;
  final String videoId;

  Video({
    required this.id,
    required this.fecha,
    required this.titulo,
    required this.descripcion,
    required this.videoId,
  });
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      fecha: json['fecha'] ?? '',
      titulo: json['titulo'] ?? '',
      descripcion: json['descripcion'] ?? '',
      videoId: json['link'] ?? '',
    );
  }
  String get youtubeUrl => 'https://www.youtube.com/watch?v=${this.videoId}';
  String get miniatura =>
      'https://img.youtube.com/vi/${this.videoId}/hqdefault.jpg';
}

class Albergue {
  final String ciudad;
  final String edificio;
  final String coordinador;
  final String telefono;
  final String capacidad;
  final String codigo;
  final String latitud;
  final String longitud;

  Albergue({
    required this.ciudad,
    required this.edificio,
    required this.coordinador,
    required this.telefono,
    required this.capacidad,
    required this.codigo,
    required this.latitud,
    required this.longitud,
  });

  factory Albergue.fromJson(Map<String, dynamic> json) {
    return Albergue(
      ciudad: json['ciudad'] ?? '',
      edificio: json['edificio'] ?? '',
      coordinador: json['coordinador'] ?? '',
      telefono: json['telefono'] ?? '',
      capacidad: json['capacidad'] ?? '',
      codigo: json['codigo'] ?? '',
      latitud: json['latitud'] ?? '',
      longitud: json['longitud'] ?? '',
    );
  }
}

class MedidaPreventiva {
  final int id;
  final String titulo;
  final String descripcion;
  final String imagen;

  MedidaPreventiva({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
  });

  factory MedidaPreventiva.fromJson(Map<String, dynamic> json) {
    return MedidaPreventiva(
      id: int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      titulo: json['titulo'] ?? '',
      descripcion: json['descripcion'] ?? '',
      imagen: json['foto'] ?? '',
    );
  }
}

class Miembro {
  final String id;
  final String nombre;
  final String cargo;
  final String? foto;

  Miembro({
    required this.id,
    required this.nombre,
    required this.cargo,
    this.foto,
  });

  factory Miembro.fromJson(Map<String, dynamic> json) {
    return Miembro(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
      cargo: json['cargo'] ?? '',
      foto: json['foto'],
    );
  }
}
