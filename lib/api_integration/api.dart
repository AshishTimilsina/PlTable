// ignore_for_file: public_member_api_docs, sort_constructors_first
class PremierLeague {
  final String name;
  final String logo;
  final String abbreviation;
  final num wins;
  final num losses;
  final num ties;
  final num gamesPlayed;
  final num goalsFor;
  final num goalsAgainst;
  final num points;
  final num rank;
  final num goalDifference;
  PremierLeague({
    required this.name,
    required this.logo,
    required this.abbreviation,
    required this.wins,
    required this.losses,
    required this.ties,
    required this.gamesPlayed,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.points,
    required this.rank,
    required this.goalDifference,
  });

  factory PremierLeague.fromJson(Map<String, dynamic> json) {
    return PremierLeague(
      name: json['team']['name'],
      logo: json['team']['logo'],
      abbreviation: json['team']['abbreviation'],
      wins: json['stats']['wins'],
      losses: json['stats']['losses'],
      ties: json['stats']['ties'],
      gamesPlayed: json['stats']['gamesPlayed'],
      goalsFor: json['stats']['goalsFor'],
      goalsAgainst: json['stats']['goalsAgainst'],
      points: json['stats']['points'],
      rank: json['stats']['rank'],
      goalDifference: json['stats']['goalDifference'],
    );
  }
}
