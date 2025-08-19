import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  List<String> tags; // NEW FIELD

  Note({
    required this.title,
    required this.description,
    required this.createdAt,
    this.tags = const [], // default empty list
  });
}
