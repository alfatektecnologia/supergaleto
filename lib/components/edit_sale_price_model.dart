import '/flutter_flow/flutter_flow_util.dart';
import 'edit_sale_price_widget.dart' show EditSalePriceWidget;
import 'package:flutter/material.dart';

class EditSalePriceModel extends FlutterFlowModel<EditSalePriceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtSalesPrice widget.
  FocusNode? txtSalesPriceFocusNode;
  TextEditingController? txtSalesPriceTextController;
  String? Function(BuildContext, String?)? txtSalesPriceTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtSalesPriceFocusNode?.dispose();
    txtSalesPriceTextController?.dispose();
  }
}
