import 'package:equatable/equatable.dart';
// Facilita la comparación de estados

abstract class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object?> get props => [];
  //Permite comparar estados cuando son iguales
}

// Estado inicial con el mensaje "Obtener una nueva reseña"
// Este es el estado inicial de la app cuando aún no se ha solicitado ninguna reseña.
class ReviewInitial extends ReviewState {}

// Estado cuando se obtiene una nueva reseña
class ReviewLoaded extends ReviewState {
  final String review;

  const ReviewLoaded(this.review);

  @override
  List<Object?> get props => [review];
  //Esto permite que Flutter reconozca cuando la reseña cambia y actualice la UI
  //Si el estado anterior y el nuevo tienen la misma reseña, la UI no se vuelve a renderizar innecesariamente.
}

// Estado cuando se está cargando una reseña. Cuando se emite este estado, la UI puede mostrar un CircularProgressIndicator()
class ReviewLoading extends ReviewState {}

// Estado cuando hay un error al obtener la reseña
class ReviewError extends ReviewState {
  final String message;

  const ReviewError(this.message);

  @override
  List<Object?> get props => [message];
  //Permite que la UI detecte cambios si el mensaje de error cambia.
}
