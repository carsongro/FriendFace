//
//  TagsView.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//

import SwiftUI

struct TagsView: View {
    let user: User
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(user.tags, id: \.self) { tag in
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
