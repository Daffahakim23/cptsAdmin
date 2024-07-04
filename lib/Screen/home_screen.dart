import 'package:flutter/material.dart';
// import 'package:test_cpts/Screen/detail_screen.dart';
import 'package:test_cpts/Screen/account_screen.dart';
import 'package:test_cpts/Screen/product_screen.dart';
import 'package:test_cpts/Screen/transactionList_Screen.dart';
import 'package:test_cpts/Screen/transaction_screen.dart';

import 'chat_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    const ProductScreen(),
    const PesananScreen(),
    const ChatListScreen(),
    const TransactionListScreen(),
    AdminProfileScreen(
      adminName: 'Admin E-Commerce',
      adminEmail: 'admin@example.com',
      profileImageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Megacom',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
              actions: [
                IconButton(
                  color: Theme.of(context).colorScheme.onPrimary,
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => NotificationListScreen()));
                  },
                  icon: const Icon(Icons.notifications),
                )
              ],
            )
          : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(),
        child: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: Theme.of(context).colorScheme.primary,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Produk'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Pesanan'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Pesan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.rotate_left_outlined), label: 'Pengembalian'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
