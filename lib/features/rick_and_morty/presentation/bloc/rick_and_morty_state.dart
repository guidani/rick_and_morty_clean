part of 'rick_and_morty_bloc.dart';

abstract class RickAndMortyState extends Equatable {
  const RickAndMortyState();  

  @override
  List<Object> get props => [];
}
class RickAndMortyInitial extends RickAndMortyState {}
