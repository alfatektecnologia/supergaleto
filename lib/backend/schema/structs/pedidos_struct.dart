// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosStruct extends FFFirebaseStruct {
  PedidosStruct({
    String? pedidoId,
    String? userId,
    String? sacolaId,
    SacolaStruct? produtos,
    String? dataCompra,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pedidoId = pedidoId,
        _userId = userId,
        _sacolaId = sacolaId,
        _produtos = produtos,
        _dataCompra = dataCompra,
        super(firestoreUtilData);

  // "pedidoId" field.
  String? _pedidoId;
  String get pedidoId => _pedidoId ?? '';
  set pedidoId(String? val) => _pedidoId = val;
  bool hasPedidoId() => _pedidoId != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "sacolaId" field.
  String? _sacolaId;
  String get sacolaId => _sacolaId ?? '';
  set sacolaId(String? val) => _sacolaId = val;
  bool hasSacolaId() => _sacolaId != null;

  // "produtos" field.
  SacolaStruct? _produtos;
  SacolaStruct get produtos => _produtos ?? SacolaStruct();
  set produtos(SacolaStruct? val) => _produtos = val;
  void updateProdutos(Function(SacolaStruct) updateFn) =>
      updateFn(_produtos ??= SacolaStruct());
  bool hasProdutos() => _produtos != null;

  // "dataCompra" field.
  String? _dataCompra;
  String get dataCompra => _dataCompra ?? '';
  set dataCompra(String? val) => _dataCompra = val;
  bool hasDataCompra() => _dataCompra != null;

  static PedidosStruct fromMap(Map<String, dynamic> data) => PedidosStruct(
        pedidoId: data['pedidoId'] as String?,
        userId: data['userId'] as String?,
        sacolaId: data['sacolaId'] as String?,
        produtos: SacolaStruct.maybeFromMap(data['produtos']),
        dataCompra: data['dataCompra'] as String?,
      );

  static PedidosStruct? maybeFromMap(dynamic data) =>
      data is Map ? PedidosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pedidoId': _pedidoId,
        'userId': _userId,
        'sacolaId': _sacolaId,
        'produtos': _produtos?.toMap(),
        'dataCompra': _dataCompra,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pedidoId': serializeParam(
          _pedidoId,
          ParamType.String,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'sacolaId': serializeParam(
          _sacolaId,
          ParamType.String,
        ),
        'produtos': serializeParam(
          _produtos,
          ParamType.DataStruct,
        ),
        'dataCompra': serializeParam(
          _dataCompra,
          ParamType.String,
        ),
      }.withoutNulls;

  static PedidosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PedidosStruct(
        pedidoId: deserializeParam(
          data['pedidoId'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        sacolaId: deserializeParam(
          data['sacolaId'],
          ParamType.String,
          false,
        ),
        produtos: deserializeStructParam(
          data['produtos'],
          ParamType.DataStruct,
          false,
          structBuilder: SacolaStruct.fromSerializableMap,
        ),
        dataCompra: deserializeParam(
          data['dataCompra'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PedidosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PedidosStruct &&
        pedidoId == other.pedidoId &&
        userId == other.userId &&
        sacolaId == other.sacolaId &&
        produtos == other.produtos &&
        dataCompra == other.dataCompra;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([pedidoId, userId, sacolaId, produtos, dataCompra]);
}

PedidosStruct createPedidosStruct({
  String? pedidoId,
  String? userId,
  String? sacolaId,
  SacolaStruct? produtos,
  String? dataCompra,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PedidosStruct(
      pedidoId: pedidoId,
      userId: userId,
      sacolaId: sacolaId,
      produtos: produtos ?? (clearUnsetFields ? SacolaStruct() : null),
      dataCompra: dataCompra,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PedidosStruct? updatePedidosStruct(
  PedidosStruct? pedidos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pedidos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPedidosStructData(
  Map<String, dynamic> firestoreData,
  PedidosStruct? pedidos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pedidos == null) {
    return;
  }
  if (pedidos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pedidos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pedidosData = getPedidosFirestoreData(pedidos, forFieldValue);
  final nestedData = pedidosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pedidos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPedidosFirestoreData(
  PedidosStruct? pedidos, [
  bool forFieldValue = false,
]) {
  if (pedidos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pedidos.toMap());

  // Handle nested data for "produtos" field.
  addSacolaStructData(
    firestoreData,
    pedidos.hasProdutos() ? pedidos.produtos : null,
    'produtos',
    forFieldValue,
  );

  // Add any Firestore field values
  pedidos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPedidosListFirestoreData(
  List<PedidosStruct>? pedidoss,
) =>
    pedidoss?.map((e) => getPedidosFirestoreData(e, true)).toList() ?? [];
