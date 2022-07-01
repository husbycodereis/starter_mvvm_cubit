abstract class BaseModel<T> {
  int? localId;

  BaseModel({this.localId});

  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
