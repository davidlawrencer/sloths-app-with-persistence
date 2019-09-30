//
//  SlothHelper.swift
//  sloth-app
//
//  Created by David Rifkin on 9/30/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct SlothPersistenceHelper {
    static let manager = SlothPersistenceHelper()

    func save(newSloth: Sloth) throws {
        try persistenceHelper.save(newElement: newSloth)
    }

    func getSloths() throws -> [Sloth] {
        return try persistenceHelper.getObjects()
    }

    private let persistenceHelper = PersistenceHelper<Sloth>(fileName: "sloths.plist")

    private init() {}
}
