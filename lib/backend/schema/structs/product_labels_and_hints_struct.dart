// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductLabelsAndHintsStruct extends FFFirebaseStruct {
  ProductLabelsAndHintsStruct({
    List<LabelsAndHintsStruct>? labelsAndHints,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _labelsAndHints = labelsAndHints,
        super(firestoreUtilData);

  // "labelsAndHints" field.
  List<LabelsAndHintsStruct>? _labelsAndHints;
  List<LabelsAndHintsStruct> get labelsAndHints => _labelsAndHints ?? const [];
  set labelsAndHints(List<LabelsAndHintsStruct>? val) => _labelsAndHints = val;
  void updateLabelsAndHints(Function(List<LabelsAndHintsStruct>) updateFn) =>
      updateFn(_labelsAndHints ??= []);
  bool hasLabelsAndHints() => _labelsAndHints != null;

  static ProductLabelsAndHintsStruct fromMap(Map<String, dynamic> data) =>
      ProductLabelsAndHintsStruct(
        labelsAndHints: getStructList(
          data['labelsAndHints'],
          LabelsAndHintsStruct.fromMap,
        ),
      );

  static ProductLabelsAndHintsStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductLabelsAndHintsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'labelsAndHints': _labelsAndHints?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'labelsAndHints': serializeParam(
          _labelsAndHints,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ProductLabelsAndHintsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductLabelsAndHintsStruct(
        labelsAndHints: deserializeStructParam<LabelsAndHintsStruct>(
          data['labelsAndHints'],
          ParamType.DataStruct,
          true,
          structBuilder: LabelsAndHintsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProductLabelsAndHintsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductLabelsAndHintsStruct &&
        listEquality.equals(labelsAndHints, other.labelsAndHints);
  }

  @override
  int get hashCode => const ListEquality().hash([labelsAndHints]);
}

ProductLabelsAndHintsStruct createProductLabelsAndHintsStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductLabelsAndHintsStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductLabelsAndHintsStruct? updateProductLabelsAndHintsStruct(
  ProductLabelsAndHintsStruct? productLabelsAndHints, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productLabelsAndHints
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductLabelsAndHintsStructData(
  Map<String, dynamic> firestoreData,
  ProductLabelsAndHintsStruct? productLabelsAndHints,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productLabelsAndHints == null) {
    return;
  }
  if (productLabelsAndHints.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      productLabelsAndHints.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productLabelsAndHintsData = getProductLabelsAndHintsFirestoreData(
      productLabelsAndHints, forFieldValue);
  final nestedData =
      productLabelsAndHintsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      productLabelsAndHints.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductLabelsAndHintsFirestoreData(
  ProductLabelsAndHintsStruct? productLabelsAndHints, [
  bool forFieldValue = false,
]) {
  if (productLabelsAndHints == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productLabelsAndHints.toMap());

  // Add any Firestore field values
  productLabelsAndHints.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductLabelsAndHintsListFirestoreData(
  List<ProductLabelsAndHintsStruct>? productLabelsAndHintss,
) =>
    productLabelsAndHintss
        ?.map((e) => getProductLabelsAndHintsFirestoreData(e, true))
        .toList() ??
    [];
