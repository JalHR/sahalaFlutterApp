class ExampleRequestModel {
  final String field1;
  final String field2;

  ExampleRequestModel({required this.field1, required this.field2});

  Map<String, dynamic> toJson() => {'field1': field1, 'field2': field2};
}
