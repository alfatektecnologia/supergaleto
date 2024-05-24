// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemDaSacolaStruct extends FFFirebaseStruct {
  ItemDaSacolaStruct({
    String? produtoId,
    String? nome,
    double? valor,
    int? qdade,
    String? userId,
    DateTime? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _produtoId = produtoId,
        _nome = nome,
        _valor = valor,
        _qdade = qdade,
        _userId = userId,
        _data = data,
        super(firestoreUtilData);

  // "produtoId" field.
  String? _produtoId;
  String get produtoId => _produtoId ?? '';
  set produtoId(String? val) => _produtoId = val;
  bool hasProdutoId() => _produtoId != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;
  void incrementValor(double amount) => _valor = valor + amount;
  bool hasValor() => _valor != null;

  // "qdade" field.
  int? _qdade;
  int get qdade => _qdade ?? 0;
  set qdade(int? val) => _qdade = val;
  void incrementQdade(int amount) => _qdade = qdade + amount;
  bool hasQdade() => _qdade != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;
  bool hasData() => _data != null;

  static ItemDaSacolaStruct fromMap(Map<String, dynamic> data) =>
      ItemDaSacolaStruct(
        produtoId: data['produtoId'] as String?,
        nome: data['nome'] as String?,
        valor: castToType<double>(data['valor']),
        qdade: castToType<int>(data['qdade']),
        userId: data['userId'] as String?,
        data: data['data'] as DateTime?,
      );

  static ItemDaSacolaStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemDaSacolaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'produtoId': _produtoId,
        'nome': _nome,
        'valor': _valor,
        'qdade': _qdade,
        'userId': _userId,
        'data': _data,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'produtoId': serializeParam(
          _produtoId,
          ParamType.String,
        ),
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
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ItemDaSacolaStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemDaSacolaStruct(
        produtoId: deserializeParam(
          data['produtoId'],
          ParamType.String,
          false,
        ),
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
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ItemDaSacolaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemDaSacolaStruct &&
        produtoId == other.produtoId &&
        nome == other.nome &&
        valor == other.valor &&
        qdade == other.qdade &&
        userId == other.userId &&
        data == other.data;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([produtoId, nome, valor, qdade, userId, data]);
}

ItemDaSacolaStruct createItemDaSacolaStruct({
  String? produtoId,
  String? nome,
  double? valor,
  int? qdade,
  String? userId,
  DateTime? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemDaSacolaStruct(
      produtoId: produtoId,
      nome: nome,
      valor: valor,
      qdade: qdade,
      userId: userId,
      data: data,
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
