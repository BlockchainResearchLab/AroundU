class Login {
  String? token;
  String? profile;
  String? email;

  Login({this.token, this.profile, this.email});

  Login.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    profile = json['profile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['profile'] = this.profile;
    data['email'] = this.email;
    return data;
  }
}
