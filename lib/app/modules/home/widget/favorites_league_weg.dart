import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saharan/app/modules/home/widget_controller/favorites_league-Controller_weg.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class FavoritesLeague extends StatelessWidget {
  FavoritesLeague({super.key});

  // Initialize controller
  final FavoritesLeagueController controller = Get.put(FavoritesLeagueController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Your favorite league section
            Text(
              "Your favorite league",
              style: GoogleFonts.sourceSans3(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
      
            // Horizontal scroll for favorite leagues
            Obx(() => controller.favoriteLeagues.isEmpty
                ? Container(
              height: 140,
              child: Center(
                child: Text(
                  "No favorite leagues yet",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
                : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.favoriteLeagues.map((league) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _buildFavoriteLeagueCard(
                      league.name,
                      _getLogoPath(league.logoPath),
                      true,
                    ),
                  );
                }).toList(),
              ),
            )
            ),
      
            SizedBox(height: 24),
      
            // You may also like section
            Text(
              "You may also like",
              style: GoogleFonts.sourceSans3(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
      
            // List of leagues (non-favorite leagues)
            Obx(() => Column(
              children: controller.allLeagues.map((league) {
                bool isFav = controller.isFavorite(league.name);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildLeagueListItem(
                    league.name,
                    _getLogoPath(league.logoPath),
                    isFav,
                  ),
                );
              }).toList(),
            )),
          ],
        ),
      ),
    );
  }

  // Favorite league card (horizontal scroll)
  Widget _buildFavoriteLeagueCard(String name, String logoPath, bool isFavorite) {
    return Container(
      width: 160,
      height: 120,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF0a3d3e),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo and favorite icon row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                 // color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  logoPath,
                  fit: BoxFit.contain,
                ),
              ),
              // Favorite icon
              GestureDetector(
                onTap: () => controller.toggleFavorite(name),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Color(0xFFF6F978),
                  size: 28,
                ),
              ),
            ],
          ),
          // League name at bottom
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: GoogleFonts.sourceSans3(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // League list item
  Widget _buildLeagueListItem(String name, String logoPath, bool isFavorite) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF0a3d3e),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Logo
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFF0a3d3e),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(6),
            child: Image.asset(
              logoPath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 12),
          // League name
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.sourceSans3(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Favorite icon
          GestureDetector(
            onTap: () => controller.toggleFavorite(name),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Color(0xFF68B5B6),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get logo path
  String _getLogoPath(String path) {
    if (path.contains("champoints_league")) return AssetPaths.champoints_league;
    if (path.contains("serie")) return AssetPaths.serie;
    if (path.contains("bundesliga")) return AssetPaths.bundesliga;
    if (path.contains("eurooa_league")) return AssetPaths.eurooa_league;
    return AssetPaths.champoints_league;
  }
}