//
//  TabBarSlideAnimation.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/16/20.
//

import UIKit

extension TabBarView: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController is PostView {
            if let newVC = tabBarController.storyboard?.instantiateViewController(withIdentifier: "PostView") {
                tabBarController.present(newVC, animated: true)
                return false
            }
        }
        
        if let fromView = tabBarController.selectedViewController?.view,
           let toView = viewController.view, fromView != toView,
           let controllerIndex = self.viewControllers?.firstIndex(of: viewController) {
            
            let viewSize = fromView.frame
            let scrollRight = controllerIndex > tabBarController.selectedIndex

            // Avoid UI issues when switching tabs fast
            if fromView.superview?.subviews.contains(toView) == true { return false }
            fromView.superview?.addSubview(toView)

            let screenWidth = UIScreen.main.bounds.size.width
            toView.frame = CGRect(
                x: (scrollRight ? screenWidth : -screenWidth),
                y: viewSize.origin.y,
                width: screenWidth,
                height: viewSize.size.height
            )

            let options: UIView.AnimationOptions = [.curveEaseOut, .preferredFramesPerSecond60]
            UIView.animate(withDuration: 0.15, delay: TimeInterval(0.0), options: options, animations: {
                
                fromView.frame = CGRect(
                    x: (scrollRight ? -screenWidth : screenWidth),
                    y: viewSize.origin.y,
                    width: screenWidth,
                    height: viewSize.size.height
                )
                
                toView.frame = CGRect(
                    x: 0,
                    y: viewSize.origin.y,
                    width: screenWidth,
                    height: viewSize.size.height
                )
                
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
