import '/flutter_flow/flutter_flow_util.dart';
import 'new_qttyt_dialog_widget.dart' show NewQttytDialogWidget;
import 'package:flutter/material.dart';

class NewQttytDialogModel extends FlutterFlowModel<NewQttytDialogWidget> {
  ///  Local state fields for this component.

  String? novaQdade = 'qdade?';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TxfNewQtty widget.
  FocusNode? txfNewQttyFocusNode;
  TextEditingController? txfNewQttyTextController;
  String? Function(BuildContext, String?)? txfNewQttyTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txfNewQttyFocusNode?.dispose();
    txfNewQttyTextController?.dispose();
  }
}
