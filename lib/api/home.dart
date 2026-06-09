import 'package:he_shop/Constants/Index.dart';
import 'package:he_shop/utils/DioRequest.dart';
import 'package:he_shop/viewmodels/home.dart';

Future<List<Banneritem>> getBannerListAPI() async {
  return ((await dioRequest.get(HTTPConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return Banneritem.fromJSON(item as Map<String, dynamic>);
  }).toList();
}
