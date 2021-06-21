import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class StudyRecord {
  StudyRecord({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  @override
  String toString() {
    return 'This item is $title';
  }
}

class StudyRecordList extends StateNotifier<List<StudyRecord>> {
  StudyRecordList([List<StudyRecord>? initial]) : super(initial ?? []);

  void add(String title) {
    state = [
      ...state,
      StudyRecord(
        id: _uuid.v4(),
        title: title,
      ),
    ];
  }

  void edit({required String id, required String title}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          StudyRecord(
            id: todo.id,
            title: title,
          )
        else
          todo,
    ];
  }

  void remove(StudyRecord target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}
