part of 'search_cubit.dart';
sealed class SearchStates {}
final class SearchInitialState extends SearchStates {}
final class GetSearchSuccessState extends SearchStates {
  final List<Note> notes;
  final List<Note> archivedNotes;
  GetSearchSuccessState(this.notes, this.archivedNotes);
}
