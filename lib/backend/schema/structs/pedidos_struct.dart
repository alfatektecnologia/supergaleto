// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosStruct extends FFFirebaseStruct {
  PedidosStruct({
    int? nroPedido,
    SacolaStruct? sacola,
    String? userName,
    bool? isClosed,
    String? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nroPedido = nroPedido,
        _sacola = sacola,
        _userName = userName,
        _isClosed = isClosed,
        _data = data,
        super(firestoreUtilData);

  // "nroPedido" field.
  int? _nroPedido;
  int get nroPedido => _nroPedido ?? 0;
  set nroPedido(int? val) => _nroPedido = val;

  void incrementNroPedido(int amount) => nroPedido = nroPedido + amount;

  bool hasNroPedido() => _nroPedido != null;

  // "sacola" field.
  SacolaStruct? _sacola;
  SacolaStruct get sacola => _sacola ?? SacolaStruct();
  set sacola(SacolaStruct? val) => _sacola = val;

  void updateSacola(Function(SacolaStruct) updateFn) {
    updateFn(_sacola ??= SacolaStruct());
  }

  bool hasSacola() => _sacola != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "isClosed" field.
  bool? _isClosed;
  bool get isClosed => _isClosed ?? false;
  set isClosed(bool? val) => _isClosed = val;

  bool hasIsClosed() => _isClosed != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  static PedidosStruct fromMap(Map<String, dynamic> data) => PedidosStruct(
        nroPedido: castToType<int>(data['nroPedido']),
        sacola: SacolaStruct.maybeFromMap(data['sacola']),
        userName: data['userName'] as String?,
        isClosed: data['isClosed'] as bool?,
        data: data['data'] as String?,
      );

  static PedidosStruct? maybeFromMap(dynamic data) =>
      data is Map ? PedidosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nroPedido': _nroPedido,
        'sacola': _sacola?.toMap(),
        'userName': _userName,
        'isClosed': _isClosed,
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nroPedido': serializeParam(
          _nroPedido,
          ParamType.int,
        ),
        'sacola': serializeParam(
          _sacola,
          ParamType.DataStruct,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'isClosed': serializeParam(
          _isClosed,
          ParamType.bool,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
      }.withoutNulls;

  static PedidosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PedidosStruct(
        nroPedido: deserializeParam(
          data['nroPedido'],
          ParamType.int,
          false,
        ),
        sacola: deserializeStructParam(
          data['sacola'],
          ParamType.DataStruct,
          false,
          structBuilder: SacolaStruct.fromSerializableMap,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        isClosed: deserializeParam(
          data['isClosed'],
          ParamType.bool,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PedidosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PedidosStruct &&
        nroPedido == other.nroPedido &&
        sacola == other.sacola &&
        userName == other.userName &&
        isClosed == other.isClosed &&
        data == other.data;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nroPedido, sacola, userName, isClosed, data]);
}

PedidosStruct createPedidosStruct({
  int? nroPedido,
  SacolaStruct? sacola,
  String? userName,
  bool? isClosed,
  String? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PedidosStruct(
      nroPedido: nroPedido,
      sacola: sacola ?? (clearUnsetFields ? SacolaStruct() : null),
      userName: userName,
      isClosed: isClosed,
      data: data,
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

  // Handle nested data for "sacola" field.
  addSacolaStructData(
    firestoreData,
    pedidos.hasSacola() ? pedidos.sacola : null,
    'sacola',
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
