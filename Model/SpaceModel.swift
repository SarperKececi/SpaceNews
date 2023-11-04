//
//  SpaceModel.swift
//  SpaceNews
//
//  Created by Sarper Kececi on 1.11.2023.
//

import Foundation
struct SpaceModel : Codable , Identifiable {
    var id : Int = 0
    var title : String = ""
    var url : String = ""
    var imageUrl : String = ""
    var newsSite : String = ""
    var summary : String = ""
    var publishedAt : String = ""
}
