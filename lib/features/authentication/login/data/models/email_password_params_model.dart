class EmailPasswordParams {
  final String email;
  final String password;

  EmailPasswordParams(this.email, this.password);

  EmailPasswordParams.fromJson(Map<String, String> json)
      : email = json['email'] ?? '',
        password = json['password'] ?? '';


  Map<String, String> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
