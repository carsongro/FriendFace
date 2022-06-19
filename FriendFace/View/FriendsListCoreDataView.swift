//
//  FriendsListCoreDataView.swift
//  FriendFace
//
//  Created by Carson Gross on 6/19/22.
//

import SwiftUI

struct FriendsListCoreDataView: View {
    let user: CachedUser
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(user.friendsArray, id: \.self) { friend in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(friend.wrappedName)
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
