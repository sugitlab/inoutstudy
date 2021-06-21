import 'package:hooks_riverpod/hooks_riverpod.dart';
import './study_record.dart';

final studyRecordListProvider = StateNotifierProvider<StudyRecordList, List<StudyRecord>>((ref) {
  return StudyRecordList([
    StudyRecord(id: 'todo-0', title: 'hi'),
    StudyRecord(id: 'todo-1', title: 'hello'),
    StudyRecord(id: 'todo-2', title: 'bonjour'),
  ]);
});
