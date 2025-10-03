import 'package:flutter/material.dart';
import 'package:project1/models/art.dart';
import 'package:project1/data/art_data.dart';


class DetailPage extends StatelessWidget {
  final int artId;// รับ id ของงานศิลป์ที่จะโชว์
  const DetailPage({super.key, required this.artId});

  @override
  Widget build(BuildContext context) {
    final Art art = artList.firstWhere((element) => element.id == artId); // หา Art object ที่ตรงกับ artId จาก artList

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(art.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity, // เต็มจอกว้าง
                height: 300, // กำหนดความสูงตายตัว (เลือกตามต้องการ)
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(art.imagePath),
                    fit: BoxFit.cover, // บังคับให้เต็ม
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Text(
              art.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              art.artist,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              art.type,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              art.description,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
