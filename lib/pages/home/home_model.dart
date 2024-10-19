import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  String? categoria = 'Aves';

  List<ProdutosRecord> initialSettings = [];
  void addToInitialSettings(ProdutosRecord item) => initialSettings.add(item);
  void removeFromInitialSettings(ProdutosRecord item) =>
      initialSettings.remove(item);
  void removeAtIndexFromInitialSettings(int index) =>
      initialSettings.removeAt(index);
  void insertAtIndexInInitialSettings(int index, ProdutosRecord item) =>
      initialSettings.insert(index, item);
  void updateInitialSettingsAtIndex(
          int index, Function(ProdutosRecord) updateFn) =>
      initialSettings[index] = updateFn(initialSettings[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Home widget.
  UsersRecord? checkAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in Home widget.
  List<ProdutosRecord>? initialSetAves;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, CategoriasRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProdutosRecord>? resultProdByCategory;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    for (var s in listViewStreamSubscriptions1) {
      s?.cancel();
    }
    listViewPagingController1?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CategoriasRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, CategoriasRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, CategoriasRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCategoriasRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
