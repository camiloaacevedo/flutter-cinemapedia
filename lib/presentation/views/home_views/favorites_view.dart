import 'package:flutter/material.dart';



class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites View'),
      ),
      body: Center(
        child: const Text('Favorites'),
      ),
    );
  }
}