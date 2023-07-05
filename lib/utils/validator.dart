

mixin InputValidationMixin {
  String? emptyValidation(String? value) {
    if (value!.isEmpty) {
      return "required field";
    } else {
      return null;
    }
  }
}
