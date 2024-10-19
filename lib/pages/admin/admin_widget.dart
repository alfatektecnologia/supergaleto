import '/backend/backend.dart';
import '/componentes/edit_generico/edit_generico_widget.dart';
import '/componentes/produto_card/produto_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'admin_model.dart';
export 'admin_model.dart';

class AdminWidget extends StatefulWidget {
  const AdminWidget({super.key});

  @override
  State<AdminWidget> createState() => _AdminWidgetState();
}

class _AdminWidgetState extends State<AdminWidget> {
  late AdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().photoFromFirebase =
          'https://firebasestorage.googleapis.com/v0/b/supergaletto-39fa9.appspot.com/o/users%2FnBL82S7N8vanmHeuj8pMB3AC3nf2%2Fuploads%2Ffoto_padr%C3%A3o.jpg?alt=media&token=acd56d4c-9622-44c4-95b4-263c02bbd61d';
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        appBar: AppBar(
          backgroundColor: const Color(0xFF495961),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 30.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Administração',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('Churrasqueira');
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.store,
                    color: Color(0xFF60EE7D),
                    size: 24.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 24.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Alerta'),
                            content:
                                const Text('Deseja realmente sair do aplicativo?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: const Text('Confirmar'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    await actions.closeApp(
                      context,
                    );
                  }
                },
                child: Icon(
                  Icons.logout_sharp,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Produtos',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterFlowRadioButton(
                        options: ['Cadastrar', 'Listar', 'Promoção'].toList(),
                        onChanged: (val) async {
                          safeSetState(() {});
                          FFAppState().isCadastro =
                              !(FFAppState().isCadastro ?? true);
                          safeSetState(() {});
                        },
                        controller: _model.radioButtonValueController ??=
                            FormFieldController<String>(null),
                        optionHeight: 32.0,
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        selectedTextStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.horizontal,
                        radioButtonColor: FlutterFlowTheme.of(context).primary,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                    ],
                  ),
                ),
                if (FFAppState().isCadastro == true)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: wrapWithModel(
                        model: _model.produtoCardModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: ProdutoCardWidget(
                          imageUrl: FFAppState().imageFromGallery == '\"\"'
                              ? 'https://firebasestorage.googleapis.com/v0/b/supergaletto-39fa9.appspot.com/o/users%2FnBL82S7N8vanmHeuj8pMB3AC3nf2%2Fuploads%2Ffoto_padr%C3%A3o.jpg?alt=media&token=acd56d4c-9622-44c4-95b4-263c02bbd61d'
                              : FFAppState().photoFromFirebase,
                          label1: 'Nome',
                          hint1: 'nome do produto',
                          label2: 'Descrição',
                          hint2: 'Descrição do produto',
                          label4: 'Preço de venda',
                          hint4: 'Preço de venda',
                          label3: 'Preço de compra',
                          hint3: 'Preço de compra',
                          nroLinhas2: 4,
                          btSalvar: (onClick) async {},
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().isCadastro == false)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: StreamBuilder<List<ProdutosRecord>>(
                      stream: queryProdutosRecord(),
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
                        List<ProdutosRecord> listViewProdutosRecordList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewProdutosRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewProdutosRecord =
                                listViewProdutosRecordList[listViewIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          listViewProdutosRecord.photoUrl,
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: EditGenericoWidget(
                                              key: Key(
                                                  'Keyl8r_${listViewIndex}_of_${listViewProdutosRecordList.length}'),
                                              label: 'Nome',
                                              hint: listViewProdutosRecord.name,
                                              textoDigitado:
                                                  (inputTextoGeneric) async {
                                                FFAppState()
                                                    .updateProdutoStruct(
                                                  (e) => e
                                                    ..nome = inputTextoGeneric
                                                    ..descricao =
                                                        listViewProdutosRecord
                                                            .description
                                                    ..valor =
                                                        listViewProdutosRecord
                                                            .price
                                                    ..isAtivo =
                                                        listViewProdutosRecord
                                                            .onSale
                                                    ..valorVenda =
                                                        listViewProdutosRecord
                                                            .salePrice,
                                                );
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: EditGenericoWidget(
                                              key: Key(
                                                  'Keyk26_${listViewIndex}_of_${listViewProdutosRecordList.length}'),
                                              label: 'Descrição',
                                              hint: listViewProdutosRecord
                                                  .description,
                                              textoDigitado:
                                                  (inputTextoGeneric) async {
                                                FFAppState()
                                                    .updateProdutoStruct(
                                                  (e) => e
                                                    ..nome =
                                                        listViewProdutosRecord
                                                            .name
                                                    ..descricao =
                                                        inputTextoGeneric
                                                    ..valor =
                                                        listViewProdutosRecord
                                                            .price
                                                    ..isAtivo =
                                                        listViewProdutosRecord
                                                            .onSale
                                                    ..valorVenda =
                                                        listViewProdutosRecord
                                                            .salePrice,
                                                );
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: EditGenericoWidget(
                                              key: Key(
                                                  'Keyf18_${listViewIndex}_of_${listViewProdutosRecordList.length}'),
                                              label: 'Valor de custo',
                                              hint: listViewProdutosRecord.price
                                                  .toString(),
                                              textoDigitado:
                                                  (inputTextoGeneric) async {
                                                FFAppState()
                                                    .updateProdutoStruct(
                                                  (e) => e
                                                    ..nome =
                                                        listViewProdutosRecord
                                                            .name
                                                    ..descricao =
                                                        listViewProdutosRecord
                                                            .description
                                                    ..valor = double.parse(
                                                        (inputTextoGeneric!))
                                                    ..isAtivo =
                                                        listViewProdutosRecord
                                                            .onSale
                                                    ..valorVenda =
                                                        listViewProdutosRecord
                                                            .salePrice,
                                                );
                                                safeSetState(() {});
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      inputTextoGeneric!,
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFFD2D8E7),
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: EditGenericoWidget(
                                              key: Key(
                                                  'Key5op_${listViewIndex}_of_${listViewProdutosRecordList.length}'),
                                              label: 'Valor de venda',
                                              hint: listViewProdutosRecord
                                                  .salePrice
                                                  .toString(),
                                              textoDigitado:
                                                  (inputTextoGeneric) async {
                                                FFAppState()
                                                    .updateProdutoStruct(
                                                  (e) => e
                                                    ..nome =
                                                        listViewProdutosRecord
                                                            .name
                                                    ..descricao =
                                                        listViewProdutosRecord
                                                            .description
                                                    ..valor =
                                                        listViewProdutosRecord
                                                            .price
                                                    ..isAtivo =
                                                        listViewProdutosRecord
                                                            .onSale
                                                    ..valorVenda = double.parse(
                                                        (inputTextoGeneric!)),
                                                );
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Theme(
                                            data: ThemeData(
                                              checkboxTheme: CheckboxThemeData(
                                                visualDensity:
                                                    VisualDensity.compact,
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              unselectedWidgetColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            child: Checkbox(
                                              value: _model.checkboxValueMap[
                                                      listViewProdutosRecord] ??=
                                                  true,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                            .checkboxValueMap[
                                                        listViewProdutosRecord] =
                                                    newValue!);

                                                if (!newValue!) {
                                                  FFAppState().Produto =
                                                      ProdutoStruct(
                                                    isAtivo: false,
                                                  );
                                                  safeSetState(() {});
                                                }
                                              },
                                              side: BorderSide(
                                                width: 2,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          ),
                                          Text(
                                            'produto disponível',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          FFAppState()
                                                              .textoDigitadoGeneric,
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            const Color(0xFFC3CBE8),
                                                      ),
                                                    );

                                                    await listViewProdutosRecord
                                                        .reference
                                                        .update(
                                                            createProdutosRecordData(
                                                      name: FFAppState()
                                                          .Produto
                                                          .nome,
                                                      description: FFAppState()
                                                          .Produto
                                                          .descricao,
                                                      price: FFAppState()
                                                          .Produto
                                                          .valor,
                                                      modifiedAt:
                                                          getCurrentTimestamp,
                                                      onSale: _model
                                                              .checkboxValueMap[
                                                          listViewProdutosRecord],
                                                      salePrice: FFAppState()
                                                          .Produto
                                                          .valorVenda,
                                                    ));
                                                  },
                                                  text: 'Atualizar',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
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
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
