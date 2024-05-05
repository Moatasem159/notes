import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/cubits/search_cubit/search_cubit.dart';
import 'package:notes/widgets/custom_icon_button.dart';
class SearchScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchScreenAppBar({super.key});

  @override
  State<SearchScreenAppBar> createState() => _SearchScreenAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
class _SearchScreenAppBarState extends State<SearchScreenAppBar> {
  late double radius;
  late double vMargin;
  late double vPadding;
  late double hMargin;
  late double buttonPadding;
  begin() {
    radius = 0;
    vMargin = 0;
    hMargin = 0;
    vPadding = 0;
    buttonPadding = 0;
    setState(() {});
  }
  end() {
    radius = 25;
    vMargin = 10;
    vPadding = 10;
    hMargin = 10;
    buttonPadding = 8;
    setState(() {});
  }
  @override
  void initState() {
    radius = 25;
    vMargin = 10;
    vPadding = 40;
    hMargin = 10;
    buttonPadding = 0;
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
      begin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        end();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
        padding: EdgeInsets.only(top: vMargin),
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: buttonPadding),
              child: CustomIconButton(
                icon: const Icon(Icons.arrow_back),
                onTap: () {
                  end();
                  context.pop();
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: SearchCubit.of(context).controller,
                autofocus: true,
                onChanged: (value) {
                  SearchCubit.of(context).search();
                },
                decoration: InputDecoration(
                  hintText: context.local.searchYourNotes,
                  hintStyle: AppStyles.styleRegular20(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}