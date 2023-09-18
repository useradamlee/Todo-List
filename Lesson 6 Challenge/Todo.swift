//
//  SwiftUIView.swift
//  Lesson 6 Challenge test
//
//  Created by Lee Jun Lei Adam on 19/8/23.
//

import SwiftUI

struct TodoDetailView: View {
    let todo: Todo
    @Binding var todoLists: [Todo]
    
    @State var hwk = 0
    
    var body: some View {
        VStack {
            Text(todo.title)
                .font(.title)
                .padding()
            Stepper("Pieces of completed homework: \(hwk)", value: $hwk, in: 0...Int.max, step: 1)
                .padding()
            Button(action: {
                if let index = todoLists.firstIndex(where: { $0.id == todo.id }) {
                    todoLists.remove(at: index)
                }
            }) {
                Label("Finish", systemImage: "checkmark")
                    .fontWeight(.bold)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        
                        
            }
            .padding()
//what I want for this application to do is to focus on one task only
            Text(todo.isDone ? "Done" : "Not Done")
                .foregroundColor(todo.isDone ? .green : .red)
                .padding()
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: Todo(title: "Sample Todo", isDone: false), todoLists: .constant([Todo(title: "")]))
    }
}
