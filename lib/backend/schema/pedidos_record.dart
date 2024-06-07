import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosRecord extends FirestoreRecord {
  PedidosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nroPedido" field.
  int? _nroPedido;
  int get nroPedido => _nroPedido ?? 0;
  bool hasNroPedido() => _nroPedido != null;

  // "sacola" field.
  SacolaStruct? _sacola;
  SacolaStruct get sacola => _sacola ?? SacolaStruct();
  bool hasSacola() => _sacola != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "isClosed" field.
  bool? _isClosed;
  bool get isClosed => _isClosed ?? false;
  bool hasIsClosed() => _isClosed != null;

  void _initializeFields() {
    _nroPedido = castToType<int>(snapshotData['nroPedido']);
    _sacola = SacolaStruct.maybeFromMap(snapshotData['sacola']);
    _data = snapshotData['data'] as DateTime?;
    _userName = snapshotData['userName'] as String?;
    _isClosed = snapshotData['isClosed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pedidos');

  static Stream<PedidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosRecord.fromSnapshot(s));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidosRecord.fromSnapshot(s));

  static PedidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosRecordData({
  int? nroPedido,
  SacolaStruct? sacola,
  DateTime? data,
  String? userName,
  bool? isClosed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nroPedido': nroPedido,
      'sacola': SacolaStruct().toMap(),
      'data': data,
      'userName': userName,
      'isClosed': isClosed,
    }.withoutNulls,
  );

  // Handle nested data for "sacola" field.
  addSacolaStructData(firestoreData, sacola, 'sacola');

  return firestoreData;
}

class PedidosRecordDocumentEquality implements Equality<PedidosRecord> {
  const PedidosRecordDocumentEquality();

  @override
  bool equals(PedidosRecord? e1, PedidosRecord? e2) {
    return e1?.nroPedido == e2?.nroPedido &&
        e1?.sacola == e2?.sacola &&
        e1?.data == e2?.data &&
        e1?.userName == e2?.userName &&
        e1?.isClosed == e2?.isClosed;
  }

  @override
  int hash(PedidosRecord? e) => const ListEquality()
      .hash([e?.nroPedido, e?.sacola, e?.data, e?.userName, e?.isClosed]);

  @override
  bool isValidKey(Object? o) => o is PedidosRecord;
}
