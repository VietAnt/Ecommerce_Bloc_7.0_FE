import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_smart/models/models.dart';
import 'package:ecommerce_smart/models/wishlist_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());

  @override
  Stream<WishlistState> mapEventToState(
    WishlistEvent event,
  ) async* {
    if (event is WishlistStarted) {
      yield* _mapWishlistStartedToState();
    } else if (event is WishlistProductAdded) {
      yield* _mapWishlistProductAddedToState(event, state);
    } else if (event is WishlistProductRemoved) {
      yield* _mapWishlistProductRemovedToState(event, state);
    }
  }

  Stream<WishlistState> _mapWishlistStartedToState() async* {
    yield WishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield WishlistLoaded();
    } catch (_) {
      yield WishlistError();
    }
  }

  Stream<WishlistState> _mapWishlistProductAddedToState(
    WishlistProductAdded event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..add(event.product),
          ),
        );
      } on Exception {
        yield WishlistError();
      }
    }
  }

  Stream<WishlistState> _mapWishlistProductRemovedToState(
    WishlistProductRemoved event,
    WishlistState state,
  ) async* {
    if (state is WishlistLoaded) {
      try {
        yield WishlistLoaded(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        );
      } on Exception {
        yield WishlistError();
      }
    }
  }
}
