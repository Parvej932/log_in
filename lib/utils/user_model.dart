class UserModel {
  final String name;
  final String email;
  final String address;
  final String? profile;

  UserModel({
    required this.name,
    required this.email,
    required this.address,
    this.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? 'No Name',
      email: json['email'] ?? 'No Email',
      address: json['address'] ?? 'No Address Provided',
      profile: json['profile'],
    );
  }
}
