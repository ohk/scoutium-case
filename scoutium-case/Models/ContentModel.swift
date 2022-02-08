//
//  ContentModel.swift
//  scoutium-case
//
//  Created by Ömer Hamid Kamışlı on 6.02.2022.
//

import Foundation

class ContentModel: Codable {
    var contents: [Content?]?
    
    enum CodingKeys: String, CodingKey {
        case contents = "contents"
    }
    
    init(contents: [Content?]?){
        self.contents = contents
    }
}

class Content: Codable {
    var id: String?
    var author: Author?
    var headline: String?
    var summary: String?
    var tags: [Tag]?
    var read_time: Int?
    var cover: Cover?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "author"
        case headline = "headline"
        case summary = "summary"
        case tags = "tags"
        case read_time = "read_time"
        case cover = "cover"
    }
    
    init(id: String?, author: Author?, headline: String?, summary: String?, tags: [Tag]?, read_time: Int?, cover: Cover?){
        self.id = id
        self.author = author
        self.headline = headline
        self.summary = summary
        self.tags = tags
        self.read_time = read_time
        self.cover = cover
    }
}

class Author: Codable {
    var name: String?
    var image_url: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case image_url = "image_url"
    }
    
    init(name: String?, image_url: String?){
        self.name = name
        self.image_url = image_url
    }
}

class Tag: Codable {
    var id: String?
    var name: String?
    var color: String?
    var background_color: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case color = "color"
        case background_color = "background_color"
    }
    
    init(id: String?, name: String?, color: String?, background_color: String?){
        self.id = id
        self.name = name
        self.color = color
        self.background_color = background_color
    }
}

class Cover: Codable {
    var url: String?
    var type: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case type = "type"
    }
    
    init(url: String?, type: String?){
        self.url = url
        self.type = type
    }
}
