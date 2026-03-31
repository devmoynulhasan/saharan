import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saharan/app/modules/home/controller/account/account_screen_controller.dart';
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

  // ✅ AccountController একবারই init করা হচ্ছে — AccountScreen এও Get.find() করবে
  final AccountController accountController = Get.put(AccountController());

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF032526),
        body: _screens[_selectedIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0A3D3E), Color(0xFF032526)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                final isSelected = _selectedIndex == index;
                final isAccountTab = index == 4;

                return GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.symmetric(
                      horizontal: isSelected ? 16 : 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF0A3D3E)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ✅ Account tab এ profile image দেখাবে
                        if (isAccountTab)
                          Obx(() => _buildAccountIcon(
                            isSelected: isSelected,
                            pickedImage:
                            accountController.pickedImage.value,
                            imageUrl:
                            accountController.profileImageUrl.value,
                            fallbackIcon: _icons[index],
                          ))
                        else
                          Image.asset(
                            _icons[index],
                            height: 24,
                            width: 24,
                            color: isSelected
                                ? const Color(0xFFF6F978)
                                : Colors.white.withOpacity(0.5),
                          ),

                        if (isSelected) ...[
                          const SizedBox(width: 8),
                          Text(
                            _labels[index],
                            style: const TextStyle(
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
      ),
    );
  }

  Widget _buildAccountIcon({
    required bool isSelected,
    required dynamic pickedImage,
    required String imageUrl,
    required String fallbackIcon,
  }) {
    // Priority 1: Gallery থেকে pick করা image
    if (pickedImage != null) {
      return _circleImage(
        child: Image.file(pickedImage, fit: BoxFit.cover),
        isSelected: isSelected,
      );
    }

    // Priority 2: API থেকে আসা network image
    if (imageUrl.isNotEmpty) {
      return _circleImage(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _fallbackIcon(fallbackIcon, isSelected),
        ),
        isSelected: isSelected,
      );
    }

    // Priority 3: Default asset icon
    return _fallbackIcon(fallbackIcon, isSelected);
  }

  Widget _circleImage({required Widget child, required bool isSelected}) {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? const Color(0xFFF6F978)
              : Colors.white.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      child: ClipOval(child: child),
    );
  }

  Widget _fallbackIcon(String iconPath, bool isSelected) {
    return Image.asset(
      iconPath,
      height: 24,
      width: 24,
      color: isSelected
          ? const Color(0xFFF6F978)
          : Colors.white.withOpacity(0.5),
    );
  }
}