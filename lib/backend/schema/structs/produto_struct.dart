// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoStruct extends FFFirebaseStruct {
  ProdutoStruct({
    String? nome,
    String? produtoId,
    String? descricao,
    String? fotoUrl,
    double? valor,
    DateTime? dataInclusao,
    bool? isAtivo,
    double? valorVenda,
    String? categoria,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _produtoId = produtoId,
        _descricao = descricao,
        _fotoUrl = fotoUrl,
        _valor = valor,
        _dataInclusao = dataInclusao,
        _isAtivo = isAtivo,
        _valorVenda = valorVenda,
        _categoria = categoria,
        super(firestoreUtilData);

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  // "produtoId" field.
  String? _produtoId;
  String get produtoId => _produtoId ?? '';
  set produtoId(String? val) => _produtoId = val;
  bool hasProdutoId() => _produtoId != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;
  bool hasDescricao() => _descricao != null;

  // "fotoUrl" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  set fotoUrl(String? val) => _fotoUrl = val;
  bool hasFotoUrl() => _fotoUrl != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;
  void incrementValor(double amount) => _valor = valor + amount;
  bool hasValor() => _valor != null;

  // "dataInclusao" field.
  DateTime? _dataInclusao;
  DateTime? get dataInclusao => _dataInclusao;
  set dataInclusao(DateTime? val) => _dataInclusao = val;
  bool hasDataInclusao() => _dataInclusao != null;

  // "isAtivo" field.
  bool? _isAtivo;
  bool get isAtivo => _isAtivo ?? false;
  set isAtivo(bool? val) => _isAtivo = val;
  bool hasIsAtivo() => _isAtivo != null;

  // "valorVenda" field.
  double? _valorVenda;
  double get valorVenda => _valorVenda ?? 0.0;
  set valorVenda(double? val) => _valorVenda = val;
  void incrementValorVenda(double amount) => _valorVenda = valorVenda + amount;
  bool hasValorVenda() => _valorVenda != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;
  bool hasCategoria() => _categoria != null;

  static ProdutoStruct fromMap(Map<String, dynamic> data) => ProdutoStruct(
        nome: data['nome'] as String?,
        produtoId: data['produtoId'] as String?,
        descricao: data['descricao'] as String?,
        fotoUrl: data['fotoUrl'] as String?,
        valor: castToType<double>(data['valor']),
        dataInclusao: data['dataInclusao'] as DateTime?,
        isAtivo: data['isAtivo'] as bool?,
        valorVenda: castToType<double>(data['valorVenda']),
        categoria: data['categoria'] as String?,
      );

  static ProdutoStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProdutoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'produtoId': _produtoId,
        'descricao': _descricao,
        'fotoUrl': _fotoUrl,
        'valor': _valor,
        'dataInclusao': _dataInclusao,
        'isAtivo': _isAtivo,
        'valorVenda': _valorVenda,
        'categoria': _categoria,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'produtoId': serializeParam(
          _produtoId,
          ParamType.String,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'fotoUrl': serializeParam(
          _fotoUrl,
          ParamType.String,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
        'dataInclusao': serializeParam(
          _dataInclusao,
          ParamType.DateTime,
        ),
        'isAtivo': serializeParam(
          _isAtivo,
          ParamType.bool,
        ),
        'valorVenda': serializeParam(
          _valorVenda,
          ParamType.double,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProdutoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProdutoStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        produtoId: deserializeParam(
          data['produtoId'],
          ParamType.String,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        fotoUrl: deserializeParam(
          data['fotoUrl'],
          ParamType.String,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
        dataInclusao: deserializeParam(
          data['dataInclusao'],
          ParamType.DateTime,
          false,
        ),
        isAtivo: deserializeParam(
          data['isAtivo'],
          ParamType.bool,
          false,
        ),
        valorVenda: deserializeParam(
          data['valorVenda'],
          ParamType.double,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProdutoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProdutoStruct &&
        nome == other.nome &&
        produtoId == other.produtoId &&
        descricao == other.descricao &&
        fotoUrl == other.fotoUrl &&
        valor == other.valor &&
        dataInclusao == other.dataInclusao &&
        isAtivo == other.isAtivo &&
        valorVenda == other.valorVenda &&
        categoria == other.categoria;
  }

  @override
  int get hashCode => const ListEquality().hash([
        nome,
        produtoId,
        descricao,
        fotoUrl,
        valor,
        dataInclusao,
        isAtivo,
        valorVenda,
        categoria
      ]);
}

ProdutoStruct createProdutoStruct({
  String? nome,
  String? produtoId,
  String? descricao,
  String? fotoUrl,
  double? valor,
  DateTime? dataInclusao,
  bool? isAtivo,
  double? valorVenda,
  String? categoria,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProdutoStruct(
      nome: nome,
      produtoId: produtoId,
      descricao: descricao,
      fotoUrl: fotoUrl,
      valor: valor,
      dataInclusao: dataInclusao,
      isAtivo: isAtivo,
      valorVenda: valorVenda,
      categoria: categoria,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProdutoStruct? updateProdutoStruct(
  ProdutoStruct? produto, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    produto
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProdutoStructData(
  Map<String, dynamic> firestoreData,
  ProdutoStruct? produto,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (produto == null) {
    return;
  }
  if (produto.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && produto.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final produtoData = getProdutoFirestoreData(produto, forFieldValue);
  final nestedData = produtoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = produto.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProdutoFirestoreData(
  ProdutoStruct? produto, [
  bool forFieldValue = false,
]) {
  if (produto == null) {
    return {};
  }
  final firestoreData = mapToFirestore(produto.toMap());

  // Add any Firestore field values
  produto.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProdutoListFirestoreData(
  List<ProdutoStruct>? produtos,
) =>
    produtos?.map((e) => getProdutoFirestoreData(e, true)).toList() ?? [];
