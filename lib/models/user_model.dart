class UserModel {
  String? id;
  String? email;
  List<String>? savedItems;

  UserModel({
    this.id,
    this.email,
    this.savedItems,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    savedItems = json["savedItems"] == null ? null : List<String>.from(json["savedItems"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['email'] = email;
    if(savedItems != null) {
      data["savedItems"] = savedItems;
    }
    return data;
  }
}
