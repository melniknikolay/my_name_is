class Portfolio {
  String? link;
  String? overview;
  String? pictures;

  Portfolio({this.link, this.overview, this.pictures});

  Portfolio.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    overview = json['overview'];
    pictures = json['pictures'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['overview'] = overview;
    data['pictures'] = pictures;
    return data;
  }
}