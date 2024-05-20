// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidoStruct extends FFFirebaseStruct {
  PedidoStruct({
    String? pedidoId,
    List<ProdutoStruct>? produtos,
    DateTime? dataCompra,
    String? userId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pedidoId = pedidoId,
        _produtos = produtos,
        _dataCompra = dataCompra,
        _userId = userId,
        super(firestoreUtilData);

  // "pedidoId" field.
  String? _pedidoId;
  String get pedidoId => _pedidoId ?? '';
  set pedidoId(String? val) => _pedidoId = val;
  bool hasPedidoId() => _pedidoId != null;

  // "produtos" field.
  List<ProdutoStruct>? _produtos;
  List<ProdutoStruct> get produtos => _produtos ?? const [];
  set produtos(List<ProdutoStruct>? val) => _produtos = val;
  void updateProdutos(Function(List<ProdutoStruct>) updateFn) =>
      updateFn(_produtos ??= []);
  bool hasProdutos() => _produtos != null;

  // "dataCompra" field.
  DateTime? _dataCompra;
  DateTime? get dataCompra => _dataCompra;
  set dataCompra(DateTime? val) => _dataCompra = val;
  bool hasDataCompra() => _dataCompra != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  static PedidoStruct fromMap(Map<String, dynamic> data) => PedidoStruct(
        pedidoId: data['pedidoId'] as String?,
        produtos: getStructList(
          data['produtos'],
          ProdutoStruct.fromMap,
        ),
        dataCompra: data['dataCompra'] as DateTime?,
        userId: data['userId'] as String?,
      );

  static PedidoStruct? maybeFromMap(dynamic data) =>
      data is Map ? PedidoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pedidoId': _pedidoId,
        'produtos': _produtos?.map((e) => e.toMap()).toList(),
        'dataCompra': _dataCompra,
        'userId': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pedidoId': serializeParam(
          _pedidoId,
          ParamType.String,
        ),
        'produtos': serializeParam(
          _produtos,
          ParamType.DataStruct,
          true,
        ),
        'dataCompra': serializeParam(
          _dataCompra,
          ParamType.DateTime,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
      }.withoutNulls;

  static PedidoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PedidoStruct(
        pedidoId: deserializeParam(
          data['pedidoId'],
          ParamType.String,
          false,
        ),
        produtos: deserializeStructParam<ProdutoStruct>(
          data['produtos'],
          ParamType.DataStruct,
          true,
          structBuilder: ProdutoStruct.fromSerializableMap,
        ),
        dataCompra: deserializeParam(
          data['dataCompra'],
          ParamType.DateTime,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PedidoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PedidoStruct &&
        pedidoId == other.pedidoId &&
        listEquality.equals(produtos, other.produtos) &&
        dataCompra == other.dataCompra &&
        userId == other.userId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([pedidoId, produtos, dataCompra, userId]);
}

PedidoStruct createPedidoStruct({
  String? pedidoId,
  DateTime? dataCompra,
  String? userId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PedidoStruct(
      pedidoId: pedidoId,
      dataCompra: dataCompra,
      userId: userId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PedidoStruct? updatePedidoStruct(
  PedidoStruct? pedido, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pedido
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPedidoStructData(
  Map<String, dynamic> firestoreData,
  PedidoStruct? pedido,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pedido == null) {
    return;
  }
  if (pedido.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pedido.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pedidoData = getPedidoFirestoreData(pedido, forFieldValue);
  final nestedData = pedidoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pedido.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPedidoFirestoreData(
  PedidoStruct? pedido, [
  bool forFieldValue = false,
]) {
  if (pedido == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pedido.toMap());

  // Add any Firestore field values
  pedido.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPedidoListFirestoreData(
  List<PedidoStruct>? pedidos,
) =>
    pedidos?.map((e) => getPedidoFirestoreData(e, true)).toList() ?? [];
