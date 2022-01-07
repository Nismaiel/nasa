class Images {
  String? date;
  String? explanation;
  String? title;
  String? url;

  Images(
      {
        this.date,
        this.explanation,
        this.title,
        this.url});

  Images.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    explanation = json['explanation'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['explanation'] = this.explanation;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
