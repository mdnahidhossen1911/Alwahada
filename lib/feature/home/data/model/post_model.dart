class PostModel {
  bool? status;
  List<Posts>? posts;

  PostModel({this.status, this.posts});

  PostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? pid;
  String? uid;
  String? title;
  String? content;
  String? image;
  String? isShare;
  String? sharePid;
  String? createdAt;
  String? username;
  String? fullName;
  String? highImage;
  int? totalLikes;
  int? totalComments;
  int? totalShares;
  bool? isLiked;

  Posts(
      {this.pid,
        this.uid,
        this.title,
        this.content,
        this.image,
        this.isShare,
        this.sharePid,
        this.createdAt,
        this.username,
        this.fullName,
        this.highImage,
        this.totalLikes,
        this.totalComments,
        this.totalShares,
        this.isLiked});

  Posts.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    uid = json['uid'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    isShare = json['is_share'];
    sharePid = json['share_pid'];
    createdAt = json['created_at'];
    username = json['username'];
    fullName = json['full_name'];
    highImage = json['high_image'];
    totalLikes = json['total_likes'];
    totalComments = json['total_comments'];
    totalShares = json['total_shares'];
    isLiked = json['isLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['uid'] = this.uid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['is_share'] = this.isShare;
    data['share_pid'] = this.sharePid;
    data['created_at'] = this.createdAt;
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    data['high_image'] = this.highImage;
    data['total_likes'] = this.totalLikes;
    data['total_comments'] = this.totalComments;
    data['total_shares'] = this.totalShares;
    data['isLiked'] = this.isLiked;
    return data;
  }
}
