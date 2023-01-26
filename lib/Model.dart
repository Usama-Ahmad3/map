class Model {
  int? page;
  int? pages;
  String? perPage;
  int? total;
  Model({
    this.page,
    this.pages,
    this.perPage,
    this.total,
  });

  Model.fromJson(dynamic json) {
    page = json['page'];
    pages = json['pages'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['pages'] = pages;
    map['per_page'] = perPage;
    map['total'] = total;
    return map;
  }
}
