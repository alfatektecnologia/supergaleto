import '/components/produto_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_widget.dart' show AdminWidget;
import 'package:flutter/material.dart';

class AdminModel extends FlutterFlowModel<AdminWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for produtoCard component.
  late ProdutoCardModel produtoCardModel;

  @override
  void initState(BuildContext context) {
    produtoCardModel = createModel(context, () => ProdutoCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    produtoCardModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
