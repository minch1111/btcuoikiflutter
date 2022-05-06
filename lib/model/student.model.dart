import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'student.model.freezed.dart';
part 'student.model.g.dart';

@freezed
class Student with _$Student {
  const factory Student({
    required int id,
    required String name,
    required String birth,
    required String phone,
    required String mail,
    required String address,
    required String gender,
    required String course
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json)
    => _$StudentFromJson(json);
}
