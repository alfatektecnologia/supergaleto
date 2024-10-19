import '/componentes/edit_qdade/edit_qdade_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'show_items_churrasqueira_widget.dart' show ShowItemsChurrasqueiraWidget;
import 'package:flutter/material.dart';

class ShowItemsChurrasqueiraModel
    extends FlutterFlowModel<ShowItemsChurrasqueiraWidget> {
  ///  Local state fields for this component.

  String? textQdade;

  String? fotoUrl;

  bool? isChecked;

  String? produtoName;

  ///  State fields for stateful widgets in this component.

  // Model for EditQdade component.
  late EditQdadeModel editQdadeModel;

  @override
  void initState(BuildContext context) {
    editQdadeModel = createModel(context, () => EditQdadeModel());
  }

  @override
  void dispose() {
    editQdadeModel.dispose();
  }
}
