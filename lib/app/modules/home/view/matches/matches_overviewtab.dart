import 'package:flutter/material.dart';
import 'package:saharan/resource/app_images/app_images.dart';

// Model class for team data
class TeamStanding {
  final String position;
  final String teamName;
  final String teamLogo;
  final String matches;
  final String wins;
  final String draws;
  final String losses;
  final String goalDifference;
  final String points;

  TeamStanding({
    required this.position,
    required this.teamName,
    required this.teamLogo,
    required this.matches,
    required this.wins,
    required this.draws,
    required this.losses,
    required this.goalDifference,
    required this.points,
  });
}

// Model class for recent match
class RecentMatch {
  final String team1Logo;
  final String team2Logo;
  final String score;
  final MatchResult result; // win, loss, draw

  RecentMatch({
    required this.team1Logo,
    required this.team2Logo,
    required this.score,
    required this.result,
  });
}

enum MatchResult { win, loss, draw }

class OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data - Replace with your actual data
    final teams = [
      TeamStanding(
        position: '04',
        teamName: 'Manchester United',
        teamLogo: AssetPaths.manchester_united,
        matches: '21',
        wins: '15',
        draws: '4',
        losses: '2',
        goalDifference: '+17',
        points: '49',
      ),
      TeamStanding(
        position: '06',
        teamName: 'Newcastle United',
        teamLogo: AssetPaths.newcastle_united,
        matches: '21',
        wins: '10',
        draws: '5',
        losses: '6',
        goalDifference: '+5',
        points: '35',
      ),
    ];

    final recentMatches = [
      [
        RecentMatch(
          team1Logo: AssetPaths.manchester_united,
          team2Logo: AssetPaths.arsenal,
          score: '2 - 1',
          result: MatchResult.win,
        ),
        RecentMatch(
          team1Logo: AssetPaths.manchester_united,
          team2Logo: AssetPaths.arsenal,
          score: '2 - 1',
          result: MatchResult.win,
        ),
      ],
      [
        RecentMatch(
          team1Logo: AssetPaths.manchester_united,
          team2Logo: AssetPaths.arsenal,
          score: '2 - 1',
          result: MatchResult.win,
        ),
        RecentMatch(
          team1Logo: AssetPaths.manchester_united,
          team2Logo: AssetPaths.arsenal,
          score: '2 - 1',
          result: MatchResult.win,
        ),
      ],
      [
        RecentMatch(
          team1Logo: AssetPaths.manchester_united,
          team2Logo: AssetPaths.arsenal,
          score: '2 - 1',
          result: MatchResult.loss,
        ),
        RecentMatch(
          team1Logo: AssetPaths.manchester_united,
          team2Logo: AssetPaths.arsenal,
          score: '2 - 1',
          result: MatchResult.draw,
        ),
      ],
      [
        RecentMatch(
          team1Logo: AssetPaths.manchester_united,
          team2Logo: AssetPaths.arsenal,
          score: '2 - 1',
          result: MatchResult.draw,
        ),
        RecentMatch(
          team1Logo: AssetPaths.manchester_united,
          team2Logo: AssetPaths.arsenal,
          score: '2 - 1',
          result: MatchResult.loss,
        ),
      ],
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Match Details Container
          _buildMatchDetailsContainer(),

          SizedBox(height: 10),

          // League Position Widget
          LeaguePositionWidget(teams: teams),

          SizedBox(height: 15),

          // Recent Performance Section
          _buildRecentPerformanceSection(recentMatches),
        ],
      ),
    );
  }

  Widget _buildMatchDetailsContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF0A3D3E),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          _buildInfoRow(
            AssetPaths.premier_league,
            'Premier League',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 8),
          _buildInfoRow(
            AssetPaths.match_delels_clender,
            '7th Jan 2026, 02:00 PM',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 8),
          _buildInfoRow(
            AssetPaths.match_delels_emirates,
            'Emirates Stadium, London, England',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String iconPath, String text, {
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return Row(
      children: [
        Image.asset(iconPath, height: 24, width: 24),
        SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentPerformanceSection(List<List<RecentMatch>> matches) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent performance",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF),
          ),
        ),
        SizedBox(height: 20),

        // Match rows
        ...matches.map((matchPair) => Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: matchPair.map((match) =>
                _buildMatchCard(match)
            ).toList(),
          ),
        )).toList(),

        SizedBox(height: 20),

        // Log Match Button
        _buildLogMatchButton(),
      ],
    );
  }

  Widget _buildMatchCard(RecentMatch match) {
    Color scoreColor;
    switch (match.result) {
      case MatchResult.win:
        scoreColor = Color(0xFF10B981);
        break;
      case MatchResult.loss:
        scoreColor = Colors.red;
        break;
      case MatchResult.draw:
        scoreColor = Color(0xFF00595B);
        break;
    }

    return Container(
      height: 44,
      width: 130,
      decoration: BoxDecoration(
        color: Color(0xFF0A3D3E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(match.team1Logo, height: 20, width: 20),
          Container(
            height: 24,
            width: 52,
            decoration: BoxDecoration(
              color: scoreColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                match.score,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Image.asset(match.team2Logo, height: 20, width: 20),
        ],
      ),
    );
  }

  Widget _buildLogMatchButton() {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF6F978),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          "Log this match",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// League Position Widget
class LeaguePositionWidget extends StatelessWidget {
  final List<TeamStanding> teams;

  const LeaguePositionWidget({
    Key? key,
    required this.teams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0A3D3E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'League Position',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Column Headers - Make it scrollable
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                children: [
                  // Left side - # and Team (Fixed width)
                  SizedBox(
                    width: 200,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          child: Text(
                            '#',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Team',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right side - Stats headers
                  Row(
                    children: [
                      _buildStatHeader('M'),
                      _buildStatHeader('W'),
                      _buildStatHeader('D'),
                      _buildStatHeader('L'),
                      _buildStatHeader('GD'),
                      _buildStatHeader('Pts'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Team Rows
          ...teams.map((team) => _buildTeamRow(team)).toList(),
        ],
      ),
    );
  }

  Widget _buildStatHeader(String label) {
    return Container(
      width: 35,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 8),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTeamRow(TeamStanding team) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        child: Row(
          children: [
            // Left side - Position, Logo, Team Name (Fixed width)
            SizedBox(
              width: 200,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Text(
                      team.position,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  SizedBox(width: 15),
                  Image.asset(
                    team.teamLogo,
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      team.teamName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Right side - Stats
            Row(
              children: [
                _buildStatValue(team.matches),
                _buildStatValue(team.wins),
                _buildStatValue(team.draws),
                _buildStatValue(team.losses),
                _buildStatValue(team.goalDifference),
                _buildStatValue(team.points),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatValue(String value) {
    return Container(
      width: 35,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 8),
      child: Text(
        value,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}