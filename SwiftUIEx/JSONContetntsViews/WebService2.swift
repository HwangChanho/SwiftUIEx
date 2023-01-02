//
//  WebService2.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2023/01/02.
//

import Foundation
import SwiftUI

// MARK: - User
struct UserNew: Codable, Identifiable {
    let id: String
    let items: [Item2]
    let count: Int
    let anyKey: String

    enum CodingKeys: String, CodingKey {
        case id = "requestId"
        case items, count, anyKey
    }
}

// MARK: - Item
struct Item2: Codable, Identifiable {
    let createdAt, name: String
    let avatar: String
    let id: String
}

class WebService2 {
    func loadUsers(completion: @escaping ([Item2]) -> Void) {
        
        guard let url = URL(string: "https://63b22cd40d51f5b2972513f8.mockapi.io/testapi/v1/user") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data else { return }
            
            let users = try! JSONDecoder().decode(UserNew.self, from: data)
            
            completion(users.items)
            
        }.resume()
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        loadImageFromURL()
    }
    
    func loadImageFromURL() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else { return }
            
            guard let loadedImage = UIImage(data: data) else { return }
            
            print("image: ", loadedImage)
            
            DispatchQueue.main.async {
                self.image = loadedImage
            }
        }.resume() // resume은 네트워크 콜을 하는것 이다.
    }
}

struct URLImage: View {
    @ObservedObject var loader: ImageLoader
    
    init(urlString: String) {
        self.loader = ImageLoader(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: (loader.image ?? UIImage(systemName: "person"))!)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
