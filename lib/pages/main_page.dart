import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop_stellantis/components/marca_selector.dart';
import 'package:workshop_stellantis/components/modelo_card.dart';
import 'package:workshop_stellantis/main.dart';
import 'package:workshop_stellantis/models/marca_model.dart';
import 'package:workshop_stellantis/models/modelo_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ModeloModel>? _modelos;

  @override
  void initState() {
    super.initState();
    _modelos = modelos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Selecione',
                    style: GoogleFonts.mavenPro(
                      color: Colors.grey[850],
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' o Carro',
                        style: GoogleFonts.mavenPro(
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                  size: 30,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              "Marcas",
              style: GoogleFonts.mavenPro(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            MarcaSelector(marcas: marcas, onChange: (e) => filterMarca(e)),
            const SizedBox(height: 32),
            Text(
              "Carros Disponíveis",
              style: GoogleFonts.mavenPro(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            if (_modelos == null || _modelos!.isEmpty)
              const Text("Nenhum veículo disponível.")
            else
              ..._modelos!.map<Widget>((e) => ModeloCard(e)).toList()
          ],
        ),
      ),
    );
  }

  void filterMarca(MarcaModel? marca) {
    setState(() {
      if (marca == null) {
        _modelos = modelos;
      } else {
        _modelos =
            modelos.where((element) => element.marcaId == marca.id).toList();
      }
    });
  }
}
