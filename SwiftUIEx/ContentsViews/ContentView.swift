//
//  ContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/08.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        ZStack { // 순차적으로 올려 놓는다 (겹침)
//            Text("Hello")
            Color.init(red: 200/255, green: 200/255, blue: 100/255)
                .edgesIgnoringSafeArea(.all) // safearea 덮기
//            Color.black
            VStack{
                HStack {
                    Text("world!")
                        .background(Color.green) // View 프로토콜을 따르는걸 넣을수 있다.
                    Text("world!")
                        .background(Color.green) // View 프로토콜을 따르는걸 넣을수 있다.
                    
                    VStack{
                        Text("world!")
                        Text("world!")
                        Text("world!")
                    }.padding(.bottom, 50)
                    
                    Text("world! hello world")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .background(Color.green)
                        .cornerRadius(500) // 최대 값은 원 형태
                        .padding(.top, 50)
                        .underline()
                        .lineLimit(1)
                        .truncationMode(.head) // 줄임 형태 .middle, .tail 가운데 끝
                        .lineSpacing(30)
                        .bold()
                        .frame(width: 200, height: 400)
                }
            }
        }
        
//        VStack {
//
//        }
    }
    
    /**
     NavigationView {
         List {
             ForEach(items) { item in
                 NavigationLink {
                     Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                 } label: {
                     Text(item.timestamp!, formatter: itemFormatter)
                 }
             }
             .onDelete(perform: deleteItems)
         }
         .toolbar {
             ToolbarItem(placement: .navigationBarTrailing) {
                 EditButton()
             }
             ToolbarItem {
                 Button(action: addItem) {
                     Label("Add Item", systemImage: "plus")
                 }
             }
         }
         Text("Select an item")
     }
     
     */

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
