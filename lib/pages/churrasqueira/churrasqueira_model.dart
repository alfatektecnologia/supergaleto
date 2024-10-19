import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'churrasqueira_widget.dart' show ChurrasqueiraWidget;
import 'package:flutter/material.dart';

class ChurrasqueiraModel extends FlutterFlowModel<ChurrasqueiraWidget> {
  ///  Local state fields for this page.

  String? dataVenda;

  double? totalVendasByDay;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Checkbox widget.
  Map<PedidosRecord, bool> checkboxValueMap = {};
  List<PedidosRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PedidosRecord>? pedidosByDate;
  // Stores action output result for [Custom Action - getTotal] action in Button widget.
  double? totalFromFirebase;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
