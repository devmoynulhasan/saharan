import 'package:flutter/material.dart';
import 'package:saharan/app/modules/home/view/account/account_screen.dart';
import 'package:saharan/app/modules/home/view/favourite/favourite_screen.dart';
import 'package:saharan/resource/app_images/app_images.dart';
import 'budget/budget_screen.dart';
import 'dashboard/dashboard_screen.dart';
import 'matches/matches_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MatchesScreen(),
    DashboardScreen(),
    BudgetScreen(),
    FavouriteScreen(),
    AccountScreen(),
  ];

  final List<String> _labels = [
    'Matches',
    'Dashboard',
    'Budget',
    'Favourite',
    'Account',
  ];

  final List<String> _icons = [

    AssetPaths.matches,
    AssetPaths.dashboard,
    AssetPaths.budget,
    AssetPaths.favourite,
    AssetPaths.account,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF032526),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0A3D3E),
                Color(0xFF032526),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) {
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(
                    horizontal: isSelected ? 16 : 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color(0xFF0A3D3E)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        _icons[index],
                        height: 24,
                        width: 24,
                        color: isSelected
                            ? Color(0xFFF6F978)
                            : Colors.white.withOpacity(0.5),
                      ),
                      if (isSelected) ...[
                        SizedBox(width: 8),
                        Text(
                          _labels[index],
                          style: TextStyle(
                            color: Color(0xFFF6F978),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}