class Urls {
  static final String _baseUrl = 'https://nahid.info.bd/api/alwahada';
  static String get baseUrl => _baseUrl;
  static String signInWithGoogle = '$_baseUrl/signInwithgoogle';
  static String getPost = '$_baseUrl/getPost';
  static String createPost = '$_baseUrl/create_post';
  static String likeToggle = '$_baseUrl/liketoggle';
  static String postComment = '$_baseUrl/postcomment';
  static String postDetails = '$_baseUrl/postdetails';
  static String createSharePost = '$_baseUrl/create_share_post';
}