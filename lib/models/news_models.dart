// To parse this JSON data, do
//
//     final newsRenponse = newsRenponseFromMap(jsonString);

import 'dart:convert';

class NewsRenponse {
    NewsRenponse({
      required this.status,
      required this.totalResults,
      required this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory NewsRenponse.fromJson(String str) => NewsRenponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NewsRenponse.fromMap(Map<String, dynamic> json) => NewsRenponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
    };
}

class Article {
    Article({
      required this.source,
      this.author,
      required this.title,
      required this.description,
      required this.url,
      this.urlToImage,
      required this.publishedAt,
        this.content,
    });

    Source source;
    String? author;
    String title;
    String? description;
    String url;
    String? urlToImage;
    DateTime publishedAt;
    String? content;

    factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Article.fromMap(Map<String, dynamic> json) => Article(
        source: Source.fromMap(json["source"]),
        author: json["author"] == null ? null : json["autor"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
    );

    Map<String, dynamic> toMap() => {
        "source": source.toMap(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content == null ? null : content,
    };
}

class Source {
    Source({
      this.id,
      required this.name,
    });

    String? id;
    String name;

    factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Source.fromMap(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name,
    };
}
