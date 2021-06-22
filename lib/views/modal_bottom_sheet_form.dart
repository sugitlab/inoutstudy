import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/study_record_provider.dart';

void newStudyModalBottomSheetForm(context) {
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
          child: const NewStudyForm(),
        ),
      );
    },
  );
}

class NewStudyForm extends StatefulWidget {
  const NewStudyForm({Key? key}) : super(key: key);
  @override
  _NewStudyFormState createState() => _NewStudyFormState();
}

class _NewStudyFormState extends State<NewStudyForm> {
  String inputField = '';
  void updateInput(String text) {
    setState(() {
      inputField = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (text) {
              updateInput(text);
            },
            autofocus: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'New Item',
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              splashRadius: 18,
              icon: const Icon(Icons.calendar_today),
              onPressed: () => {},
            ),
            SaveInput(
              input: inputField,
            )
          ],
        ),
      ],
    );
  }
}

class SaveInput extends ConsumerWidget {
  const SaveInput({
    Key? key,
    required this.input,
  }) : super(key: key);
  final String input;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      child: const Text('保存'),
      onPressed: () {
        ref.read(studyRecordListProvider.notifier).add(input);
        Navigator.pop(context);
      },
    );
  }
}
