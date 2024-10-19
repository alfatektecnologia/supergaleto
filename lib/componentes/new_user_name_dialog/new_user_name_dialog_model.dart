import '/flutter_flow/flutter_flow_util.dart';
import 'new_user_name_dialog_widget.dart' show NewUserNameDialogWidget;
import 'package:flutter/material.dart';

class NewUserNameDialogModel extends FlutterFlowModel<NewUserNameDialogWidget> {
  ///  Local state fields for this component.

  String? novaNome = 'Nome?';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TxfNewName widget.
  FocusNode? txfNewNameFocusNode;
  TextEditingController? txfNewNameTextController;
  String? Function(BuildContext, String?)? txfNewNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txfNewNameFocusNode?.dispose();
    txfNewNameTextController?.dispose();
  }
}
