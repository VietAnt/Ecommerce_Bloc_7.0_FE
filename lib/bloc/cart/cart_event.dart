part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

//!--CartSatrted--//
class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

//!--CartProduct--//
class CartProductAdded extends CartEvent {
  final Product product;

  const CartProductAdded(this.product);

  @override
  List<Object> get props => [product];
}

//!--CartProduct--//
class CartProductRemoved extends CartEvent {
  final Product product;

  const CartProductRemoved(this.product);

  @override
  List<Object> get props => [product];
}
