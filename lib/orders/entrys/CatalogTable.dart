class CatalogTable {
  String name;

  int order;

  String catalogId;

  bool select = false;

  CatalogTable(String name) {
    this.name = name;
  }


  CatalogTable.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        order = json['order'],
        catalogId = json['catalogId'];
}
