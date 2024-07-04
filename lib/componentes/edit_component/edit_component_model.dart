import '/flutter_flow/flutter_flow_util.dart';
import 'edit_component_widget.dart' show EditComponentWidget;
import 'package:flutter/material.dart';

class EditComponentModel extends FlutterFlowModel<EditComponentWidget> {
  ///  Local state fields for this component.

  String? textoDigitado;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
