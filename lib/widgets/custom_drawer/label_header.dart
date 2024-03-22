part of'main_drawer.dart';
class _LabelsHeader extends StatelessWidget {
  const _LabelsHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        children: [
          Text(context.local.labels, style: AppStyles.styleRegular16(context)),
          const Spacer(),
          InkWell(
            onTap: (){
              context.pop();
              context.pushNamed(Routes.createLabelRoute,arguments: false);
            },
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                context.local.edit,
                style: AppStyles.styleRegular16(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}