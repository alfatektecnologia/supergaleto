// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategoriasStruct extends FFFirebaseStruct {
  CategoriasStruct({
    String? nome,
    bool? isActive,
    String? categoriaId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _isActive = isActive,
        _categoriaId = categoriaId,
        super(firestoreUtilData);

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? true;
  set isActive(bool? val) => _isActive = val;

  bool hasIsActive() => _isActive != null;

  // "categoriaId" field.
  String? _categoriaId;
  String get categoriaId => _categoriaId ?? '';
  set categoriaId(String? val) => _categoriaId = val;

  bool hasCategoriaId() => _categoriaId != null;

  static CategoriasStruct fromMap(Map<String, dynamic> data) =>
      CategoriasStruct(
        nome: data['nome'] as String?,
        isActive: data['isActive'] as bool?,
        categoriaId: data['categoriaId'] as String?,
      );

  static CategoriasStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'isActive': _isActive,
        'categoriaId': _categoriaId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'isActive': serializeParam(
          _isActive,
          ParamType.bool,
        ),
        'categoriaId': serializeParam(
          _categoriaId,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoriasStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriasStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        isActive: deserializeParam(
          data['isActive'],
          ParamType.bool,
          false,
        ),
        categoriaId: deserializeParam(
          data['categoriaId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategoriasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriasStruct &&
        nome == other.nome &&
        isActive == other.isActive &&
        categoriaId == other.categoriaId;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, isActive, categoriaId]);
}

CategoriasStruct createCategoriasStruct({
  String? nome,
  bool? isActive,
  String? categoriaId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoriasStruct(
      nome: nome,
      isActive: isActive,
      categoriaId: categoriaId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoriasStruct? updateCategoriasStruct(
  CategoriasStruct? categorias, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categorias
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoriasStructData(
  Map<String, dynamic> firestoreData,
  CategoriasStruct? categorias,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categorias == null) {
    return;
  }
  if (categorias.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categorias.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoriasData = getCategoriasFirestoreData(categorias, forFieldValue);
  final nestedData = categoriasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categorias.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoriasFirestoreData(
  CategoriasStruct? categorias, [
  bool forFieldValue = false,
]) {
  if (categorias == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categorias.toMap());

  // Add any Firestore field values
  categorias.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoriasListFirestoreData(
  List<CategoriasStruct>? categoriass,
) =>
    categoriass?.map((e) => getCategoriasFirestoreData(e, true)).toList() ?? [];
