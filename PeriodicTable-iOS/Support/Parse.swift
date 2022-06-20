//
//  Parse.swift
//  PeriodicTable-iOS
//
//  Created by Sami Saleh on 6/20/22.
//

import Foundation
import UIKit

class ParseClass {


    init() {

    }

    deinit {

    }


    func parseToModel(file_string : String) -> [PeriodicModel] {

        var modeList : [PeriodicModel] = []

        guard let filepath = Bundle.main.path(forResource: file_string, ofType: "csv") else {
            print("failed")
            fatalError()
        }

        var data = ""
        do {
            data = try String(contentsOfFile: filepath)
        } catch {
            print(error)
            fatalError()
        }

        var rows = data.components(separatedBy: "\n")
        rows.removeFirst()

        for row in rows {
            let columns = row.components(separatedBy: ",")

            let inst = PeriodicModel(atomic: UInt8(columns[0])!, name: columns[1], symbol: columns[2])
            modeList.append(inst)
        }

        return modeList
    }

}
