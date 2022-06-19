//
//  ContentView.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//

import SwiftUI

struct ListView: View {
    @State private var showingCoreData = true
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    @FetchRequest(sortDescriptors: []) var cachedFriends: FetchedResults<CachedFriend>
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            if showingCoreData {
                List(cachedUsers, id: \.id) { item in
                    NavigationLink {
                        DetailCoreDataView(user: item)
                    } label: {
                        HStack {
                            Image(systemName: "person.fill")
                                .padding(.horizontal)

                            VStack(alignment: .leading) {
                                Text(item.unwrappedName)
                                    .font(.headline)
                                Text(item.isActive ? "Active" : "Not Active")
                            }
                        }
                    }
                }
                .navigationTitle("FriendFace")
            } else {
                List(users, id: \.id) { item in
                    NavigationLink {
                        DetailView(user: item)
                    } label: {
                        HStack {
                            Image(systemName: "person.fill")
                                .padding(.horizontal)

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
        .task {
            await loadData()
            await saveToCached(users: users)
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
        }
        
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let userData = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown Error")")
                return
            }

            let userDecoder = JSONDecoder()
            userDecoder.dateDecodingStrategy = .iso8601

            do {
                users = try userDecoder.decode([User].self, from: userData)
                return
            } catch {
                print("Decoding Failed: \(error)")
            }

            print("Fetch Failed: \(error?.localizedDescription ?? "Unknown Error")")

        }.resume()
        showingCoreData = false
    }
    
    func saveToCached(users: [User]) async {
        await MainActor.run {
            users.forEach { user in
                let person = CachedUser(context: moc)
                person.id = user.id
                person.name = user.name
                person.isActive = user.isActive
                person.age = Int16(user.age)
                person.company = user.company
                person.email = user.email
                person.address = user.address
                person.about = user.about
                person.registered = user.registered
                person.tags = user.tags

                var tempFriendArray = Array<CachedFriend>()

                user.friends.forEach { friend in
                    let cdFriend = CachedFriend(context: moc)
                    cdFriend.id = friend.id
                    cdFriend.name = friend.name
                    tempFriendArray.append(cdFriend)
                }

                person.friends = NSSet(array: tempFriendArray)
                print(person.friends!)
            }
            if moc.hasChanges {
                try? moc.save()
            }
        }
        }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
