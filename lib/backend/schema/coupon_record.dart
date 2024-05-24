import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponRecord extends FirestoreRecord {
  CouponRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "qty" field.
  int? _qty;
  int get qty => _qty ?? 0;
  bool hasQty() => _qty != null;

  // "dateInput" field.
  DateTime? _dateInput;
  DateTime? get dateInput => _dateInput;
  bool hasDateInput() => _dateInput != null;

  // "dateOutput" field.
  DateTime? _dateOutput;
  DateTime? get dateOutput => _dateOutput;
  bool hasDateOutput() => _dateOutput != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _qty = castToType<int>(snapshotData['qty']);
    _dateInput = snapshotData['dateInput'] as DateTime?;
    _dateOutput = snapshotData['dateOutput'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coupon');

  static Stream<CouponRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouponRecord.fromSnapshot(s));

  static Future<CouponRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouponRecord.fromSnapshot(s));

  static CouponRecord fromSnapshot(DocumentSnapshot snapshot) => CouponRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouponRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouponRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouponRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouponRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouponRecordData({
  String? userId,
  int? qty,
  DateTime? dateInput,
  DateTime? dateOutput,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'qty': qty,
      'dateInput': dateInput,
      'dateOutput': dateOutput,
    }.withoutNulls,
  );

  return firestoreData;
}

class CouponRecordDocumentEquality implements Equality<CouponRecord> {
  const CouponRecordDocumentEquality();

  @override
  bool equals(CouponRecord? e1, CouponRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.qty == e2?.qty &&
        e1?.dateInput == e2?.dateInput &&
        e1?.dateOutput == e2?.dateOutput;
  }

  @override
  int hash(CouponRecord? e) => const ListEquality()
      .hash([e?.userId, e?.qty, e?.dateInput, e?.dateOutput]);

  @override
  bool isValidKey(Object? o) => o is CouponRecord;
}
