import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/study_record_provider.dart';
import '../views/modal_bottom_sheet_form.dart';

class TopSummary extends ConsumerWidget {
  const TopSummary({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(studyRecordListProvider);
    return Scaffold(
      extendBody: true,
      body: Center(
        child: ListView.builder(
          itemCount: records.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              color: Colors.green.withOpacity(index % 10 / 10),
              child: Center(
                child: Text(records.elementAt(index).toString(), style: const TextStyle(fontSize: 24)),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: const Icon(Icons.add),
        onPressed: () => newStudyModalBottomSheetForm(context),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        notchMargin: 5,
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
