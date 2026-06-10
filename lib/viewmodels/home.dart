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

class ProductList {
  String id;
  String title;
  List<ProductSubType> subTypes;

  ProductList({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory ProductList.fromJSON(Map<String, dynamic> json) {
    return ProductList(
      id: json["id"]?.toString() ?? "",
      title: json["title"]?.toString() ?? "",
      subTypes: (json["subTypes"] as List? ?? [])
          .map(
            (item) =>
                ProductSubType.fromJSON(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class ProductSubType {
  String id;
  String title;
  GoodsItems goodsItems;

  ProductSubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory ProductSubType.fromJSON(Map<String, dynamic> json) {
    return ProductSubType(
      id: json["id"]?.toString() ?? "",
      title: json["title"]?.toString() ?? "",
      goodsItems: GoodsItems.fromJSON(
        json["goodsItems"] as Map<String, dynamic>? ?? {},
      ),
    );
  }
}

class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJSON(Map<String, dynamic> json) {
    return GoodsItems(
      counts: _parseInt(json["counts"]),
      pageSize: _parseInt(json["pageSize"]),
      pages: _parseInt(json["pages"]),
      page: _parseInt(json["page"]),
      items: (json["items"] as List? ?? [])
          .map((item) => GoodsItem.fromJSON(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJSON(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      desc: json["desc"]?.toString(),
      price: json["price"]?.toString() ?? "0.00",
      picture: json["picture"]?.toString() ?? "",
      orderNum: _parseInt(json["orderNum"]),
    );
  }
}

int _parseInt(dynamic value) {
  if (value is int) {
    return value;
  }
  return int.tryParse(value?.toString() ?? "") ?? 0;
}
