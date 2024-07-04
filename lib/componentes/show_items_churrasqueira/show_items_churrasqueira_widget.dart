import '/backend/schema/structs/index.dart';
import '/componentes/edit_qdade/edit_qdade_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'show_items_churrasqueira_model.dart';
export 'show_items_churrasqueira_model.dart';

class ShowItemsChurrasqueiraWidget extends StatefulWidget {
  const ShowItemsChurrasqueiraWidget({
    super.key,
    this.parameter1,
    required this.image,
    required this.produtoName,
  });

  final bool? parameter1;
  final String? image;
  final String? produtoName;

  @override
  State<ShowItemsChurrasqueiraWidget> createState() =>
      _ShowItemsChurrasqueiraWidgetState();
}

class _ShowItemsChurrasqueiraWidgetState
    extends State<ShowItemsChurrasqueiraWidget> {
  late ShowItemsChurrasqueiraModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowItemsChurrasqueiraModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.fotoUrl = widget.image;
      _model.isChecked = false;
      _model.produtoName = widget.produtoName;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent1,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.image!,
                          width: 183.0,
                          height: 122.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.produtoName,
                          '\"\"',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().dadosItensAssando = DadosItensAssandoStruct(
                        name: widget.produtoName,
                        foto: widget.image,
                      );
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            widget.produtoName!,
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).warning,
                        ),
                      );
                    },
                    child: wrapWithModel(
                      model: _model.editQdadeModel,
                      updateCallback: () => setState(() {}),
                      child: EditQdadeWidget(
                        textoDigitado: (textoQdade) async {
                          _model.textQdade = textoQdade;
                          setState(() {});
                          FFAppState().qdade = int.parse((textoQdade!));
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                textoQdade,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor: const Color(0xFF6B84E5),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              if (_model.isChecked == true)
                Icon(
                  Icons.check_sharp,
                  color: FlutterFlowTheme.of(context).success,
                  size: 24.0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
