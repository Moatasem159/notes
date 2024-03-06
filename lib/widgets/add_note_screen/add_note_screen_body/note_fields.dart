part of'add_note_screen_body.dart';
class NoteFields extends StatelessWidget {
  const NoteFields({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40,right: 15,left: 15),
      child: Column(
        children: [
          15.ph,
          CustomTextFormField(
            controller: AddNoteCubit.of(context).title,
            formatter: [
             LengthLimitingTextInputFormatter(150)
            ],
            autoValidateMode: AutovalidateMode.onUserInteraction,
            onChange: (value) {
              if(value.length>=150){
                CustomToast.showToast(context, msg: "Title too large");
              }
              else{
                AddNoteCubit.of(context).note!.title=value;
              }
            },
            hintText: context.local.title,
            minLines: 1,
            maxLines: 10,
            style: const TextStyle(fontSize: 22),
          ),
          10.ph,
          CustomTextFormField(
            controller: AddNoteCubit.of(context).content,
            onChange: (value) {
              AddNoteCubit.of(context).note!.note=value;
            },
            autoFocus:  AddNoteCubit.of(context).content.text.isEmpty?true:false,
            hintText: context.local.note,
            maxLines: null,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}