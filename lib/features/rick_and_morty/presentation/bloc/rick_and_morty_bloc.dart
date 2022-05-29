import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rick_and_morty_event.dart';
part 'rick_and_morty_state.dart';

class RickAndMortyBloc extends Bloc<RickAndMortyEvent, RickAndMortyState> {
  RickAndMortyBloc() : super(RickAndMortyInitial()) {
    on<RickAndMortyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
