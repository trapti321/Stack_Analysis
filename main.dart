import 'package:flutter/material.dart';
import 'package:web_test/src/ui/theme/color.dart';
import 'package:web_test/src/ui/views/dashboard/dashboard_view.dart';
import 'package:web_test/src/ui/widgets/app_button.dart';



void main() => runApp(const SignUpApp());

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const DashboardView(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text(
            'Intraday APP',
          ),
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        backgroundColor: Colors.white,
        body: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
                color: AppColors.primary,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomButton3(
                    text: 'Enter',
                    color: CustomBgColor.primary,
                    onPressed: () => Navigator.push(
                          context as BuildContext,
                          MaterialPageRoute(
                              builder: (context) => const DashboardView()),
                        )),
              ))
        ],
      ),
    );
  }
}
