class UserModel {
  final String userId;
  final String name;
  final String phone;
  final String email;
  final String nidOrDob;
  final String gender;
  final String? profileImageUrl;

  UserModel({
    required this.userId,
    required this.name,
    required this.phone,
    required this.email,
    required this.nidOrDob,
    required this.gender,
    this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      nidOrDob: json['nid_or_dob'] ?? '',
      gender: json['gender'] ?? 'Male',
      profileImageUrl: json['profile_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'phone': phone,
      'email': email,
      'nid_or_dob': nidOrDob,
      'gender': gender,
      'profile_image_url': profileImageUrl,
    };
  }
}
