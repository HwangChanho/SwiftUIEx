//
//  JSONContentsView.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2022/12/28.
//

import SwiftUI

// JSONContentsView

struct JSONContentsView: View {
    
    @State var todos = [Todo]()
    
    var body: some View {
        List(todos) { todo in // identifierble 프로토콜 참조, id 이름의 특정변수 필요
            VStack(alignment: .leading) {
                Text(todo.title!)
                Text(todo.completed!.description)
                Text("?")
            }
        }
        .onAppear(perform: {
            WebService().getTodos { todos in
                self.todos = todos
            }
        })
    }
}

struct JSONContentsView_Previews: PreviewProvider {
    static var previews: some View {
        JSONContentsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
