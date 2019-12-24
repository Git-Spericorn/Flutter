import 'dart:convert';

//Creating an instance of HomeNewsModel from the given JSON.
HomeNewsModel homeNewsModelFromJson(String str) => HomeNewsModel.fromJson(json.decode(str));

//Creating a string of the 
String homeNewsModelToJson(HomeNewsModel data) => json.encode(data.toJson());

//Creating a function to return Articles as a list.
List<Article> getArticleDetailsList(String stringData){

  final jsonData = json.decode(stringData);
  return new List<Article>.from(jsonData["articles"].map((x) => Article.fromJson(x)));
}

class HomeNewsModel {

  //Declaring variables for showing status, total results and list for articles.
  String status;
  int totalResults;
  List<Article> articles;

  //Primary constructor
  HomeNewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  //Factory method that maps data from JSON against the given variables.
  factory HomeNewsModel.fromJson(Map<String, dynamic> json) => new HomeNewsModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: new List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  //Map function for dynamically maps JSON data to variables to use within the Factory.
  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": new List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

//Article class for holding article related data.
class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  //Primary Constructor.
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  //Factory method that maps data from JSON against the given variables.
  factory Article.fromJson(Map<String, dynamic> json) => new Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  //Map function for dynamically maps JSON data to variables to use within the Factory.
  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

//Source class for holding name & id.
class Source {
  dynamic id;
  String name;

  Source({
    this.id,
    this.name,
  });

  //Factory method that maps data from JSON against the given variables.
  factory Source.fromJson(Map<String, dynamic> json) => new Source(
    id: json["id"],
    name: json["name"],
  );

  //Map function for dynamically maps JSON data to variables to use within the Factory.
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
