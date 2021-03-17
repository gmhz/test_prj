import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/constant/strings.dart';

import '../constant/colors.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';

  @override
  Widget build(BuildContext context) {
    var controller = ScrollController(initialScrollOffset: 0);
    return Scaffold(
      backgroundColor: ProjectColor.kColorB9B9B9,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: ProjectColor.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                            ),
                            const Text(
                              "Title",
                              style: TextStyle(
                                color: ProjectColor.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                child: const Text(
                                  "X",
                                  style: TextStyle(
                                    color: ProjectColor.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Text(
                          ProjectStrings.topText,
                          style: TextStyle(color: ProjectColor.black),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                CupertinoScrollbar(
                  controller: controller,
                  isAlwaysShown: true,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 100.0,
                      maxHeight: 400.0,
                    ),
                    child: Container(
                      color: ProjectColor.kColorDFDEDE,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        controller: controller,
                        child: const Text(ProjectStrings.longText),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ProjectColor.k25pBlack,
                        offset: Offset(0.0, -8.0),
                        blurRadius: 16.0,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      color: ProjectColor.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      color: ProjectColor.kColorDB00FF,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "TEST BUTTON",
                        style: TextStyle(
                          color: ProjectColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
