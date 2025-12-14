import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
        elevation: 0,
        title: const Text('โปรไฟล์', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFF00FF00),
              child: const Icon(
                Icons.person,
                size: 60,
                color: Color(0xFF1a1a1a),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'ผู้ใช้',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'user@mangareader.com',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const SizedBox(height: 32),
            _buildProfileOption('ประวัติการอ่าน', Icons.history),
            _buildProfileOption('รายการโปรด', Icons.favorite),
            _buildProfileOption('การซื้อในแอป', Icons.shopping_bag),
            _buildProfileOption('ตั้งค่า', Icons.settings),
            _buildProfileOption('ออกจากระบบ', Icons.logout),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00FF00)),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward, color: Colors.white54),
        ],
      ),
    );
  }
}
