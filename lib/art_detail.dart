import 'package:flutter/material.dart';
import '../models/art.dart';
import 'data/art_data.dart';

class DetailPage extends StatelessWidget {
  final int artId;
  const DetailPage({super.key, required this.artId});

  @override
  Widget build(BuildContext context) {
    final Art art = artList.firstWhere((element) => element.id == artId);

    return Scaffold(
      appBar: AppBar(title: Text(art.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(art.imagePath),
            ),
            const SizedBox(height: 16),
            Text(
              art.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              art.artist,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              art.price,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              art.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}