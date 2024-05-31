//
//  UserDefaultHelper.swift
//  EmotionDiary
//
//  Created by 권대윤 on 5/31/24.
//

import UIKit

struct UserDefaultsManager {
    static var countData: [String: Int]? {
        get {
            let dictionary = UserDefaults.standard.dictionary(forKey: "count") as? [String: Int]
            return dictionary
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "count")
        }
    }
    
    static func removeCountData(completion: @escaping () -> Void) {
        UserDefaults.standard.removeObject(forKey: "count")
        completion()
    }
}
