import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PiCharts extends StatelessWidget {
  const PiCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: PieChart(
                      swapAnimationDuration: const Duration(milliseconds: 500),
                      swapAnimationCurve: Curves.bounceInOut,
                      PieChartData(
                          sections: List.generate(
                        dataList.length,
                        (index) => PieChartSectionData(
                          color: dataList[index].color,
                          value: dataList[index].value,
                        ),
                      )),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:
                      MediaQuery.of(context).size.width * .07 * dataList.length,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: dataList.length ~/ 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: ListTile(
                                  leading: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: dataList[index].color,
                                      borderRadius: BorderRadius.circular(0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: Text(dataList[index].name),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: ListTile(
                                  leading: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color:
                                          dataList[index + dataList.length ~/ 2]
                                              .color,
                                      borderRadius: BorderRadius.circular(0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: Text(dataList[index].name),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}

class DataItem {
  String name;
  double value;
  Color color;

  DataItem({required this.name, required this.value, required this.color});
}

// Usage
List<DataItem> dataList = [
  DataItem(name: 'Category 1', value: 30, color: Colors.blue),
  DataItem(name: 'Category 2', value: 20, color: Colors.green),
  DataItem(name: 'Category 3', value: 10, color: Colors.yellow),
  DataItem(name: 'Category 4', value: 40, color: Colors.red),
];
