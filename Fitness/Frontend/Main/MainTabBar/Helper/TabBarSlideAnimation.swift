//
//  TabBarSlideAnimation.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/16/20.
//

import UIKit

extension MainTabBarView: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let fromView = tabBarController.selectedViewController?.view,    // Checks if the current view controller exists
           let toView = viewController.view, fromView != toView,            // Checks that the current view controller is not same destination
           let controllerIndex = self.viewControllers?.firstIndex(of: viewController) {     // Gets the index of the selected view controller in the array
            
            let viewSize = fromView.frame
            let scrollRight = controllerIndex > tabBarController.selectedIndex

            // Avoid UI issues when switching tabs fast
            if fromView.superview?.subviews.contains(toView) == true { return false }

            fromView.superview?.addSubview(toView)

            let screenWidth = UIScreen.main.bounds.size.width
            toView.frame = CGRect(x: (scrollRight ? screenWidth : -screenWidth), y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)

            UIView.animate(withDuration: 0.15, delay: TimeInterval(0.0), options: [.curveEaseOut, .preferredFramesPerSecond60], animations: {
                fromView.frame = CGRect(x: (scrollRight ? -screenWidth : screenWidth), y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
                toView.frame = CGRect(x: 0, y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
            }, completion: { finished in
                if finished {
                    fromView.removeFromSuperview()
                    tabBarController.selectedIndex = controllerIndex
                }
            })
        }
    
        // dismiss and scroll to top
        guard let viewControllers = viewControllers else { return false }
        if viewController == viewControllers[selectedIndex] {
            if let nav = viewController as? UINavigationController {
                guard let topController = nav.viewControllers.last else { return true }
                if (!topController.isScrolledToTop) {
                    topController.scrollToTop()
                    return false
                }
                nav.popViewController(animated: true)
                return false
            }
        }

        return true
    }
    
}

extension UIViewController {
    func scrollToTop() {
        func scrollToTop(view: UIView?) {
            guard let view = view else { return }
            switch view {
            case let scrollView as UIScrollView:
                if (scrollView.scrollsToTop == true) {
                    scrollView.setContentOffset(.zero, animated: true)
                    return
                }
            default:
                break
            }

            for subView in view.subviews {
                scrollToTop(view: subView)
            }
        }
        scrollToTop(view: view)
    }

    var isScrolledToTop: Bool {
        for subView in view.subviews {
            if let scrollView = subView as? UIScrollView {
                return (scrollView.contentOffset.y == 0)
            }
        }
        return true
    }
}
