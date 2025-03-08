class Articles {
  Source? source;
  String? description;
  String? urlToImage;
  String? publishedAt;

  Articles({
    this.source,
    this.description,
    this.urlToImage,
    this.publishedAt,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;

    description = json['description'];

    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }

    data['description'] = description;

    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;

    return data;
  }
}

class Source {
  String? name;

  Source({this.name});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    return data;
  }
}
