class Registered {
  int? status;
  Payload? payload;
  String? token;

  Registered({this.status, this.payload, this.token});

  Registered.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Payload {
  String? email;
  String? phone;
  String? password;
  String? profile;

  Payload({this.email, this.phone, this.password, this.profile});

  Payload.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['profile'] = this.profile;
    return data;
  }
}
