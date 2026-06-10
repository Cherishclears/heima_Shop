class Banneritem {
  String id;
  String imgURL;

  Banneritem({required this.id, required this.imgURL});

  factory Banneritem.fromJSON(Map<String, dynamic> json) {
    return Banneritem(id: json["id"], imgURL: json["imgUrl"]);
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJSON(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] == null
          ? null
          : (json["children"] as List)
                .map(
                  (item) => CategoryItem.fromJSON(item as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}
