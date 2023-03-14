//
//  ContentView.swift
//  SwiftUI-Map
//
//  Created by 桑野友輔 on 2023/03/13.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var displaySearchkey: String = ""
    @State var displayMapType: MapType = .standard
    
    var body: some View {
        VStack{
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
            //入力が完了したら実行
                .onSubmit {
                    displaySearchkey = inputText
                }
                .padding()
            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: displaySearchkey, mapType: displayMapType)
                Button {
                    if displayMapType == .standard {
                        displayMapType = .statellite
                    } else if displayMapType == .statellite {
                        displayMapType = .hybird
                    } else {
                        displayMapType = .standard
                    }
                }label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
