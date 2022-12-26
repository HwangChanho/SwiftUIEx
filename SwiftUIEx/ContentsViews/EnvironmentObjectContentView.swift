//
//  EnvironmentObjectContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/26.
//

import SwiftUI

// EnvironmentObject
class MyInfo2: ObservableObject {
    @Published var name = ""
    @Published var photoURL = ""
    var token = ""
}

class MyLocation: ObservableObject {
    @Published var name = ""
    @Published var photoURL = ""
    var token = ""
}

/*
 
 씬 딜리게이트에서 또는 @main에서 값을 넣어줘야 실행이 가능하다.
 EnvironmentObjectContentView().environmentObject(MyInfo2()) 인스턴스화 시켜줘야한다.
 
 */ 

struct EnvironmentObjectContentView: View {
    
    @EnvironmentObject var myInfo: MyInfo2 // 타입 지정만 가능
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                NavigationLink {
                    DetailView2()
                } label: {
                    Text("navigate")
                }
                
                Text("name : \(myInfo.name)")
                    .font(.largeTitle)
                    .padding()
                Text("url : \(myInfo.photoURL)")
                    .font(.largeTitle)
                    .padding()
            }
            
        }.onAppear {
            myInfo.name = "kim"
            myInfo.photoURL = "https://www.apple.com"
        }
        
    }
}

struct DetailView2: View {
    
    @EnvironmentObject var myInfo: MyInfo2
    
    var body: some View {
        VStack {
            Text("detail name : \(myInfo.name)")
                .font(.largeTitle)
                .padding()
            Text("detail url : \(myInfo.photoURL)")
                .font(.largeTitle)
                .padding()
            
            Button("Change Name") {
                myInfo.name = "lee"
            }
        }
    }
}

struct EnvironmentObjectContentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectContentView()
            .environmentObject(MyInfo2())
            .environmentObject(MyLocation())
    }
}
