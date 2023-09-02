import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Address();

  late String street;
  late String suite;
  late String city;
  late String zipcode;
  late Map<String,dynamic> geo;
  
  factory Address.fromJson(Map<String,dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
