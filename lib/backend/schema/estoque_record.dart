import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EstoqueRecord extends FirestoreRecord {
  EstoqueRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "produto_id" field.
  String? _produtoId;
  String get produtoId => _produtoId ?? '';
  bool hasProdutoId() => _produtoId != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "date_aquisition" field.
  DateTime? _dateAquisition;
  DateTime? get dateAquisition => _dateAquisition;
  bool hasDateAquisition() => _dateAquisition != null;

  // "observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  bool hasObservation() => _observation != null;

  void _initializeFields() {
    _produtoId = snapshotData['produto_id'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _dateAquisition = snapshotData['date_aquisition'] as DateTime?;
    _observation = snapshotData['observation'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('estoque');

  static Stream<EstoqueRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EstoqueRecord.fromSnapshot(s));

  static Future<EstoqueRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EstoqueRecord.fromSnapshot(s));

  static EstoqueRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EstoqueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EstoqueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EstoqueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EstoqueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EstoqueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEstoqueRecordData({
  String? produtoId,
  int? quantity,
  DateTime? dateAquisition,
  String? observation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'produto_id': produtoId,
      'quantity': quantity,
      'date_aquisition': dateAquisition,
      'observation': observation,
    }.withoutNulls,
  );

  return firestoreData;
}

class EstoqueRecordDocumentEquality implements Equality<EstoqueRecord> {
  const EstoqueRecordDocumentEquality();

  @override
  bool equals(EstoqueRecord? e1, EstoqueRecord? e2) {
    return e1?.produtoId == e2?.produtoId &&
        e1?.quantity == e2?.quantity &&
        e1?.dateAquisition == e2?.dateAquisition &&
        e1?.observation == e2?.observation;
  }

  @override
  int hash(EstoqueRecord? e) => const ListEquality()
      .hash([e?.produtoId, e?.quantity, e?.dateAquisition, e?.observation]);

  @override
  bool isValidKey(Object? o) => o is EstoqueRecord;
}
