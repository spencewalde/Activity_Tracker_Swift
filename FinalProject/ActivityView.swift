//
//  SwiftUIView.swift
//  FinalProject
//
//  Created by Williams-Waldemar, Spencer A on 11/28/20.
//  Copyright © 2020 Williams-Waldemar, Spencer A. All rights reserved.
//

import UIkit

class ActivityView: UIViewController {
    
    var MainScreenBtn: UIButton = UIButton()
    var SettingsBtn: UIButton = UIButton()
    var startlabel: UILabel = UILabel()
    var endlabel: UILabel = UILabel()
    
    
    let startdatepicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.addTarget(self, action: #selector(handleValueChange), for: .valueChanged)
        return picker
        
    }()
    let enddatepicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.addTarget(self, action: #selector(handleValueChange), for: .valueChanged)
        return picker
        
    }()
    
    @objc func handleValueChange(_ sender: UIDatePicker){
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyy hh:mm a"
        
        if(enddatepicker.isSelected){
        let startDate: String = dateFormatter.string(from: sender.date)
        print("end date " + startDate)
        }
        else{
        let endDate: String = dateFormatter.string(from: sender.date)
        print("start date " + endDate)
        }
    }
    
    @objc func didTapSettings(_ recognizer: UITapGestureRecognizer){
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
        
        func createUI(){
            let startpickerheight = view.bounds.height / 6
                    startdatepicker.frame = CGRect(x:0, y: startpickerheight, width: view.bounds.width, height:200)
                    startdatepicker.timeZone = NSTimeZone.local
                    startdatepicker.backgroundColor = UIColor.white
                    startdatepicker.layer.opacity = 0.8
                    
            let endpickerheight = view.bounds.height / 2
                    enddatepicker.frame = CGRect(x:0, y: endpickerheight, width: view.bounds.width, height:200)
                    enddatepicker.timeZone = NSTimeZone.local
                    enddatepicker.backgroundColor = UIColor.white
                    enddatepicker.layer.opacity = 0.8
                    
                    //label for start date picker
                    startlabel.frame = CGRect(x:0 , y:startpickerheight - 50 , width: view.bounds.width , height: 50)
                    startlabel.text = "Sleep Start Date - Time"
                    startlabel.textAlignment = .center
                    startlabel.font = startlabel.font.withSize(24)
            //        startlabel.backgroundColor = UIColor.white
                    startlabel.layer.opacity = 0.7
                    
                    //label for end date picker
                    endlabel.frame = CGRect(x:0, y:endpickerheight - 50 , width: view.bounds.width , height: 50)
                    endlabel.text = "Sleep End Date - Time"
                    endlabel.textAlignment = .center
                    endlabel.font = endlabel.font.withSize(24)
            //        endlabel.backgroundColor = UIColor.white
                    endlabel.layer.opacity = 0.7
                    
                    
                    
                    view.addSubview(startdatepicker)
                    view.addSubview(enddatepicker)
                    view.addSubview(startlabel)
                    view.addSubview(endlabel)
                    
        }
        
        func createButtons(){
            let taskbarbtnwidth = 2 * view.bounds.width / 5
            let taskbarbtnheight = view.bounds.height / 10
            MainScreenBtn = UIButton(frame: CGRect(x: view.bounds.width / 4 - taskbarbtnwidth / 2 ,y:view.bounds.height - taskbarbtnheight, width: taskbarbtnwidth  ,height: taskbarbtnheight - taskbarbtnheight / 2))
                          
            SettingsBtn = UIButton(frame: CGRect(x: 3 * view.bounds.width / 4  - taskbarbtnwidth/2 ,y:view.bounds.height - taskbarbtnheight, width: taskbarbtnwidth ,height: taskbarbtnheight - taskbarbtnheight / 2))
                          
            MainScreenBtn.backgroundColor = UIColor.black
            SettingsBtn.backgroundColor = UIColor.black
                          
                          
                    MainScreenBtn.setTitle("Main Screen", for: .normal)
                    MainScreenBtn.setTitleColor(.white, for: .normal)
                    MainScreenBtn.layer.cornerRadius = 10
                    MainScreenBtn.layer.borderWidth = 1
                    MainScreenBtn.layer.borderColor = UIColor.white.cgColor
                    
                    SettingsBtn.setTitle("Settings", for: .normal)
                    SettingsBtn.setTitleColor(.white, for: .normal)
                    SettingsBtn.layer.cornerRadius = 10
                    SettingsBtn.layer.borderWidth = 1
                    SettingsBtn.layer.borderColor = UIColor.white.cgColor
                          
                          
                          
                    view.addSubview(MainScreenBtn)
                    view.addSubview(SettingsBtn)
        }
    



    override func viewDidLoad() {
          super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        //creates pickers and labels
        createButtons()
        createUI()
        

//////////// READ A FILE THAT ALREADY EXISTS
        
//        let fileURlProject = Bundle.main.path(forResource: "ActivityLog", ofType: "txt")
//        var readStringProject = ""
//        do {
//            readStringProject = try String(contentsOfFile: fileURlProject!, encoding: String.Encoding.utf8)
//
//        }catch let error as NSError{
//            print("failed to read from projects")
//            print(error)
//        }
//        print(readStringProject)
//
        
       
               
//
        //button action for New Activity View
        MainScreenBtn.addTarget(self, action: #selector(ActivityView.didTapMainScreen(_:)),
                   for: .touchUpInside)

        MainScreenBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ActivityView.didTapMainScreen(_:))))
               view.addSubview(MainScreenBtn)


        SettingsBtn.addTarget(self, action: #selector(ActivityView.didTapSettings(_:)),
                   for: .touchUpInside)

        SettingsBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ActivityView.didTapSettings(_:))))
               view.addSubview(SettingsBtn)
               
      }
    
}
