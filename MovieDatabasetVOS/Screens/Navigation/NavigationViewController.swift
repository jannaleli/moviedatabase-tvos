//
//  NavigationViewController.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-06-02.
//

import Foundation
import UIKit
import Combine
//Item is whether "genre" or "movies" for now
protocol NavigationViewControllerDelegate: AnyObject {
    func didSelectItem(_ sender: NavigationViewController, item: String)
}

final class NavigationViewController: UIViewController {
    
    weak var delegate: NavigationViewControllerDelegate?
    
    var contentViewController: UIViewController? {
        didSet {
            if let vc = oldValue { vc.remove() }
            if let vc = contentViewController {
                add(vc, containerView: containerView)
                view.setNeedsLayout()
            }
        }
    }
    //didSet is okay if you want a reference to an old value or something like that
    private let containerView = UIView()
    private let tabViewController: TabViewController
    private let focusView = FocusView()
    private let viewModel: NavigationViewModel
    private var bag = Set<AnyCancellable>()

    private var menuRecognizer: UITapGestureRecognizer?
    private var rightArrowRecognizer: UITapGestureRecognizer?
    private var rightSwipeRecognizer: UISwipeGestureRecognizer?
    init(viewModel: NavigationViewModel, tabViewController: TabViewController) {
        print("went here in navigation view controller")
        self.viewModel = viewModel
       self.tabViewController = tabViewController
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //view.addSubview(focusView)
        viewModel.delegate = self
        setupRemoteGesture()
        view.addSubview(containerView)
        view.addSubview(focusView)
        add(tabViewController)
        update()
        viewModel.isCollapsedPublisher
            .dropFirst()
            .receiveOnMain()
            .sink { [weak self] in
                self?.updateIfNeeded()
            }.store(in: &bag)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("view did layout subviews")
        containerView.frame = view.bounds
        //focusView.frame = CGRect(x: 0, y: 0, width: 1, height: view.bounds.height)
        focusView.frame = CGRect(x: 0, y: 0, width: 1, height: view.bounds.height)
        contentViewController?.view.frame = containerView.bounds
        tabViewController.view.frame = view.bounds
        
    }
    
    private func setupRemoteGesture() {
        /// menu
        let menuRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleMenuPress))
        menuRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        view.addGestureRecognizer(menuRecognizer)
        self.menuRecognizer = menuRecognizer

        /// right arrow
        let rightArrowRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleRightArrowPress))
        rightArrowRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.rightArrow.rawValue)]
        view.addGestureRecognizer(rightArrowRecognizer)
        self.rightArrowRecognizer = rightArrowRecognizer

        /// right swipe
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe))
        rightSwipeRecognizer.direction = .right
        view.addGestureRecognizer(rightSwipeRecognizer)
        self.rightSwipeRecognizer = rightSwipeRecognizer
    }

    @objc
    private func handleMenuPress() {
        if viewModel.isCollapsed {
            viewModel.isCollapsed = false
            updateIfNeeded()
        }
    }

    @objc
    private func handleRightArrowPress() {
        if !viewModel.isCollapsed {
            viewModel.isCollapsed = true
        }
    }

    @objc
    private func handleRightSwipe() {
        if !viewModel.isCollapsed {
            viewModel.isCollapsed = true
        }
    }

    private lazy var _isCollapsed = viewModel.isCollapsed

    private func updateIfNeeded() {
        guard _isCollapsed != viewModel.isCollapsed else { return }
        _isCollapsed = viewModel.isCollapsed
        update()
    }

    private func update() {
        tabViewController.view.isUserInteractionEnabled = !_isCollapsed
        containerView.isUserInteractionEnabled = _isCollapsed
        menuRecognizer?.isEnabled = _isCollapsed
        rightArrowRecognizer?.isEnabled = !_isCollapsed
        rightSwipeRecognizer?.isEnabled = !_isCollapsed
        setNeedsFocusUpdate()
    }

    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        if viewModel.isCollapsed {
            return [contentViewController ?? containerView]
        } else {
            return [tabViewController]
        }
    }

    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        if context.nextFocusedView == focusView {
            if let previous = context.previouslyFocusedView, previous.isDescendant(of: containerView) {
                viewModel.isCollapsed = false
                updateIfNeeded()
            }
            return false
        } else {
            return true
        }
    }
}

@nonobjc extension UIViewController {
    
    public func add(_ child: UIViewController) {
        add(child, containerView: view)
    }

    public func add(_ child: UIViewController, containerView: UIView) {
        addChild(child)
        containerView.addSubview(child.view)
        child.didMove(toParent: self)
    }

    public func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

// MARK: MenuViewModelDelegate

extension NavigationViewController: NavigationViewModelDelegate {
    func didSelectItem(_ sender: NavigationViewModel, item: String) {
        delegate?.didSelectItem(self, item: item)
    }

}
