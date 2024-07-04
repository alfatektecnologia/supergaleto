import '/flutter_flow/flutter_flow_util.dart';
import 'edit_price_widget.dart' show EditPriceWidget;
import 'package:flutter/material.dart';

class EditPriceModel extends FlutterFlowModel<EditPriceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtPrice widget.
  FocusNode? txtPriceFocusNode;
  TextEditingController? txtPriceTextController;
  String? Function(BuildContext, String?)? txtPriceTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtPriceFocusNode?.dispose();
    txtPriceTextController?.dispose();
  }
}
