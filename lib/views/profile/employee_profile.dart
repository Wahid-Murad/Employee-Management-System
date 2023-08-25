import 'package:employee_management/utils/constants/imports.dart';
import 'package:employee_management/widgets/custom_rounded_circle_icon_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EmployeeProfile extends StatelessWidget {
  EmployeeProfile({super.key});
  final HomeController homeController = Get.find<HomeController>();
  final ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cBackgroundColor,
        appBar: AppBar(
          backgroundColor: cBackgroundColor,
          title: Text(
            ksProfile,
            style: p24RegularTextStyle(cWhiteColor),
          ),
          leading: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: k10Padding, vertical: k10Padding),
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ksGood.tr + homeController.currentTimeFormat(),
                        style: p18MediumTextStyle(cWhiteColor),
                      ),
                      const Spacer(),
                      CustomRoundedCircleIconButton(
                        onPress: () {
                          // Get.toNamed();
                        },
                        icon: Icons.edit,
                        iconColor: cWhiteColor,
                        containerColor: cBlackColor,
                      ),
                    ],
                  ),
                  kH10sizedBox,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(k5BorderRadius),
                      color: cBlackColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(k5Padding),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: cBlackColor,
                            radius: 40,
                            backgroundImage: AssetImage('assets/images/user.jpg'),
                          ),
                          kW20sizedBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ksUserName,
                                  style: p24RegularTextStyle(cWhiteColor),
                                  overflow: TextOverflow.clip,
                                ),
                                kH5sizedBox,
                                Text(
                                  ksDesignation,
                                  style: p20MediumTextStyle(cWhiteColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  kH10sizedBox,
                  ProfileContainer(containerText: '${ksPhone.tr}\n${profileController.phone}'),
                  kH10sizedBox,
                  ProfileContainer(containerText: '${ksEmail.tr}\n${profileController.email}'),
                  kH10sizedBox,
                  ProfileContainer(containerText: '${ksAddress.tr}\n${profileController.address}'),
                  kH10sizedBox,
                  ProfileContainer(containerText: '${ksDateOfBirth.tr}\n${profileController.dateOfBirth}'),
                  kH10sizedBox,
                  CircularPercentIndicator(
                    radius: 120.0,
                    animation: true,
                    animationDuration: 1000,
                    lineWidth: 20,
                    percent: 0.4,
                    center: Text(
                      profileController.formattedTime.value,
                      style: p20MediumTextStyle(cWhiteColor),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: cBlackColor,
                    progressColor: cPrimaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: k25Padding),
                    child: CustomElevatedButton(
                        label: ksLogout,
                        buttonColor: cRedAccentColor,
                        onPressed: () {
                          profileController.logout(context);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key, required this.containerText});
  final String containerText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(color: cWhiteColor, borderRadius: BorderRadius.circular(k5BorderRadius)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: k5Padding),
        child: Text(
          containerText,
          style: p16MediumTextStyle(cTextPrimaryColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
