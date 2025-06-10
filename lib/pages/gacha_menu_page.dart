import 'package:flutter/material.dart';
import 'package:gachafigo/pages/gacha_page.dart';
import 'package:gachafigo/pages/event_game_page.dart';
import 'package:gachafigo/pages/profile_page.dart';
import 'package:gachafigo/pages/topup_page.dart';
import 'package:gachafigo/pages/accelerometer_game.dart';

class HomeMenu extends StatelessWidget {
  final VoidCallback onGachaPressed;
  final String username;
  final int credit;

  const HomeMenu({
    Key? key,
    required this.onGachaPressed,
    required this.username,
    required this.credit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildUserInfoCard(context),
          const SizedBox(height: 20),
          _buildGachaButton(context),
          const SizedBox(height: 20),
          _buildFeatureGrid(context),
        ],
      ),
    );
  }

  Widget _buildUserInfoCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias, // agar gambar tidak keluar dari border
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              'https://static.atlasacademy.io/NA/CharaGraph/9807740/9807740a.png',
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                        'https://static.atlasacademy.io/NA/CharaGraph/9400030/9400030a.png',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, $username',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Credit: $credit',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 5, 255, 21),
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGachaButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA500), Color(0xFFFFD700)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.yellow.withOpacity(0.6),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onGachaPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'GACHA NOW !!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.orangeAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        _buildFeatureItem(
          context,
          Icons.person_2_sharp,
          'Profile',
          Colors.amber,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
        _buildFeatureItem(
          context,
          Icons.attach_money,
          'Top Up',
          Colors.green,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TopUpPage()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
