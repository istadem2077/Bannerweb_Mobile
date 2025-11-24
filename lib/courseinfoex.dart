import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseRegExPage extends StatelessWidget {
  CourseRegExPage({super.key});

  // Search controller (needed for the search bar)
  final TextEditingController _searchController = TextEditingController();

  // Function to open URLs
  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(),
            prefix: Icon(Icons.search),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SelectableText.rich(
          TextSpan(
            children: [
              //Title
              TextSpan(
                text: "Access to Information system\n",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: "\n"),
              //Body text
              const TextSpan(
                text:
                  "Course registrations can be done online via Information System. You can enter to Information System via ",
              ),
              //clickable link 1
              TextSpan(
                text: "bannerweb.sabanciuniv.edu",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = (){
                    _openLink("https://bannerweb.sabanciuniv.edu");
                  },
              ),
              const TextSpan(
                text:
                ". In order to connect to Sabancı University, you should have a SU-net username "
                    "and creating an account is the first thing you have to do. With this account, "
                    "you will be able to access the SU information system and thus complete course "
                    "registration, access your records, etc.\n\n",
              ),
              const TextSpan(
                text: "Please check new comers link to create your account: ",
              ),
              //clickable link 2
              TextSpan(
                text: "https://www.sabanciuniv.edu/en/suaccountform",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _openLink("https://www.sabanciuniv.edu/en/suaccountform");
                  },
              ),
              const TextSpan(text: "\n\n"),
              //2nd section
              TextSpan(
                text: "Course Schedule and Course Selection\n",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: "Course selections can be done by viewing the “Course Schedule” via Information System.\n\n",
              ),
              //3rd section
              TextSpan(
                text: "Course Registrations\n",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text:
                'By entering to Information System, course registration operations can be done via “Student & Financial Aid > Registration” menu.'
                    'Maximum 18 SU credits can be registered. If registration trial is done over this limit, system gives Maximum Hours Exceeded warning.'
                    'Courses with co-requisite class should be registered at same time. If not; system gives Corq_"XXX xxx CRN" Req warning.'
                    'System gives Time Conflict with "CRN" warning for the courses in case of any time conflicts.'
                    'Course registrations are being done within their capacity. If you want to register to a course with full capacity; system gives Closed Section warning.'
                    'In a trial for registering to courses which has needed instructor approval; system gives "Approval Needed" warning.'
                    'Registration Approval from Instructor For registration to courses with Approval Needed from P.'
                    'In. restriction, can only be done by the approval of instructor. If instructor approves, course registration can be done.'
                    'The details of the registration override application are displayed in the application list.'
                    'If registration override is given then "Approve" is displayed, if rejected "Reject" is displayed.\n\n',
              ),
              TextSpan(
                text: "Learning Agreements\n",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text:
                'It is the student’s responsibility to update and to get the approvals for the Learning Agreement.'
                    ' After online registrations, it is required to control and update the Learning Agreements according to your schedule.\n\n'
              ),
              TextSpan(
                text: "Attention!\n",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text:
                '1. Course registrations and add-drop are being done according to current local time in Turkey.\n'
                    '2. After the add-drop period no changes will be done.\n\n'
                    '© Sabancı Üniversitesi. Orta Mahalle, Tuzla 34956 İstanbul Tel: 0216 483 90 00 Faks: 0216 483 90 05\n\n'
                    'For your questions, requests and suggestions : '
              ),
              TextSpan(
                text:"SU Ticket",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = (){
                    _openLink("https://hc.suticket.sabanciuniv.edu/servicedesk/customer/portal/200/user/login?destination=portal%2F200");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}