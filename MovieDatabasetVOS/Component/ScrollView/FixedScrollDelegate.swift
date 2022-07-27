//
//  FixedScrollDelegate.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-05-04.
//

import Foundation
import UIKit

final class FixedScrollDelegate: NSObject, UIScrollViewDelegate {
    
    enum Edge {
        case leading
        case trailing
        case top
        case bottom
    }
    
    private var edge: Edge = .leading
    private var padding: CGFloat = 0
    private var minThreshold: CGFloat = 0
    
    func withPadding(_ padding: CGFloat) -> Self {
        self.padding = padding
        return self
    }
    
    func withEdge( _edge: Edge) -> Self {
        self.edge = edge
        return self
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        guard let window = scrollView.window as? FocusWindow else {
            return
        }
        
        
        
    }
}
