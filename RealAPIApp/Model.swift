//
//  Model.swift
//  RealAPIApp
//
//  Created by Eren Demir on 24.04.2022.
//

import Foundation

struct Photo {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    init(dictionary:[String:Any]) {
        self.albumId = dictionary["albumId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.url = dictionary["url"] as? String ?? ""
        self.thumbnailUrl = dictionary["thumbnailUrl"] as? String ?? ""
    }
}


struct Comment {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    init(dictionary:[String:Any]) {
        self.postId = dictionary["postId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.body = dictionary["body"] as? String ?? ""
    }
}

//jsonplaceholder.typicode.com/posts/1/comments
