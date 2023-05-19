//
//  HomeModel.swift
//  ahmetmert_hw2
//
//  Created by Ahmet Mert ÖZ on 14.05.2023.
//

import Foundation

// MARK: - Welcome
struct Welcome : Codable {
    let status, copyright, section: String?
    let last_updated: String?
    let num_results: Int?
    let results: [ResultNews]?
}

// MARK: - Result
struct ResultNews : Codable {
    let section, subsection, title, abstract: String?
    let url: String?
    let uri, byline: String?
    let item_type: String?
    let updated_date, created_date, published_date: String?
    let material_type_facet, kicker: String?
    let des_facet, org_facet, per_facet, geo_facet: [String]?
    let multimedia: [Multimedia]?
    let short_url: String?
}

// MARK: - Multimedia
struct Multimedia : Codable {
    let url: String?
    let format: String?
    let height, width: Int?
    let type: String?
    let subtype: String?
    let caption, copyright: String?
}

