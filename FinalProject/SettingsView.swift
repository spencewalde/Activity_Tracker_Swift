//
//  SettingsView.swift
//  FinalProject
//
//  Created by Williams-Waldemar, Spencer A on 11/30/20.
//  Copyright © 2020 Williams-Waldemar, Spencer A. All rights reserved.
//

import UIKit

////////////     SETTINGS VIEW     ////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// settings View Controller that handles deleting file and changing colors
class SettingsView: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    
    var MainScreenBtn: UIButton = UIButton()
    var NewActivityBtn: UIButton = UIButton()
    var MScolorpickerBtn: UIButton = UIButton()
    var NAcolorpickerBtn: UIButton = UIButton()
    var ClearFileBtn: UIButton = UIButton()
    var ButtonColorBtn: UIButton = UIButton()
    var rotationAngle: CGFloat!
    var tempColor: UIColor = UIColor()
    let width:CGFloat = 100
    let height:CGFloat = 100
    let Colorlist = ["Red", "Orange", "Yellow" , "Green", "Blue", "Black" , "Gray", "White"]
    
    
    
    //MARK: - BUTTONS AND RECOGNIZERS - SETTINGS VIEW
    func createBtns(){
        let taskbarbtnwidth = 2 * view.bounds.width / 5
        let taskbarbtnheight = view.bounds.height / 10
        let halfview = view.bounds.width / 2
        let btnwidth = view.bounds.width - 50
        let btnheight = view.bounds.height / 20
        
        MainScreenBtn = UIButton(frame: CGRect(
            x: view.bounds.width / 4 - taskbarbtnwidth / 2 ,
            y: view.bounds.height - taskbarbtnheight,
            width: taskbarbtnwidth  ,
            height: taskbarbtnheight - taskbarbtnheight / 2))
        
        NewActivityBtn = UIButton(frame: CGRect(
            x: 3 * view.bounds.width / 4 - taskbarbtnwidth/2 ,
            y: view.bounds.height - taskbarbtnheight,
            width: taskbarbtnwidth ,
            height: taskbarbtnheight - taskbarbtnheight / 2))
        
        MScolorpickerBtn = UIButton(frame: CGRect(
            x: halfview - btnwidth / 2  ,
            y: view.bounds.height / 6,
            width: btnwidth ,
            height: btnheight))
        
        NAcolorpickerBtn = UIButton(frame: CGRect(
            x: halfview - btnwidth / 2  ,
            y: 2 * view.bounds.height / 6,
            width: btnwidth ,
            height: btnheight))
        
        ButtonColorBtn = UIButton(frame: CGRect(
            x: halfview - btnwidth / 2 ,
            y: 3 * view.bounds.height / 6,
            width: btnwidth,
            height: btnheight))
        
        ClearFileBtn = UIButton(frame: CGRect(
            x: halfview - btnwidth / 2 ,
            y: 4 * view.bounds.height / 6,
            width: btnwidth ,
            height: btnheight))
        
        MainScreenBtn.backgroundColor = buttonColor
        NewActivityBtn.backgroundColor = buttonColor
        MScolorpickerBtn.backgroundColor = buttonColor
        NAcolorpickerBtn.backgroundColor = buttonColor
        ButtonColorBtn.backgroundColor = buttonColor
        ClearFileBtn.backgroundColor = buttonColor
        
        MainScreenBtn.setTitle("Main Screen", for: .normal)
        MainScreenBtn.setTitleColor(.white, for: .normal)
        MainScreenBtn.layer.cornerRadius = 10
        MainScreenBtn.layer.borderWidth = 1
        MainScreenBtn.layer.borderColor = UIColor.white.cgColor
        
        NewActivityBtn.setTitle("New Activity", for: .normal)
        NewActivityBtn.setTitleColor(.white, for: .normal)
        NewActivityBtn.layer.cornerRadius = 10
        NewActivityBtn.layer.borderWidth = 1
        NewActivityBtn.layer.borderColor = UIColor.white.cgColor
        
        MScolorpickerBtn.setTitle("Change Main Screen Background Color", for: .normal)
        MScolorpickerBtn.setTitleColor(.white, for: .normal)
        MScolorpickerBtn.layer.cornerRadius = 10
        MScolorpickerBtn.layer.borderWidth = 1
        MScolorpickerBtn.layer.borderColor = UIColor.white.cgColor
        
        NAcolorpickerBtn.setTitle("Change New Acitivity Background Color", for: .normal)
        NAcolorpickerBtn.setTitleColor(.white, for: .normal)
        NAcolorpickerBtn.layer.cornerRadius = 10
        NAcolorpickerBtn.layer.borderWidth = 1
        NAcolorpickerBtn.layer.borderColor = UIColor.white.cgColor
        
        ButtonColorBtn.setTitle("Change Button Color", for: .normal)
        ButtonColorBtn.setTitleColor(.white, for: .normal)
        ButtonColorBtn.layer.cornerRadius = 10
        ButtonColorBtn.layer.borderWidth = 1
        ButtonColorBtn.layer.borderColor = UIColor.white.cgColor
        
        ClearFileBtn.setTitle("Clear Activity Log", for: .normal)
        ClearFileBtn.setTitleColor(.white, for: .normal)
        ClearFileBtn.layer.cornerRadius = 10
        ClearFileBtn.layer.borderWidth = 1
        ClearFileBtn.layer.borderColor = UIColor.white.cgColor
        
        
        //navigation button to main screen
        MainScreenBtn.addTarget(self,action:#selector(SettingsView.didTapMainScreen(_:)), for: .touchUpInside)
        
        MainScreenBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SettingsView.didTapMainScreen(_:))))
        
        // navigation button to new activity
        NewActivityBtn.addTarget(self, action: #selector(SettingsView.didTapNewActivity(_:)),for: .touchUpInside)
        
        NewActivityBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SettingsView.didTapNewActivity(_:))))
        
        // main screen color picker
        MScolorpickerBtn.addTarget(self, action: #selector(SettingsView.didTapMSColorPicker(_:)),for: .touchUpInside)
        
        MScolorpickerBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SettingsView.didTapMSColorPicker(_:))))
        
        // new activity color picker
        NAcolorpickerBtn.addTarget(self, action: #selector(SettingsView.didTapNAColorPicker(_:)),for: .touchUpInside)
        
        NAcolorpickerBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SettingsView.didTapNAColorPicker(_:))))
        
        // button color picker
        ButtonColorBtn.addTarget(self, action: #selector(SettingsView.didTapButtonColorPicker(_:)),for: .touchUpInside)
        
        ButtonColorBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SettingsView.didTapButtonColorPicker(_:))))
        
        // clear file button
        ClearFileBtn.addTarget(self, action: #selector(SettingsView.didTapClearFileBtn(_:)),for: .touchUpInside)
        
        ClearFileBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SettingsView.didTapClearFileBtn(_:))))
        
        view.addSubview(MainScreenBtn)
        view.addSubview(NewActivityBtn)
        view.addSubview(MScolorpickerBtn)
        view.addSubview(NAcolorpickerBtn)
        view.addSubview(ButtonColorBtn)
        view.addSubview(ClearFileBtn)
    }
    
    //MARK: - BUTTONTAP - SETTINGSVIEW
    @objc func didTapNewActivity(_ recognizer: UITapGestureRecognizer){
        let mvc: ActivityView = ActivityView()
        mvc.modalPresentationStyle = .fullScreen
        mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(mvc, animated: true, completion: {
            () -> Void in
        })
        
    }
    
    @objc func didTapMainScreen(_ recognizer: UITapGestureRecognizer){
        let mvc: MainScreen = MainScreen()
        mvc.modalPresentationStyle = .fullScreen
        mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(mvc, animated: true, completion: {
            () -> Void in
        })
        
    }
    
    @objc func didTapMSColorPicker(_ recognizer: UITapGestureRecognizer){
        let UIPicker: UIPickerView = UIPickerView()
        UIPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        UIPicker.delegate = self as UIPickerViewDelegate
        UIPicker.dataSource = self as UIPickerViewDataSource
        UIPicker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        UIPicker.largeContentTitle = "Change Main Screen Background Color"
        self.view.addSubview(UIPicker)
        UIPicker.center.x = view.center.x
        UIPicker.center.y = view.center.y - 205
        
        
        
    }
    
    @objc func didTapNAColorPicker(_ recognizer: UITapGestureRecognizer){
        let UIPicker: UIPickerView = UIPickerView()
        UIPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        UIPicker.delegate = self as UIPickerViewDelegate
        UIPicker.dataSource = self as UIPickerViewDataSource
        UIPicker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        UIPicker.largeContentTitle = "Change New Activity Background Color"
        self.view.addSubview(UIPicker)
        UIPicker.center.x = view.center.x
        UIPicker.center.y = view.center.y - 50
        
        
    }
    @objc func didTapButtonColorPicker(_ recognizer: UITapGestureRecognizer){
        let UIPicker: UIPickerView = UIPickerView()
        UIPicker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        UIPicker.delegate = self as UIPickerViewDelegate
        UIPicker.dataSource = self as UIPickerViewDataSource
        UIPicker.largeContentTitle = "Change Button Background Color"
        UIPicker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        self.view.addSubview(UIPicker)
        UIPicker.center.x = view.center.x
        UIPicker.center.y = view.center.y + 95
        
        
        
    }
    
    
    
    //MARK: - Clear data on button click
    @objc func didTapClearFileBtn(_ recognizer: UITapGestureRecognizer){
        
        clearDataAlert()
        
        
    }
    @objc func clearDataAlert(){
        let alert: UIAlertController = UIAlertController(title: "Clear Activity Log", message:
            "Are you sure you want to clear activity log" , preferredStyle:
            UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler:
            {(action: UIAlertAction!) -> Void in
                let file = "/tmp/ActivityLog.txt"
                let full_string = ""
                do {
                    try full_string.write(toFile: file, atomically: false, encoding: .utf8)
                }catch {
                    print("Can't find the file yet, didn't read anything.")
                }
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler:
            {(action: UIAlertAction!) -> Void in
                
        }))
        present(alert, animated: true, completion:
            {() -> Void in
        })
        
    }
    
    //MARK: - PICKER HELPER FUNCTIONS
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Colorlist.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: width, height: height)
        label.textAlignment = .center
        label.text = Colorlist[row]
        label.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(label)
        
        //view rotation
        view.transform = CGAffineTransform(rotationAngle: 90 * (.pi / 180 ))
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let valueSelected = Colorlist[row] as String?
        if(valueSelected == "Red") { tempColor = UIColor.red}
        else if(valueSelected == "Orange") { tempColor = UIColor.orange}
        else if(valueSelected == "Yellow"){ tempColor = UIColor.yellow}
        else if(valueSelected == "Green"){ tempColor = UIColor.green}
        else if(valueSelected == "Blue") { tempColor = UIColor.blue}
        else if(valueSelected == "Black") { tempColor = UIColor.black}
        else if(valueSelected == "Gray") { tempColor = UIColor.gray}
        else if(valueSelected == "White") { tempColor = UIColor.white}
        
        
        
        if((pickerView.largeContentTitle?.contains("Button Background"))!) {
            buttonColor = tempColor
        }
        else if((pickerView.largeContentTitle?.contains("Main Screen Background"))!) {
            MSbackgroundColor = tempColor
        }
        else if((pickerView.largeContentTitle?.contains("New Activity Background"))!) {
            NewActbackgroundColor = tempColor
        }
        
    }
    //MARK: - VIEWDIDLOAD - SETTINGSVIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        createBtns()
        rotationAngle = -90 * (.pi / 180)
        
        view.backgroundColor = UIColor.gray
        
    }
}



