import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/study_record_provider.dart';

class TopSummary extends HookConsumerWidget {
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
        onPressed: () => _newStudyModalBottomSheet(context),
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

void _newStudyModalBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'New Item',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                onTap: () {},
              ),
            ],
          ),
        ),
      );
    },
  );
}
