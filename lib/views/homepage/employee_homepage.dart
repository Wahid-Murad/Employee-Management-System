import 'package:employee_management/utils/constants/imports.dart';
import 'package:employee_management/widgets/custom_rounded_circle_icon_button.dart';
import 'package:employee_management/widgets/custom_text_button.dart';

class EmployeeHomepage extends StatelessWidget {
  EmployeeHomepage({super.key});
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return SafeArea(
      child: Scaffold(
        backgroundColor: cBackgroundColor,
        body: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: k10Padding, vertical: k10Padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      icon: Icons.notifications,
                      iconColor: cWhiteColor,
                      containerColor: cBlackColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: k10Padding, vertical: k10Padding),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(krEmployeeProfile);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: cBlackColor,
                      borderRadius: BorderRadius.circular(k10BorderRadius),
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
                                Text(
                                  ksDesignation,
                                  style: p18MediumTextStyle(cWhiteColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ContainerWidget(
                      width: width,
                      // height: height - 110 - MediaQuery.of(context).padding.top,
                      decoration: BoxDecoration(
                        color: cBlackColor,
                        borderRadius: BorderRadius.circular(25).copyWith(bottomLeft: const Radius.circular(0), bottomRight: const Radius.circular(0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: k10Padding, vertical: k10Padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckInCheckOutBox(),
                            kH20sizedBox,
                            Row(
                              children: [
                                CardContainer(
                                  date: homeController.currentDate.value,
                                  time: homeController.formattedTime,
                                  title: ksTakeBreak,
                                  dateTextStyle: p20MediumTextStyle(homeController.isTakeBreakVisible.value ? cWhiteColor : cGreyColor),
                                  timeTextStyle: p18MediumTextStyle(homeController.isTakeBreakVisible.value ? cWhiteColor : cGreyColor),
                                  titleTextStyle: p16MediumTextStyle(homeController.isTakeBreakVisible.value ? cWhiteColor : cGreyColor),
                                  icon: Icons.check_box_outline_blank,
                                  onPressed: homeController.isCheckOut.value
                                      ? null
                                      : () {
                                          homeController.isTakeBreakVisible.value = true;
                                          homeController.takeBreakCardEnableDisable();
                                          homeController.isTakeBreakVisible.value = false;
                                        },
                                ),
                                kW10sizedBox,
                                CardContainer(
                                  date: homeController.currentDate.value,
                                  time: homeController.formattedTime,
                                  title: ksBackWork,
                                  dateTextStyle: p20MediumTextStyle(homeController.isBackWorkVisible.value ? cWhiteColor : cGreyColor),
                                  timeTextStyle: p18MediumTextStyle(homeController.isBackWorkVisible.value ? cWhiteColor : cGreyColor),
                                  titleTextStyle: p16MediumTextStyle(homeController.isBackWorkVisible.value ? cWhiteColor : cGreyColor),
                                  icon: Icons.check_box,
                                  onPressed: homeController.isCheckOut.value
                                      ? null
                                      : () {
                                          homeController.isBackWorkVisible.value = true;
                                          homeController.backWorkCardEnableDisable();
                                        },
                                ),
                              ],
                            ),
                            kH20sizedBox,
                            Text(
                              ksToodayTask,
                              style: p24RegularTextStyle(cWhiteColor),
                            ),
                            kH20sizedBox,
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: cWhiteColor,
                                borderRadius: BorderRadius.circular(k5BorderRadius),
                              ),
                              child: CustomTextButton(
                                onPressed: () {
                                  homeController.claerAddTaskTextField();
                                  homeController.isTaskTitleDescriptionValue.value = false;
                                  Get.to(AddTask());
                                },
                                text: ksAddTask,
                                textStyle: p20MediumTextStyle(cTextPrimaryColor),
                              ),
                            ),
                            kH20sizedBox,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckInCheckOutBox extends StatelessWidget {
  CheckInCheckOutBox({super.key});
  final HomeController homePageController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        homePageController.isCheckIn.value
            ? CardContainer(
                date: homePageController.currentDate.value,
                time: homePageController.formattedTime,
                title: ksCheckIn,
                dateTextStyle: p20MediumTextStyle(homePageController.isCheckInVisible.value ? cWhiteColor : cGreyColor),
                timeTextStyle: p18MediumTextStyle(homePageController.isCheckInVisible.value ? cWhiteColor : cGreyColor),
                titleTextStyle: p16MediumTextStyle(homePageController.isCheckInVisible.value ? cWhiteColor : cGreyColor),
                icon: Icons.check_box_outline_blank,
                onPressed: null)
            : CardContainer(
                date: homePageController.currentDate.value,
                time: homePageController.formattedTime,
                title: ksCheckIn,
                dateTextStyle: p20MediumTextStyle(homePageController.isCheckInVisible.value ? cWhiteColor : cGreyColor),
                timeTextStyle: p18MediumTextStyle(homePageController.isCheckInVisible.value ? cWhiteColor : cGreyColor),
                titleTextStyle: p16MediumTextStyle(homePageController.isCheckInVisible.value ? cWhiteColor : cGreyColor),
                icon: Icons.check_box_outline_blank,
                onPressed: () {
                  homePageController.isCheckInVisible.value = false;
                  homePageController.checkInCardEnableDisable();
                  if (homePageController.isCheckIn.value == true) {
                    profileController.timer = Timer.periodic(const Duration(seconds: 1), profileController.updateTimer);
                  }
                },
              ),
        kW10sizedBox,
        homePageController.isCheckOut.value
            ? CardContainer(
                date: homePageController.currentDate.value,
                time: homePageController.formattedTime,
                title: ksCheckOut,
                dateTextStyle: p20MediumTextStyle(homePageController.isCheckOutVisible.value ? cWhiteColor : cGreyColor),
                timeTextStyle: p18MediumTextStyle(homePageController.isCheckOutVisible.value ? cWhiteColor : cGreyColor),
                titleTextStyle: p16MediumTextStyle(homePageController.isCheckOutVisible.value ? cWhiteColor : cGreyColor),
                icon: Icons.check_box,
                onPressed: null)
            : CardContainer(
                date: homePageController.currentDate.value,
                time: homePageController.formattedTime,
                title: ksCheckOut,
                dateTextStyle: p20MediumTextStyle(homePageController.isCheckOutVisible.value ? cWhiteColor : cGreyColor),
                timeTextStyle: p18MediumTextStyle(homePageController.isCheckOutVisible.value ? cWhiteColor : cGreyColor),
                titleTextStyle: p16MediumTextStyle(homePageController.isCheckOutVisible.value ? cWhiteColor : cGreyColor),
                icon: Icons.check_box,
                onPressed: () {
                  homePageController.isCheckOutVisible.value = true;
                  homePageController.checkOutCardEnableDisable();
                },
              ),
      ],
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.time,
    this.onPressed,
    required this.dateTextStyle,
    required this.timeTextStyle,
    required this.titleTextStyle,
  });
  final String date;
  final String time;
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;
  final TextStyle dateTextStyle;
  final TextStyle timeTextStyle;
  final TextStyle titleTextStyle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ContainerWidget(
        width: (width / 2) - 15,
        height: 100,
        decoration: BoxDecoration(
          color: cBackgroundColor,
          borderRadius: BorderRadius.circular(k10BorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: k10Padding),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: dateTextStyle,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      icon,
                      color: cWhiteColor,
                    ),
                  ),
                ],
              ),
              kH5sizedBox,
              Text(
                time,
                style: timeTextStyle,
              ),
              kH5sizedBox,
              Text(
                title,
                style: titleTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//*Add Task Page Ui
class AddTask extends StatelessWidget {
  AddTask({super.key});
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cBackgroundColor,
        appBar: AppBar(
          backgroundColor: cBackgroundColor,
          title: Text(
            ksAddTask,
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
            padding: const EdgeInsets.symmetric(horizontal: k10Padding),
            child: Column(
              children: [
                CustomModifiedTextField(
                  controller: homeController.taskTitleController,
                  maxLength: 50,
                  label: ksTaskTitle.tr,
                  onChanged: (v) {
                    if (v.trim() != '') {
                      homeController.taskTitleValue.value = v;
                    }
                  },
                ),
                kH10sizedBox,
                CustomModifiedTextField(
                  controller: homeController.taskDescriptionController,
                  label: ksTaskDelayReason,
                  maxLength: 256,
                  maxLines: 5,
                  focusNode: homeController.taskDescriptionTextFieldFocus,
                  inputType: TextInputType.multiline,
                  onChanged: (v) {
                    if (v.trim() != '') {
                      homeController.taskDescriptionValue.value = v;
                    }
                  },
                ),
                kH10sizedBox,
                CustomModifiedTextField(
                  controller: homeController.taskDelayReasonController,
                  label: ksTaskDescription,
                  // maxLength: 256,
                  maxLines: 2,
                  focusNode: homeController.taskDelayReasonTextFieldFocus,
                  inputType: TextInputType.multiline,
                  onChanged: (v) {
                    if (v.trim() != '') {
                      homeController.taskDelayReasonValue.value = v;
                    }
                  },
                ),
                kH10sizedBox,
                CustomModifiedTextField(
                  controller: homeController.taskDependencyController,
                  label: ksTaskDescription,
                  // maxLength: 256,
                  maxLines: 2,
                  focusNode: homeController.taskDependencyTextFieldFocus,
                  inputType: TextInputType.multiline,
                  onChanged: (v) {
                    if (v.trim() != '') {
                      homeController.taskDependencyValue.value = v;
                    }
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomElevatedButton(
                    label: ksAdd,
                    onPressed: () {
                      print(homeController.taskDescriptionValue.value);
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
