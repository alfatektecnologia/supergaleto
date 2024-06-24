// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DadosItensAssandoStruct extends FFFirebaseStruct {
  DadosItensAssandoStruct({
    String? name,
    String? foto,
    int? qdade,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _foto = foto,
        _qdade = qdade,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  set foto(String? val) => _foto = val;

  bool hasFoto() => _foto != null;

  // "qdade" field.
  int? _qdade;
  int get qdade => _qdade ?? 0;
  set qdade(int? val) => _qdade = val;

  void incrementQdade(int amount) => qdade = qdade + amount;

  bool hasQdade() => _qdade != null;

  static DadosItensAssandoStruct fromMap(Map<String, dynamic> data) =>
      DadosItensAssandoStruct(
        name: data['name'] as String?,
        foto: data['foto'] as String?,
        qdade: castToType<int>(data['qdade']),
      );

  static DadosItensAssandoStruct? maybeFromMap(dynamic data) => data is Map
      ? DadosItensAssandoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'foto': _foto,
        'qdade': _qdade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'foto': serializeParam(
          _foto,
          ParamType.String,
        ),
        'qdade': serializeParam(
          _qdade,
          ParamType.int,
        ),
      }.withoutNulls;

  static DadosItensAssandoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DadosItensAssandoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        foto: deserializeParam(
          data['foto'],
          ParamType.String,
          false,
        ),
        qdade: deserializeParam(
          data['qdade'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DadosItensAssandoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DadosItensAssandoStruct &&
        name == other.name &&
        foto == other.foto &&
        qdade == other.qdade;
  }

  @override
  int get hashCode => const ListEquality().hash([name, foto, qdade]);
}

DadosItensAssandoStruct createDadosItensAssandoStruct({
  String? name,
  String? foto,
  int? qdade,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DadosItensAssandoStruct(
      name: name,
      foto: foto,
      qdade: qdade,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DadosItensAssandoStruct? updateDadosItensAssandoStruct(
  DadosItensAssandoStruct? dadosItensAssando, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dadosItensAssando
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDadosItensAssandoStructData(
  Map<String, dynamic> firestoreData,
  DadosItensAssandoStruct? dadosItensAssando,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dadosItensAssando == null) {
    return;
  }
  if (dadosItensAssando.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dadosItensAssando.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dadosItensAssandoData =
      getDadosItensAssandoFirestoreData(dadosItensAssando, forFieldValue);
  final nestedData =
      dadosItensAssandoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dadosItensAssando.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDadosItensAssandoFirestoreData(
  DadosItensAssandoStruct? dadosItensAssando, [
  bool forFieldValue = false,
]) {
  if (dadosItensAssando == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dadosItensAssando.toMap());

  // Add any Firestore field values
  dadosItensAssando.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDadosItensAssandoListFirestoreData(
  List<DadosItensAssandoStruct>? dadosItensAssandos,
) =>
    dadosItensAssandos
        ?.map((e) => getDadosItensAssandoFirestoreData(e, true))
        .toList() ??
    [];
