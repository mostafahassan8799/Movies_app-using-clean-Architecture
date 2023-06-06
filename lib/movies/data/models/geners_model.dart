import 'package:movie_app_clean_architecture/core/utils/geners.dart';

class GenersModel extends Geners {
  const GenersModel({required super.name, required super.id});
  factory GenersModel.fromJson(Map<String, dynamic> json) =>
      GenersModel(id: json["id"], name: json["name"]);
}
