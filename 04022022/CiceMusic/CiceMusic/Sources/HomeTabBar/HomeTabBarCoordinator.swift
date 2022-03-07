//
//  HomeTabBarCoordinator.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 7/3/22.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator {
    static func tabBarController() -> UITabBarController {
        let tbc = HomeTabBarController()
        
        //Controllers
        let musicVC = MusicCoordinator.navigation()
        let podcastVC = PodcastCoordinator.navigation()
        let booksVC = BooksCoordinator.navigation()
        
        //Icons
        let iconMusic = UITabBarItem(title: "Music",
                                     image: UIImage(systemName: "music.note.list"),
                                     selectedImage: UIImage(systemName: "music.note.list"))
        let iconPodcast = UITabBarItem(title: "Podcast",
                                     image: UIImage(systemName: "music.note.house.fill"),
                                     selectedImage: UIImage(systemName: "music.note.house.fill"))
        let iconBooks = UITabBarItem(title: "Books",
                                     image: UIImage(systemName: "book"),
                                     selectedImage: UIImage(systemName: "book.fill"))
        
        //Asignamos el icono al controlador
        musicVC.tabBarItem = iconMusic
        podcastVC.tabBarItem = iconPodcast
        booksVC.tabBarItem = iconBooks
        
        tbc.viewControllers = [musicVC, podcastVC, booksVC]
        
        return tbc
    }
}
