import '/flutter_flow/flutter_flow_util.dart';
import 'edit_qdade_widget.dart' show EditQdadeWidget;
import 'package:flutter/material.dart';

class EditQdadeModel extends FlutterFlowModel<EditQdadeWidget> {
  ///  Local state fields for this component.

  String? textoQdade;

  ///  State fields for stateful widgets in this component.

  // State field(s) for EdtQdaddeFrango widget.
  FocusNode? edtQdaddeFrangoFocusNode;
  TextEditingController? edtQdaddeFrangoTextController;
  String? Function(BuildContext, String?)?
      edtQdaddeFrangoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    edtQdaddeFrangoFocusNode?.dispose();
    edtQdaddeFrangoTextController?.dispose();
  }
}
