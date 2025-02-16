import 'package:equatable/equatable.dart';

//Este archivo define los eventos en el Bloc Pattern. En Bloc, un evento es una acción que el usuario o la aplicación ejecuta para cambiar el estado.

//Clase base para todos los eventos relacionados con las reseñas
abstract class ReviewEvent extends Equatable {
  //Permite comparar eventos y evitar llamadas innecesarias en la UI
  const ReviewEvent();

  @override
  List<Object?> get props => [];
  //Permite que Flutter compare eventos correctamente
}

// Evento para obtener una nueva reseña
//Es un evento que indica que el usuario quiere obtener una nueva reseña.
//e dispara cuando el usuario presiona el botón "Obtener Reseña" en la UI
class GetNewReview extends ReviewEvent {}

// Evento para limpiar la reseña
//Indica que el usuario quiere limpiar la reseña.
// Se dispara cuando el usuario presiona el botón "Limpiar"
class ClearReview extends ReviewEvent {}
