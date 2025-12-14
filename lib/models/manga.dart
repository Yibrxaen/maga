class Manga {
  final int id;
  final String title;
  final String category;
  final String imageUrl;
  final String author;
  final double rating;
  final int views;
  final String description;

  Manga({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.author,
    required this.rating,
    required this.views,
    required this.description,
  });
}

// Sample data
final List<Manga> sampleMangaData = [
  // Romance
  for (int i = 1; i <= 10; i++)
    Manga(
      id: i,
      title: 'Romance Manga $i',
      category: 'Romance',
      imageUrl: 'https://via.placeholder.com/200x300?text=Romance+$i',
      author: 'Author $i',
      rating: 4.5,
      views: 26900000 + (i * 100000),
      description: 'A romantic manga story',
    ),
  // Action
  for (int i = 11; i <= 20; i++)
    Manga(
      id: i,
      title: 'Action Manga ${i - 10}',
      category: 'Action',
      imageUrl: 'https://via.placeholder.com/200x300?text=Action+${i - 10}',
      author: 'Author $i',
      rating: 4.8,
      views: 32900000 + (i * 100000),
      description: 'An action-packed manga story',
    ),
  // Daily Life
  for (int i = 21; i <= 30; i++)
    Manga(
      id: i,
      title: 'Daily Life Manga ${i - 20}',
      category: 'Daily Life',
      imageUrl: 'https://via.placeholder.com/200x300?text=Daily+${i - 20}',
      author: 'Author $i',
      rating: 4.3,
      views: 22900000 + (i * 100000),
      description: 'A slice of life manga',
    ),
  // Fantasy
  for (int i = 31; i <= 40; i++)
    Manga(
      id: i,
      title: 'Fantasy Manga ${i - 30}',
      category: 'Fantasy',
      imageUrl: 'https://via.placeholder.com/200x300?text=Fantasy+${i - 30}',
      author: 'Author $i',
      rating: 4.7,
      views: 28900000 + (i * 100000),
      description: 'A fantasy manga adventure',
    ),
];
