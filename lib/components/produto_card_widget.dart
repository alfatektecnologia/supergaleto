import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/edit_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
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
      height: MediaQuery.sizeOf(context).height * 0.827,
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
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading1 = true);
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
                        _model.isDataUploading1 = false;
                      }
                      if (selectedUploadedFiles.length ==
                          selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile1 =
                              selectedUploadedFiles.first;
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
                    child: Image.memory(
                      _model.uploadedLocalFile1.bytes ?? Uint8List.fromList([]),
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: FutureBuilder<List<CategoriasRecord>>(
                      future: FFAppState().categories(
                        requestFn: () => queryCategoriasRecordOnce(
                          queryBuilder: (categoriasRecord) =>
                              categoriasRecord.orderBy('nome'),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<CategoriasRecord> dropDownCategoriasRecordList =
                            snapshot.data!;
                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(null),
                          options: dropDownCategoriasRecordList
                              .map((e) => e.nome)
                              .toList()
                              .sortedList((e) => e),
                          onChanged: (val) async {
                            setState(() => _model.dropDownValue = val);
                            FFAppState().updateProdutoStruct(
                              (e) => e..categoria = _model.dropDownValue,
                            );
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  _model.dropDownValue!,
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor: const Color(0xFF8316CC),
                              ),
                            );
                          },
                          width: 300.0,
                          height: 56.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Selecione uma categoria...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 36.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // Confirmação para salvar
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Alerta'),
                                  content: const Text(
                                      'Todos os dados estão corretos para serem salvos?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: const Text('Confirmar'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          // Salva no firestore
                          {
                            setState(() => _model.isDataUploading2 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var selectedFiles = <SelectedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles =
                                  _model.uploadedLocalFile1.bytes!.isNotEmpty
                                      ? [_model.uploadedLocalFile1]
                                      : <FFUploadedFile>[];
                              selectedFiles = selectedFilesFromUploadedFiles(
                                selectedUploadedFiles,
                              );
                              downloadUrls = (await Future.wait(
                                selectedFiles.map(
                                  (f) async =>
                                      await uploadData(f.storagePath, f.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              _model.isDataUploading2 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedFiles.length &&
                                downloadUrls.length == selectedFiles.length) {
                              setState(() {
                                _model.uploadedLocalFile2 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl2 = downloadUrls.first;
                              });
                            } else {
                              setState(() {});
                              return;
                            }
                          }

                          // Get url and prepare produto
                          FFAppState().photoProdutoUrl =
                              _model.uploadedFileUrl2;
                          FFAppState().updateProdutoStruct(
                            (e) => e
                              ..fotoUrl = _model.uploadedFileUrl2
                              ..nome =
                                  _model.edProdutoNameModel.textController.text
                              ..descricao =
                                  _model.edDiscricaoModel.textController.text
                              ..valor = double.parse(
                                  _model.edValorCompraModel.textController.text)
                              ..valorVenda = double.parse(
                                  _model.edValorVendaModel.textController.text),
                          );
                          setState(() {});
                          // Save product to firebase

                          var produtosRecordReference =
                              ProdutosRecord.collection.doc();
                          await produtosRecordReference
                              .set(createProdutosRecordData(
                            name: FFAppState().Produto.nome,
                            description: FFAppState().Produto.descricao,
                            price: FFAppState().Produto.valor,
                            createdAt: getCurrentTimestamp,
                            onSale: true,
                            salePrice: FFAppState().Produto.valorVenda,
                            photoUrl: FFAppState().photoProdutoUrl,
                            categoria: FFAppState().Produto.categoria,
                          ));
                          _model.productSavedToFirebase =
                              ProdutosRecord.getDocumentFromData(
                                  createProdutosRecordData(
                                    name: FFAppState().Produto.nome,
                                    description: FFAppState().Produto.descricao,
                                    price: FFAppState().Produto.valor,
                                    createdAt: getCurrentTimestamp,
                                    onSale: true,
                                    salePrice: FFAppState().Produto.valorVenda,
                                    photoUrl: FFAppState().photoProdutoUrl,
                                    categoria: FFAppState().Produto.categoria,
                                  ),
                                  produtosRecordReference);
                          // Elimina dados
                          setState(() {
                            _model.isDataUploading2 = false;
                            _model.uploadedLocalFile2 =
                                FFUploadedFile(bytes: Uint8List.fromList([]));
                            _model.uploadedFileUrl2 = '';
                          });

                          // Elimina outro dado
                          setState(() {
                            _model.isDataUploading1 = false;
                            _model.uploadedLocalFile1 =
                                FFUploadedFile(bytes: Uint8List.fromList([]));
                          });

                          // Limpa campos de textos
                          setState(() {
                            _model.edProdutoNameModel.textController?.clear();
                            _model.edDiscricaoModel.textController?.clear();
                            _model.edValorCompraModel.textController?.clear();
                            _model.edValorVendaModel.textController?.clear();
                          });
                        }

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
