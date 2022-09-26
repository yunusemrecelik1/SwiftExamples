//
//  AppDelegate.swift
//  Bankey
//
//  Created by Yunus Emre Çelik on 17.06.2022.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    let loginViewController = LoginViewController()
    let onboardViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onboardViewController.delegate = self
        
        displayLogin()
        return true
    }
    private func displayLogin(){
        setRootViewController(loginViewController)
    }
    private func displayNextScreen(){
        if LocalState.hasOnboarded {
            prepMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardViewController)
        }
    }
    private func prepMainView() {
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
    }
}


extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated : Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with:window,duration: 0.3,options: .transitionCrossDissolve,animations: nil,completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnBoarding() {
        LocalState.hasOnboarded = true
        prepMainView()
        setRootViewController(mainViewController)
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout(){
        setRootViewController(loginViewController)
    }
}

