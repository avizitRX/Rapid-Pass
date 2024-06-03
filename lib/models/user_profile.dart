class UserProfile {
  String cardNumber;
  String name;
  String cardStatus;

  UserProfile({
    required this.cardNumber,
    required this.name,
    required this.cardStatus,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      cardNumber: json['cardNumber'],
      name: json['name'],
      cardStatus: json['cardStatus'],
    );
  }

  get keyData => null;

  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'name': name,
      'cardStatus': cardStatus,
    };
  }
}
