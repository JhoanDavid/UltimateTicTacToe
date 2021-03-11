import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ultimate_tic_tac_toe/resource/constants.dart';
import 'package:ultimate_tic_tac_toe/ui/rounds_page_ui.dart';

class MethodsGame extends StatelessWidget {
  Color getColor(Set<MaterialState> states) {
    return Colors.red[400];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: (MediaQuery.of(context).size.width * 0.80),
        height: (MediaQuery.of(context).size.height * 0.30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ElevatedButton(
                    child: Container(
                        height: (MediaQuery.of(context).size.height * 0.08),
                        width: (MediaQuery.of(context).size.width * 0.70),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Icon(
                                      Icons.videogame_asset,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                    text: Constants.vs,
                                    style: GoogleFonts.bungee(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                      height: 1.5,
                                    )),
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Icon(
                                      Icons.videogame_asset,
                                      size: 35,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return RoundsPage();
                      }));
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateColor.resolveWith(getColor)),
                    child: Container(
                        height: (MediaQuery.of(context).size.height * 0.08),
                        width: (MediaQuery.of(context).size.width * 0.70),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headline3,
                              children: [
                                TextSpan(
                                    text: Constants.outOfApp,
                                    style: GoogleFonts.bungee(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87,
                                      height: 1.5,
                                    )),
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Icon(
                                      Icons.exit_to_app,
                                      size: 40,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  )
                ],
              )
            ]),
      ),
    );
  }
}
