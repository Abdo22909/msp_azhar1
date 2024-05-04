
import 'package:flutter/material.dart';
import 'package:msp/pages/home.dart';
import 'package:onboarding/onboarding.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatelessWidget {

  final onBoardingPagesList = [
    //first
    PageModel(
      widget: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 45.0, top: 45.0),
            child: Image.asset(
              'assets/onboarding/logo-discussion.png',
              height: 100,
            ),
          ),
          Container(
              width: double.infinity,
              child: Text('MSP Tech Club at Al-Azher', style: pageTitleStyle)),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            child: Text(
              '''
              Our Mission :\nMSP Tech club at Al-Azher has a clear mission to help the students in the camps and to be there for any kind of support needed whether it's technical or non- technical and to help them find their most suitable career.
              '''
                  .trim(),
              style: pageInfoStyle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Text(
              '''
              Our products :\nTechnical sessions , soft skills , workshops , online courses and Compatitions .
              '''
                  .trim(),
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
    //second
    PageModel(
      widget: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 45.0, top: 45.0),
            child: Lottie.asset('assets/onboarding/company-discussion.json',height: 200,repeat: true,),),
          Container(
              width: double.infinity,
              child: Text('Technical Committee', style: pageTitleStyle)),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            child: Text('Developers, Techoons, Media \nInterested in keeping up with life with technology?'.trim(),
              style: pageInfoStyle,
            ),
          ),

          SizedBox(
            height: 50,
          ),

          Container(
              width: double.infinity,
              child: Text('Non Technical Committee', style: pageTitleStyle)),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Text('HR, PR, FR, Marketing, Logistic \nInterested in organizing the team and making it known among students'.trim(),
              style: pageInfoStyle,
            ),
          ),


        ],
      ),
    ),
    //third
    PageModel(
      widget: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
              //bottom: 10.0,
                top: 30.0),
            child: Lottie.asset('assets/onboarding/software-development.json',height: 300,repeat: true,),),

          Container(
              width: double.infinity,
              child: Text('Developers', style: pageTitleStyle)),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text('Flutter, web developers, Testing '.trim(),
              style: pageInfoStyle,
            ),
          ),

          SizedBox(
            height: 30,
          ),

          Container(
              width: double.infinity,
              child: Text('Techoons', style: pageTitleStyle)),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text('AI, Machine Learning, Embedded system, Security, Network, Java'.trim(),
              style: pageInfoStyle,
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Container(
              width: double.infinity,
              child: Text('Media', style: pageTitleStyle)),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text('Photoshop, photography, video editing, illustration'.trim(),
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
    //four
    PageModel(
      widget: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
              //bottom: 10.0,
                top: 20.0),
            child: Lottie.asset('assets/onboarding/logistic-coupon-json-animation.json',height: 300,repeat: true,),),

          Container(
              width: double.infinity,
              child: Text('PR', style: pageTitleStyle)),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text('Interested in public relations and finding speakers for the event'.trim(),
              style: pageInfoStyle,
            ),
          ),

          SizedBox(
            height: 30,
          ),

          Container(
              width: double.infinity,
              child: Text('FR', style: pageTitleStyle)),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text('Finding money for Team for different purposes'.trim(),
              style: pageInfoStyle,
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Container(
              width: double.infinity,
              child: Text('Logistic', style: pageTitleStyle)),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text('Responsible for organizing and decorating events'.trim(),
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
    //five
    PageModel(
      widget: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
                right: 20,
                top: 20.0),
            child: Lottie.asset('assets/onboarding/marketing-analytics.json',height: 300,repeat: true,),),

          Container(
              width: double.infinity,
              child: Text('Marketing', style: pageTitleStyle)),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text('Interested in creating posts and replying to page messages'.trim(),
              style: pageInfoStyle,
            ),
          ),

          SizedBox(
            height: 30,
          ),

          Container(
              width: double.infinity,
              child: Text('HR', style: pageTitleStyle)),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text('Interested in evaluating the member from time to time and encouraging them'.trim(),
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
  ];
  _storeOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', 0);
  }
  @override
  Widget build(BuildContext context) {
    return Onboarding(
        background: Color(0xFF3490dc),
        proceedButtonStyle: ProceedButtonStyle(

          proceedButtonColor: Colors.blue,
            proceedpButtonText: Text('Get Start',style: TextStyle(fontSize: 20,color: Colors.white),) ,
          proceedButtonRoute: (context) {

            _storeOnboardInfo();

            return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Home()
              ),
                  (route) => false,
            );
          },
        ),
        pages: onBoardingPagesList,
        skipButtonStyle: SkipButtonStyle(
          skipButtonColor: Colors.blue,
          skipButtonText: Text('Skip',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
        isSkippable: true,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.line(
            lineDesign: LineDesign(
              lineType: DesignType.line_nonuniform,
            ),
          ),
        ),
    );
  }
}
