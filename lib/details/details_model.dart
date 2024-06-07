import '/components/display_total_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'details_widget.dart' show DetailsWidget;
import 'package:flutter/material.dart';

class DetailsModel extends FlutterFlowModel<DetailsWidget> {
  ///  Local state fields for this page.

  double? valueItemSacola;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;

  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // Model for DisplayTotal component.
  late DisplayTotalModel displayTotalModel;

  @override
  void initState(BuildContext context) {
    displayTotalModel = createModel(context, () => DisplayTotalModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    displayTotalModel.dispose();
  }
}
