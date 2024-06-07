import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sacola_widget.dart' show SacolaWidget;
import 'package:flutter/material.dart';

class SacolaModel extends FlutterFlowModel<SacolaWidget> {
  ///  Local state fields for this page.

  SacolaStruct? listaDeItens;
  void updateListaDeItensStruct(Function(SacolaStruct) updateFn) =>
      updateFn(listaDeItens ??= SacolaStruct());

  ItemDaSacolaStruct? item2delete;
  void updateItem2deleteStruct(Function(ItemDaSacolaStruct) updateFn) =>
      updateFn(item2delete ??= ItemDaSacolaStruct());

  int? nroPedido;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Sacola widget.
  int? countPedidos;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PedidosRecord? pedidoSalvo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
