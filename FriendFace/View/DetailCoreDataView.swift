//
//  DetailCoreDataView.swift
//  FriendFace
//
//  Created by Carson Gross on 6/19/22.
//

import SwiftUI

struct DetailCoreDataView: View {
    let user: CachedUser
    
    var formattedRegistration: String {
        user.unwrappedRegistered.formatted(date: .abbreviated, time: .omitted)
    }
    
    var body: some View {
        ScrollView {
            Text(user.unwrappedCompany)
                .foregroundColor(.secondary)
            Text("About:")
                .padding(.top)
            Text(user.unwrappedAbout)
                .padding(.bottom)
            
            Text("Age: \(user.age)")
                .padding()
            
            Text("\(user.unwrappedName) joined on \(formattedRegistration)")
                .padding()
            
            Text("Tags:")
                .padding(.top)
            TagsCoreDataView(user: user)
    
            Text("Friends List:")
                .padding(.top)
            FriendsListCoreDataView(user: user)
            
        }
        .navigationTitle(user.unwrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
