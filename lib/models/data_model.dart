// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataModel {
  String name;
  String img;
  String description;
  String location;
  int price;
  int people;
  int stars;
  DataModel({
    required this.name,
    required this.img,
    required this.description,
    required this.location,
    required this.price,
    required this.people,
    required this.stars,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'img': img,
      'description': description,
      'location': location,
      'price': price,
      'people': people,
      'stars': stars,
    };
  }

  factory DataModel.fromJson(Map<String, dynamic> map) {
    return DataModel(
      name: map['name'] as String,
      img: map['img'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      price: map['price'] as int,
      people: map['people'] as int,
      stars: map['stars'] as int,
    );
  }
}
