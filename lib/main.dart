import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ========================== INICIO MyApp ==========================
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Ocultar el banner de debug
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cesar Reyes Vazquez N.1294',
            style: TextStyle(color: Colors.white), // Texto en blanco
          ),
          backgroundColor: Colors.blueGrey[900], // Color serio para el AppBar
          iconTheme: IconThemeData(color: Colors.white), // Íconos en blanco
        ),
        body: PlatosList(platos: platos),
        backgroundColor: Colors.grey[200], // Fondo de la app más sutil
      ),
    );
  }
}
// ========================== FIN MyApp ==========================

// ========================== INICIO Modelo Plato ==========================
class Plato {
  final String idPlato;
  final String nombre;
  final String descripcion;
  final double precio;
  final String tipo;
  final DateTime fechaSalida;
  final DateTime fechaEntrega;

  Plato({
    required this.idPlato,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.tipo,
    required this.fechaSalida,
    required this.fechaEntrega,
  });
}
// ========================== FIN Modelo Plato ==========================

// ========================== INICIO Lista de Platos ==========================
List<Plato> platos = [
  Plato(
    idPlato: '001',
    nombre: 'Burgir',
    descripcion: 'Rellena de aguacate',
    precio: 185.00,
    tipo: 'Comida',
    fechaSalida: DateTime(2024, 3, 1),
    fechaEntrega: DateTime(2024, 12, 31),
  ),
  Plato(
    idPlato: '002',
    nombre: 'Limonada',
    descripcion: 'Limonada con agua carbonatada',
    precio: 60.00,
    tipo: 'Bebida',
    fechaSalida: DateTime(2024, 4, 15),
    fechaEntrega: DateTime(2024, 11, 30),
  ),
];
// ========================== FIN Lista de Platos ==========================

// ========================== INICIO Widget Lista de Platos ==========================
class PlatosList extends StatelessWidget {
  final List<Plato> platos;

  PlatosList({required this.platos});

  // Función para formatear la fecha
  String formatFecha(DateTime fecha) {
    return fecha.toLocal().toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: platos.map((plato) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              // Fondo del Stack con bordes redondeados y sombra
              Container(
                decoration: BoxDecoration(
                  color: plato.idPlato == '001'
                      ? Colors.blueGrey[900] // Color serio para comida
                      : Colors.teal[900], // Color serio para bebida
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, // Sombra más discreta
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                height: 200, // Altura fija para el contenedor
              ),
              // Contenido del Stack
              Positioned(
                top: 16,
                left: 16,
                right:
                    16, // Asegura que el contenido no quede pegado a los bordes
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre: ${plato.nombre}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Descripción: ${plato.descripcion}',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Precio: \$${plato.precio.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tipo: ${plato.tipo}',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fecha de Salida: ${formatFecha(plato.fechaSalida)}',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fecha de Entrega: ${formatFecha(plato.fechaEntrega)}',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
// ========================== FIN Widget Lista de Platos ==========================
