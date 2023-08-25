import 'package:employee_management/utils/constants/imports.dart';
import 'package:employee_management/views/owner/add_employee.dart';


const String krSplashScreen = '/splash-screen';
const String krLogin = '/login';
const String krEmployeeHomepage = '/employeeHomepage';
const String krEmployeeProfile = '/employeeProfile';
const String krOwnerHomepage = '/ownerHomepage';
const String krAddEmployee = '/addEmployee'; 

List<GetPage<dynamic>>? routes = [
  GetPage(name: krSplashScreen, page: () => SplashScreen(), transition: Transition.noTransition),
  GetPage(name: krLogin, page: () => Login(), transition: Transition.noTransition),
  GetPage(name: krEmployeeHomepage, page: () => EmployeeHomepage(), transition: Transition.noTransition),
  GetPage(name: krEmployeeProfile, page: () => EmployeeProfile(), transition: Transition.noTransition),
  GetPage(name: krOwnerHomepage, page: () => OwnerHomepage(), transition: Transition.noTransition),
  GetPage(name: krAddEmployee, page: () => AddEmployee(), transition: Transition.noTransition),
];
