import 'package:ejemplos_2do_soft_9010/pedidos/dominio/entidades.dart';
import 'package:ejemplos_2do_soft_9010/pedidos/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

enum NombreDeEstadoDeAdministracionDePedidos { inicial, falla, editandoPedido }

abstract class EstadoDeAdministracionDePedidos extends Equatable {
  final NombreDeEstadoDeAdministracionDePedidos nombre;
  @override
  List<Object?> get props => [nombre];
  const EstadoDeAdministracionDePedidos(this.nombre);
}

class EstadoADPInicial extends EstadoDeAdministracionDePedidos {
  final List<Pedido> pedidos;
  final Pedido? pedidoSeleccionado;

  @override
  List<Object?> get props => [nombre, pedidoSeleccionado, pedidos];
  const EstadoADPInicial(
      {required this.pedidos, required this.pedidoSeleccionado})
      : super(NombreDeEstadoDeAdministracionDePedidos.inicial);
}

class EstadoADPEditandoPedido extends EstadoDeAdministracionDePedidos {
  final Pedido pedido;
  const EstadoADPEditandoPedido({required this.pedido})
      : super(NombreDeEstadoDeAdministracionDePedidos.editandoPedido);

  @override
  List<Object?> get props => [nombre, pedido];
}

class EstadoADPFalla extends EstadoDeAdministracionDePedidos {
  final String mensajeDeError;
  const EstadoADPFalla({required this.mensajeDeError})
      : super(NombreDeEstadoDeAdministracionDePedidos.falla);

  @override
  List<Object?> get props => [nombre, mensajeDeError];
}

class AdministracionDePedidos extends Cubit<EstadoDeAdministracionDePedidos> {
  final List<Pedido> _pedidos = [];
  Pedido? pedidoSeleccionado;

  AdministracionDePedidos(super.initialState);

  seleccionarPedido(Pedido? nuevoPedidoSeleccionado) {
    pedidoSeleccionado = pedidoSeleccionado;
  }

  comenzarCreacionDePedido() {
    Pedido nuevoPedido =
        Pedido(repositorioDePedidos.obtenerProximoNumeroDePedido() + 1);
    emit(EstadoADPEditandoPedido(pedido: nuevoPedido));
  }

  agregarNuevoPedido(Pedido nuevoPedido) {
    pedidoSeleccionado = nuevoPedido;
    repositorioDePedidos.guardarPedido(nuevoPedido);
    emit(EstadoADPEditandoPedido(pedido: nuevoPedido));
  }

  comenzarEdicionDePedidoSeleccionado() {
    if (pedidoSeleccionado == null) {
      emit(const EstadoADPFalla(
          mensajeDeError: 'Es necesario que selecciones el pedido a editar'));
      emit(EstadoADPInicial(pedidos: _pedidos, pedidoSeleccionado: null));
    } else {
      emit(EstadoADPEditandoPedido(pedido: pedidoSeleccionado!));
    }
  }
}
