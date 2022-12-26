//
//  Item.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/26.
//

import Foundation

struct DogItem: Identifiable {
    let id = UUID()
    let mainTitle: String
    let subTitle: String
    let imageName: String
    
    static var dummyData: [DogItem] {
        
        //        var temp = [DogItem]()
        //
        //        for index in 0...30 {
        //            temp.append(DogItem(mainTitle: "Main title index\(index)",
        //                                subTitle: "Sub title INdex\(index)",
        //                                imageName: "강아지\(index % 3 + 1)"))
        //        }
        //
        //        return tmep
        
        // 위와 동일
        (0...30).map {
            DogItem(mainTitle: "Main title index\($0)",
                    subTitle: "Sub title INdex\($0)",
                    imageName: "강아지\($0 % 3 + 1)")
        }
    }
    
    
}
