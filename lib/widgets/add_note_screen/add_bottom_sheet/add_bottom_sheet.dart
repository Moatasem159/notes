import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/extension/empty_padding_extension.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
part 'add_bottom_sheet_tile.dart';
class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AddNoteCubit.of(context).note!.color ==
              Colors.transparent.value
          ? context.scaffoldBackground
          : Color(AddNoteCubit.of(context).note!.color),
      height: context.height / 8.658823529411765,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AddBottomSheetTile(
              onTap: () async=>AddNoteCubit.of(context).getImage(ImageSource.camera),
              icon: Icons.camera_alt_outlined,
              title: context.local.takePhoto),
          _AddBottomSheetTile(
              onTap: () async=>AddNoteCubit.of(context).getImage(ImageSource.gallery),
              icon: Icons.image_outlined,
              title: context.local.addImage)
        ],
      ),
    );
  }
}
