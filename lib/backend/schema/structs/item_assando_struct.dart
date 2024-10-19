// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ItemAssandoStruct extends FFFirebaseStruct {
  ItemAssandoStruct({
    String? produtoName,
    int? quantidade,
    String? fotoUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _produtoName = produtoName,
        _quantidade = quantidade,
        _fotoUrl = fotoUrl,
        super(firestoreUtilData);

  // "produtoName" field.
  String? _produtoName;
  String get produtoName => _produtoName ?? '';
  set produtoName(String? val) => _produtoName = val;

  bool hasProdutoName() => _produtoName != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "fotoUrl" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  set fotoUrl(String? val) => _fotoUrl = val;

  bool hasFotoUrl() => _fotoUrl != null;

  static ItemAssandoStruct fromMap(Map<String, dynamic> data) =>
      ItemAssandoStruct(
        produtoName: data['produtoName'] as String?,
        quantidade: castToType<int>(data['quantidade']),
        fotoUrl: data['fotoUrl'] as String?,
      );

  static ItemAssandoStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemAssandoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'produtoName': _produtoName,
        'quantidade': _quantidade,
        'fotoUrl': _fotoUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'produtoName': serializeParam(
          _produtoName,
          ParamType.String,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
        'fotoUrl': serializeParam(
          _fotoUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemAssandoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemAssandoStruct(
        produtoName: deserializeParam(
          data['produtoName'],
          ParamType.String,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
        fotoUrl: deserializeParam(
          data['fotoUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemAssandoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemAssandoStruct &&
        produtoName == other.produtoName &&
        quantidade == other.quantidade &&
        fotoUrl == other.fotoUrl;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([produtoName, quantidade, fotoUrl]);
}

ItemAssandoStruct createItemAssandoStruct({
  String? produtoName,
  int? quantidade,
  String? fotoUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemAssandoStruct(
      produtoName: produtoName,
      quantidade: quantidade,
      fotoUrl: fotoUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemAssandoStruct? updateItemAssandoStruct(
  ItemAssandoStruct? itemAssando, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemAssando
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemAssandoStructData(
  Map<String, dynamic> firestoreData,
  ItemAssandoStruct? itemAssando,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemAssando == null) {
    return;
  }
  if (itemAssando.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemAssando.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemAssandoData =
      getItemAssandoFirestoreData(itemAssando, forFieldValue);
  final nestedData =
      itemAssandoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemAssando.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemAssandoFirestoreData(
  ItemAssandoStruct? itemAssando, [
  bool forFieldValue = false,
]) {
  if (itemAssando == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemAssando.toMap());

  // Add any Firestore field values
  itemAssando.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemAssandoListFirestoreData(
  List<ItemAssandoStruct>? itemAssandos,
) =>
    itemAssandos?.map((e) => getItemAssandoFirestoreData(e, true)).toList() ??
    [];
