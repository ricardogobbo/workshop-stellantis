import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop_stellantis/models/modelo_model.dart';
import 'package:workshop_stellantis/pages/details_page.dart';

class ModeloCard extends StatelessWidget {
  final ModeloModel modelo;

  const ModeloCard(this.modelo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24, top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Image.asset("assets/cars/${modelo.id}.png"),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        modelo.name ?? "",
                        style: GoogleFonts.mavenPro(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(modelo.year?.toString() ?? ""),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "R\$ " + (modelo.price?.toStringAsFixed(2) ?? ""),
                      style: GoogleFonts.mavenPro(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DetailsPage(),
                      ),
                    ),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                      child: Center(
                        child: Text(
                          "Montar",
                          style: GoogleFonts.mavenPro(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
