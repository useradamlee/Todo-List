//
//  ContentView.swift
//  Lesson 6 Challenge test
//
//  Created by Lee Jun Lei Adam on 19/8/23.
//
import SwiftUI

struct Todo: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var isDone = false
}
/// GITHUB works?
/// wow
struct ContentView: View {
    
    @State var listOfTodos = [
        Todo (title: "task"),
        Todo (title: "task")
    ]
    @State private var newTodoTitle = ""
    @State private var selectedTodo: Todo? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(listOfTodos) { todo in
                        HStack {
                            Text(todo.title)
                            Spacer()
                            Button(action: {
                                toggleTodoCompletion(todo: todo)
                            }) {
                                Image(systemName: todo.isDone ? "checkmark.square.fill" : "square")
                            }
                            Button(action: {
                                selectedTodo = todo
                            }) {
                                Image(systemName: "info.circle")
                            }
                        }
                    }
                }
                .navigationTitle("Todo List")
                
                HStack {
                    TextField("New Task", text: $newTodoTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        addNewTodo()
                    }) {
                        Text("Add")
                    }
                }
                .padding()
            }
        }
        .sheet(item: $selectedTodo) { todo in
            TodoDetailView(todo: todo, todoLists: $listOfTodos) 
        }
    }
    
    func toggleTodoCompletion(todo: Todo) {
        if let index = listOfTodos.firstIndex(where: { $0.id == todo.id }) {
            listOfTodos[index].isDone.toggle()
        }
    }
    
    func addNewTodo() {
        if !newTodoTitle.isEmpty {
            listOfTodos.append(Todo(title: newTodoTitle))
            newTodoTitle = "new"
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
