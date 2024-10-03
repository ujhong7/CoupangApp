//
//  ProductDetailResponse.swift
//  CoupangApp
//
//  Created by yujaehong on 10/3/24.
//

import Foundation

struct ProductDetailResponse: Decodable {
    var bannerImages: [String]
    var product: ProductDetail
    var option: ProductDetailOption
    var detailImages: [String]
}

struct ProductDetail: Decodable {
    var name: String
    var discountPercent: Int
    var originalPrice: Int
    var discountPrice: Int
    var rate: Int
}

struct ProductDetailOption: Decodable {
    var type: String
    var name: String
    var image: String
}
