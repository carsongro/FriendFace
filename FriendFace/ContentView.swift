//
//  ContentView.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//

import SwiftUI

struct ContentView: View {
    let users: [User] = Bundle.main.decode("https://www.hackingwithswift.com/samples/friendface.json")
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { item in
                NavigationLink {
                    DetailView(user: item)
                } label: {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.isActive ? "Active" : "Not Active")
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
