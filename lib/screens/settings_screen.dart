import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1a1a),
        elevation: 0,
        title: const Text('ตั้งค่า', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // App Information
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ข้อมูลแอป',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingItem('ชื่อแอป', 'Manga Reader'),
                  _buildSettingItem('เวอร์ชัน', '1.0.0'),
                  _buildSettingItem('ผู้พัฒนา', 'Manga Team'),
                  _buildSettingItem('อีเมล', 'contact@mangareader.com'),
                ],
              ),
            ),
            const Divider(color: Color(0xFF2a2a2a)),
            // Settings
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ตั้งค่าทั่วไป',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSwitchItem('Dark Mode', true),
                  _buildSwitchItem('Notifications', true),
                  _buildSwitchItem('Auto-save Progress', true),
                ],
              ),
            ),
            const Divider(color: Color(0xFF2a2a2a)),
            // Account
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'บัญชี',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildButtonItem('เข้าสู่ระบบ', Icons.login),
                  _buildButtonItem('สร้างบัญชี', Icons.person_add),
                  _buildButtonItem('ลืมรหัสผ่าน', Icons.lock_reset),
                ],
              ),
            ),
            const Divider(color: Color(0xFF2a2a2a)),
            // Social Media
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ติดต่อเรา',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSocialIcon('f', 'Facebook', Colors.blue[700]!),
                      _buildSocialIcon('📷', 'Instagram', Colors.pink),
                      _buildSocialIcon('📄', 'Line', Colors.green),
                      _buildSocialIcon('🎵', 'TikTok', Colors.black),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSettingItem('Email Support', 'support@mangareader.com'),
                  _buildSettingItem('Website', 'www.mangareader.com'),
                ],
              ),
            ),
            const Divider(color: Color(0xFF2a2a2a)),
            // Other Pages
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'หน้าอื่น ๆ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildPageLink('นโยบายความเป็นส่วนตัว'),
                  _buildPageLink('เงื่อนไขการใช้บริการ'),
                  _buildPageLink('เกี่ยวกับเรา'),
                  _buildPageLink('ช่วยเหลือ'),
                  _buildPageLink('การตั้งค่าขั้นสูง'),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchItem(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          Switch(
            value: value,
            onChanged: (_) {},
            activeColor: const Color(0xFF00FF00),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonItem(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF00FF00), size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String icon, String name, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: Text(icon, style: const TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(color: Colors.white70, fontSize: 10)),
      ],
    );
  }

  Widget _buildPageLink(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const Icon(Icons.arrow_forward, color: Color(0xFF00FF00)),
          ],
        ),
      ),
    );
  }
}
