import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'teste_model.dart';
export 'teste_model.dart';

class TesteWidget extends StatefulWidget {
  const TesteWidget({super.key});

  @override
  State<TesteWidget> createState() => _TesteWidgetState();
}

class _TesteWidgetState extends State<TesteWidget> {
  late TesteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TesteModel());

    _model.texQdadeTextController ??= TextEditingController();
    _model.texQdadeFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: TextFormField(
        controller: _model.texQdadeTextController,
        focusNode: _model.texQdadeFocusNode,
        autofocus: true,
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
        validator: _model.texQdadeTextControllerValidator.asValidator(context),
      ),
    );
  }
}
