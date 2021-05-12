//
//  ContentView.swift
//  UI-183
//
//  Created by にゃんにゃん丸 on 2021/05/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            MainView()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
