//
//  helper.swift
//  taqadam
//
//  Created by hoton on 26/08/1444 AH.
//

import Foundation


func isEnglishLanguage() -> Bool {
    if let language = Locale.current.language.languageCode?.identifier {
        return language == "en" ? true : false
    } else {
        return true
    }
}
