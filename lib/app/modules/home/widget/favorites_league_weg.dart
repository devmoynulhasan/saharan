import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:saharan/resource/app_images/app_images.dart';

class FavoritesLeague extends StatelessWidget {
  const FavoritesLeague({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFavoriteLeagueCard(
                  "FIFA World Cup 2026",
                  AssetPaths.champoints_league,
                  true,
                ),
                SizedBox(width: 12),
                _buildFavoriteLeagueCard(
                  "Premier League",
                  AssetPaths.serie,
                  true,
                ),
                SizedBox(width: 12),
                _buildFavoriteLeagueCard(
                  "LaLiga",
                  AssetPaths.bundesliga,
                  true,
                ),
              ],
            ),
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

          // List of leagues
          _buildLeagueListItem(
            "Champions League",
            AssetPaths.champoints_league,
            false,
          ),
          SizedBox(height: 12),
          _buildLeagueListItem(
            "Serie A",
            AssetPaths.serie,
            false,
          ),
          SizedBox(height: 12),
          _buildLeagueListItem(
            "Bundesliga",
            AssetPaths.bundesliga,
            false,
          ),
          SizedBox(height: 12),
          _buildLeagueListItem(
            "Europa League",
            AssetPaths.eurooa_league,
            false,
          ),
        ],
      ),
    );
  }

  // Favorite league card (horizontal scroll)
  Widget _buildFavoriteLeagueCard(String name, String logoPath, bool isFavorite) {
    return Container(
      width: 140,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF0a3d3e),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Logo and favorite icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF0a3d3e),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  logoPath,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Favorite icon
          Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Color(0xFFF6F978),
            size: 24,
          ),
          SizedBox(height: 8),
          // League name
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSans3(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
            onTap: () {
              // Toggle favorite logic
            },
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
}