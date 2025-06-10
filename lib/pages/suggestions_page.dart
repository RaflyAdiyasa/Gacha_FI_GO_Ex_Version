import 'package:flutter/material.dart';

class ProfilePageDouble extends StatelessWidget {
  final Color _primaryColor = Color.fromARGB(179, 205, 194, 255);
  final Color _accentColor = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Tim',
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _primaryColor.withOpacity(0.1),
              _primaryColor.withOpacity(0.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile Card 1
                _buildProfileCard(
                  context,
                  'Rafly Adiyasa Putra',
                  'Linux User',
                  'Mahasiswa Teknik Informatika yang passionate dalam pengembangan app. Suka kopi dan tantangan coding yang kompleks.',
                  Icons.person,
                  Colors.blue,
                  [
                    {
                      'label': 'Email',
                      'value': 'raflyadiyasa@gmail.com',
                      'icon': Icons.email,
                    },
                    {
                      'label': 'Phone',
                      'value': '+62 812-3456-7890',
                      'icon': Icons.phone,
                    },
                    {'label': 'Skill', 'value': 'Linux', 'icon': Icons.code},
                  ],
                ),
                SizedBox(height: 20),

                // Profile Card 2
                _buildProfileCard(
                  context,
                  'Muhamad Tsani Putra Tronchet',
                  'Backend Developer',
                  'Mahasiswa pemalas yang ngoding h-1 deadline',
                  Icons.person_outline,
                  Colors.blue,
                  [
                    {
                      'label': 'Email',
                      'value': 'tsani@cmail.com',
                      'icon': Icons.email,
                    },
                    {
                      'label': 'Phone',
                      'value': '+62 821-9876-5432',
                      'icon': Icons.phone,
                    },
                    {
                      'label': 'Skill',
                      'value':
                          'JS , API REST , POSTMAN , NODE.js , NEXT.js , React.js , Golang',
                      'icon': Icons.design_services,
                    },
                  ],
                ),

                SizedBox(height: 30),
                _buildTeamSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(
    BuildContext context,
    String name,
    String role,
    String description,
    IconData avatarIcon,
    Color themeColor,
    List<Map<String, dynamic>> contactInfo,
  ) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Avatar and basic info
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: themeColor.withOpacity(0.2),
                  child: Icon(avatarIcon, size: 40, color: themeColor),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _accentColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        role,
                        style: TextStyle(
                          fontSize: 16,
                          color: themeColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Description
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.grey[700],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Contact information
            ...contactInfo
                .map(
                  (info) => _buildContactItem(
                    info['icon'],
                    info['label'],
                    info['value'],
                    themeColor,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          SizedBox(width: 12),
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            child: Text(value, style: TextStyle(color: Colors.grey[800])),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(Icons.group, size: 40, color: _accentColor),
            SizedBox(height: 12),
            Text(
              'Tim Pengembang',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _accentColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Kami adalah tim yang berdedikasi untuk menciptakan aplikasi mobile yang inovatif dan user-friendly.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
