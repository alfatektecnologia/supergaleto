import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'edit_component_model.dart';
export 'edit_component_model.dart';

class EditComponentWidget extends StatefulWidget {
  const EditComponentWidget({
    super.key,
    String? label,
    String? hint,
    required this.icon,
    required this.texto,
  })  : label = label ?? 'label',
        hint = hint ?? 'Hint';

  final String label;
  final String hint;
  final Future Function(Widget? onClick)? icon;
  final Future Function(String texto2callback)? texto;

  @override
  State<EditComponentWidget> createState() => _EditComponentWidgetState();
}

class _EditComponentWidgetState extends State<EditComponentWidget> {
  late EditComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditComponentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          onFieldSubmitted: (_) async {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _model.textController.text,
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).tertiary,
              ),
            );
          },
          autofocus: true,
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
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          maxLines: null,
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
