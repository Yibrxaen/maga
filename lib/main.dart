import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/category_screen.dart';
import 'screens/trending_screen.dart';
import 'screens/special_for_you_screen.dart';
import 'screens/new_releases_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/search_screen.dart';
import 'screens/bookmarks_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MangaReaderApp());
}

class MangaReaderApp extends StatelessWidget {
  const MangaReaderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manga Reader',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF00FF00),
        scaffoldBackgroundColor: const Color(0xFF1a1a1a),
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/category': (context) {
          final category =
              ModalRoute.of(context)?.settings.arguments as String?;
          return CategoryScreen(category: category ?? 'Romance');
        },
        '/trending': (context) => const TrendingScreen(),
        '/special': (context) => const SpecialForYouScreen(),
        '/new-releases': (context) => const NewReleasesScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/search': (context) => const SearchScreen(),
        '/bookmarks': (context) => const BookmarksScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
