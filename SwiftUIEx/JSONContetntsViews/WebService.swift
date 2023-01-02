//
//  WebService.swift
//  SwiftUIEx
//
//  Created by AlexHwang on 2022/12/28.
//

import Foundation

// https://jsonplaceholder.typicode.com/todos/1

struct Todo: Codable, Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
}

class WebService {
    func getTodos(completion: @escaping ([Todo]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            print("data :: ", data, response, error)
            
            guard let hasData = data else { return }
            
            let todos = try! JSONDecoder().decode([Todo].self, from: hasData) // 강제 언랩핑이라 크래쉬남
            
            completion(todos)
        }
    }
}


