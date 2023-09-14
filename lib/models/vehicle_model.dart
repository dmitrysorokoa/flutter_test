class VehicleModel {
  List<String> images;
  String title;
  List<String> tags;
  String description;
  int score;
  String price;
  String status;

  VehicleModel(
      {required this.images,
      required this.status,
      required this.price,
      required this.score,
      required this.title,
      required this.tags,
      required this.description});
}