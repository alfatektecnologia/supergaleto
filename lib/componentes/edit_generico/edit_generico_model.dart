import '/flutter_flow/flutter_flow_util.dart';
import 'edit_generico_widget.dart' show EditGenericoWidget;
import 'package:flutter/material.dart';

class EditGenericoModel extends FlutterFlowModel<EditGenericoWidget> {
  ///  Local state fields for this component.

  String? textoDigitado = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for EditexGenerico widget.
  FocusNode? editexGenericoFocusNode;
  TextEditingController? editexGenericoTextController;
  String? Function(BuildContext, String?)?
      editexGenericoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    editexGenericoFocusNode?.dispose();
    editexGenericoTextController?.dispose();
  }
}
