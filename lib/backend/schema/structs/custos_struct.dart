// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustosStruct extends FFFirebaseStruct {
  CustosStruct({
    String? custosId,
    DateTime? data,
    double? custoMateriaPrima,
    double? custoDelivery,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _custosId = custosId,
        _data = data,
        _custoMateriaPrima = custoMateriaPrima,
        _custoDelivery = custoDelivery,
        super(firestoreUtilData);

  // "custosId" field.
  String? _custosId;
  String get custosId => _custosId ?? '';
  set custosId(String? val) => _custosId = val;
  bool hasCustosId() => _custosId != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;
  bool hasData() => _data != null;

  // "custoMateriaPrima" field.
  double? _custoMateriaPrima;
  double get custoMateriaPrima => _custoMateriaPrima ?? 0.0;
  set custoMateriaPrima(double? val) => _custoMateriaPrima = val;
  void incrementCustoMateriaPrima(double amount) =>
      _custoMateriaPrima = custoMateriaPrima + amount;
  bool hasCustoMateriaPrima() => _custoMateriaPrima != null;

  // "custoDelivery" field.
  double? _custoDelivery;
  double get custoDelivery => _custoDelivery ?? 0.0;
  set custoDelivery(double? val) => _custoDelivery = val;
  void incrementCustoDelivery(double amount) =>
      _custoDelivery = custoDelivery + amount;
  bool hasCustoDelivery() => _custoDelivery != null;

  static CustosStruct fromMap(Map<String, dynamic> data) => CustosStruct(
        custosId: data['custosId'] as String?,
        data: data['data'] as DateTime?,
        custoMateriaPrima: castToType<double>(data['custoMateriaPrima']),
        custoDelivery: castToType<double>(data['custoDelivery']),
      );

  static CustosStruct? maybeFromMap(dynamic data) =>
      data is Map ? CustosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'custosId': _custosId,
        'data': _data,
        'custoMateriaPrima': _custoMateriaPrima,
        'custoDelivery': _custoDelivery,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'custosId': serializeParam(
          _custosId,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'custoMateriaPrima': serializeParam(
          _custoMateriaPrima,
          ParamType.double,
        ),
        'custoDelivery': serializeParam(
          _custoDelivery,
          ParamType.double,
        ),
      }.withoutNulls;

  static CustosStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustosStruct(
        custosId: deserializeParam(
          data['custosId'],
          ParamType.String,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        custoMateriaPrima: deserializeParam(
          data['custoMateriaPrima'],
          ParamType.double,
          false,
        ),
        custoDelivery: deserializeParam(
          data['custoDelivery'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CustosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustosStruct &&
        custosId == other.custosId &&
        data == other.data &&
        custoMateriaPrima == other.custoMateriaPrima &&
        custoDelivery == other.custoDelivery;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([custosId, data, custoMateriaPrima, custoDelivery]);
}

CustosStruct createCustosStruct({
  String? custosId,
  DateTime? data,
  double? custoMateriaPrima,
  double? custoDelivery,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustosStruct(
      custosId: custosId,
      data: data,
      custoMateriaPrima: custoMateriaPrima,
      custoDelivery: custoDelivery,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustosStruct? updateCustosStruct(
  CustosStruct? custos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    custos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustosStructData(
  Map<String, dynamic> firestoreData,
  CustosStruct? custos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (custos == null) {
    return;
  }
  if (custos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && custos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final custosData = getCustosFirestoreData(custos, forFieldValue);
  final nestedData = custosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = custos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustosFirestoreData(
  CustosStruct? custos, [
  bool forFieldValue = false,
]) {
  if (custos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(custos.toMap());

  // Add any Firestore field values
  custos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustosListFirestoreData(
  List<CustosStruct>? custoss,
) =>
    custoss?.map((e) => getCustosFirestoreData(e, true)).toList() ?? [];
