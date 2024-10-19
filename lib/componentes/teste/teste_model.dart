import '/flutter_flow/flutter_flow_util.dart';
import 'teste_widget.dart' show TesteWidget;
import 'package:flutter/material.dart';

class TesteModel extends FlutterFlowModel<TesteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TexQdade widget.
  FocusNode? texQdadeFocusNode;
  TextEditingController? texQdadeTextController;
  String? Function(BuildContext, String?)? texQdadeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    texQdadeFocusNode?.dispose();
    texQdadeTextController?.dispose();
  }
}
