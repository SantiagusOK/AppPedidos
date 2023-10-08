import 'package:ejemplos_2do_soft_9010/pedidos/aplicacion/adm_pedidos.dart';
import 'package:ejemplos_2do_soft_9010/pedidos/dominio/entidades.dart';
import 'package:ejemplos_2do_soft_9010/pedidos/main.dart';
import 'package:ejemplos_2do_soft_9010/pedidos/presentacion/ui/blocs/bloc_edicion_de_pedido.dart';
import 'package:ejemplos_2do_soft_9010/pedidos/presentacion/ui/vistas/vista_de_edicion_de_pedido.dart';
import 'package:ejemplos_2do_soft_9010/pedidos/presentacion/ui/vistas/vista_pedidos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum NombreDeVista {
  vistaDePedidos,
  edicionDePedidos,
}

GoRouter pedidosRouter =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(
      name: NombreDeVista.vistaDePedidos.name,
      path: '/',
      builder: (context, state) {
        return BlocProvider<AdministracionDePedidos>.value(
            value: blocAdministracionDePedidos, child: const VistaPedidos());
      },
      routes: [
        GoRoute(
            name: NombreDeVista.edicionDePedidos.name,
            path: 'initial',
            builder: (context, state) {
              return BlocProvider<BlocEdicionDePedido>(
                  create: (context) =>
                      BlocEdicionDePedido(pedido: state.extra as Pedido),
                  child: const VistaDeEdicionDePedido());
            })
      ])
]);
