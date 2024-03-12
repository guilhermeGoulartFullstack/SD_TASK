enum PeriodCategory {
  one(name: "Categoria 1"),
  two(name: "Categoria 2"),
  three(name: "Categoria 3"),
  four(name: "Categoria 4"),
  five(name: "Categoria 5");

  const PeriodCategory({required this.name});

  final String name;
}
