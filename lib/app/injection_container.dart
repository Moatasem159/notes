import 'package:get_it/get_it.dart';
import 'package:notes/models/label.dart';
import 'package:notes/models/note.dart';
import 'package:notes/app/bloc_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notes/sources/labels_data_source.dart';
import 'package:path_provider/path_provider.dart';
import 'package:notes/core/utils/app_constants.dart';
import 'package:notes/sources/notes_data_source.dart';
final GetIt sl = GetIt.instance;
init()async{
  Bloc.observer=AppBlocObserver();
  await _iniHive();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  sl.registerLazySingleton<NoteLocalDataSource>(() => NoteLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<LabelLocalDataSource>(() => LabelLocalDataSourceImpl(sl(),sl()));
}
_iniHive()async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(NoteStatusAdapter());
  Hive.registerAdapter(LabelAdapter());
  Box<Note> noteBox=await Hive.openBox<Note>(AppConstants.noteBox);
  Box<Label> labelBox=await Hive.openBox<Label>(AppConstants.labelBox);
  sl.registerLazySingleton<Box<Note>>(() =>noteBox);
  sl.registerLazySingleton<Box<Label>>(() =>labelBox);
}