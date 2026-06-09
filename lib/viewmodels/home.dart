
class Banneritem{
  String id;
  String imgURL;

  Banneritem({required this.id,required this.imgURL});

  factory Banneritem.fromJSON(Map<String,dynamic> json){
    return Banneritem(id: json["id"], imgURL: json["imgUrl"]);
  }
}