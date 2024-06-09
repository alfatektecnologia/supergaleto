import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'edit_qdade_model.dart';
export 'edit_qdade_model.dart';

class EditQdadeWidget extends StatefulWidget {
  const EditQdadeWidget({
    super.key,
    required this.textoDigitado,
  });

  final Future Function(String? textoQdade)? textoDigitado;

  @override
  State<EditQdadeWidget> createState() => _EditQdadeWidgetState();
}

class _EditQdadeWidgetState extends State<EditQdadeWidget> {
  late EditQdadeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditQdadeModel());

    _model.edtQdaddeFrangoTextController ??=
        TextEditingController(text: _model.textoQdade);
    _model.edtQdaddeFrangoFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: TextFormField(
          controller: _model.edtQdaddeFrangoTextController,
          focusNode: _model.edtQdaddeFrangoFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.edtQdaddeFrangoTextController',
            const Duration(milliseconds: 2000),
            () async {
              // Atualiza qdade
              FFAppState().qdade =
                  int.parse(_model.edtQdaddeFrangoTextController.text);
              setState(() {});
            },
          ),
          onFieldSubmitted: (_) async {
            // Atualiza qdade
            FFAppState().qdade =
                int.parse(_model.edtQdaddeFrangoTextController.text);
            setState(() {});
          },
          autofocus: true,
          textInputAction: TextInputAction.next,
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Quantidade',
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          validator: _model.edtQdaddeFrangoTextControllerValidator
              .asValidator(context),
        ),
      ),
    );
  }
}
