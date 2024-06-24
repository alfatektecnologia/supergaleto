// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChurrasqueiraStruct extends FFFirebaseStruct {
  ChurrasqueiraStruct({
    String? id,
    List<ItemAssandoStruct>? itemsAssando,
    String? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _itemsAssando = itemsAssando,
        _data = data,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "itemsAssando" field.
  List<ItemAssandoStruct>? _itemsAssando;
  List<ItemAssandoStruct> get itemsAssando => _itemsAssando ?? const [];
  set itemsAssando(List<ItemAssandoStruct>? val) => _itemsAssando = val;

  void updateItemsAssando(Function(List<ItemAssandoStruct>) updateFn) {
    updateFn(itemsAssando ??= []);
  }

  bool hasItemsAssando() => _itemsAssando != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  static ChurrasqueiraStruct fromMap(Map<String, dynamic> data) =>
      ChurrasqueiraStruct(
        id: data['id'] as String?,
        itemsAssando: getStructList(
          data['itemsAssando'],
          ItemAssandoStruct.fromMap,
        ),
        data: data['data'] as String?,
      );

  static ChurrasqueiraStruct? maybeFromMap(dynamic data) => data is Map
      ? ChurrasqueiraStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'itemsAssando': _itemsAssando?.map((e) => e.toMap()).toList(),
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'itemsAssando': serializeParam(
          _itemsAssando,
          ParamType.DataStruct,
          isList: true,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChurrasqueiraStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChurrasqueiraStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        itemsAssando: deserializeStructParam<ItemAssandoStruct>(
          data['itemsAssando'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemAssandoStruct.fromSerializableMap,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChurrasqueiraStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChurrasqueiraStruct &&
        id == other.id &&
        listEquality.equals(itemsAssando, other.itemsAssando) &&
        data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([id, itemsAssando, data]);
}

ChurrasqueiraStruct createChurrasqueiraStruct({
  String? id,
  String? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChurrasqueiraStruct(
      id: id,
      data: data,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChurrasqueiraStruct? updateChurrasqueiraStruct(
  ChurrasqueiraStruct? churrasqueira, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    churrasqueira
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChurrasqueiraStructData(
  Map<String, dynamic> firestoreData,
  ChurrasqueiraStruct? churrasqueira,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (churrasqueira == null) {
    return;
  }
  if (churrasqueira.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && churrasqueira.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final churrasqueiraData =
      getChurrasqueiraFirestoreData(churrasqueira, forFieldValue);
  final nestedData =
      churrasqueiraData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = churrasqueira.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChurrasqueiraFirestoreData(
  ChurrasqueiraStruct? churrasqueira, [
  bool forFieldValue = false,
]) {
  if (churrasqueira == null) {
    return {};
  }
  final firestoreData = mapToFirestore(churrasqueira.toMap());

  // Add any Firestore field values
  churrasqueira.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChurrasqueiraListFirestoreData(
  List<ChurrasqueiraStruct>? churrasqueiras,
) =>
    churrasqueiras
        ?.map((e) => getChurrasqueiraFirestoreData(e, true))
        .toList() ??
    [];
