import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'review_event.dart';
import 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  //ReviewBloc extiende Bloc<ReviewEvent, ReviewState>.
  //Esto significa que:
  //Recibe eventos de tipo ReviewEvent (acciones del usuario).
  //Retorna estados de tipo ReviewState (lo que ve el usuario en la UI).
  ReviewBloc() : super(ReviewInitial()) {
    on<GetNewReview>(_onGetNewReview);
    on<ClearReview>(_onClearReview);
  }

  //ecibe el evento GetNewReview y un Emitter que cambia el estado
  Future<void> _onGetNewReview(GetNewReview event, Emitter<ReviewState> emit) async {
    //primero cambia el estado a ReviewLoading() → La UI puede mostrar un CircularProgressIndicator().
    emit(ReviewLoading());

    try {
      final response = await http.get(
        Uri.parse('https://zenquotes.io/api/random'),
        headers: {
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final review = data[0]['q'];
        emit(ReviewLoaded(review));
        //Actualiza el estado con la reseña obtenida.
      } else {
        emit(ReviewError("Error al obtener la reseña. Código: ${response.statusCode}"));
        //Cambia el estado a ReviewError para mostrar un mensaje de error.
      }
    } catch (e) {
      emit(ReviewError("Error de conexión: ${e.toString()}"));
    }
  }

  //Cuando el usuario presiona el botón "Limpiar":
  //Cambia el estado a ReviewInitial().
  //Esto hace que la UI vuelva a mostrar "Obtener una nueva reseña".
  void _onClearReview(ClearReview event, Emitter<ReviewState> emit) {
    emit(ReviewInitial());
  }
}
