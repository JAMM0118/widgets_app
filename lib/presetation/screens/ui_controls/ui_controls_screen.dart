import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  //static const name = "ui_controls_screen";
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("UI Controls"),
        ),
        body: const _UiControlsView());
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile( //con esto hacemos un switch de opcion tipo on - off

          title: const Text("Devloper Mode"),
          subtitle: const Text("Enable developer mode features"),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        ExpansionTile( //con esto hacemos un switch de opcion que se expande al darle click
          title: const Text("Vehiculo de transporte"),
          subtitle: Text('Select your vehicle: $selectedTransportation'),
          children: [
            RadioListTile( //con esto hacemos una opcion de seleccion como fomulario tipo bolita
              title: const Text("By Car"),
              subtitle: const Text("Travel by car"),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text("By Boat"),
              subtitle: const Text("Travel by Boat"),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text("By Plane"),
              subtitle: const Text("Travel by plane"),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text("By Submarine"),
              subtitle: const Text("Travel by submarine"),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        
        
        CheckboxListTile( //con esto hacemos un lista de marcar opciones tipo checkbox
          title: const Text("¿Quieres desayuno?"),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile( //con esto hacemos un lista de marcar opciones tipo checkbox
          title: const Text("¿Quieres almorzar?"),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile( //con esto hacemos un lista de marcar opciones tipo checkbox
          title: const Text("¿Quieres desayuno?"),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],

     
    );
  }
}
