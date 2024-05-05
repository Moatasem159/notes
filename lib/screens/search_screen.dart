import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/app/injection_container.dart';
import 'package:notes/config/themes/app_theme.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/cubits/search_cubit/search_cubit.dart';
import 'package:notes/models/search_screen_params.dart';
import 'package:notes/widgets/search_screen/search_screen_appbar.dart';
import 'package:notes/widgets/search_screen/search_screen_body.dart';
class SearchScreen extends StatelessWidget {
  final SearchScreenParams params;
  const SearchScreen({super.key, required this.params});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(sl(),params.noteStatus),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.systemUiOverlayStyle(context).copyWith(
            statusBarColor: context.theme.colorScheme.onSecondary
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: context.theme.scaffoldBackgroundColor,
              appBar: const SearchScreenAppBar(),
              body: const SearchScreenBody(),
            ),
          ),
        ),
      ),
    );
  }
}