// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LabelsAndHintsStruct extends FFFirebaseStruct {
  LabelsAndHintsStruct({
    String? label,
    String? hint,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _hint = hint,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? 'label';
  set label(String? val) => _label = val;
  bool hasLabel() => _label != null;

  // "hint" field.
  String? _hint;
  String get hint => _hint ?? 'hint';
  set hint(String? val) => _hint = val;
  bool hasHint() => _hint != null;

  static LabelsAndHintsStruct fromMap(Map<String, dynamic> data) =>
      LabelsAndHintsStruct(
        label: data['label'] as String?,
        hint: data['hint'] as String?,
      );

  static LabelsAndHintsStruct? maybeFromMap(dynamic data) => data is Map
      ? LabelsAndHintsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'hint': _hint,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'hint': serializeParam(
          _hint,
          ParamType.String,
        ),
      }.withoutNulls;

  static LabelsAndHintsStruct fromSerializableMap(Map<String, dynamic> data) =>
      LabelsAndHintsStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        hint: deserializeParam(
          data['hint'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LabelsAndHintsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LabelsAndHintsStruct &&
        label == other.label &&
        hint == other.hint;
  }

  @override
  int get hashCode => const ListEquality().hash([label, hint]);
}

LabelsAndHintsStruct createLabelsAndHintsStruct({
  String? label,
  String? hint,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LabelsAndHintsStruct(
      label: label,
      hint: hint,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LabelsAndHintsStruct? updateLabelsAndHintsStruct(
  LabelsAndHintsStruct? labelsAndHints, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    labelsAndHints
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLabelsAndHintsStructData(
  Map<String, dynamic> firestoreData,
  LabelsAndHintsStruct? labelsAndHints,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (labelsAndHints == null) {
    return;
  }
  if (labelsAndHints.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && labelsAndHints.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final labelsAndHintsData =
      getLabelsAndHintsFirestoreData(labelsAndHints, forFieldValue);
  final nestedData =
      labelsAndHintsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = labelsAndHints.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLabelsAndHintsFirestoreData(
  LabelsAndHintsStruct? labelsAndHints, [
  bool forFieldValue = false,
]) {
  if (labelsAndHints == null) {
    return {};
  }
  final firestoreData = mapToFirestore(labelsAndHints.toMap());

  // Add any Firestore field values
  labelsAndHints.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLabelsAndHintsListFirestoreData(
  List<LabelsAndHintsStruct>? labelsAndHintss,
) =>
    labelsAndHintss
        ?.map((e) => getLabelsAndHintsFirestoreData(e, true))
        .toList() ??
    [];
