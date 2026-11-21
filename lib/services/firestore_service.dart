import 'package:cloud_firestore/cloud_firestore.dart';
import "../models/todo.dart";

class FirestoreService {
  final CollectionReference _todosCollection = FirebaseFirestore.instance.collection('todos');

  //Create atau tambah task baru
  Future<void> addTodo(String taskName) async{
    final newTodo = Todo(id:'', task:taskName, isDone:false);
    await _todosCollection.add(newTodo.toMap());
  }

  //Read atau ambil list todo dari firebase/firestore
  Stream<List<Todo>> getTodos(){
    return _todosCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Todo.fromFirestore(doc)).toList()
        );
  }

  //Update centang atau box status 
  Future<void> updateTodoStatus(String Id, bool currentStatus) async{
    await _todosCollection.doc(Id).update({'isDone': !currentStatus});
  }

  //Delete 
  Future<void> deleteTodo(String Id) async{
    await _todosCollection.doc(Id).delete();
  }
}