//
// JournalItem.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct JournalItem: Codable {

    public var placeOfPublication: String?
    public var startYear: Int?
    public var publisher: String?
    public var id: String?
    public var title: String?
    public var endYear: Int?

    public init(placeOfPublication: String?, startYear: Int?, publisher: String?, id: String?, title: String?, endYear: Int?) {
        self.placeOfPublication = placeOfPublication
        self.startYear = startYear
        self.publisher = publisher
        self.id = id
        self.title = title
        self.endYear = endYear
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case placeOfPublication = "place_of_publication"
        case startYear = "start_year"
        case publisher
        case id
        case title
        case endYear = "end_year"
    }

}
