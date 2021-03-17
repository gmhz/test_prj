import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../providers/horizontal_items.dart';
import '../providers/vertical_items.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: GestureDetector(
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
            ),
            Expanded(
              child: Consumer<VerticalItemsProvider>(
                builder: (_, vProvider, __) {
                  return Container(
                    height: 166,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: vProvider.itemsCount + 3,
                      itemBuilder: (ctx, index) {
                        if (index == 1) {
                          return Consumer<HorizontalItemsProvider>(
                            builder: (_, hProvider, __) {
                              return Container(
                                height: 182,
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: hProvider.itemsCount,
                                  itemBuilder: (ctx, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        bottom: 16,
                                        top: 16,
                                        left: index == 0 ? 16 : 8,
                                        right: 8,
                                      ),
                                      height: 150,
                                      width: width - 64,
                                      decoration: const BoxDecoration(
                                        color: ProjectColor.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ProjectColor.k25pBlack,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 16.0,
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        hProvider.itemAt(index) ?? "",
                                        style: const TextStyle(
                                          color: ProjectColor.black,
                                          fontSize: 24,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        } else if (index == 0) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: const Text(
                              "Section 1 (2)",
                              style: TextStyle(
                                color: ProjectColor.black,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          );
                        } else if (index == 2) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: const Text(
                              "Section 2 (4)",
                              style: TextStyle(
                                color: ProjectColor.black,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          );
                        }
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          height: 150,
                          decoration: const BoxDecoration(
                            color: ProjectColor.white,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            boxShadow: [
                              BoxShadow(
                                color: ProjectColor.k25pBlack,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 16.0,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            vProvider.itemAt(index) ?? "",
                            style: const TextStyle(
                              color: ProjectColor.black,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
