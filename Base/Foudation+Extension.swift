//
//  Foudation+Extension.swift
//  Base
//
//  Created by Murillo Nicacio de Maraes on 7/3/15.
//  Copyright (c) 2015 SuperUnreasonable. All rights reserved.
//

import Foundation

public extension String {
    public var words: [String] {
        return self.componentsSeparatedByCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet).filter { $0 != "" }
    }
}