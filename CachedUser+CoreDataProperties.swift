//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Carson Gross on 6/18/22.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: [String]?
    @NSManaged public var friends: NSSet?

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)
    
    var unwrappedAbout: String {
        about ?? "Unknown"
    }
    
    var unwrappedAddress: String {
        address ?? "Unknown"
    }

    var unwrappedCompany: String {
        company ?? "Unknown"
    }
    
    var unwrappedEmail: String {
        email ?? "Unknown"
    }
    
    var unwrappedId: String {
        id ?? "Unknown"
    }
    
    var unwrappedName: String {
        name ?? "Unknown"
    }
    
    var unwrappedRegistered: Date {
        registered ?? Date.now
    }
    
    var unwrappedTags: [String] {
        tags ?? ["Unknown"]
    }
    
    public var friendsArray: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

extension CachedUser : Identifiable {

}
