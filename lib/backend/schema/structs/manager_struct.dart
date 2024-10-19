// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ManagerStruct extends FFFirebaseStruct {
  ManagerStruct({
    UserStruct? user,
    SacolaStruct? sacola,
    ChurrasqueiraStruct? churrasqueira,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _sacola = sacola,
        _churrasqueira = churrasqueira,
        super(firestoreUtilData);

  // "user" field.
  UserStruct? _user;
  UserStruct get user => _user ?? UserStruct();
  set user(UserStruct? val) => _user = val;

  void updateUser(Function(UserStruct) updateFn) {
    updateFn(_user ??= UserStruct());
  }

  bool hasUser() => _user != null;

  // "sacola" field.
  SacolaStruct? _sacola;
  SacolaStruct get sacola => _sacola ?? SacolaStruct();
  set sacola(SacolaStruct? val) => _sacola = val;

  void updateSacola(Function(SacolaStruct) updateFn) {
    updateFn(_sacola ??= SacolaStruct());
  }

  bool hasSacola() => _sacola != null;

  // "churrasqueira" field.
  ChurrasqueiraStruct? _churrasqueira;
  ChurrasqueiraStruct get churrasqueira =>
      _churrasqueira ?? ChurrasqueiraStruct();
  set churrasqueira(ChurrasqueiraStruct? val) => _churrasqueira = val;

  void updateChurrasqueira(Function(ChurrasqueiraStruct) updateFn) {
    updateFn(_churrasqueira ??= ChurrasqueiraStruct());
  }

  bool hasChurrasqueira() => _churrasqueira != null;

  static ManagerStruct fromMap(Map<String, dynamic> data) => ManagerStruct(
        user: UserStruct.maybeFromMap(data['user']),
        sacola: SacolaStruct.maybeFromMap(data['sacola']),
        churrasqueira: ChurrasqueiraStruct.maybeFromMap(data['churrasqueira']),
      );

  static ManagerStruct? maybeFromMap(dynamic data) =>
      data is Map ? ManagerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user': _user?.toMap(),
        'sacola': _sacola?.toMap(),
        'churrasqueira': _churrasqueira?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DataStruct,
        ),
        'sacola': serializeParam(
          _sacola,
          ParamType.DataStruct,
        ),
        'churrasqueira': serializeParam(
          _churrasqueira,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ManagerStruct fromSerializableMap(Map<String, dynamic> data) =>
      ManagerStruct(
        user: deserializeStructParam(
          data['user'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        sacola: deserializeStructParam(
          data['sacola'],
          ParamType.DataStruct,
          false,
          structBuilder: SacolaStruct.fromSerializableMap,
        ),
        churrasqueira: deserializeStructParam(
          data['churrasqueira'],
          ParamType.DataStruct,
          false,
          structBuilder: ChurrasqueiraStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ManagerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ManagerStruct &&
        user == other.user &&
        sacola == other.sacola &&
        churrasqueira == other.churrasqueira;
  }

  @override
  int get hashCode => const ListEquality().hash([user, sacola, churrasqueira]);
}

ManagerStruct createManagerStruct({
  UserStruct? user,
  SacolaStruct? sacola,
  ChurrasqueiraStruct? churrasqueira,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ManagerStruct(
      user: user ?? (clearUnsetFields ? UserStruct() : null),
      sacola: sacola ?? (clearUnsetFields ? SacolaStruct() : null),
      churrasqueira:
          churrasqueira ?? (clearUnsetFields ? ChurrasqueiraStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ManagerStruct? updateManagerStruct(
  ManagerStruct? manager, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    manager
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addManagerStructData(
  Map<String, dynamic> firestoreData,
  ManagerStruct? manager,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (manager == null) {
    return;
  }
  if (manager.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && manager.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final managerData = getManagerFirestoreData(manager, forFieldValue);
  final nestedData = managerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = manager.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getManagerFirestoreData(
  ManagerStruct? manager, [
  bool forFieldValue = false,
]) {
  if (manager == null) {
    return {};
  }
  final firestoreData = mapToFirestore(manager.toMap());

  // Handle nested data for "user" field.
  addUserStructData(
    firestoreData,
    manager.hasUser() ? manager.user : null,
    'user',
    forFieldValue,
  );

  // Handle nested data for "sacola" field.
  addSacolaStructData(
    firestoreData,
    manager.hasSacola() ? manager.sacola : null,
    'sacola',
    forFieldValue,
  );

  // Handle nested data for "churrasqueira" field.
  addChurrasqueiraStructData(
    firestoreData,
    manager.hasChurrasqueira() ? manager.churrasqueira : null,
    'churrasqueira',
    forFieldValue,
  );

  // Add any Firestore field values
  manager.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getManagerListFirestoreData(
  List<ManagerStruct>? managers,
) =>
    managers?.map((e) => getManagerFirestoreData(e, true)).toList() ?? [];
