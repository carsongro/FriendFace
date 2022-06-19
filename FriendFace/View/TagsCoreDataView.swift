//
//  TagsCoreDataView.swift
//  FriendFace
//
//  Created by Carson Gross on 6/19/22.
//

import SwiftUI

struct TagsCoreDataView: View {
    let user: CachedUser
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(user.unwrappedTags, id: \.self) { tag in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(tag)
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    }
                    .padding(.horizontal)
                    }
                Text("hello")
                }
            }
    }
}
