import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'churrasqueira_widget.dart' show ChurrasqueiraWidget;
import 'package:flutter/material.dart';

class ChurrasqueiraModel extends FlutterFlowModel<ChurrasqueiraWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Checkbox widget.
  Map<ProdutosRecord, bool> checkboxValueMap1 = {};
  List<ProdutosRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.
  Map<PedidosRecord, bool> checkboxValueMap2 = {};
  List<PedidosRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
