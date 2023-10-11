class ResultModel {
  String result;
  bool isClick = false;
  ResultModel({required this.result});

  Map<String, dynamic> toMap() {
    return {"result": result};
  }

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(result: json["result"] as String);
  }
}
