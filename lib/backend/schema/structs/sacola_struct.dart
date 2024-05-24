// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SacolaStruct extends FFFirebaseStruct {
  SacolaStruct({
    String? sacolaId,
    DateTime? dateCreate,
    List<ItemDaSacolaStruct>? items,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sacolaId = sacolaId,
        _dateCreate = dateCreate,
        _items = items,
        super(firestoreUtilData);

  // "sacolaId" field.
  String? _sacolaId;
  String get sacolaId => _sacolaId ?? '';
  set sacolaId(String? val) => _sacolaId = val;
  bool hasSacolaId() => _sacolaId != null;

  // "dateCreate" field.
  DateTime? _dateCreate;
  DateTime? get dateCreate => _dateCreate;
  set dateCreate(DateTime? val) => _dateCreate = val;
  bool hasDateCreate() => _dateCreate != null;

  // "items" field.
  List<ItemDaSacolaStruct>? _items;
  List<ItemDaSacolaStruct> get items => _items ?? const [];
  set items(List<ItemDaSacolaStruct>? val) => _items = val;
  void updateItems(Function(List<ItemDaSacolaStruct>) updateFn) =>
      updateFn(_items ??= []);
  bool hasItems() => _items != null;

  static SacolaStruct fromMap(Map<String, dynamic> data) => SacolaStruct(
        sacolaId: data['sacolaId'] as String?,
        dateCreate: data['dateCreate'] as DateTime?,
        items: getStructList(
          data['items'],
          ItemDaSacolaStruct.fromMap,
        ),
      );

  static SacolaStruct? maybeFromMap(dynamic data) =>
      data is Map ? SacolaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'sacolaId': _sacolaId,
        'dateCreate': _dateCreate,
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sacolaId': serializeParam(
          _sacolaId,
          ParamType.String,
        ),
        'dateCreate': serializeParam(
          _dateCreate,
          ParamType.DateTime,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static SacolaStruct fromSerializableMap(Map<String, dynamic> data) =>
      SacolaStruct(
        sacolaId: deserializeParam(
          data['sacolaId'],
          ParamType.String,
          false,
        ),
        dateCreate: deserializeParam(
          data['dateCreate'],
          ParamType.DateTime,
          false,
        ),
        items: deserializeStructParam<ItemDaSacolaStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemDaSacolaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SacolaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SacolaStruct &&
        sacolaId == other.sacolaId &&
        dateCreate == other.dateCreate &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([sacolaId, dateCreate, items]);
}

SacolaStruct createSacolaStruct({
  String? sacolaId,
  DateTime? dateCreate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SacolaStruct(
      sacolaId: sacolaId,
      dateCreate: dateCreate,
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
