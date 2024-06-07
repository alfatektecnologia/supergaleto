import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'display_total_model.dart';
export 'display_total_model.dart';

class DisplayTotalWidget extends StatefulWidget {
  const DisplayTotalWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final double? parameter1;
  final int? parameter2;

  @override
  State<DisplayTotalWidget> createState() => _DisplayTotalWidgetState();
}

class _DisplayTotalWidgetState extends State<DisplayTotalWidget> {
  late DisplayTotalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayTotalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'R\$ ${((widget.parameter1!) * (widget.parameter2!)).toStringAsFixed(2)}',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Inter',
            color: FlutterFlowTheme.of(context).primaryBackground,
            letterSpacing: 0.0,
          ),
    );
  }
}
