// 🌐 Importación del paquete principal de Flutter
import 'package:flutter/material.dart';

// 🚀 Función principal que arranca la aplicación
void main() {
  runApp(MyApp()); // ⬅️ Inicia la aplicación con MyApp
}

// 🌐 CLASE PRINCIPAL: Define la aplicación completa
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 🔵 Quitar la barra de debug
      home: ReservaScreen(), // ⬅️ Pantalla principal que se va a mostrar
    );
  }
}
// 🔚 Fin de MyApp

// 🌐 CLASE DE LA PANTALLA PRINCIPAL (ReservaScreen)
class ReservaScreen extends StatelessWidget {
  // 🌐 Mapa que contiene todas las reservas (simula la base de datos)
  final Map<String, dynamic> reservas = {
    'reserva1': {
      'url_imagen':
          'https://raw.githubusercontent.com/CESARIIN0/imagenes-para-APP-flutter-6.-j/refs/heads/main/cuchillo1.png',
      'id_reserva': '001',
      'id_cliente': 'C123',
      'id_mesa': 'M5',
      'fecha_reserva': '2024-03-15',
    },
    'reserva2': {
      'url_imagen':
          'https://raw.githubusercontent.com/CESARIIN0/imagenes-para-APP-flutter-6.-j/refs/heads/main/cuchillo2.jpg',
      'id_reserva': '002',
      'id_cliente': 'C456',
      'id_mesa': 'M3',
      'fecha_reserva': '2024-03-16',
    },
    'reserva3': {
      'url_imagen':
          'https://raw.githubusercontent.com/CESARIIN0/imagenes-para-APP-flutter-6.-j/refs/heads/main/cuchillo3.jpg',
      'id_reserva': '003',
      'id_cliente': 'C789',
      'id_mesa': 'M1',
      'fecha_reserva': '2024-03-17',
    },
    'reserva4': {
      'url_imagen':
          'https://raw.githubusercontent.com/CESARIIN0/imagenes-para-APP-flutter-6.-j/refs/heads/main/cliente.jpg',
      'id_reserva': '004',
      'id_cliente': 'C321',
      'id_mesa': 'M4',
      'fecha_reserva': '2024-03-18',
    },
  };
  // 🔚 Fin del mapa de reservas

  // 🌐 Método principal para construir la interfaz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ⬅️ Pantalla con AppBar y cuerpo
      appBar: AppBar(
        // ⬅️ Barra superior de la aplicación
        title: Text(
          'Cesar Reyes Vazquez N.-1294', // Título del AppBar
        ),
        centerTitle: true, // Centrar el título
        backgroundColor: Colors.blue, // Color azul al AppBar
        leading: Icon(Icons.menu), // Icono de menú a la izquierda
      ),
      body: ListView(
        // ⬅️ Lista scrollable para mostrar las reservas
        children: reservas.entries.map((entry) {
          var reserva = entry.value; // Datos individuales de cada reserva

          // 🔹 Tarjeta (Card) que muestra cada reserva
          return Container(
            margin: EdgeInsets.symmetric(
                vertical: 10, horizontal: 15), // Margen alrededor de la tarjeta
            child: Card(
              elevation: 5, // Sombra (altura)
              shadowColor: Colors.black45, // Color de la sombra
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Bordes redondeados
              ),
              child: ListTile(
                // ⬅️ Componente para mostrar contenido en lista
                contentPadding: EdgeInsets.all(10), // Espaciado interno
                tileColor: Colors.blue.shade50, // Color de fondo del ListTile
                leading: CircleAvatar(
                  // ⬅️ Imagen circular
                  backgroundImage:
                      NetworkImage(reserva['url_imagen']), // Imagen de la URL
                  radius: 30, // Tamaño del avatar
                ),
                title: Text(
                  // ⬅️ Título (ID de la reserva)
                  'Reserva ID: ${reserva['id_reserva']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Texto en negrita
                  ),
                ),
                subtitle: Column(
                  // ⬅️ Información adicional debajo del título
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Alinear texto a la izquierda
                  children: [
                    SizedBox(height: 5), // Espacio vertical
                    Text(
                      'Cliente ID: ${reserva['id_cliente']}',
                      style: TextStyle(color: Colors.purple), // Texto morado
                    ),
                    Text(
                      'Mesa ID: ${reserva['id_mesa']}',
                      style: TextStyle(color: Colors.purple),
                    ),
                    Text(
                      'Fecha: ${reserva['fecha_reserva']}',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ],
                ),
              ),
            ),
          );
          // 🔚 Fin de la tarjeta de reserva
        }).toList(), // Convertir los elementos del mapa a lista de widgets
      ),
    );
  }
  // 🔚 Fin del método build
}
// 🔚 Fin de la clase ReservaScreen
