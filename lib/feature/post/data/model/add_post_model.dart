class AddPostModel {
  String title;
  String content;
  String? imageBase64;

  AddPostModel({required this.title, required this.content, this.imageBase64});

  Map<String, dynamic> tojson() {
    if (imageBase64 == null) {
      return {'title': title, 'content': content};
    } else {
      return {'title': title, 'content': content, 'image': imageBase64};
    }
  }
}
