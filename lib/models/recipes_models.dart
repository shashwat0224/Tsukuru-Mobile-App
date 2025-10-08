class Recipe {
  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.directions,
    required this.imgname,
    required this.image,
  });

  final int id;
  final String title;
  final List<String> ingredients;
  final String directions;
  final String imgname;
  final String image;
}
