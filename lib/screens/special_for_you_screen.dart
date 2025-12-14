import 'package:flutter/material.dart';
import '../models/manga.dart';
import '../widgets/manga_card.dart';

class SpecialForYouScreen extends StatelessWidget {
  const SpecialForYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final specialMangas = sampleMangaData.take(6).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
        elevation: 0,
        title: const Text(
          'พิเศษสำหรับคุณ',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: specialMangas.length,
        itemBuilder: (context, index) {
          return MangaCard(manga: specialMangas[index]);
        },
      ),
    );
  }
}
