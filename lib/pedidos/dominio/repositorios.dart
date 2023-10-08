import 'package:ejemplos_2do_soft_9010/pedidos/dominio/entidades.dart';

abstract class RepositorioDePedidos {
  guardarPedido(Pedido unPedido);
  guardarComida(Comida unaComida);
  List<Pedido> obtenerPedidosQueContengaDeterminadaComida(Comida unaComida);
  List<Comida> obtenerTodasLasComidas();
  List<Pedido> obtenerTodosLosPedidos();
  int obtenerProximoNumeroDePedido();
}
