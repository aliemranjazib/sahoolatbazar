import 'package:flutter/material.dart';
import 'package:sahoolar_bazar/adminside/update/product_update/show_category_product_for_update.dart';
import 'package:sahoolar_bazar/category/main_category/main_category_model.dart';

class ShowCategoryForUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('main category'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Column(
            //   children: [

            //     // Container(
            //     //   decoration: decoration(),
            //     //   child: TextField(
            //     //     controller: search,
            //     //     decoration: InputDecoration(hintText: 'search here'
            //     //         // border: InputDecoration.none;
            //     //         ),
            //     //   ),
            //     // ),

            //   ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: maincategorydata
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        ShowCategoryProductForUpdate(
                                          title: e.name,
                                        )));
                          },
                          child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(colors: [
                                    Colors.green.shade200,
                                    Colors.blue.shade300,
                                  ])),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        e.image,
                                        width: 90,
                                        height: 90,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  e.name,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  e.name,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ))
                  .toList(),
            )));
  }
}
