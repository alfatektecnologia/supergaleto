import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'edit_generico_model.dart';
export 'edit_generico_model.dart';

class EditGenericoWidget extends StatefulWidget {
  const EditGenericoWidget({
    super.key,
    required this.textoDigitado,
    required this.label,
    required this.hint,
  });

  final Future Function(String? inputTextoGeneric)? textoDigitado;
  final String? label;
  final String? hint;

  @override
  State<EditGenericoWidget> createState() => _EditGenericoWidgetState();
}

class _EditGenericoWidgetState extends State<EditGenericoWidget> {
  late EditGenericoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditGenericoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.textoDigitado = widget.hint;
      safeSetState(() {});
    });

    _model.editexGenericoTextController ??=
        TextEditingController(text: widget.hint);
    _model.editexGenericoFocusNode ??= FocusNode();
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
          controller: _model.editexGenericoTextController,
          focusNode: _model.editexGenericoFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.editexGenericoTextController',
            const Duration(milliseconds: 2000),
            () async {
              await widget.textoDigitado?.call(
                _model.editexGenericoTextController.text,
              );
            },
          ),
          onFieldSubmitted: (_) async {
            await widget.textoDigitado?.call(
              _model.editexGenericoTextController.text,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _model.editexGenericoTextController.text,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: const Color(0xFFF6F8FD),
              ),
            );
          },
          autofocus: false,
          textInputAction: TextInputAction.next,
          obscureText: false,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
            hintText: widget.hint,
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
          textAlign: TextAlign.start,
          validator:
              _model.editexGenericoTextControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
