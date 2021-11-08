import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop_stellantis/models/marca_model.dart';
import 'package:workshop_stellantis/models/modelo_model.dart';
import 'package:workshop_stellantis/pages/main_page.dart';

final List<MarcaModel> marcas = [
  MarcaModel(id: "fiat", name: "Fiat"),
  MarcaModel(id: "jeep", name: "Jeep"),
  MarcaModel(id: "ram", name: "RAM"),
  MarcaModel(id: "citroen", name: "Citroen"),
];

final List<ModeloModel> modelos = [
  ModeloModel(id: "argo", name: "Fiat Argo", marcaId: "fiat", year: 2021, price: 69990),
  ModeloModel(id: "strada", name: "Fiat Strada", marcaId: "fiat", year: 2021, price: 79990),
  ModeloModel(id: "doblo", name: "Fiat Doblo", marcaId: "fiat", year: 2021, price: 89990),
  ModeloModel(id: "renegade", name: "Renegade", marcaId: "jeep", year: 2021, price: 99990),
  ModeloModel(id: "compass", name: "Compass", marcaId: "jeep", year: 2021, price: 169990),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Stellantis',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.mavenPro().fontFamily,
      ),
      home: const MainPage(),
    );
  }
}
