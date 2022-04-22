//
//  HomepageViewControlelr.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-21.
//

import Foundation
import SwiftUI

public protocol HomepageViewControllerDelegate: AnyObject {
    
}

class HomepageViewController: UIHostingController<HomepageView> {
    
    weak var delegate: HomepageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
