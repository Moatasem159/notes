part of 'add_note_screen_body.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteStates>(
      listener: (context, state) {
        if(state is PickImageState)
        {
          context.pop();
        }
      },
      builder: (context, state) {
        if (AddNoteCubit.of(context).note!.imagePath.isNotEmpty) {
          return Stack(
            children: [
              Image(
                image: FileImage(
                  File(AddNoteCubit.of(context).note!.imagePath),
                ),
              ),
              Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black26),
                child: CustomIconButton(
                  onTap:AddNoteCubit.of(context).removeImage,
                  icon: const Icon(Icons.clear)
                ),
              )
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
