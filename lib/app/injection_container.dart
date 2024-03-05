import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notes/app/bloc_observer.dart';
import 'package:notes/core/database/hive_consumer.dart';
import 'package:notes/models/note.dart';
import 'package:path_provider/path_provider.dart';
final GetIt sl = GetIt.instance;

init()async{
  Bloc.observer=AppBlocObserver();
  await _iniHive();
  await _registerAdapters();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

}
_iniHive()async{
  await Hive.initFlutter();
  sl.registerLazySingleton(() =>Hive);
  sl.registerLazySingleton<HiveConsumer>(() => HiveManager(sl()));
}
_registerAdapters()async {
  sl<HiveConsumer>().registerAdapter(NoteAdapter());
  sl<HiveConsumer>().registerAdapter(NoteStatusAdapter());
}