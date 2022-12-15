//
//  ListContentView.swift
//  SwiftUIEx
//
//  Created by MDsqr on 2022/12/15.
//

import SwiftUI

// List
// Model

struct LocationInfo: Identifiable, Hashable {
    var id = UUID()
    var city = ""
    var weather = ""
}

struct ListContentView: View {
    
    @State private var Locations = [
        LocationInfo(city: "seoul", weather: "sunny"),
        LocationInfo(city: "busan", weather: "bunny"),
        LocationInfo(city: "incheon", weather: "gunny"),
        LocationInfo(city: "zip", weather: "junny"),
        LocationInfo(city: "nugu", weather: "lunny")
    ]
    
    var body: some View {
        List {
            ForEach(Locations, id: \.self) { location in // /.self -> Hashable
                HStack {
                    Text("\(location.city)")
                    Text("\(location.weather)")
                }
            }
            
            ForEach(Locations) { location in // id -> identifiable
                HStack {
                    Text("\(location.city)")
                    Text("\(location.weather)")
                }
            }
            
            ForEach(0..<Locations.count) { index in // 인덱스로 접근
                HStack {
                    Text("\(index + 1)")
                    Text("\(Locations[index].city)")
                    Text("\(Locations[index].weather)")
                }
            }
        }
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
