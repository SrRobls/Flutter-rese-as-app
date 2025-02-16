import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/review_bloc.dart';
import '../blocs/review_event.dart';
import '../blocs/review_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reseñas con BLoC by Johan Robles')),
      body: Center(
        child: BlocBuilder<ReviewBloc, ReviewState>(
          builder: (context, state) { //obtenemos el estado del contexto
            String message = "Obtener una nueva reseña";

            if (state is ReviewLoading) {
              return CircularProgressIndicator();
            } else if (state is ReviewLoaded) { //si la reseña cargo, cargamos el estado, osea mostramos al reseña
              message = state.review;
            } else if (state is ReviewError) {
              message = state.message; //mostramos el error del estado
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  //Cuando el usuario presiona el botón, envía el evento GetNewReview() al Bloc.
                  //Esto hace que el Bloc obtenga una nueva reseña y actualice la UI.
                  onPressed: () {
                    context.read<ReviewBloc>().add(GetNewReview());
                  },
                  child: Text("Obtener Reseña"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  //El botón "Limpiar" envía el evento ClearReview().
                  //Esto hace que el Bloc vuelva al estado ReviewInitial() y la UI muestre "Obtener una nueva reseña".
                  onPressed: () {
                    context.read<ReviewBloc>().add(ClearReview());
                  },
                  child: Text("Limpiar"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
