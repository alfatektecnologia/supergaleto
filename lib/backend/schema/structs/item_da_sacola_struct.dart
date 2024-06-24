// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ItemDaSacolaStruct extends FFFirebaseStruct {
  ItemDaSacolaStruct({
    String? nome,
    double? valor,
    int? qdade,
    String? data,
    String? fotoUrl,
    String? descricao,
    DocumentReference? referenceProd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _valor = valor,
        _qdade = qdade,
        _data = data,
        _fotoUrl = fotoUrl,
        _descricao = descricao,
        _referenceProd = referenceProd,
        super(firestoreUtilData);

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  // "qdade" field.
  int? _qdade;
  int get qdade => _qdade ?? 0;
  set qdade(int? val) => _qdade = val;

  void incrementQdade(int amount) => qdade = qdade + amount;

  bool hasQdade() => _qdade != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "fotoUrl" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  set fotoUrl(String? val) => _fotoUrl = val;

  bool hasFotoUrl() => _fotoUrl != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "referenceProd" field.
  DocumentReference? _referenceProd;
  DocumentReference? get referenceProd => _referenceProd;
  set referenceProd(DocumentReference? val) => _referenceProd = val;

  bool hasReferenceProd() => _referenceProd != null;

  static ItemDaSacolaStruct fromMap(Map<String, dynamic> data) =>
      ItemDaSacolaStruct(
        nome: data['nome'] as String?,
        valor: castToType<double>(data['valor']),
        qdade: castToType<int>(data['qdade']),
        data: data['data'] as String?,
        fotoUrl: data['fotoUrl'] as String?,
        descricao: data['descricao'] as String?,
        referenceProd: data['referenceProd'] as DocumentReference?,
      );

  static ItemDaSacolaStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemDaSacolaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'valor': _valor,
        'qdade': _qdade,
        'data': _data,
        'fotoUrl': _fotoUrl,
        'descricao': _descricao,
        'referenceProd': _referenceProd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
        'qdade': serializeParam(
          _qdade,
          ParamType.int,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
        'fotoUrl': serializeParam(
          _fotoUrl,
          ParamType.String,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'referenceProd': serializeParam(
          _referenceProd,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ItemDaSacolaStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemDaSacolaStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
        qdade: deserializeParam(
          data['qdade'],
          ParamType.int,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
        fotoUrl: deserializeParam(
          data['fotoUrl'],
          ParamType.String,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        referenceProd: deserializeParam(
          data['referenceProd'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['produtos'],
        ),
      );

  @override
  String toString() => 'ItemDaSacolaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemDaSacolaStruct &&
        nome == other.nome &&
        valor == other.valor &&
        qdade == other.qdade &&
        data == other.data &&
        fotoUrl == other.fotoUrl &&
        descricao == other.descricao &&
        referenceProd == other.referenceProd;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nome, valor, qdade, data, fotoUrl, descricao, referenceProd]);
}

ItemDaSacolaStruct createItemDaSacolaStruct({
  String? nome,
  double? valor,
  int? qdade,
  String? data,
  String? fotoUrl,
  String? descricao,
  DocumentReference? referenceProd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemDaSacolaStruct(
      nome: nome,
      valor: valor,
      qdade: qdade,
      data: data,
      fotoUrl: fotoUrl,
      descricao: descricao,
      referenceProd: referenceProd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemDaSacolaStruct? updateItemDaSacolaStruct(
  ItemDaSacolaStruct? itemDaSacola, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemDaSacola
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemDaSacolaStructData(
  Map<String, dynamic> firestoreData,
  ItemDaSacolaStruct? itemDaSacola,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemDaSacola == null) {
    return;
  }
  if (itemDaSacola.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemDaSacola.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemDaSacolaData =
      getItemDaSacolaFirestoreData(itemDaSacola, forFieldValue);
  final nestedData =
      itemDaSacolaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemDaSacola.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemDaSacolaFirestoreData(
  ItemDaSacolaStruct? itemDaSacola, [
  bool forFieldValue = false,
]) {
  if (itemDaSacola == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemDaSacola.toMap());

  // Add any Firestore field values
  itemDaSacola.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemDaSacolaListFirestoreData(
  List<ItemDaSacolaStruct>? itemDaSacolas,
) =>
    itemDaSacolas?.map((e) => getItemDaSacolaFirestoreData(e, true)).toList() ??
    [];
