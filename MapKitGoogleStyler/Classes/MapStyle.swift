//
//  MapStyle.swift
//  Pods
//
//  Created by Fernando on 1/2/17.
//
//

import Foundation

internal struct MapStyle {
    
    private let baseURL = "http://mts0.google.com/vt/lyrs=m@289000001&hl=en&src=app&x={x}&y={y}&z={z}&s=DGal"
    private let prefix = "&apistyle="
    
    internal var googleStyles = [GoogleStyle]()
    
    internal init(json: [[String: Any]]) {
        googleStyles = json.map (GoogleStyle.init)
    }
    
    internal var urlString: String {
        var url = ""
        url = baseURL
        if googleStyles.isEmpty == false {
            url += prefix
            for (index, style) in googleStyles.enumerated() {
                url += style.encodedStyles
                if index != googleStyles.count - 1 {
                    url += ","
                }
            }
        }
        return url
    }
}