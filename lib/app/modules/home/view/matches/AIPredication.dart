import 'package:flutter/material.dart';

class AIPrediction extends StatelessWidget {
  const AIPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Match Winner ──
          _SectionTitle('Match Winner?'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _OddsCard(label: '1',  odds: '1.78', percent: '44%')),
              const SizedBox(width: 8),
              Expanded(child: _OddsCard(label: 'X',  odds: '3.41', percent: '26%')),
              const SizedBox(width: 8),
              Expanded(child: _OddsCard(label: '2',  odds: '5.22', percent: '30%')),
            ],
          ),

          const SizedBox(height: 20),

          // ── Double Chance ──
          _SectionTitle('Double Chance?'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _OddsCard(label: '1X', odds: '1.78', percent: '44%', bgColor: const Color(0xFF1A7A4A))),
              const SizedBox(width: 8),
              Expanded(child: _OddsCard(label: '12', odds: '1.29', percent: '76%', bgColor: const Color(0xFFD32F2F), labelColor: Colors.white, subColor: Colors.white)),
              const SizedBox(width: 8),
              Expanded(child: _OddsCard(label: '2X', odds: '2.23', percent: '46%')),
            ],
          ),

          const SizedBox(height: 20),

          // ── Both Teams Score ──
          _SectionTitle('Both Teams Score?'),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _OddsCard(label: 'YES', odds: '1.92', percent: '50%')),
              const SizedBox(width: 8),
              Expanded(child: _OddsCard(label: 'NO',  odds: '2',    percent: '50%')),
              const Expanded(child: SizedBox()),
            ],
          ),

          const SizedBox(height: 20),

          // ── Goals Over/Under ──
          _SectionTitle('Goals Over/Under?'),
          const SizedBox(height: 8),
          _GoalsGrid(),

          const SizedBox(height: 24),

          // ── Log this match button ──  ✅ এখন scroll এর শেষে
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF6F978),
                foregroundColor: const Color(0xFF053030),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Log this match',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ── Goals Grid ──
class _GoalsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items = const [
    {'label': 'Over 0.5',  'odds': '1.06', 'percent': '90%', 'highlight': true,  'color': Color(0xFF1A7A4A)},
    {'label': 'Under 1.5', 'odds': '11.8', 'percent': '10%', 'highlight': false, 'color': null},
    {'label': 'Over 1.5',  'odds': '1.31', 'percent': '69%', 'highlight': true,  'color': Color(0xFF1A7A4A)},
    {'label': 'Under 2.5', 'odds': '1.97', 'percent': '58%', 'highlight': false, 'color': null},
    {'label': 'Over 3.5',  'odds': '3.4',  'percent': '21%', 'highlight': false, 'color': null},
    {'label': 'Over 0.5',  'odds': '1.06', 'percent': '90%', 'highlight': true,  'color': Color(0xFF1A7A4A)},
    {'label': 'Under 4.5', 'odds': '6.25', 'percent': '8%',  'highlight': true,  'color': Color(0xFF1A7A4A)},
    {'label': 'Over 4.5',  'odds': '1.13', 'percent': '92%', 'highlight': false, 'color': null},
    {'label': 'Over 5.5',  'odds': '1.05', 'percent': '97%', 'highlight': false, 'color': null},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return _OddsCard(
          label:   item['label'],
          odds:    item['odds'],
          percent: item['percent'],
          bgColor: item['color'] ?? const Color(0xFF184647),
          labelColor: Colors.white,
          subColor: item['highlight'] == true ? Colors.white : Colors.white70,
        );
      },
    );
  }
}

// ── Section Title ──
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

// ── Odds Card ──
class _OddsCard extends StatelessWidget {
  final String label;
  final String odds;
  final String percent;
  final Color bgColor;
  final Color labelColor;
  final Color subColor;

  const _OddsCard({
    required this.label,
    required this.odds,
    required this.percent,
    this.bgColor    = const Color(0xFF184647),
    this.labelColor = Colors.white,
    this.subColor   = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: labelColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Divider(
              color: Colors.white.withOpacity(0.15),
              height: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(odds,
                  style: TextStyle(
                      color: subColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
              Text(percent,
                  style: TextStyle(
                      color: subColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}