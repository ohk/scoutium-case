//
//  ContentDetailModel.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 6.02.2022.
//

import Foundation

class ContentDetailModel: Codable {
    var content: ContentDetailModelInner?
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
    }
    
    init(content: ContentDetailModelInner?){
        self.content = content
    }
}

class ContentDetailModelInner: Codable {
    var tags: [Tag?]?
    var cover: Cover?
    var read_time: Int?
    var headline: String?
    var content: [ContentTags?]?
    var author: Author?
    var id: String?
    
    
    enum CodingKeys: String, CodingKey {
        case tags = "tags"
        case cover = "cover"
        case read_time = "read_time"
        case headline = "headline"
        case content = "content"
        case author = "author"
        case id = "id"
    }
    
    init(tags: [Tag?]?, cover: Cover?, read_time: Int?, headline: String?, content: [ContentTags?]?, author: Author?, id: String?){
        self.tags = tags
        self.cover = cover
        self.read_time = read_time
        self.headline = headline
        self.content = content
        self.author = author
        self.id = id
    }
}

class ContentTags: Codable {
    var p: String?
    var h2: String?
    var video: String?
    var size: String?
    var thumbnail_url: String?
    
    enum CodingKeys: String, CodingKey {
        case p = "p"
        case h2 = "h2"
        case video = "video"
        case size = "size"
        case thumbnail_url = "thumbnail_url"
    }
    
    init(p: String?, h2: String?, video: String?, size: String?, thumbnail_url: String?){
        self.p = p
        self.h2 = h2
        self.video = video
        self.size = size
        self.thumbnail_url = thumbnail_url
    }
    
}
