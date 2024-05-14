part of 'label_screen_body.dart';

class _RenameLabelDialog extends StatefulWidget {
  const _RenameLabelDialog();

  @override
  State<_RenameLabelDialog> createState() => _RenameLabelDialogState();
}

class _RenameLabelDialogState extends State<_RenameLabelDialog> {
  late final TextEditingController controller;
  late final GlobalKey<FormState> key;
  late bool _found;
  @override
  void initState() {
    super.initState();
    _found = false;
    controller = TextEditingController(
        text: GetLabeledNotesCubit.of(context).label.name);
    key = GlobalKey<FormState>();
  }
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
  _edit() {
    bool found = LabelActionsBloc.of(context).checkFound(controller.text);
    _found = found;
    bool validate = key.currentState!.validate();
    if (validate) {
      if (controller.text.isNotEmpty) {
        LabelActionsBloc.of(context).add(EditLabelEvent(
            GetLabeledNotesCubit.of(context).label, controller.text));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LabelActionsBloc, LabelActionsStates>(
      listener: (context, state) {
        if (state is EditLabelSuccessState) {
          GetLabeledNotesCubit.of(context).label.name = controller.text;
          GetLabeledNotesCubit.of(context).getLabeledNotes();
          context.pop();
        }
      },
      child: AlertDialog(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.local.renameLabel,
                style: AppStyles.styleSemiBold24(context)),
            5.ph,
            Form(
              key: key,
              child: TextFormField(
                controller: controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return context.local.enterLabelName;
                  }
                  if (value.length >= 50) {
                    return context.local.enterShorterLabel;
                  }
                  if (_found) {
                    return context.local.labelAlreadyExists;
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  _edit();
                },
                decoration: const InputDecoration(
                    isDense: true, border: OutlineInputBorder()),
              ),
            )
          ],
        ),
        actions: [
          CustomButton(
            title: context.local.cancel,
            onTap: context.pop,
            foregroundColor:
                context.theme.elevatedButtonTheme.style!.backgroundColor,
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
          ),
          CustomButton(
            title: context.local.rename,
            onTap: _edit,
            backgroundColor:
                context.theme.elevatedButtonTheme.style!.backgroundColor,
          ),
        ],
      ),
    );
  }
}
