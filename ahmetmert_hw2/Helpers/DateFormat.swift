//
//  DateFormat.swift
//  ahmetmert_hw2
//
//  Created by Ahmet Mert ÖZ on 19.05.2023.
//

import Foundation

func formatDate(dateString: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

    if let date = dateFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd"
        return outputFormatter.string(from: date)
    } else {
        return nil
    }
}
