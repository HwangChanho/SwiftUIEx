//
//  UserDetailView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2023/01/02.
//

import Foundation
import SwiftUI

struct UserDetailView: View {
    var user: Item2
    
    var body: some View {
        VStack {
            URLImage(urlString: user.avatar)
                .frame(width: UIScreen.main.bounds.width, height: 250)
            Text(user.name)
                .font(.largeTitle)
            Text(user.createdAt)
        }
    }
}
