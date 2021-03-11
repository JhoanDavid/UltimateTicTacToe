import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ultimate_tic_tac_toe/resource/constants.dart';
import 'package:ultimate_tic_tac_toe/ui/home_page_ui.dart';
import 'package:ultimate_tic_tac_toe/widget/background_widget.dart';

class StartupView extends HookWidget {
  StartupView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController();
    return Scaffold(
        body: Container(
            child: Stack(children: <Widget>[
      BackgroundWidget(),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Lottie.asset(Constants.startup,
                    width: (MediaQuery.of(context).size.width * 0.70),
                    height: (MediaQuery.of(context).size.height * 0.70),
                    controller: animationController, onLoaded: (composition) {
              animationController.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, anotherAnimation) {
                        return HomePage();
                      },
                      transitionDuration: Duration(milliseconds: 2000),
                      transitionsBuilder:
                          (context, animation, anotherAnimation, child) {
                        animation = CurvedAnimation(
                            curve: Curves.ease, parent: animation);
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      }));
                }
              });

              animationController
                ..duration = composition.duration
                ..forward();
            })),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('ULTIMATE',
                          style: GoogleFonts.teko(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87))
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('TIC',
                          style: GoogleFonts.bungeeOutline(
                              fontSize: 55,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87)),
                      Text('TAC',
                          style: GoogleFonts.bungee(
                              fontSize: 55, color: Colors.black87)),
                      Text('TOE',
                          style: GoogleFonts.bungeeOutline(
                              fontSize: 55,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87))
                    ])
              ],
            )
          ]),
    ])));
  }
}
