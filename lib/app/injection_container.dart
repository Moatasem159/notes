import 'package:get_it/get_it.dart';
import 'package:notes/models/note.dart';
import 'package:notes/app/bloc_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:notes/core/utils/app_constants.dart';
import 'package:notes/sources/notes_data_source.dart';
final GetIt sl = GetIt.instance;
init()async{
  Bloc.observer=AppBlocObserver();
  await _iniHive();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  sl.registerLazySingleton<NoteLocalDataSource>(() => NoteLocalDataSourceImpl(sl()));
}
_iniHive()async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(NoteStatusAdapter());
  Box<Note> box=await Hive.openBox<Note>(AppConstants.noteBox);
  sl.registerLazySingleton<Box<Note>>(() =>box);
}