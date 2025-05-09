class UserProfile {
  final String name;
  final String role;
  final String skills;
  final String company;
  final String location;
  final int followers;
  final int connections;
  final int profileViews;
  final int postViews;
  final int searchAppearances;

  UserProfile({
    required this.name,
    required this.role,
    required this.skills,
    required this.company,
    required this.location,
    required this.followers,
    required this.connections,
    required this.profileViews,
    required this.postViews,
    required this.searchAppearances,
  });
}