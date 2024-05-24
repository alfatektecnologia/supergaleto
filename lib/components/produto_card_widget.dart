import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/edit_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'produto_card_model.dart';
export 'produto_card_model.dart';

class ProdutoCardWidget extends StatefulWidget {
  const ProdutoCardWidget({
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
    required this.btSalvar,
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
  final Future Function(bool onClick)? btSalvar;
  final int nroLinhas2;

  @override
  State<ProdutoCardWidget> createState() => _ProdutoCardWidgetState();
}

class _ProdutoCardWidgetState extends State<ProdutoCardWidget> {
  late ProdutoCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdutoCardModel());
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
      height: MediaQuery.sizeOf(context).height * 0.741,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SingleChildScrollView(
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
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                      allowVideo: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }

                    setState(() {
                      _model.imgeUrl = _model.imgeUrl;
                    });
                    await actions.saveToFirestore(
                      context,
                      _model.imgeUrl,
                    );
                    setState(() {
                      FFAppState().updateProdutoStruct(
                        (e) => e..fotoUrl = widget.imageUrl,
                      );
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          FFAppState().photoProdutoUrl,
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: const Color(0xFF0F3CF2),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.memory(
                      _model.imgeUrl?.bytes ?? Uint8List.fromList([]),
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
                        setState(() {
                          _model.textoFromTextfield = texto2callback;
                        });
                        setState(() {
                          FFAppState().updateProdutoStruct(
                            (e) => e..nome = texto2callback,
                          );
                        });
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
                        setState(() {
                          _model.textoFromTextfield = texto2callback;
                        });
                        setState(() {
                          FFAppState().updateProdutoStruct(
                            (e) => e..descricao = texto2callback,
                          );
                        });
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
                        setState(() {
                          _model.textoFromTextfield = texto2callback;
                        });
                        setState(() {
                          FFAppState().updateProdutoStruct(
                            (e) => e..valor = double.parse(texto2callback),
                          );
                        });
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
                        setState(() {
                          _model.textoFromTextfield = texto2callback;
                        });
                        setState(() {
                          FFAppState().updateProdutoStruct(
                            (e) => e..valorVenda = double.parse(texto2callback),
                          );
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 36.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var produtosRecordReference =
                            ProdutosRecord.collection.doc();
                        await produtosRecordReference
                            .set(createProdutosRecordData(
                          name: FFAppState().Produto.nome,
                          description: FFAppState().Produto.descricao,
                          createdAt: getCurrentTimestamp,
                          onSale: true,
                          price: FFAppState().Produto.valor,
                          salePrice: FFAppState().Produto.valorVenda,
                        ));
                        _model.produtoToFirestore =
                            ProdutosRecord.getDocumentFromData(
                                createProdutosRecordData(
                                  name: FFAppState().Produto.nome,
                                  description: FFAppState().Produto.descricao,
                                  createdAt: getCurrentTimestamp,
                                  onSale: true,
                                  price: FFAppState().Produto.valor,
                                  salePrice: FFAppState().Produto.valorVenda,
                                ),
                                produtosRecordReference);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Saved',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: const Color(0xFF0930F4),
                          ),
                        );

                        setState(() {});
                      },
                      text: 'SALVAR',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
