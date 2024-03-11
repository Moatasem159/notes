part of'../default_options_appbar.dart';
class _ColorDialog extends StatelessWidget {
  final NoteStatus noteStatus;
  const _ColorDialog(this.noteStatus);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorsBottomSheetCubit, ColorsBottomSheetStates>(
      builder: (context, state) {
        ColorsBottomSheetCubit cubit = ColorsBottomSheetCubit.of(context);
        return Dialog(
            backgroundColor: context.theme.colorScheme.onSecondary,
            elevation: 0,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text(context.local.noteColor,
                      style: AppStyles.styleSemiBold24(context)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: cubit.colors.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) => ColorCircle(
                      onTap: () {
                        cubit.chooseColor(index);
                        List<Note> notes = [];
                        notes.addAll(AppBarCubit.of(context).selectedNotes);
                        NotesActionsBloc.of(context).add(ColorsNote(
                            color: cubit.colors[index].value, notes: notes));
                        context.pop();
                      },
                      color: cubit.colors[index].value,
                      isSelected: cubit.chosen[index],
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}