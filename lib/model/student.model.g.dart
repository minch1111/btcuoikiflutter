// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$$_StudentFromJson(Map<String, dynamic> json) => _$_Student(
      id: json['Id'] as int,
      name: json['p0'] as String,
      birth: json['p1'] as String,
      phone: json['p2'] as String,
      mail: json['p3'] as String,
      address: json['p4'] as String,
      course: json['p5'] as String,
      gender: json['p6'] as String,
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birth': instance.birth,
      'phone': instance.phone,
      'mail': instance.mail,
      'address': instance.address,
      'gender': instance.gender,
      'course': instance.course,
    };
