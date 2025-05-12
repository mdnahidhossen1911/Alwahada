class PostModel {
  bool? status;
  int? page;
  int? limit;
  int? totalPosts;
  int? totalPages;
  int? nextPage;
  List<Posts>? posts;

  PostModel(
      {this.status,
        this.page,
        this.limit,
        this.totalPosts,
        this.totalPages,
        this.nextPage,
        this.posts});

  PostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    page = json['page'];
    limit = json['limit'];
    totalPosts = json['total_posts'];
    totalPages = json['total_pages'];
    nextPage = json['next_page'];
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
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['total_posts'] = this.totalPosts;
    data['total_pages'] = this.totalPages;
    data['next_page'] = this.nextPage;
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
  bool? isShare;
  String? sharePid;
  String? createdAt;
  String? username;
  String? fullName;
  String? highImage;
  int? totalLikes;
  int? totalComments;
  int? totalShares;
  bool? isLiked;
  ShareInfo? shareInfo;

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
        this.isLiked,
        this.shareInfo});

  Posts.fromJson(Map<String, dynamic> json) {
    pid = json['pid'] is String ? int.tryParse(json['pid']) : json['pid'];
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
    shareInfo = json['share_info'] != null
        ? new ShareInfo.fromJson(json['share_info'])
        : null;
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
    if (this.shareInfo != null) {
      data['share_info'] = this.shareInfo!.toJson();
    }
    return data;
  }

  updateLikeCount(bool liked) {
    if (liked) {
      isLiked = true;
      totalLikes = (totalLikes ?? 0) + 1;
    } else {
      isLiked = false;
      totalLikes = (totalLikes ?? 0) - 1;
    }
  }


  updateCommentCunt(){
    totalComments = (totalComments ?? 0) + 1 ;
  }
}
class ShareInfo {
  int? pid;
  String? fullName;
  String? highImage;
  String? title;
  String? content;
  String? image;
  String? createdAt;

  ShareInfo(
      {this.pid,
        this.fullName,
        this.highImage,
        this.title,
        this.content,
        this.image,
        this.createdAt});

  ShareInfo.fromJson(Map<String, dynamic> json) {
    pid = json['pid'] is String ? int.tryParse(json['pid']) : json['pid'];
    fullName = json['full_name'];
    highImage = json['high_image'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['full_name'] = this.fullName;
    data['high_image'] = this.highImage;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}