import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_user') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_user') ?? '{}';
          _user = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_Adm') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_Adm') ?? '{}';
          _Adm = ManagerStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _pratelheira = (await secureStorage.getStringList('ff_pratelheira'))
              ?.map((x) {
                try {
                  return ItemAssandoStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _pratelheira;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  UserStruct _user = UserStruct();
  UserStruct get user => _user;
  set user(UserStruct value) {
    _user = value;
    secureStorage.setString('ff_user', value.serialize());
  }

  void deleteUser() {
    secureStorage.delete(key: 'ff_user');
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_user);
    secureStorage.setString('ff_user', _user.serialize());
  }

  List<ProdutoStruct> _cart = [];
  List<ProdutoStruct> get cart => _cart;
  set cart(List<ProdutoStruct> value) {
    _cart = value;
  }

  void addToCart(ProdutoStruct value) {
    _cart.add(value);
  }

  void removeFromCart(ProdutoStruct value) {
    _cart.remove(value);
  }

  void removeAtIndexFromCart(int index) {
    _cart.removeAt(index);
  }

  void updateCartAtIndex(
    int index,
    ProdutoStruct Function(ProdutoStruct) updateFn,
  ) {
    _cart[index] = updateFn(_cart[index]);
  }

  void insertAtIndexInCart(int index, ProdutoStruct value) {
    _cart.insert(index, value);
  }

  ManagerStruct _Adm = ManagerStruct();
  ManagerStruct get Adm => _Adm;
  set Adm(ManagerStruct value) {
    _Adm = value;
    secureStorage.setString('ff_Adm', value.serialize());
  }

  void deleteAdm() {
    secureStorage.delete(key: 'ff_Adm');
  }

  void updateAdmStruct(Function(ManagerStruct) updateFn) {
    updateFn(_Adm);
    secureStorage.setString('ff_Adm', _Adm.serialize());
  }

  String _photoProdutoUrl = '';
  String get photoProdutoUrl => _photoProdutoUrl;
  set photoProdutoUrl(String value) {
    _photoProdutoUrl = value;
  }

  ProdutoStruct _Produto = ProdutoStruct();
  ProdutoStruct get Produto => _Produto;
  set Produto(ProdutoStruct value) {
    _Produto = value;
  }

  void updateProdutoStruct(Function(ProdutoStruct) updateFn) {
    updateFn(_Produto);
  }

  String _photoFromFirebase = '';
  String get photoFromFirebase => _photoFromFirebase;
  set photoFromFirebase(String value) {
    _photoFromFirebase = value;
  }

  List<ItemAssandoStruct> _pratelheira = [];
  List<ItemAssandoStruct> get pratelheira => _pratelheira;
  set pratelheira(List<ItemAssandoStruct> value) {
    _pratelheira = value;
    secureStorage.setStringList(
        'ff_pratelheira', value.map((x) => x.serialize()).toList());
  }

  void deletePratelheira() {
    secureStorage.delete(key: 'ff_pratelheira');
  }

  void addToPratelheira(ItemAssandoStruct value) {
    _pratelheira.add(value);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }

  void removeFromPratelheira(ItemAssandoStruct value) {
    _pratelheira.remove(value);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPratelheira(int index) {
    _pratelheira.removeAt(index);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }

  void updatePratelheiraAtIndex(
    int index,
    ItemAssandoStruct Function(ItemAssandoStruct) updateFn,
  ) {
    _pratelheira[index] = updateFn(_pratelheira[index]);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPratelheira(int index, ItemAssandoStruct value) {
    _pratelheira.insert(index, value);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
