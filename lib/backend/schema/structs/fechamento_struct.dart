// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FechamentoStruct extends FFFirebaseStruct {
  FechamentoStruct({
    String? vendasId,
    List<PedidosStruct>? pedidos,
    DateTime? dataVendas,
    double? totalVendas,
    double? totalCustos,
    int? totalCupons,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vendasId = vendasId,
        _pedidos = pedidos,
        _dataVendas = dataVendas,
        _totalVendas = totalVendas,
        _totalCustos = totalCustos,
        _totalCupons = totalCupons,
        super(firestoreUtilData);

  // "vendasId" field.
  String? _vendasId;
  String get vendasId => _vendasId ?? '';
  set vendasId(String? val) => _vendasId = val;

  bool hasVendasId() => _vendasId != null;

  // "pedidos" field.
  List<PedidosStruct>? _pedidos;
  List<PedidosStruct> get pedidos => _pedidos ?? const [];
  set pedidos(List<PedidosStruct>? val) => _pedidos = val;

  void updatePedidos(Function(List<PedidosStruct>) updateFn) {
    updateFn(pedidos ??= []);
  }

  bool hasPedidos() => _pedidos != null;

  // "dataVendas" field.
  DateTime? _dataVendas;
  DateTime? get dataVendas => _dataVendas;
  set dataVendas(DateTime? val) => _dataVendas = val;

  bool hasDataVendas() => _dataVendas != null;

  // "totalVendas" field.
  double? _totalVendas;
  double get totalVendas => _totalVendas ?? 0.0;
  set totalVendas(double? val) => _totalVendas = val;

  void incrementTotalVendas(double amount) =>
      totalVendas = totalVendas + amount;

  bool hasTotalVendas() => _totalVendas != null;

  // "totalCustos" field.
  double? _totalCustos;
  double get totalCustos => _totalCustos ?? 0.0;
  set totalCustos(double? val) => _totalCustos = val;

  void incrementTotalCustos(double amount) =>
      totalCustos = totalCustos + amount;

  bool hasTotalCustos() => _totalCustos != null;

  // "totalCupons" field.
  int? _totalCupons;
  int get totalCupons => _totalCupons ?? 0;
  set totalCupons(int? val) => _totalCupons = val;

  void incrementTotalCupons(int amount) => totalCupons = totalCupons + amount;

  bool hasTotalCupons() => _totalCupons != null;

  static FechamentoStruct fromMap(Map<String, dynamic> data) =>
      FechamentoStruct(
        vendasId: data['vendasId'] as String?,
        pedidos: getStructList(
          data['pedidos'],
          PedidosStruct.fromMap,
        ),
        dataVendas: data['dataVendas'] as DateTime?,
        totalVendas: castToType<double>(data['totalVendas']),
        totalCustos: castToType<double>(data['totalCustos']),
        totalCupons: castToType<int>(data['totalCupons']),
      );

  static FechamentoStruct? maybeFromMap(dynamic data) => data is Map
      ? FechamentoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'vendasId': _vendasId,
        'pedidos': _pedidos?.map((e) => e.toMap()).toList(),
        'dataVendas': _dataVendas,
        'totalVendas': _totalVendas,
        'totalCustos': _totalCustos,
        'totalCupons': _totalCupons,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vendasId': serializeParam(
          _vendasId,
          ParamType.String,
        ),
        'pedidos': serializeParam(
          _pedidos,
          ParamType.DataStruct,
          isList: true,
        ),
        'dataVendas': serializeParam(
          _dataVendas,
          ParamType.DateTime,
        ),
        'totalVendas': serializeParam(
          _totalVendas,
          ParamType.double,
        ),
        'totalCustos': serializeParam(
          _totalCustos,
          ParamType.double,
        ),
        'totalCupons': serializeParam(
          _totalCupons,
          ParamType.int,
        ),
      }.withoutNulls;

  static FechamentoStruct fromSerializableMap(Map<String, dynamic> data) =>
      FechamentoStruct(
        vendasId: deserializeParam(
          data['vendasId'],
          ParamType.String,
          false,
        ),
        pedidos: deserializeStructParam<PedidosStruct>(
          data['pedidos'],
          ParamType.DataStruct,
          true,
          structBuilder: PedidosStruct.fromSerializableMap,
        ),
        dataVendas: deserializeParam(
          data['dataVendas'],
          ParamType.DateTime,
          false,
        ),
        totalVendas: deserializeParam(
          data['totalVendas'],
          ParamType.double,
          false,
        ),
        totalCustos: deserializeParam(
          data['totalCustos'],
          ParamType.double,
          false,
        ),
        totalCupons: deserializeParam(
          data['totalCupons'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FechamentoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FechamentoStruct &&
        vendasId == other.vendasId &&
        listEquality.equals(pedidos, other.pedidos) &&
        dataVendas == other.dataVendas &&
        totalVendas == other.totalVendas &&
        totalCustos == other.totalCustos &&
        totalCupons == other.totalCupons;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [vendasId, pedidos, dataVendas, totalVendas, totalCustos, totalCupons]);
}

FechamentoStruct createFechamentoStruct({
  String? vendasId,
  DateTime? dataVendas,
  double? totalVendas,
  double? totalCustos,
  int? totalCupons,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FechamentoStruct(
      vendasId: vendasId,
      dataVendas: dataVendas,
      totalVendas: totalVendas,
      totalCustos: totalCustos,
      totalCupons: totalCupons,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FechamentoStruct? updateFechamentoStruct(
  FechamentoStruct? fechamento, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fechamento
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFechamentoStructData(
  Map<String, dynamic> firestoreData,
  FechamentoStruct? fechamento,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fechamento == null) {
    return;
  }
  if (fechamento.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fechamento.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fechamentoData = getFechamentoFirestoreData(fechamento, forFieldValue);
  final nestedData = fechamentoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fechamento.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFechamentoFirestoreData(
  FechamentoStruct? fechamento, [
  bool forFieldValue = false,
]) {
  if (fechamento == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fechamento.toMap());

  // Add any Firestore field values
  fechamento.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFechamentoListFirestoreData(
  List<FechamentoStruct>? fechamentos,
) =>
    fechamentos?.map((e) => getFechamentoFirestoreData(e, true)).toList() ?? [];
