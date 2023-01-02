//
//  JSONContentView2.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2023/01/02.
//

import SwiftUI

// JSONContentView2

struct JSONContentView2: View {
    
    @State private var users = [Item2]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    Text("List")
                        .font(.largeTitle)
                    ForEach(users) { user in
                        
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            HStack {
                                URLImage(urlString: user.avatar)
                                    .frame(width: 100, height: 100)
                                Text("\(user.name)")
                                Spacer()
                            }
                        }
                    }
                    
                }.onAppear {
                    WebService2().loadUsers { users in
                        self.users = users
                    }
                    
                }
            }
        }.navigationTitle("User List")
    }
}

struct JSONContentsView2_Previews: PreviewProvider {
    static var previews: some View {
        JSONContentView2()
    }
}
