import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChurrasqueiraRecord extends FirestoreRecord {
  ChurrasqueiraRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "prateleira" field.
  List<ItemAssandoStruct>? _prateleira;
  List<ItemAssandoStruct> get prateleira => _prateleira ?? const [];
  bool hasPrateleira() => _prateleira != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  bool hasData() => _data != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _prateleira = getStructList(
      snapshotData['prateleira'],
      ItemAssandoStruct.fromMap,
    );
    _data = snapshotData['data'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('churrasqueira');

  static Stream<ChurrasqueiraRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChurrasqueiraRecord.fromSnapshot(s));

  static Future<ChurrasqueiraRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChurrasqueiraRecord.fromSnapshot(s));

  static ChurrasqueiraRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChurrasqueiraRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChurrasqueiraRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChurrasqueiraRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChurrasqueiraRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChurrasqueiraRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChurrasqueiraRecordData({
  String? userId,
  String? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChurrasqueiraRecordDocumentEquality
    implements Equality<ChurrasqueiraRecord> {
  const ChurrasqueiraRecordDocumentEquality();

  @override
  bool equals(ChurrasqueiraRecord? e1, ChurrasqueiraRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userId == e2?.userId &&
        listEquality.equals(e1?.prateleira, e2?.prateleira) &&
        e1?.data == e2?.data;
  }

  @override
  int hash(ChurrasqueiraRecord? e) =>
      const ListEquality().hash([e?.userId, e?.prateleira, e?.data]);

  @override
  bool isValidKey(Object? o) => o is ChurrasqueiraRecord;
}
