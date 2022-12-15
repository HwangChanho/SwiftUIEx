//
//  ListSectionContentVIew.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/15.
//

import SwiftUI

// List Section

// 1. 기본구조
// 2. data 가공 (원하는 형태로 표현)

// model

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let index: Int
}

struct ListSectionContentView: View {
    
    var animalList = [
        Animal(name: "dog", index: 1),
        Animal(name: "cat", index: 2),
        Animal(name: "cow", index: 3),
        Animal(name: "dog", index: 4),
        Animal(name: "dog", index: 5),
        Animal(name: "bi", index: 6),
        Animal(name: "gierf", index: 7)
    ]
    
    // dog : [Animal, Animal, Animal]
    var groupedAnimal: [String: [Animal]] {
        // Dictionary(grouping: animalList) { $0.name } 단일 일경우 리턴 생략 가능
        var dic = Dictionary(grouping: animalList) { $0.name }
        
        for (key, value) in dic {
            dic[key] = value.sorted(by: { $0.index < $1.index })
        }
        
        return dic
    }
    
    var groupKey: [String] {
        groupedAnimal.map { $0.key }
    }
    
    var body: some View {
        VStack {
            List{
                ForEach(groupKey, id: \.self) { animalKey in
                    Section {
                        ForEach(groupedAnimal[animalKey]!) { animal in
                            HStack{
                                Text(animal.name)
                                Text(String(animal.index))
                            }
                        }
                    } header: {
                        Text("\(animalKey)")
                    }
                }
            }.frame(height: 700)
            
            List{
                ForEach(animalList) { list in
                    HStack{
                        Text("\(list.index)")
                        Text(list.name)
                    }
                }
            }
            
            List{
                Section {
                    Text("A")
                    Text("A")
                    Text("A")
                } header: {
                    Image(systemName: "pencil")
                }
                
                Section {
                    Text("A")
                    Text("A")
                    Text("A")
                } footer: {
                    Image(systemName: "pencil")
                }
                
                Section {
                    Text("A")
                    Text("A")
                    Text("A")
                } header: {
                    Image(systemName: "pencil")
                } footer: {
                    Image(systemName: "pencil")
                }

            }
        }
        
    }
}

struct ListSectionContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListSectionContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

