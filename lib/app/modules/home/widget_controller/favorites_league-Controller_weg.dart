import 'package:get/get.dart';

class League {
  final String name;
  final String logoPath;

  League({
    required this.name,
    required this.logoPath,
  });
}

class FavoritesLeagueController extends GetxController {
  // All leagues এর main list
  final _allLeaguesList = <League>[
    League(name: "FIFA World Cup 2026", logoPath: "AssetPaths.champoints_league"),
    League(name: "Premier League", logoPath: "AssetPaths.serie"),
    League(name: "LaLiga", logoPath: "AssetPaths.bundesliga"),
    League(name: "Champions League", logoPath: "AssetPaths.champoints_league"),
    League(name: "Serie A", logoPath: "AssetPaths.serie"),
    League(name: "Bundesliga", logoPath: "AssetPaths.bundesliga"),
    League(name: "Europa League", logoPath: "AssetPaths.eurooa_league"),
  ];

  // Favorite leagues (উপরের horizontal scroll এ দেখাবে)
  var favoriteLeagues = <League>[].obs;

  // All leagues (নিচের list এ দেখাবে - শুধু non-favorite leagues)
  var allLeagues = <League>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initially all leagues are non-favorite
    allLeagues.value = List.from(_allLeaguesList);
  }

  // Toggle favorite
  void toggleFavorite(String leagueName) {
    // Check if already in favorites
    int favoriteIndex = favoriteLeagues.indexWhere((league) => league.name == leagueName);

    if (favoriteIndex != -1) {
      // Remove from favorites এবং নিচের list এ add করো
      League removedLeague = favoriteLeagues[favoriteIndex];
      favoriteLeagues.removeAt(favoriteIndex);

      // নিচের list এ আবার add করো
      allLeagues.add(removedLeague);
    } else {
      // নিচের list থেকে remove করো এবং favorites এ add করো
      int leagueIndex = allLeagues.indexWhere((league) => league.name == leagueName);
      if (leagueIndex != -1) {
        League selectedLeague = allLeagues[leagueIndex];
        allLeagues.removeAt(leagueIndex);
        favoriteLeagues.add(selectedLeague);
      }
    }
  }

  // Check if league is favorite
  bool isFavorite(String leagueName) {
    return favoriteLeagues.any((league) => league.name == leagueName);
  }
}