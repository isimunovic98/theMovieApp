//
//  AppDelegate.swift
//  TheMovieApp
//
//  Created by Ivan Simunovic on 18.10.2021..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let repo = MoviesListRepository()
        let viewModel = MoviesListViewModel(repository: repo)
        let rootViewController = UINavigationController(rootViewController: MoviesListViewController(viewModel: viewModel))
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }


}

