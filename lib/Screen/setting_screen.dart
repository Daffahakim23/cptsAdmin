// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../main.dart';

// class SettingsScreen extends StatefulWidget {
//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     if (themeProvider == null) {
//       // Contoh: Menampilkan pesan atau widget lain jika themeProvider null
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Pengaturan'),
//         ),
//         body: Center(
//           child: Text('Tidak dapat mengambil tema dari Provider.'),
//         ),
//       );
//     }

//     bool isDarkMode = themeProvider.isDarkMode;
//     Function toggleTheme = themeProvider.toggleTheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pengaturan'),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: Text('Notifikasi'),
//             trailing: Switch(
//               value: isDarkMode,
//               onChanged: (value) {
//                 toggleTheme();
//               },
//             ),
//           ),
//           ListTile(
//             title: Text('Tema Aplikasi'),
//             trailing: DropdownButton<String>(
//               value: isDarkMode ? 'Dark' : 'Light',
//               onChanged: (value) {
//                 // Implementasi logika untuk mengubah tema aplikasi
//                 if (value == 'Dark') {
//                   themeProvider.setDarkMode(true);
//                 } else if (value == 'Light') {
//                   themeProvider.setDarkMode(false);
//                 }
//               },
//               items: <String>['Light', 'Dark'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//           // Tambahkan opsi pengaturan lainnya sesuai kebutuhan
//         ],
//       ),
//     );
//   }
// }
