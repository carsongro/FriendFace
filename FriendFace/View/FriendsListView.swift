//
//  FriendsListView.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//

import SwiftUI

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
