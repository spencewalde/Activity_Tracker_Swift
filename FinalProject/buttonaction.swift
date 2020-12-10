//
//  buttonaction.swift
//  FinalProject
//
//  Created by Williams-Waldemar, Spencer A on 11/28/20.
//  Copyright © 2020 Williams-Waldemar, Spencer A. All rights reserved.
//

import Foundation
import UIKit
protocol actions {

@objc func didTapNewActivity(_ recognizer: UITapGestureRecognizer){
    //          present(ViewController(), animated: true)
    let mvc: ActivityView = ActivityView()
    mvc.modalPresentationStyle = .fullScreen
    mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    present(mvc, animated: true, completion: {
        () -> Void in
    })
    
}


    func didTapSettings(_ recognizer: UITapGestureRecognizer){
    //          present(ViewController(), animated: true)
    let mvc: SettingsView = SettingsView()
    mvc.modalPresentationStyle = .fullScreen
    mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    present(mvc, animated: true, completion: {
        () -> Void in
    })
    
}

@objc func didTapMainScreen(_ recognizer: UITapGestureRecognizer){
    //          present(ViewController(), animated: true)
    let mvc: MainScreen = MainScreen()
    mvc.modalPresentationStyle = .fullScreen
    mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    present(mvc, animated: true, completion: {
        () -> Void in
    })
    
}
}
