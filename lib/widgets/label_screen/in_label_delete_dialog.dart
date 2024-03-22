part of'label_screen_body.dart';
class _InLabelDeleteDialog extends StatelessWidget {
  const _InLabelDeleteDialog();
  @override
  Widget build(BuildContext context) {
    return DeleteDialog(
      delete: () {
        context.pushReplacementNamed(Routes.homeRoute);
        LabelActionsBloc.of(context).add(DeleteLabelEvent(GetLabeledNotesCubit.of(context).label));
      },
    );
  }
}