import 'package:employee_management/utils/constants/imports.dart';

class AddEmployee extends StatelessWidget {
  const AddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: AppBar(
        backgroundColor: cBackgroundColor,
        title: Text(ksAddEmployee),
      ),
    );
  }
}
