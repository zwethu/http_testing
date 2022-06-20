class ApiResponses {
  int postId;
  int id;
  String name;
  String email;
  String body;

  ApiResponses({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
  factory ApiResponses.fromJson(Map<String, dynamic> json) {
    return ApiResponses(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}

class ResponsesLists{
  final List<ApiResponses> posts;
  ResponsesLists({required this.posts});

  factory ResponsesLists.fromJson(List<dynamic> jsonData){
    List<ApiResponses> post;
    post = jsonData.map((i)=> ApiResponses.fromJson(i)).toList();
    return ResponsesLists(posts: post);
  }
}
