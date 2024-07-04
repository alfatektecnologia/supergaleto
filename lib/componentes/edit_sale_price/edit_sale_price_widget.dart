import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'edit_sale_price_model.dart';
export 'edit_sale_price_model.dart';

class EditSalePriceWidget extends StatefulWidget {
  const EditSalePriceWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<EditSalePriceWidget> createState() => _EditSalePriceWidgetState();
}

class _EditSalePriceWidgetState extends State<EditSalePriceWidget> {
  late EditSalePriceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditSalePriceModel());

    _model.txtSalesPriceTextController ??= TextEditingController();
    _model.txtSalesPriceFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: TextFormField(
        controller: _model.txtSalesPriceTextController,
        focusNode: _model.txtSalesPriceFocusNode,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Valor de venda',
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Inter',
                letterSpacing: 0.0,
              ),
          hintText: widget.parameter1,
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
        validator:
            _model.txtSalesPriceTextControllerValidator.asValidator(context),
      ),
    );
  }
}
