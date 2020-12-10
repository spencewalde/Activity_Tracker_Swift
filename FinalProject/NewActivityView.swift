//
//  NewActivityView.swift
//  FinalProject
//
//  Created by Williams-Waldemar, Spencer A on 11/30/20.
//  Copyright © 2020 Williams-Waldemar, Spencer A. All rights reserved.
//

import UIKit

//////////      ACTIVITY VIEW     /////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ACTIIVITY VIEW THAT WRITES TO A FILE FOR THE ACTIVITY ENTERED FROM THE USER

//SETTING VIEW THAT ALLOWS USER TO CHANGE BACKGROUND OF MAIN SCREEN AND NEW ACTIVITY, BUTTON COLORS, AND ALLOWS THE DELETION OF ACTIVITYS LIST

class ActivityView: UIViewController {
    
    //VARIABLES
    var MainScreenBtn: UIButton = UIButton()
    var SettingsBtn: UIButton = UIButton()
    var SubmitBtn: UIButton = UIButton()
    var startlabel: UILabel = UILabel()
    var endlabel: UILabel = UILabel()
    var activityDescriptionBox: UITextField = UITextField()
    var startstring = "default"
    var endstring = "default"
    
    //MARK: - DATE PICKER AND CHANGE HANDLER
    let startdatepicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = true
        
        picker.addTarget(self, action: #selector(handleStartChange), for: .valueChanged)
        return picker
        
    }()
    let enddatepicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = true
        
        picker.addTarget(self, action: #selector(handleEndChange), for: .valueChanged)
        return picker
        
    }()
    
    
    @objc func handleStartChange(_ sender: UIDatePicker){
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyy hh:mm a"
        
        let startDate: String = dateFormatter.string(from: sender.date)
        startstring = "Start Date/Time: " + startDate
        
    }
    
    @objc func handleEndChange(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyy hh:mm a"
        
        let endDate: String = dateFormatter.string(from: sender.date)
        endstring = "End Date/Time:" + endDate
        
    }
    
    
    //MARK: - WRITE TO FILE
    func writefile() {
        let url = "/tmp/ActivityLog.txt"
        let description = activityDescriptionBox.text! + "\n"
        
        var full_string = ""
        do {
            full_string = try String(contentsOfFile:url, encoding: .utf8)
        }catch {
            print("Can't find the file yet, didn't read anything.")
        }
        
        do{
            let new_entry = description + startstring + "\n" + endstring
            if(full_string == ""){
                full_string = full_string + new_entry + "@@@"
            }
            else{
                full_string = full_string + "\n" + new_entry + "@@@"
            }
            try full_string.write(toFile: url, atomically: true, encoding: String.Encoding.utf8)
            
        } catch let error as NSError{
            print("failed to write to url")
            print(error)
            
        }
        print(url)
        print(" Start date: " + startstring)
        print(" End date: " + endstring)
    }
    
    
    //MARK: - CREATEPICKERS & LABELS
    func createUI(){
        
        let startpickerheight = view.bounds.height / 3
        startdatepicker.frame = CGRect(x:0, y: startpickerheight, width: view.bounds.width, height:100)
        startdatepicker.timeZone = NSTimeZone.local
        startdatepicker.backgroundColor = UIColor.white
        startdatepicker.layer.opacity = 0.8
        startdatepicker.preservesSuperviewLayoutMargins = true
        
        
        let endpickerheight = view.bounds.height / 2 + 50
        enddatepicker.frame = CGRect(x:0, y: endpickerheight, width: view.bounds.width, height:100)
        enddatepicker.timeZone = NSTimeZone.local
        enddatepicker.backgroundColor = UIColor.white
        enddatepicker.layer.opacity = 0.8
        
        
        //label for start date picker
        startlabel.frame = CGRect(x:0 , y:startpickerheight - 50 , width: view.bounds.width , height: 50)
        startlabel.text = "Activity Start Date - Time"
        startlabel.textAlignment = .center
        startlabel.font = startlabel.font.withSize(24)
        startlabel.layer.opacity = 0.8
        
        //label for end date picker
        endlabel.frame = CGRect(x:0, y:endpickerheight - 50 , width: view.bounds.width , height: 50)
        endlabel.text = "Activity End Date - Time"
        endlabel.textAlignment = .center
        endlabel.font = endlabel.font.withSize(24)
        endlabel.layer.opacity = 0.8
        
        activityDescriptionBox.frame = CGRect(x:0 , y: startpickerheight / 2 , width: view.bounds.width , height: 50)
        activityDescriptionBox.placeholder = "ENTER DESCRIPTION HERE"
        activityDescriptionBox.textAlignment = .center
        activityDescriptionBox.font = activityDescriptionBox.font?.withSize(24)
        
        view.addSubview(activityDescriptionBox)
        view.addSubview(startdatepicker)
        view.addSubview(enddatepicker)
        view.addSubview(startlabel)
        view.addSubview(endlabel)
        
    }
    
    
    //CREATES, POSITIONS AND ADDS RECOGNIZERS TO BUTTONS
    func createButtons(){
        let taskbarbtnwidth = 2 * view.bounds.width / 5
        let taskbarbtnheight = view.bounds.height / 10
        MainScreenBtn = UIButton(frame: CGRect(x: view.bounds.width / 4 - taskbarbtnwidth / 2 ,y:view.bounds.height - taskbarbtnheight, width: taskbarbtnwidth  ,height: taskbarbtnheight - taskbarbtnheight / 2))
        
        SettingsBtn = UIButton(frame: CGRect(x: 3 * view.bounds.width / 4  - taskbarbtnwidth/2 ,y:view.bounds.height - taskbarbtnheight, width: taskbarbtnwidth ,height: taskbarbtnheight - taskbarbtnheight / 2))
        
        SubmitBtn = UIButton(frame: CGRect(x: view.center.x - taskbarbtnwidth / 2 , y: view.bounds.height - taskbarbtnheight * 2, width: taskbarbtnwidth , height: taskbarbtnheight - taskbarbtnheight / 2))
        
        MainScreenBtn.backgroundColor = UIColor.black
        SettingsBtn.backgroundColor = UIColor.black
        SubmitBtn.backgroundColor = UIColor.black
        
        
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
        
        SubmitBtn.setTitle("SUBMIT", for: .normal)
        SubmitBtn.setTitleColor(.white, for: .normal)
        SubmitBtn.layer.cornerRadius = 10
        SubmitBtn.layer.borderWidth = 1
        SubmitBtn.layer.borderColor = UIColor.white.cgColor
        
        
        view.addSubview(MainScreenBtn)
        view.addSubview(SettingsBtn)
        view.addSubview(SubmitBtn)
        
        MainScreenBtn.addTarget(self, action: #selector(ActivityView.didTapMainScreen(_:)),
                                for: .touchUpInside)
        
        MainScreenBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ActivityView.didTapMainScreen(_:))))
        view.addSubview(MainScreenBtn)
        
        
        SettingsBtn.addTarget(self, action: #selector(ActivityView.didTapSettings(_:)),
                              for: .touchUpInside)
        
        SettingsBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ActivityView.didTapSettings(_:))))
        view.addSubview(SubmitBtn)
        
        
        SubmitBtn.addTarget(self, action: #selector(ActivityView.didTapSubmit(_:)),
                            for: .touchUpInside)
        
        SubmitBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ActivityView.didTapSubmit(_:))))
        view.addSubview(SubmitBtn)
    }
    
    
    //MARK: - BUTTON RECOGNIZERS
    // SETTINGS BUTTON TAPPED
    @objc func didTapSettings(_ recognizer: UITapGestureRecognizer){
        
        let mvc: SettingsView = SettingsView()
        
        mvc.modalPresentationStyle = .fullScreen
        mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(mvc, animated: true, completion: {
            () -> Void in
        })
        
    }
    
    // MAIN SCREEN BUTTON TAPPED
    @objc func didTapMainScreen(_ recognizer: UITapGestureRecognizer){
        let mvc: MainScreen = MainScreen()
        mvc.modalPresentationStyle = .fullScreen
        mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(mvc, animated: true, completion: {
            () -> Void in
            
            
        })
        
    }
    
    
    //SUBMIT BUTTON WAS TAPPED
    @objc func didTapSubmit(_ recognizer: UITapGestureRecognizer){
        if(startstring == "default" || endstring == "default" || activityDescriptionBox.text == ""){
            incompleteEntry()
            return
        }
        else{
            writefile()
            
            let mvc: MainScreen = MainScreen()
            mvc.modalPresentationStyle = .fullScreen
            mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
            present(mvc, animated: true, completion: {
                () -> Void in
            })
        }
    }
    
    //ALERT FOR WHEN AN ENTRY IS INCOMPLETE
    @objc func incompleteEntry(){
        let alert: UIAlertController = UIAlertController(title: "OPPS", message:
            "Complete All Fields" , preferredStyle:
            UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:
            {(action: UIAlertAction!) -> Void in
                
        }))
        present(alert, animated: true, completion:
            {() -> Void in
        })
        
    }
    
    
    /////////////////////////// VIEW DID LOAD ///////////////////////////
    //MARK: - View did load override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = NewActbackgroundColor
        //creates pickers and labels
        createButtons()
        createUI()
        
    }
    
    
    
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF ACTIVITY VIEW

