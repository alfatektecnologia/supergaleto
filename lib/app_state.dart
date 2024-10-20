import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
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
    await _safeInitAsync(() async {
      _Carrinho = (await secureStorage.getStringList('ff_Carrinho'))
              ?.map((x) {
                try {
                  return ItemDaSacolaStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Carrinho;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_Sacola') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_Sacola') ?? '{}';
          _Sacola =
              SacolaStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _TotalSacola =
          await secureStorage.getDouble('ff_TotalSacola') ?? _TotalSacola;
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
    pratelheira.add(value);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }

  void removeFromPratelheira(ItemAssandoStruct value) {
    pratelheira.remove(value);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPratelheira(int index) {
    pratelheira.removeAt(index);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }

  void updatePratelheiraAtIndex(
    int index,
    ItemAssandoStruct Function(ItemAssandoStruct) updateFn,
  ) {
    pratelheira[index] = updateFn(_pratelheira[index]);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPratelheira(int index, ItemAssandoStruct value) {
    pratelheira.insert(index, value);
    secureStorage.setStringList(
        'ff_pratelheira', _pratelheira.map((x) => x.serialize()).toList());
  }

  List<StatusItensSavedStruct> _StatusItensSaved = [];
  List<StatusItensSavedStruct> get StatusItensSaved => _StatusItensSaved;
  set StatusItensSaved(List<StatusItensSavedStruct> value) {
    _StatusItensSaved = value;
  }

  void addToStatusItensSaved(StatusItensSavedStruct value) {
    StatusItensSaved.add(value);
  }

  void removeFromStatusItensSaved(StatusItensSavedStruct value) {
    StatusItensSaved.remove(value);
  }

  void removeAtIndexFromStatusItensSaved(int index) {
    StatusItensSaved.removeAt(index);
  }

  void updateStatusItensSavedAtIndex(
    int index,
    StatusItensSavedStruct Function(StatusItensSavedStruct) updateFn,
  ) {
    StatusItensSaved[index] = updateFn(_StatusItensSaved[index]);
  }

  void insertAtIndexInStatusItensSaved(
      int index, StatusItensSavedStruct value) {
    StatusItensSaved.insert(index, value);
  }

  String _imageFromGallery = '';
  String get imageFromGallery => _imageFromGallery;
  set imageFromGallery(String value) {
    _imageFromGallery = value;
  }

  List<ItemDaSacolaStruct> _Carrinho = [];
  List<ItemDaSacolaStruct> get Carrinho => _Carrinho;
  set Carrinho(List<ItemDaSacolaStruct> value) {
    _Carrinho = value;
    secureStorage.setStringList(
        'ff_Carrinho', value.map((x) => x.serialize()).toList());
  }

  void deleteCarrinho() {
    secureStorage.delete(key: 'ff_Carrinho');
  }

  void addToCarrinho(ItemDaSacolaStruct value) {
    Carrinho.add(value);
    secureStorage.setStringList(
        'ff_Carrinho', _Carrinho.map((x) => x.serialize()).toList());
  }

  void removeFromCarrinho(ItemDaSacolaStruct value) {
    Carrinho.remove(value);
    secureStorage.setStringList(
        'ff_Carrinho', _Carrinho.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCarrinho(int index) {
    Carrinho.removeAt(index);
    secureStorage.setStringList(
        'ff_Carrinho', _Carrinho.map((x) => x.serialize()).toList());
  }

  void updateCarrinhoAtIndex(
    int index,
    ItemDaSacolaStruct Function(ItemDaSacolaStruct) updateFn,
  ) {
    Carrinho[index] = updateFn(_Carrinho[index]);
    secureStorage.setStringList(
        'ff_Carrinho', _Carrinho.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCarrinho(int index, ItemDaSacolaStruct value) {
    Carrinho.insert(index, value);
    secureStorage.setStringList(
        'ff_Carrinho', _Carrinho.map((x) => x.serialize()).toList());
  }

  SacolaStruct _Sacola = SacolaStruct();
  SacolaStruct get Sacola => _Sacola;
  set Sacola(SacolaStruct value) {
    _Sacola = value;
    secureStorage.setString('ff_Sacola', value.serialize());
  }

  void deleteSacola() {
    secureStorage.delete(key: 'ff_Sacola');
  }

  void updateSacolaStruct(Function(SacolaStruct) updateFn) {
    updateFn(_Sacola);
    secureStorage.setString('ff_Sacola', _Sacola.serialize());
  }

  double _TotalSacola = 0.0;
  double get TotalSacola => _TotalSacola;
  set TotalSacola(double value) {
    _TotalSacola = value;
    secureStorage.setDouble('ff_TotalSacola', value);
  }

  void deleteTotalSacola() {
    secureStorage.delete(key: 'ff_TotalSacola');
  }

  List<ItemAssandoStruct> _ItemAssandoFromFirebase = [];
  List<ItemAssandoStruct> get ItemAssandoFromFirebase =>
      _ItemAssandoFromFirebase;
  set ItemAssandoFromFirebase(List<ItemAssandoStruct> value) {
    _ItemAssandoFromFirebase = value;
  }

  void addToItemAssandoFromFirebase(ItemAssandoStruct value) {
    ItemAssandoFromFirebase.add(value);
  }

  void removeFromItemAssandoFromFirebase(ItemAssandoStruct value) {
    ItemAssandoFromFirebase.remove(value);
  }

  void removeAtIndexFromItemAssandoFromFirebase(int index) {
    ItemAssandoFromFirebase.removeAt(index);
  }

  void updateItemAssandoFromFirebaseAtIndex(
    int index,
    ItemAssandoStruct Function(ItemAssandoStruct) updateFn,
  ) {
    ItemAssandoFromFirebase[index] = updateFn(_ItemAssandoFromFirebase[index]);
  }

  void insertAtIndexInItemAssandoFromFirebase(
      int index, ItemAssandoStruct value) {
    ItemAssandoFromFirebase.insert(index, value);
  }

  List<ItemAssandoStruct> _itemAssando = [];
  List<ItemAssandoStruct> get itemAssando => _itemAssando;
  set itemAssando(List<ItemAssandoStruct> value) {
    _itemAssando = value;
  }

  void addToItemAssando(ItemAssandoStruct value) {
    itemAssando.add(value);
  }

  void removeFromItemAssando(ItemAssandoStruct value) {
    itemAssando.remove(value);
  }

  void removeAtIndexFromItemAssando(int index) {
    itemAssando.removeAt(index);
  }

  void updateItemAssandoAtIndex(
    int index,
    ItemAssandoStruct Function(ItemAssandoStruct) updateFn,
  ) {
    itemAssando[index] = updateFn(_itemAssando[index]);
  }

  void insertAtIndexInItemAssando(int index, ItemAssandoStruct value) {
    itemAssando.insert(index, value);
  }

  int _qdade = 0;
  int get qdade => _qdade;
  set qdade(int value) {
    _qdade = value;
  }

  DadosItensAssandoStruct _dadosItensAssando = DadosItensAssandoStruct();
  DadosItensAssandoStruct get dadosItensAssando => _dadosItensAssando;
  set dadosItensAssando(DadosItensAssandoStruct value) {
    _dadosItensAssando = value;
  }

  void updateDadosItensAssandoStruct(
      Function(DadosItensAssandoStruct) updateFn) {
    updateFn(_dadosItensAssando);
  }

  bool _isSaved = false;
  bool get isSaved => _isSaved;
  set isSaved(bool value) {
    _isSaved = value;
  }

  String _textoDigitadoGeneric = '';
  String get textoDigitadoGeneric => _textoDigitadoGeneric;
  set textoDigitadoGeneric(String value) {
    _textoDigitadoGeneric = value;
  }

  String _pedidoUserName = '';
  String get pedidoUserName => _pedidoUserName;
  set pedidoUserName(String value) {
    _pedidoUserName = value;
  }

  List<PedidosStruct> _ListaPedidosByDate = [];
  List<PedidosStruct> get ListaPedidosByDate => _ListaPedidosByDate;
  set ListaPedidosByDate(List<PedidosStruct> value) {
    _ListaPedidosByDate = value;
  }

  void addToListaPedidosByDate(PedidosStruct value) {
    ListaPedidosByDate.add(value);
  }

  void removeFromListaPedidosByDate(PedidosStruct value) {
    ListaPedidosByDate.remove(value);
  }

  void removeAtIndexFromListaPedidosByDate(int index) {
    ListaPedidosByDate.removeAt(index);
  }

  void updateListaPedidosByDateAtIndex(
    int index,
    PedidosStruct Function(PedidosStruct) updateFn,
  ) {
    ListaPedidosByDate[index] = updateFn(_ListaPedidosByDate[index]);
  }

  void insertAtIndexInListaPedidosByDate(int index, PedidosStruct value) {
    ListaPedidosByDate.insert(index, value);
  }

  List<dynamic> _novaLista = [];
  List<dynamic> get novaLista => _novaLista;
  set novaLista(List<dynamic> value) {
    _novaLista = value;
  }

  void addToNovaLista(dynamic value) {
    novaLista.add(value);
  }

  void removeFromNovaLista(dynamic value) {
    novaLista.remove(value);
  }

  void removeAtIndexFromNovaLista(int index) {
    novaLista.removeAt(index);
  }

  void updateNovaListaAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    novaLista[index] = updateFn(_novaLista[index]);
  }

  void insertAtIndexInNovaLista(int index, dynamic value) {
    novaLista.insert(index, value);
  }

  String _diaDaSemana = '';
  String get diaDaSemana => _diaDaSemana;
  set diaDaSemana(String value) {
    _diaDaSemana = value;
  }

  bool _isCadastro = false;
  bool get isCadastro => _isCadastro;
  set isCadastro(bool value) {
    _isCadastro = value;
  }

  bool _cadastroImg = false;
  bool get cadastroImg => _cadastroImg;
  set cadastroImg(bool value) {
    _cadastroImg = value;
  }

  final _categoriesManager = FutureRequestManager<List<CategoriasRecord>>();
  Future<List<CategoriasRecord>> categories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CategoriasRecord>> Function() requestFn,
  }) =>
      _categoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoriesCache() => _categoriesManager.clear();
  void clearCategoriesCacheKey(String? uniqueKey) =>
      _categoriesManager.clearRequest(uniqueKey);
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
