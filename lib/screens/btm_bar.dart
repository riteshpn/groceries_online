import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceries_online/provider/dark_theme_provider.dart';
import 'package:groceries_online/screens/cart.dart';
import 'package:groceries_online/screens/categories.dart';
import 'package:groceries_online/screens/home_screen.dart';
import 'package:groceries_online/screens/user.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 3;
  final List<Map<String, dynamic>> _pages = [
    {'pages': const HomeScreen(), 'title': 'Home Screen'},
    {'pages': const CategoriesScreen(), 'title': 'Categories Screen'},
    {'pages': const CartScreen(), 'title': 'Cart Screen'},
    {'pages': const UserScreen(), 'title': 'user Screen'}
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: _pages[_selectedIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
          selectedItemColor:
              _isDark ? Colors.lightBlue.shade200 : Colors.black87,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2,
              ),
              label: "User",
            ),
          ]),
    );
  }
}
