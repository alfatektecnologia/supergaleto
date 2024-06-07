// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusItensSavedStruct extends FFFirebaseStruct {
  StatusItensSavedStruct({
    String? produtoName,
    bool? isSaved,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _produtoName = produtoName,
        _isSaved = isSaved,
        super(firestoreUtilData);

  // "produtoName" field.
  String? _produtoName;
  String get produtoName => _produtoName ?? '';
  set produtoName(String? val) => _produtoName = val;
  bool hasProdutoName() => _produtoName != null;

  // "isSaved" field.
  bool? _isSaved;
  bool get isSaved => _isSaved ?? false;
  set isSaved(bool? val) => _isSaved = val;
  bool hasIsSaved() => _isSaved != null;

  static StatusItensSavedStruct fromMap(Map<String, dynamic> data) =>
      StatusItensSavedStruct(
        produtoName: data['produtoName'] as String?,
        isSaved: data['isSaved'] as bool?,
      );

  static StatusItensSavedStruct? maybeFromMap(dynamic data) => data is Map
      ? StatusItensSavedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'produtoName': _produtoName,
        'isSaved': _isSaved,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'produtoName': serializeParam(
          _produtoName,
          ParamType.String,
        ),
        'isSaved': serializeParam(
          _isSaved,
          ParamType.bool,
        ),
      }.withoutNulls;

  static StatusItensSavedStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StatusItensSavedStruct(
        produtoName: deserializeParam(
          data['produtoName'],
          ParamType.String,
          false,
        ),
        isSaved: deserializeParam(
          data['isSaved'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'StatusItensSavedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusItensSavedStruct &&
        produtoName == other.produtoName &&
        isSaved == other.isSaved;
  }

  @override
  int get hashCode => const ListEquality().hash([produtoName, isSaved]);
}

StatusItensSavedStruct createStatusItensSavedStruct({
  String? produtoName,
  bool? isSaved,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusItensSavedStruct(
      produtoName: produtoName,
      isSaved: isSaved,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatusItensSavedStruct? updateStatusItensSavedStruct(
  StatusItensSavedStruct? statusItensSaved, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    statusItensSaved
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatusItensSavedStructData(
  Map<String, dynamic> firestoreData,
  StatusItensSavedStruct? statusItensSaved,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (statusItensSaved == null) {
    return;
  }
  if (statusItensSaved.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && statusItensSaved.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusItensSavedData =
      getStatusItensSavedFirestoreData(statusItensSaved, forFieldValue);
  final nestedData =
      statusItensSavedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = statusItensSaved.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatusItensSavedFirestoreData(
  StatusItensSavedStruct? statusItensSaved, [
  bool forFieldValue = false,
]) {
  if (statusItensSaved == null) {
    return {};
  }
  final firestoreData = mapToFirestore(statusItensSaved.toMap());

  // Add any Firestore field values
  statusItensSaved.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusItensSavedListFirestoreData(
  List<StatusItensSavedStruct>? statusItensSaveds,
) =>
    statusItensSaveds
        ?.map((e) => getStatusItensSavedFirestoreData(e, true))
        .toList() ??
    [];
