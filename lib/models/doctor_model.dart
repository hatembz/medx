class Doctor {
  String name;
  String email;

  String areaOfExpertise;
  bool isFavorite;
  double rating;
  int reviews;
  String imagePath;
  int totalPatients;
  int yearsOfExperience;
  String workingDays;

  Doctor({
    required this.name,
    required this.email,
    required this.areaOfExpertise,
    required this.rating,
    required this.reviews,
    required this.isFavorite,
    required this.imagePath,
    required this.totalPatients,
    required this.workingDays,
    required this.yearsOfExperience,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      email: json['email'],
      areaOfExpertise: json['areaOfExpertise'],
      rating: json['rating'],
      reviews: json['reviews'],
      isFavorite: json['isFavorite'],
      imagePath: json['imagePth'],
      totalPatients: json['totalPatients'],
      workingDays: json['workingDays'],
      yearsOfExperience: json['yearsOfExperience'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'areaOfExpertise': areaOfExpertise,
      'rating': rating,
      'reviews': reviews,
      'isFavorite': isFavorite,
    };
  }

  Doctor copyWith({
    String? name,
    String? email,
    String? areaOfExpertise,
    bool? isFavorite,
    double? rating,
    int? reviews,
    String? imagePath,
    int? totalPatients,
    String? workingDays,
    int? yearsOfExperience,
  }) =>
      Doctor(
        email: email ?? this.email,
        name: name ?? this.name,
        areaOfExpertise: areaOfExpertise ?? this.areaOfExpertise,
        reviews: reviews ?? this.reviews,
        rating: rating ?? this.rating,
        imagePath: imagePath ?? this.imagePath,
        isFavorite: isFavorite ?? this.isFavorite,
        totalPatients: totalPatients ?? this.totalPatients,
        workingDays: workingDays ?? this.workingDays,
        yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      );
}
