class UserParameters {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;

  UserParameters({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
  });
  factory UserParameters.fromJison(Map<String, dynamic> json) {
    return UserParameters(
      username: json['username'],
      firstName: json['username'],
      lastName: json['username'],
      email: json['username'],
      password: json['username'],
      phone: json['username'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}
