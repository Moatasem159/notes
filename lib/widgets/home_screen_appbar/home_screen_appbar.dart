import 'package:flutter/material.dart';
import 'package:notes/core/extension/context_extension.dart';
import 'package:notes/core/utils/app_text_styles.dart';
import 'package:notes/widgets/custom_icon_button.dart';
import 'package:notes/widgets/switch_list_view_button.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 15,vertical:50),
        child: Material(
          color: context.theme.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            onTap: null,
            borderRadius: BorderRadius.circular(25),
            child: SizedBox(
              child: Row(
                children: [
                  CustomIconButton(icon: Icons.menu_rounded,onTap:Scaffold.of(context).openDrawer),
                  Text(context.local.searchMsg,style:AppStyles.styleRegular20(context)),
                  const Spacer(),
                  const SwitchListViewButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}