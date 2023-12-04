//
//  CountryNames.swift
//  CountryApp
//
//  Created by Kaan Ezerrtaş on 4.12.2023.
//

import Foundation
//MARK: Jsondan Çekilecek Veriler
struct CountryNames: Codable {
    let countryName: String?
    let capitalName: String?
    let flagImage: String?
}
