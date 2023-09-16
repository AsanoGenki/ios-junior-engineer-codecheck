//
//  ExternalPrefectureAPIItem.swift
//  ios-junior-engineer-codecheck
//
//  Created by Genki on 9/16/23.
//

import Foundation

struct LocationData: Codable {
    let id: Int
    let name_ja: String
    let name_en: String
    let lat: Double
    let lng: Double
    let population: Int
    let last_updated: LastUpdated
    let cases: Int
    let deaths: Int
    let pcr: Int
    let hospitalize: Int
    let severe: Int
    let discharge: Int
    let symptom_confirming: Int
}

struct LastUpdated: Codable {
    let cases_date: Int
    let deaths_date: Int
    let pcr_date: Int
    let hospitalize_date: Int
    let severe_date: Int
    let discharge_date: Int
    let symptom_confirming_date: Int
}
