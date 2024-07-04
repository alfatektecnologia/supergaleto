import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/new_user_name_dialog/new_user_name_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'sacola_model.dart';
export 'sacola_model.dart';

class SacolaWidget extends StatefulWidget {
  const SacolaWidget({
    super.key,
    required this.itensSacola,
  });

  final SacolaStruct? itensSacola;

  @override
  State<SacolaWidget> createState() => _SacolaWidgetState();
}

class _SacolaWidgetState extends State<SacolaWidget> {
  late SacolaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SacolaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.updateListaDeItensStruct(
        (e) => e..items = widget.itensSacola!.items.toList(),
      );
      setState(() {});
      _model.countPedidos = await queryPedidosRecordCount();
      _model.nroPedido = _model.countPedidos;
      setState(() {});
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

    return FutureBuilder<int>(
      future: queryPedidosRecordCount(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        int sacolaCount = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
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
            title: Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Text(
                ' SACOLA',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            actions: [
              Visibility(
                visible: FFAppState().user.isAdmin,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('MeusPedidos');
                    },
                    child: Icon(
                      Icons.checklist_rounded,
                      color: FlutterFlowTheme.of(context).primaryBackground,
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
                    Icons.logout_rounded,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 770.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Sua sacola, ',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    FFAppState().pedidoUserName,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 12.0),
                                child: Text(
                                  'Abaixo está a lista de seus itens:',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Builder(
                                  builder: (context) {
                                    final listItensSacola =
                                        _model.listaDeItens?.items.toList() ??
                                            [];
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listItensSacola.length,
                                      itemBuilder:
                                          (context, listItensSacolaIndex) {
                                        final listItensSacolaItem =
                                            listItensSacola[
                                                listItensSacolaIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  offset: const Offset(
                                                    0.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 4.0, 8.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    1.0,
                                                                    1.0,
                                                                    1.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  listItensSacolaItem
                                                                      .fotoUrl,
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            child:
                                                                Image.network(
                                                              listItensSacolaItem.fotoUrl,
                                                              width: 70.0,
                                                              height: 70.0,
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listItensSacolaItem
                                                                    .nome,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      const TextSpan(
                                                                        text:
                                                                            'qdade: ',
                                                                        style:
                                                                            TextStyle(),
                                                                      ),
                                                                      TextSpan(
                                                                        text: listItensSacolaItem
                                                                            .qdade
                                                                            .toString(),
                                                                        style:
                                                                            const TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          formatNumber(
                                                            listItensSacolaItem
                                                                .valor,
                                                            formatType:
                                                                FormatType
                                                                    .custom,
                                                            currency: 'R\$ ',
                                                            format: '0.00',
                                                            locale: '',
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    4.0,
                                                                    8.0,
                                                                    12.0),
                                                        child: Text(
                                                          listItensSacolaItem
                                                              .descricao
                                                              .maybeHandleOverflow(
                                                                  maxChars: 25),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            // update produto qdade

                                                            await listItensSacolaItem
                                                                .referenceProd!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'qdade': FieldValue.increment(widget
                                                                      .itensSacola!
                                                                      .items[
                                                                          listItensSacolaIndex]
                                                                      .qdade),
                                                                },
                                                              ),
                                                            });
                                                            // Ajusta total
                                                            FFAppState()
                                                                    .TotalSacola =
                                                                FFAppState()
                                                                        .TotalSacola +
                                                                    (-listItensSacolaItem
                                                                        .valor);
                                                            setState(() {});
                                                            // Item2delete
                                                            _model
                                                                .item2delete = widget
                                                                    .itensSacola
                                                                    ?.items[
                                                                listItensSacolaIndex];
                                                            setState(() {});
                                                            // deleteFromList
                                                            _model
                                                                .updateListaDeItensStruct(
                                                              (e) => e
                                                                ..updateItems(
                                                                  (e) => e.remove(
                                                                      _model
                                                                          .item2delete),
                                                                ),
                                                            );
                                                            setState(() {});
                                                            // update carrinho
                                                            FFAppState()
                                                                .removeFromCarrinho(
                                                                    ItemDaSacolaStruct(
                                                              nome: _model
                                                                  .item2delete
                                                                  ?.nome,
                                                              valor: _model
                                                                  .item2delete
                                                                  ?.valor,
                                                              qdade: _model
                                                                  .item2delete
                                                                  ?.qdade,
                                                              data: _model
                                                                  .item2delete
                                                                  ?.data,
                                                              fotoUrl: _model
                                                                  .item2delete
                                                                  ?.fotoUrl,
                                                              descricao: _model
                                                                  .item2delete
                                                                  ?.descricao,
                                                              referenceProd: _model
                                                                  .item2delete
                                                                  ?.referenceProd,
                                                            ));
                                                            setState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .delete_outline,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 24.0,
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Resumo do pedido',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        'Abaixo está a lista de seus itens:',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Divider(
                                      height: 32.0,
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 12.0),
                                            child: Text(
                                              'Valores detalhados:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Valor do pedido',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                Text(
                                                  formatNumber(
                                                    FFAppState().TotalSacola,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: 'R\$ ',
                                                    format: '0.00',
                                                    locale: '',
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Cupons',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                Text(
                                                  ' ',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Taxa entrega',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                Text(
                                                  'R\$ 0.00',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Total R\$',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    (FFAppState().TotalSacola +
                                                            0.00)
                                                        .toStringAsFixed(2),
                                                    '0.00',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Builder(
                      builder: (context) => Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (currentUserDisplayName == 'Balcao') {
                              // Change userName?
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: NewUserNameDialogWidget(
                                      title: 'Alerta',
                                      message:
                                          'Deseja incluir o nome do cliente?',
                                      qdadeAtual: currentUserDisplayName,
                                      cancelar: 'Cancelar',
                                      confirmar: 'Confirmar',
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            }
                            if ((String var1) {
                              return var1 == "Saturday" || var1 == "Sunday";
                            }(dateTimeFormat(
                              'EEEE',
                              getCurrentTimestamp,
                              locale: FFLocalizations.of(context).languageCode,
                            ))) {
                              if (FFAppState().TotalSacola > 0.0) {
                                // Save pedido

                                var pedidosRecordReference1 =
                                    PedidosRecord.collection.doc();
                                await pedidosRecordReference1
                                    .set(createPedidosRecordData(
                                  nroPedido: sacolaCount + 1,
                                  sacola: updateSacolaStruct(
                                    FFAppState().Sacola,
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  data: dateTimeFormat(
                                    'd/M/y',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  userName: FFAppState().pedidoUserName,
                                  isClosed: false,
                                ));
                                _model.pedidoSalvo1 =
                                    PedidosRecord.getDocumentFromData(
                                        createPedidosRecordData(
                                          nroPedido: sacolaCount + 1,
                                          sacola: updateSacolaStruct(
                                            FFAppState().Sacola,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          data: dateTimeFormat(
                                            'd/M/y',
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          userName: FFAppState().pedidoUserName,
                                          isClosed: false,
                                        ),
                                        pedidosRecordReference1);
                                if (_model.pedidoSalvo?.nroPedido ==
                                    ((_model.nroPedido!) + 1)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Pedido salvo com sucesso!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).success,
                                    ),
                                  );
                                  // clear carrinho e sacola
                                  FFAppState().deleteCarrinho();
                                  FFAppState().Carrinho = [];

                                  FFAppState().deleteSacola();
                                  FFAppState().Sacola = SacolaStruct();

                                  FFAppState().deleteTotalSacola();
                                  FFAppState().TotalSacola = 0.0;

                                  setState(() {});

                                  context.pushNamed('Home');
                                } else {
                                  // clear carrinho e sacola
                                  FFAppState().deleteCarrinho();
                                  FFAppState().Carrinho = [];

                                  FFAppState().deleteSacola();
                                  FFAppState().Sacola = SacolaStruct();

                                  FFAppState().deleteTotalSacola();
                                  FFAppState().TotalSacola = 0.0;

                                  setState(() {});

                                  context.pushNamed('Home');
                                }
                              } else {
                                // clear carrinho e sacola
                                FFAppState().deleteCarrinho();
                                FFAppState().Carrinho = [];

                                FFAppState().deleteSacola();
                                FFAppState().Sacola = SacolaStruct();

                                FFAppState().deleteTotalSacola();
                                FFAppState().TotalSacola = 0.0;

                                setState(() {});

                                context.pushNamed('Home');
                              }
                            } else {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Alerta'),
                                            content: const Text(
                                                'Nosso expediente é de sábado a domingo. Deseja deixar encomendado esse seu pedido?'),
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
                                if (FFAppState().TotalSacola > 0.0) {
                                  // Save encomenda

                                  var pedidosRecordReference2 =
                                      PedidosRecord.collection.doc();
                                  await pedidosRecordReference2
                                      .set(createPedidosRecordData(
                                    nroPedido: sacolaCount + 1,
                                    sacola: updateSacolaStruct(
                                      FFAppState().Sacola,
                                      clearUnsetFields: false,
                                      create: true,
                                    ),
                                    data: dateTimeFormat(
                                      'd/M/y',
                                      getCurrentTimestamp,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    userName: FFAppState().pedidoUserName,
                                    isClosed: false,
                                  ));
                                  _model.pedidoSalvo =
                                      PedidosRecord.getDocumentFromData(
                                          createPedidosRecordData(
                                            nroPedido: sacolaCount + 1,
                                            sacola: updateSacolaStruct(
                                              FFAppState().Sacola,
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            data: dateTimeFormat(
                                              'd/M/y',
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            userName:
                                                FFAppState().pedidoUserName,
                                            isClosed: false,
                                          ),
                                          pedidosRecordReference2);
                                  if (_model.pedidoSalvo?.nroPedido ==
                                      ((_model.nroPedido!) + 1)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Pedido salvo com sucesso!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                      ),
                                    );
                                    // clear carrinho e sacola
                                    FFAppState().deleteCarrinho();
                                    FFAppState().Carrinho = [];

                                    FFAppState().deleteSacola();
                                    FFAppState().Sacola = SacolaStruct();

                                    FFAppState().deleteTotalSacola();
                                    FFAppState().TotalSacola = 0.0;

                                    setState(() {});

                                    context.pushNamed('Home');
                                  }
                                } else {
                                  // clear carrinho e sacola
                                  FFAppState().deleteCarrinho();
                                  FFAppState().Carrinho = [];

                                  FFAppState().deleteSacola();
                                  FFAppState().Sacola = SacolaStruct();

                                  FFAppState().deleteTotalSacola();
                                  FFAppState().TotalSacola = 0.0;

                                  setState(() {});

                                  context.pushNamed('Home');
                                }
                              } else {
                                // clear carrinho e sacola
                                FFAppState().deleteCarrinho();
                                FFAppState().Carrinho = [];

                                FFAppState().deleteSacola();
                                FFAppState().Sacola = SacolaStruct();

                                FFAppState().deleteTotalSacola();
                                FFAppState().TotalSacola = 0.0;

                                setState(() {});

                                context.pushNamed('Home');
                              }
                            }

                            setState(() {});
                          },
                          text: (String var1) {
                            return var1 == "Saturday" || var1 == "Sunday"
                                ? "Finalizar pedidor"
                                : "Encomendar";
                          }(dateTimeFormat(
                            'EEEE',
                            getCurrentTimestamp,
                            locale: FFLocalizations.of(context).languageCode,
                          )),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).success,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                            hoverColor: FlutterFlowTheme.of(context).accent1,
                            hoverBorderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            hoverTextColor:
                                FlutterFlowTheme.of(context).primary,
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
      },
    );
  }
}
