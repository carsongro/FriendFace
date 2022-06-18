//
//  DetailView.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var formattedRegistration: String {
        user.registered.formatted(date: .abbreviated, time: .omitted)
    }
    
    var body: some View {
        ScrollView {
            Text(user.company)
                .foregroundColor(.secondary)
            Text("About:")
                .padding(.top)
            Text(user.about)
                .padding(.bottom)
            
            Text("Age: \(user.age)")
                .padding()
            
            Text("\(user.name) joined on \(formattedRegistration)")
                .padding()
            
            Text("Friends List:")
                .padding(.top)
            FriendsListView(user: user)
            
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FriendsListView: View {
    let user: User
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(user.friends, id: \.self) { friend in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    }
                    .padding(.horizontal)
                    }
                }
            }
        }
}
