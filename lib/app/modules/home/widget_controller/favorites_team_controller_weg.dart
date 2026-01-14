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

  // All teams এর main list
  var _allTeamsList = <Team>[
    Team(name: "Brington", logoPath: "AssetPaths.brington"),
    Team(name: "Liverpool", logoPath: "AssetPaths.liverpool"),
    Team(name: "Arsenal", logoPath: "AssetPaths.arsenal"),
    Team(name: "Newcastle United", logoPath: "AssetPaths.brington"),
  ];

  // Favorite teams (উপরের horizontal scroll এ দেখাবে)
  var favoriteTeams = <Team>[].obs;

  // All teams (নিচের list এ দেখাবে - শুধু non-favorite teams)
  var allTeams = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initially all teams are non-favorite
    allTeams.value = List.from(_allTeamsList);
  }

  void selectLeague(int index) {
    selectedIndex.value = index;
  }

  // Toggle favorite
  void toggleFavorite(String teamName) {
    // Check if already in favorites
    int favoriteIndex = favoriteTeams.indexWhere((team) => team.name == teamName);

    if (favoriteIndex != -1) {
      // Remove from favorites এবং নিচের list এ add করো
      Team removedTeam = favoriteTeams[favoriteIndex];
      favoriteTeams.removeAt(favoriteIndex);

      // নিচের list এ আবার add করো
      allTeams.add(removedTeam);
    } else {
      // নিচের list থেকে remove করো এবং favorites এ add করো
      int teamIndex = allTeams.indexWhere((team) => team.name == teamName);
      if (teamIndex != -1) {
        Team selectedTeam = allTeams[teamIndex];
        allTeams.removeAt(teamIndex);
        favoriteTeams.add(selectedTeam);
      }
    }
  }

  // Check if team is favorite
  bool isFavorite(String teamName) {
    return favoriteTeams.any((team) => team.name == teamName);
  }
}