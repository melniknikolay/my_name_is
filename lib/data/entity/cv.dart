class Cv {
  String? pdfLink;

  Cv({this.pdfLink});

  Cv.fromJson(Map<String, dynamic> json) {
    pdfLink = json['pdf_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pdf_link'] = pdfLink;
    return data;
  }
}