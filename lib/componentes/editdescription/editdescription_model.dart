import '/flutter_flow/flutter_flow_util.dart';
import 'editdescription_widget.dart' show EditdescriptionWidget;
import 'package:flutter/material.dart';

class EditdescriptionModel extends FlutterFlowModel<EditdescriptionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtDescription widget.
  FocusNode? txtDescriptionFocusNode;
  TextEditingController? txtDescriptionTextController;
  String? Function(BuildContext, String?)?
      txtDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtDescriptionFocusNode?.dispose();
    txtDescriptionTextController?.dispose();
  }
}
