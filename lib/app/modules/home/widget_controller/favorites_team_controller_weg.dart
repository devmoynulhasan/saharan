import 'package:get/get.dart';

class Team {
  final String name;
  final String logoPath;
  final bool isFavorite;

  Team({
    required this.name,
    required this.logoPath,
    this.isFavorite = false,
  });

  Team copyWith({String? name, String? logoPath, bool? isFavorite}) {
    return Team(
      name: name ?? this.name,
      logoPath: logoPath ?? this.logoPath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class FavoritesTeamController extends GetxController {
  var selectedIndex = 0.obs;

  // Favorite teams (উপরের horizontal scroll এ দেখাবে)
  var favoriteTeams = <Team>[].obs;

  // All teams (নিচের list এ দেখাবে)
  var allTeams = <Team>[
    Team(name: "Brington", logoPath: "AssetPaths.brington"),
    Team(name: "Liverpool", logoPath: "AssetPaths.liverpool"),
    Team(name: "Arsenal", logoPath: "AssetPaths.arsenal"),
    Team(name: "Newcastle United", logoPath: "AssetPaths.brington"),
  ].obs;

  void selectLeague(int index) {
    selectedIndex.value = index;
  }

  // Toggle favorite
  void toggleFavorite(String teamName) {
    // Check if already in favorites
    int favoriteIndex = favoriteTeams.indexWhere((team) => team.name == teamName);

    if (favoriteIndex != -1) {
      // Remove from favorites
      favoriteTeams.removeAt(favoriteIndex);
    } else {
      // Add to favorites
      int teamIndex = allTeams.indexWhere((team) => team.name == teamName);
      if (teamIndex != -1) {
        favoriteTeams.add(allTeams[teamIndex]);
      }
    }
  }

  // Check if team is favorite
  bool isFavorite(String teamName) {
    return favoriteTeams.any((team) => team.name == teamName);
  }
}