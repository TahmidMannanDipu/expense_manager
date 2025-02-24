class ExpenseCategory {
  final String id;
  final String name;
  final bool isDafault;

  ExpenseCategory({
    required this.id,
    required this.name,
    this.isDafault = false,
  });
}
