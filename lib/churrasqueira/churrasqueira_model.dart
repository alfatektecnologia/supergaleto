import '/flutter_flow/flutter_flow_util.dart';
import 'churrasqueira_widget.dart' show ChurrasqueiraWidget;
import 'package:flutter/material.dart';

class ChurrasqueiraModel extends FlutterFlowModel<ChurrasqueiraWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for EdtQdaddeFrango widget.
  FocusNode? edtQdaddeFrangoFocusNode;
  TextEditingController? edtQdaddeFrangoTextController;
  String? Function(BuildContext, String?)?
      edtQdaddeFrangoTextControllerValidator;
  // State field(s) for EdtQdadeCoxa widget.
  FocusNode? edtQdadeCoxaFocusNode;
  TextEditingController? edtQdadeCoxaTextController;
  String? Function(BuildContext, String?)? edtQdadeCoxaTextControllerValidator;
  // State field(s) for EdtQdadePernil widget.
  FocusNode? edtQdadePernilFocusNode;
  TextEditingController? edtQdadePernilTextController;
  String? Function(BuildContext, String?)?
      edtQdadePernilTextControllerValidator;
  // State field(s) for EdtQdadePanceta widget.
  FocusNode? edtQdadePancetaFocusNode;
  TextEditingController? edtQdadePancetaTextController;
  String? Function(BuildContext, String?)?
      edtQdadePancetaTextControllerValidator;
  // State field(s) for EdtQdadeJoelho widget.
  FocusNode? edtQdadeJoelhoFocusNode;
  TextEditingController? edtQdadeJoelhoTextController;
  String? Function(BuildContext, String?)?
      edtQdadeJoelhoTextControllerValidator;
  // State field(s) for EdtQdadeFraldinha widget.
  FocusNode? edtQdadeFraldinhaFocusNode;
  TextEditingController? edtQdadeFraldinhaTextController;
  String? Function(BuildContext, String?)?
      edtQdadeFraldinhaTextControllerValidator;
  // State field(s) for EdtQdadeCupim widget.
  FocusNode? edtQdadeCupimFocusNode;
  TextEditingController? edtQdadeCupimTextController;
  String? Function(BuildContext, String?)? edtQdadeCupimTextControllerValidator;
  // State field(s) for EdtQdadCostelinha widget.
  FocusNode? edtQdadCostelinhaFocusNode;
  TextEditingController? edtQdadCostelinhaTextController;
  String? Function(BuildContext, String?)?
      edtQdadCostelinhaTextControllerValidator;
  // State field(s) for EdtQdadeCostela widget.
  FocusNode? edtQdadeCostelaFocusNode;
  TextEditingController? edtQdadeCostelaTextController;
  String? Function(BuildContext, String?)?
      edtQdadeCostelaTextControllerValidator;
  // State field(s) for EdtQdadeMaionese widget.
  FocusNode? edtQdadeMaioneseFocusNode;
  TextEditingController? edtQdadeMaioneseTextController;
  String? Function(BuildContext, String?)?
      edtQdadeMaioneseTextControllerValidator;
  // State field(s) for EdtQdadeFarofa widget.
  FocusNode? edtQdadeFarofaFocusNode;
  TextEditingController? edtQdadeFarofaTextController;
  String? Function(BuildContext, String?)?
      edtQdadeFarofaTextControllerValidator;
  // State field(s) for EdtQdadeSalpicao widget.
  FocusNode? edtQdadeSalpicaoFocusNode;
  TextEditingController? edtQdadeSalpicaoTextController;
  String? Function(BuildContext, String?)?
      edtQdadeSalpicaoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    edtQdaddeFrangoFocusNode?.dispose();
    edtQdaddeFrangoTextController?.dispose();

    edtQdadeCoxaFocusNode?.dispose();
    edtQdadeCoxaTextController?.dispose();

    edtQdadePernilFocusNode?.dispose();
    edtQdadePernilTextController?.dispose();

    edtQdadePancetaFocusNode?.dispose();
    edtQdadePancetaTextController?.dispose();

    edtQdadeJoelhoFocusNode?.dispose();
    edtQdadeJoelhoTextController?.dispose();

    edtQdadeFraldinhaFocusNode?.dispose();
    edtQdadeFraldinhaTextController?.dispose();

    edtQdadeCupimFocusNode?.dispose();
    edtQdadeCupimTextController?.dispose();

    edtQdadCostelinhaFocusNode?.dispose();
    edtQdadCostelinhaTextController?.dispose();

    edtQdadeCostelaFocusNode?.dispose();
    edtQdadeCostelaTextController?.dispose();

    edtQdadeMaioneseFocusNode?.dispose();
    edtQdadeMaioneseTextController?.dispose();

    edtQdadeFarofaFocusNode?.dispose();
    edtQdadeFarofaTextController?.dispose();

    edtQdadeSalpicaoFocusNode?.dispose();
    edtQdadeSalpicaoTextController?.dispose();
  }
}
