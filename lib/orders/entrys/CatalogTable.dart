import 'package:data_plugin/bmob/table/bmob_object.dart';

class CatalogTable extends BmobObject {
  String name;

  int order;

  String catalogId;

  bool select = false;

  @override
  Map getParams() {
    // TODO: implement getParams
    return null;
  }

  CatalogTable.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        order = json['order'],
        catalogId = json['catalogId'];
}
