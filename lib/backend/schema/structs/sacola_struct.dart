// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SacolaStruct extends FFFirebaseStruct {
  SacolaStruct({
    String? produtoId,
    String? nome,
    double? valor,
    int? qdade,
    String? userId,
    DateTime? data,
    String? pedidoId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _produtoId = produtoId,
        _nome = nome,
        _valor = valor,
        _qdade = qdade,
        _userId = userId,
        _data = data,
        _pedidoId = pedidoId,
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

  // "pedidoId" field.
  String? _pedidoId;
  String get pedidoId => _pedidoId ?? '';
  set pedidoId(String? val) => _pedidoId = val;
  bool hasPedidoId() => _pedidoId != null;

  static SacolaStruct fromMap(Map<String, dynamic> data) => SacolaStruct(
        produtoId: data['produtoId'] as String?,
        nome: data['nome'] as String?,
        valor: castToType<double>(data['valor']),
        qdade: castToType<int>(data['qdade']),
        userId: data['userId'] as String?,
        data: data['data'] as DateTime?,
        pedidoId: data['pedidoId'] as String?,
      );

  static SacolaStruct? maybeFromMap(dynamic data) =>
      data is Map ? SacolaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'produtoId': _produtoId,
        'nome': _nome,
        'valor': _valor,
        'qdade': _qdade,
        'userId': _userId,
        'data': _data,
        'pedidoId': _pedidoId,
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
        'pedidoId': serializeParam(
          _pedidoId,
          ParamType.String,
        ),
      }.withoutNulls;

  static SacolaStruct fromSerializableMap(Map<String, dynamic> data) =>
      SacolaStruct(
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
        pedidoId: deserializeParam(
          data['pedidoId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SacolaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SacolaStruct &&
        produtoId == other.produtoId &&
        nome == other.nome &&
        valor == other.valor &&
        qdade == other.qdade &&
        userId == other.userId &&
        data == other.data &&
        pedidoId == other.pedidoId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([produtoId, nome, valor, qdade, userId, data, pedidoId]);
}

SacolaStruct createSacolaStruct({
  String? produtoId,
  String? nome,
  double? valor,
  int? qdade,
  String? userId,
  DateTime? data,
  String? pedidoId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SacolaStruct(
      produtoId: produtoId,
      nome: nome,
      valor: valor,
      qdade: qdade,
      userId: userId,
      data: data,
      pedidoId: pedidoId,
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
