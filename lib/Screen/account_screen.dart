import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import 'setting_screen.dart';

class AdminProfileScreen extends StatelessWidget {
  final String adminName;
  final String adminEmail;
  final String profileImageUrl;

  AdminProfileScreen({
    required this.adminName,
    required this.adminEmail,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Admin'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              const SizedBox(height: 16),
              Text(
                adminName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                adminEmail,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  // Contoh bagian untuk menampilkan statistik atau laporan
                  // const ExpansionTile(
                  //   title: Text('Statistik'),
                  //   children: [
                  //     ListTile(
                  //       title: Text('Total Penjualan Bulan Ini: \$10,000'),
                  //     ),
                  //     ListTile(
                  //       title: Text('Jumlah Pesanan Masuk: 50'),
                  //     ),
                  //     // Tambahkan data statistik atau laporan lainnya
                  //   ],
                  // ),

                  Card(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SettingsScreen(),
                        //   ),
                        // );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.bar_chart),
                        title: Text('Statistik'),
                      ),
                    ),
                  ),
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SettingsScreen(),
                        //   ),
                        // );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
