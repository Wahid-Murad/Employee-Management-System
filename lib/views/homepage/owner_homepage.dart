import 'package:employee_management/utils/constants/imports.dart';

class OwnerHomepage extends StatelessWidget {
  const OwnerHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: AppBar(
        backgroundColor: cBackgroundColor,
        title: Text("Owner Homepage"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: k10Padding, vertical: k10Padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                OwnerHomePageContainer(
                  icon: Icons.add,
                  title: ksAddEmployee,
                  onPressed: () {
                    Get.toNamed(krAddEmployee);
                  },
                ),
                kW20sizedBox,
                OwnerHomePageContainer(
                  icon: Icons.list_alt_sharp,
                  title: ksEmployeeList,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OwnerHomePageContainer extends StatelessWidget {
  const OwnerHomePageContainer({super.key, required this.icon, required this.title, this.onPressed});
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      highlightColor: cTransparentColor,
      splashColor: cTransparentColor,
      child: ContainerWidget(
        width: (width / 2) - 20,
        height: 150,
        decoration: BoxDecoration(
          color: cBlackColor,
          borderRadius: BorderRadius.circular(k10BorderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: cWhiteColor,
            ),
            kH10sizedBox,
            Text(
              title,
              style: p16MediumTextStyle(cWhiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
