//
//  Class.swift
//  HW4
//
//  Created by Ann Katanska on 5/10/18.
//  Copyright © 2018 Ann Katanska. All rights reserved.
//

import Foundation

class Bottle {
    let color: String
    let material: String
    var volume: Double
    let isTermo: Bool
    
    private var content: Double = 0
    
    init(color: String,
         material: String,
         volume: Double,
         isTermo: Bool) {
        
        self.color = color
        self.material = material
        self.volume = volume
        self.isTermo = isTermo
    }
    
    var description: String {
        return "color: \(color); material: \(material): volume: \(volume); content: \(content); isTermo: \(isTermo)"
    }
    
    //how much space is left in the bottle
    var spaceLeft: Double {
        return self.volume - self.content
    }
    
    //add water to the bottle if there is space
    private func canAdd(volume: Double) -> Bool {
        return self.content + volume <= self.volume
    }
    
    // during content
    func getContent() -> Double {
        return self.content
    }
    
    //check is bottle termo or nor
    private func temperatureIsFine(isHot: Bool) -> Bool {
        return self.isTermo || isHot == false
    }
    
    //fill the bottle with liquid
    func fill(volume: Double, isHot: Bool) {
        if !temperatureIsFine(isHot: isHot) {
            print("This cup is for cold liquids only")
            return
        }
        if canAdd(volume: volume) {
            self.content += volume
        } else {
            print("This bottle is full. You can add only \(spaceLeft)")
        }
    }
    
    //check if can remove liquid from bottle
    private func canRemove(volume: Double) -> Bool {
        return self.content - volume >= 0
    }
    
    //remove water from bottle
    func pour(volume: Double) {
        if canRemove(volume: volume) {
            self.content -= volume
        } else {
            print("You can't do it.")
        }
    }
    
    //do bottle empty
    func throwTheBottleOut() {
        if self.content > 0 {
            self.content -= self.content
        }
    }
}
