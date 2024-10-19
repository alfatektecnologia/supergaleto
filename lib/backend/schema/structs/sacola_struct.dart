// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SacolaStruct extends FFFirebaseStruct {
  SacolaStruct({
    String? userId,
    List<ItemDaSacolaStruct>? items,
    double? total,
    String? dataCreated,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _items = items,
        _total = total,
        _dataCreated = dataCreated,
        super(firestoreUtilData);

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "items" field.
  List<ItemDaSacolaStruct>? _items;
  List<ItemDaSacolaStruct> get items => _items ?? const [];
  set items(List<ItemDaSacolaStruct>? val) => _items = val;

  void updateItems(Function(List<ItemDaSacolaStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  // "Total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "dataCreated" field.
  String? _dataCreated;
  String get dataCreated => _dataCreated ?? '';
  set dataCreated(String? val) => _dataCreated = val;

  bool hasDataCreated() => _dataCreated != null;

  static SacolaStruct fromMap(Map<String, dynamic> data) => SacolaStruct(
        userId: data['userId'] as String?,
        items: getStructList(
          data['items'],
          ItemDaSacolaStruct.fromMap,
        ),
        total: castToType<double>(data['Total']),
        dataCreated: data['dataCreated'] as String?,
      );

  static SacolaStruct? maybeFromMap(dynamic data) =>
      data is Map ? SacolaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'items': _items?.map((e) => e.toMap()).toList(),
        'Total': _total,
        'dataCreated': _dataCreated,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
        'Total': serializeParam(
          _total,
          ParamType.double,
        ),
        'dataCreated': serializeParam(
          _dataCreated,
          ParamType.String,
        ),
      }.withoutNulls;

  static SacolaStruct fromSerializableMap(Map<String, dynamic> data) =>
      SacolaStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        items: deserializeStructParam<ItemDaSacolaStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemDaSacolaStruct.fromSerializableMap,
        ),
        total: deserializeParam(
          data['Total'],
          ParamType.double,
          false,
        ),
        dataCreated: deserializeParam(
          data['dataCreated'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SacolaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SacolaStruct &&
        userId == other.userId &&
        listEquality.equals(items, other.items) &&
        total == other.total &&
        dataCreated == other.dataCreated;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userId, items, total, dataCreated]);
}

SacolaStruct createSacolaStruct({
  String? userId,
  double? total,
  String? dataCreated,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SacolaStruct(
      userId: userId,
      total: total,
      dataCreated: dataCreated,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SacolaStruct? updateSacolaStruct(
  SacolaStruct? sacola, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sacola
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSacolaStructData(
  Map<String, dynamic> firestoreData,
  SacolaStruct? sacola,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sacola == null) {
    return;
  }
  if (sacola.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sacola.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sacolaData = getSacolaFirestoreData(sacola, forFieldValue);
  final nestedData = sacolaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sacola.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSacolaFirestoreData(
  SacolaStruct? sacola, [
  bool forFieldValue = false,
]) {
  if (sacola == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sacola.toMap());

  // Add any Firestore field values
  sacola.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSacolaListFirestoreData(
  List<SacolaStruct>? sacolas,
) =>
    sacolas?.map((e) => getSacolaFirestoreData(e, true)).toList() ?? [];
