import 'dart:convert';

List<UserModels> userModelsFromJson(String str) =>
    List<UserModels>.from(json.decode(str).map((x) => UserModels.fromJson(x)));

String userModelsToJson(List<UserModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModels {
  int idUsers;
  String nom;
  String prenom;
  String adresse;
  String mail;

  UserModels({
    required this.idUsers,
    required this.nom,
    required this.prenom,
    required this.adresse,
    required this.mail
  });
// `toJson` converts a UserModels object to a JSON representation.
// `fromJson` creates a UserModels object from a JSON map.

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
    idUsers: json["id"],
    nom: json["name"],
    prenom: json["surname"],
    adresse: json["adresse"],
    mail: json["mail"]
  );

  Map<String, dynamic> toJson() => {
    "id": idUsers,
    "name": nom,
    "surname": prenom,
    "adresse": adresse,
    "mail": mail
  };
}