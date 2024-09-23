//
//  HomeResponse.swift
//  CoupangApp
//
//  Created by yujaehong on 9/24/24.
//

import Foundation

struct HomeResponse: Decodable {
    let banners: [Banner]
    let horizontalProducts: [Product]
    let verticalProducts: [Product]
    let themes: [Banner]
}

struct Banner: Decodable {
    let id: Int
    let imageUrl: String
}

struct Product: Decodable {
    let id: Int
    let imageUrl: String
    let title: String
    let discount: String
    let originalPrice: Int
    let discountPrice: Int
}
