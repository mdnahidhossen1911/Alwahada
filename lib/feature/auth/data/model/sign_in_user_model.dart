class SignInUserModel {
  String? id;
  String? uid;
  String? fullName;
  String? highImage;
  String? midImage;
  String? bio;
  String? createdAt;
  String? work;
  String? study;
  String? address;
  String? gmail;

  SignInUserModel(
      {this.id,
        this.uid,
        this.fullName,
        this.highImage,
        this.midImage,
        this.bio,
        this.createdAt,
        this.work,
        this.study,
        this.address,
        this.gmail});

  SignInUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    fullName = json['full_name'];
    highImage = json['high_image'];
    midImage = json['mid_image'];
    bio = json['bio'];
    createdAt = json['created_at'];
    work = json['work'];
    study = json['study'];
    address = json['address'];
    gmail = json['gmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['full_name'] = this.fullName;
    data['high_image'] = this.highImage;
    data['mid_image'] = this.midImage;
    data['bio'] = this.bio;
    data['created_at'] = this.createdAt;
    data['work'] = this.work;
    data['study'] = this.study;
    data['address'] = this.address;
    data['gmail'] = this.gmail;
    return data;
  }
}