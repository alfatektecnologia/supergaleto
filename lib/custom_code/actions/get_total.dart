// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:core';

import 'package:provider/provider.dart';

Future<double> getTotal(
  BuildContext context,
  String? date,
) async {
  // map var listaPedidosByDate = await FirebaseFirestore.instance       .collection('pedidos')       .where('data', isEqualTo: date)       .get(); to List<PedidosStruc>
  List<PedidosStruct> pedidosList = [];

  double total = 0.00;

  var listaPedidosByDate = await FirebaseFirestore.instance
      .collection('pedidos')
      .where('data', isEqualTo: date)
      .get();

  if (listaPedidosByDate.docs.isNotEmpty) {
    listaPedidosByDate.docs.forEach((doc) {
      PedidosStruct pedido = PedidosStruct.fromMap(doc.data());
      pedidosList.add(pedido);
      total += pedido.sacola.total;
    });
  }
  return total;
}
