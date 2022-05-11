import 'package:cloud_firestore/cloud_firestore.dart';

class License {
  final String name;
  final String contents;
  final String term;
  final bool like;
  final String location;
  final DocumentReference reference;

  License.fromMap(Map<String, dynamic> map, {required this.reference})
      : name = map['name'],
        contents = map['contents'],
        term = map['term'],
        like = map['like'],
        location = map['poster'];

  License.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "License<$name:$contents>";
}
