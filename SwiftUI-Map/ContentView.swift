//
//  ContentView.swift
//  SwiftUI-Map
//
//  Created by 桑野友輔 on 2023/03/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            MapView(searchKey: "羽田空港")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
