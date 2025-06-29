import 'package:flutter/material.dart';

class FavorsMainWidget extends StatefulWidget {
  const FavorsMainWidget({super.key});

  @override
  State<FavorsMainWidget> createState() => _FavorsMainWidgetState();
}

class _FavorsMainWidgetState extends State<FavorsMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(child: Text('Favors'))));
  }
}
