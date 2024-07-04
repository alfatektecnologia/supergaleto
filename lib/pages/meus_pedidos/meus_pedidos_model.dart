import '/flutter_flow/flutter_flow_util.dart';
import 'meus_pedidos_widget.dart' show MeusPedidosWidget;
import 'package:flutter/material.dart';

class MeusPedidosModel extends FlutterFlowModel<MeusPedidosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
