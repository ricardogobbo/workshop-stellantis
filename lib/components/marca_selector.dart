import 'package:flutter/material.dart';
import 'package:workshop_stellantis/models/marca_model.dart';

class MarcaSelector extends StatefulWidget {
  final List<MarcaModel> marcas;
  final Function(MarcaModel?) onChange;

  const MarcaSelector({required this.marcas, required this.onChange, Key? key})
      : super(key: key);

  @override
  _MarcaSelectorState createState() => _MarcaSelectorState();
}

class _MarcaSelectorState extends State<MarcaSelector> {
  MarcaModel? _selectedMarca;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              _selectedMarca = null;
              widget.onChange(null);
            }),
            child: MarcaContainer(
              child: const Center(
                child: Text("Todas"),
              ),
              backgroundColor: Colors.grey[100]!,
            ),
          ),
          ...widget.marcas.map<Widget>((e) {
            var image = "normal";
            var color = Colors.white;
            if (e == _selectedMarca) {
              image = "selected";
              color = Colors.blue[700]!;
            }

            return GestureDetector(
              onTap: () => setState(() {
                _selectedMarca = e;
                widget.onChange(e);
              }),

              child: MarcaContainer(
                child: Image.asset("assets/logos/${e.id}-$image.png"),
                backgroundColor: color,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class MarcaContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const MarcaContainer(
      {required this.child, required this.backgroundColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      width: 72,
      height: 72,
      child: child,
    );
  }
}
