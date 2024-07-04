import '/componentes/edit_component/edit_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'produto_card_listar_model.dart';
export 'produto_card_listar_model.dart';

class ProdutoCardListarWidget extends StatefulWidget {
  const ProdutoCardListarWidget({
    super.key,
    required this.imageUrl,
    String? label1,
    String? hint1,
    String? label2,
    String? hint2,
    String? label4,
    String? hint4,
    String? label3,
    String? hint3,
    int? nroLinhas2,
  })  : label1 = label1 ?? 'Nome do produto',
        hint1 = hint1 ?? 'Digite o nome do produto',
        label2 = label2 ?? 'label2',
        hint2 = hint2 ?? 'hint2',
        label4 = label4 ?? 'label4',
        hint4 = hint4 ?? 'hint4',
        label3 = label3 ?? 'label3',
        hint3 = hint3 ?? 'hint3',
        nroLinhas2 = nroLinhas2 ?? 1;

  final String? imageUrl;
  final String label1;
  final String hint1;
  final String label2;
  final String hint2;
  final String label4;
  final String hint4;
  final String label3;
  final String hint3;
  final int nroLinhas2;

  @override
  State<ProdutoCardListarWidget> createState() =>
      _ProdutoCardListarWidgetState();
}

class _ProdutoCardListarWidgetState extends State<ProdutoCardListarWidget> {
  late ProdutoCardListarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdutoCardListarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.004,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: Container(
              width: 300.0,
              height: 234.0,
              decoration: const BoxDecoration(),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                    context: context,
                    allowPhoto: true,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    setState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    try {
                      showUploadMessage(
                        context,
                        'Uploading file...',
                        showLoading: true,
                      );
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                      });
                      showUploadMessage(context, 'Success!');
                    } else {
                      setState(() {});
                      showUploadMessage(context, 'Failed to upload data');
                      return;
                    }
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    '${widget.imageUrl}',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                wrapWithModel(
                  model: _model.edProdutoNameModel,
                  updateCallback: () => setState(() {}),
                  child: EditComponentWidget(
                    label: widget.label1,
                    hint: widget.hint1,
                    icon: (onClick) async {},
                    texto: (texto2callback) async {
                      _model.textoFromTextfield = texto2callback;
                      setState(() {});
                      FFAppState().updateProdutoStruct(
                        (e) => e..nome = texto2callback,
                      );
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            texto2callback,
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: const Color(0xFF0937F2),
                        ),
                      );
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.edDiscricaoModel,
                  updateCallback: () => setState(() {}),
                  child: EditComponentWidget(
                    label: widget.label2,
                    hint: widget.hint2,
                    icon: (onClick) async {},
                    texto: (texto2callback) async {
                      _model.textoFromTextfield = texto2callback;
                      setState(() {});
                      FFAppState().updateProdutoStruct(
                        (e) => e..descricao = texto2callback,
                      );
                      setState(() {});
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.edValorCompraModel,
                  updateCallback: () => setState(() {}),
                  child: EditComponentWidget(
                    label: widget.label3,
                    hint: widget.hint3,
                    icon: (onClick) async {},
                    texto: (texto2callback) async {
                      _model.textoFromTextfield = texto2callback;
                      setState(() {});
                      FFAppState().updateProdutoStruct(
                        (e) => e..valor = double.parse(texto2callback),
                      );
                      setState(() {});
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.edValorVendaModel,
                  updateCallback: () => setState(() {}),
                  child: EditComponentWidget(
                    label: widget.label4,
                    hint: widget.hint4,
                    icon: (onClick) async {},
                    texto: (texto2callback) async {
                      _model.textoFromTextfield = texto2callback;
                      setState(() {});
                      FFAppState().updateProdutoStruct(
                        (e) => e..valorVenda = double.parse(texto2callback),
                      );
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
