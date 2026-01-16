import 'dart:convert';

class Todo {
  final String title;
  final String description;
  final String id;

  Todo({required this.title, required this.description, required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  Todo copyWith({
    String? title,
    String? description,
    String? id,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }
}
