import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pltable/api_integration/api_provider.dart';
import 'package:pltable/constants.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(dataprovider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Premier League Standing',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Helvetica-Bold',
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  headingRowHeight: 40,
                  columnSpacing: 40,
                  columns: const [
                    DataColumn(
                      label: Text(
                        'Team',
                        style: kstyle,
                      ),
                    ),
                    DataColumn(
                      label: Text('P', style: kstyle),
                    ),
                    DataColumn(
                      label: Text('W', style: kstyle),
                    ),
                    DataColumn(
                      label: Text('D', style: kstyle),
                    ),
                    DataColumn(
                      label: Text('L', style: kstyle),
                    ),
                    DataColumn(
                      label: Text('F/A', style: kstyle),
                    ),
                    DataColumn(
                      label: Text('Pts', style: kstyle),
                    ),
                  ],
                  rows: List.generate(data.pl.length, (index) {
                    return DataRow(cells: [
                      DataCell(Row(
                        children: [
                          Text(data.pl[index].rank.toString(),
                              style: const TextStyle(
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          Image(
                            image: NetworkImage(data.pl[index].logo),
                            height: 30,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            data.pl[index].name,
                            style: const TextStyle(
                              fontFamily: 'IBMPlexMono',
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      )),
                      DataCell(Text(data.pl[index].gamesPlayed.toString(),
                          style: numstyle)),
                      DataCell(Text(data.pl[index].wins.toString(),
                          style: numstyle)),
                      DataCell(Text(data.pl[index].ties.toString(),
                          style: numstyle)),
                      DataCell(Text(data.pl[index].losses.toString(),
                          style: numstyle)),
                      DataCell(Text(
                          "${data.pl[index].goalsFor}/${data.pl[index].goalsAgainst}",
                          style: numstyle)),
                      DataCell(Text(data.pl[index].points.toString(),
                          style: numstyle)),
                    ]);
                  })),
            )));
  }
}
