import 'package:flutter/material.dart';
import '../models/manga.dart';
import '../widgets/manga_card.dart';
import '../widgets/horizontal_manga_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'Romance',
    'Action',
    'Daily Life',
    'Fantasy',
  ];
  String selectedCategory = 'Romance';

  @override
  Widget build(BuildContext context) {
    final romanticManga = sampleMangaData
        .where((m) => m.category == 'Romance')
        .toList();
    final actionManga = sampleMangaData
        .where((m) => m.category == 'Action')
        .toList();
    final dailyLifeManga = sampleMangaData
        .where((m) => m.category == 'Daily Life')
        .toList();
    final fantasyManga = sampleMangaData
        .where((m) => m.category == 'Fantasy')
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF00FF00),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'M',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF1a1a1a),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF00FF00)
                              : const Color(0xFF2a2a2a),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF1a1a1a)
                                  : Colors.white70,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Popular by Category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'เรื่องยอดนิยมตามหมวดหมู่',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/category',
                        arguments: selectedCategory,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF00FF00),
                    ),
                  ),
                ],
              ),
            ),
            HorizontalMangaList(
              mangas: _getMangaByCategory(selectedCategory),
              title: '',
            ),
            // Hot & Popular Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'เรื่องมาแรง & ยอดนิยม',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/trending');
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF00FF00),
                    ),
                  ),
                ],
              ),
            ),
            HorizontalMangaList(
              mangas: sampleMangaData.take(10).toList(),
              title: '',
            ),
            // Special for You
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'พิเศษสำหรับคุณ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/special');
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF00FF00),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final manga = sampleMangaData[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: MangaCard(manga: manga),
                  );
                },
              ),
            ),
            // New Releases
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'เรื่องใหม่',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/new-releases');
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF00FF00),
                    ),
                  ),
                ],
              ),
            ),
            HorizontalMangaList(
              mangas: sampleMangaData.skip(5).take(7).toList(),
              title: '',
            ),
            // Recommendations
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: const Text(
                'ทำเป็นแนวแนะนำ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildRecommendationSection('Romance', romanticManga),
                    _buildRecommendationSection('Action', actionManga),
                    _buildRecommendationSection('Daily Life', dailyLifeManga),
                    _buildRecommendationSection('Fantasy', fantasyManga),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF2a2a2a),
        selectedItemColor: const Color(0xFF00FF00),
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Hot'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushNamed(context, '/bookmarks');
              break;
            case 2:
              Navigator.pushNamed(context, '/search');
              break;
            case 3:
              Navigator.pushNamed(context, '/trending');
              break;
            case 4:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }

  List<Manga> _getMangaByCategory(String category) {
    return sampleMangaData
        .where((m) => m.category == category)
        .toList()
        .take(10)
        .toList();
  }

  Widget _buildRecommendationSection(String category, List<Manga> mangas) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SizedBox(
              width: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  final manga = mangas[index % mangas.length];
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF2a2a2a),
                      image: DecorationImage(
                        image: NetworkImage(manga.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
