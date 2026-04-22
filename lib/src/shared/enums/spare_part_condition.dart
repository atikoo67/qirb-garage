/// Spare part condition
enum SparePartCondition {
  newPart('NEW'),
  used('USED');

  const SparePartCondition(this.value);

  final String value;

  static SparePartCondition fromString(String value) {
    return SparePartCondition.values.firstWhere(
      (condition) => condition.value == value,
      orElse: () => SparePartCondition.newPart,
    );
  }
}
