//
//  File.swift
//  FinalProject
//
//  Created by Williams-Waldemar, Spencer A on 11/28/20.
//  Copyright © 2020 Williams-Waldemar, Spencer A. All rights reserved.
//

//import UIKit
//
//extension UIView {
//    func createNavButtons(View view){
//    var NewActivityBtn: UIButton = UIButton()
//    var SettingsBtn: UIButton = UIButton()
//    var MainScreen: UIButton = UIButton()
//        
//    NewActivityBtn.addTarget(self, action: #selector(MainScreen.didTapNewActivity(_:)),
//                    for: .touchUpInside)
//        
//    NewActivityBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainScreen.didTapNewActivity(_:))))
//                view.addSubview(NewActivityBtn)
//        
//        
//    SettingsBtn.addTarget(self, action: #selector(MainScreen.didTapSettings(_:)),
//                    for: .touchUpInside)
//        
//    SettingsBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainScreen.didTapSettings(_:))))
//                view.addSubview(SettingsBtn)
//        
//        
//    }
//    
//    @objc func didTapSettings(_ recognizer: UITapGestureRecognizer){
//    //          present(ViewController(), animated: true)
//            let mvc: SettingsView = SettingsView()
//            mvc.modalPresentationStyle = .fullScreen
//            mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
//            view.present(mvc, animated: true, completion: {
//                () -> Void in
//            })
//            
//         }
//    @objc func didTapNewActivity(_ recognizer: UITapGestureRecognizer){
//    //          present(ViewController(), animated: true)
//            let mvc: ActivityView = ActivityView()
//            mvc.modalPresentationStyle = .fullScreen
//            mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
//            present(mvc, animated: true, completion: {
//                () -> Void in
//            })
//            
//         }
//    @objc func didTapMainScreen(_ recognizer: UITapGestureRecognizer){
//    //          present(ViewController(), animated: true)
//            let mvc: ActivityView = ActivityView()
//            mvc.modalPresentationStyle = .fullScreen
//            mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
//            present(mvc, animated: true, completion: {
//                () -> Void in
//            })
//            
//         }
//}
