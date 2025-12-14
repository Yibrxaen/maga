import 'package:flutter/material.dart';
import '../models/manga.dart';
import 'manga_card.dart';

class HorizontalMangaList extends StatelessWidget {
  final List<Manga> mangas;
  final String title;

  const HorizontalMangaList({
    Key? key,
    required this.mangas,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: mangas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: MangaCard(manga: mangas[index]),
          );
        },
      ),
    );
  }
}
