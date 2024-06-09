import '/backend/backend.dart';
import '/components/edit_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'produto_card_listar_widget.dart' show ProdutoCardListarWidget;
import 'package:flutter/material.dart';

class ProdutoCardListarModel extends FlutterFlowModel<ProdutoCardListarWidget> {
  ///  Local state fields for this component.

  String? labelNomeProduto;

  String? hintNomeProduto = 'Nome do produto';

  String? textoFromTextfield;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for EdProdutoName.
  late EditComponentModel edProdutoNameModel;
  // Model for EdDiscricao.
  late EditComponentModel edDiscricaoModel;
  // Model for EdValorCompra.
  late EditComponentModel edValorCompraModel;
  // Model for EdValorVenda.
  late EditComponentModel edValorVendaModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProdutosRecord? productSavedToFirebase;

  @override
  void initState(BuildContext context) {
    edProdutoNameModel = createModel(context, () => EditComponentModel());
    edDiscricaoModel = createModel(context, () => EditComponentModel());
    edValorCompraModel = createModel(context, () => EditComponentModel());
    edValorVendaModel = createModel(context, () => EditComponentModel());
  }

  @override
  void dispose() {
    edProdutoNameModel.dispose();
    edDiscricaoModel.dispose();
    edValorCompraModel.dispose();
    edValorVendaModel.dispose();
  }
}
