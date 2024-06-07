import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/display_total_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'details_model.dart';
export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    super.key,
    required this.produto,
  });

  final ProdutosRecord? produto;

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Detalhe do produto',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await actions.closeApp(
                    context,
                  );
                },
                child: Icon(
                  Icons.logout_rounded,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: 441.0,
                              height: 219.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondary,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  bottomRight: Radius.circular(100.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 4.0,
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 10.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(100.0),
                                    bottomRight: Radius.circular(100.0),
                                    topLeft: Radius.circular(100.0),
                                    topRight: Radius.circular(100.0),
                                  ),
                                  child: Image.network(
                                    '${widget.produto?.photoUrl}',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                    alignment: const Alignment(0.0, 0.0),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 100.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Descrição',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      width: 159.0,
                                      height: 41.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 160.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: FlutterFlowCountController(
                                                decrementIconBuilder:
                                                    (enabled) => FaIcon(
                                                  FontAwesomeIcons.minus,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 20.0,
                                                ),
                                                incrementIconBuilder:
                                                    (enabled) => FaIcon(
                                                  FontAwesomeIcons.plus,
                                                  color: enabled
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  size: 20.0,
                                                ),
                                                countBuilder: (count) => Text(
                                                  count.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                count: _model
                                                    .countControllerValue ??= 1,
                                                updateCount: (count) async {
                                                  setState(() => _model
                                                          .countControllerValue =
                                                      count);
                                                  await widget
                                                      .produto!.reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'qdade': FieldValue
                                                            .increment(-(_model
                                                                .countControllerValue!)),
                                                      },
                                                    ),
                                                  });
                                                },
                                                stepSize: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 8.0),
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        widget.produto?.description,
                        '\"\"',
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
              if (widget.produto?.name == 'Frango')
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: FlutterFlowCheckboxGroup(
                    options: const ['Sem batatas', 'Bem moreninho', 'Tamanho médio'],
                    onChanged: (val) =>
                        setState(() => _model.checkboxGroupValues = val),
                    controller: _model.checkboxGroupValueController ??=
                        FormFieldController<List<String>>(
                      [],
                    ),
                    activeColor: FlutterFlowTheme.of(context).secondaryText,
                    checkColor: FlutterFlowTheme.of(context).info,
                    checkboxBorderColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                        ),
                    checkboxBorderRadius: BorderRadius.circular(4.0),
                    initialized: _model.checkboxGroupValues != null,
                  ),
                ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 24.0),
                    child: Container(
                      width: 388.0,
                      height: 63.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Valor',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  wrapWithModel(
                                    model: _model.displayTotalModel,
                                    updateCallback: () => setState(() {}),
                                    child: DisplayTotalWidget(
                                      parameter1: widget.produto?.salePrice,
                                      parameter2: _model.countControllerValue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.countControllerValue! > 0) {
                                    // Calc value of item x qty
                                    _model.valueItemSacola =
                                        widget.produto!.salePrice *
                                            (_model.countControllerValue!);
                                    setState(() {});
                                    // update total
                                    FFAppState().TotalSacola =
                                        FFAppState().TotalSacola +
                                            _model.valueItemSacola!;
                                    setState(() {});
                                    // Adding items to Cart
                                    FFAppState()
                                        .addToCarrinho(ItemDaSacolaStruct(
                                      nome: widget.produto?.name,
                                      valor: _model.valueItemSacola,
                                      qdade: _model.countControllerValue,
                                      data: dateTimeFormat(
                                          'd/M/y', getCurrentTimestamp),
                                      fotoUrl: widget.produto?.photoUrl,
                                      descricao: widget.produto?.description,
                                      referenceProd: widget.produto?.reference,
                                    ));
                                    FFAppState().updateSacolaStruct(
                                      (e) => e
                                        ..items = FFAppState().Carrinho.toList()
                                        ..total = FFAppState().TotalSacola
                                        ..userId = currentUserUid,
                                    );
                                    setState(() {});
                                    // updated produto qdade

                                    await widget.produto!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'qdade': FieldValue.increment(
                                              -(_model.countControllerValue!)),
                                        },
                                      ),
                                    });
                                    context.safePop();
                                  } else {
                                    context.safePop();
                                  }
                                },
                                text: 'Sacola',
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
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
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
