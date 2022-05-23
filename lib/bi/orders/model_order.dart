class Order{
  String idOrder; /// уникальный UUID
  String urlImage;
  String title;
  String miniDescription;
  String description;
  Order({
    required this.idOrder,
    required this.urlImage,
    required this.title,
    required this.miniDescription,
    required this.description,
  });
}