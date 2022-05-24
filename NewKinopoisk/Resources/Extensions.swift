//
//  Extensions.swift
//  NewKinopoisk
//
//  Created by Игорь Иванюков on 14.05.2022.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
