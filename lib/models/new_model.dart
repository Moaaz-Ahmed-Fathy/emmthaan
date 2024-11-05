class newmodel {
  List<Map> articless;
  String status;


  newmodel({
    required this.articless,
    required this.status,

});

  factory newmodel.fromJson(Map<String, dynamic> json) {
    return newmodel(articless: json["articles"] , status: json["status"]);
  }
}


