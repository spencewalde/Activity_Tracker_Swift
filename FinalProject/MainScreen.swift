//
//  ViewController.swift
//  FinalProject
//
//  Created by Williams-Waldemar, Spencer A on 11/27/20.
//  Copyright © 2020 Williams-Waldemar, Spencer A. All rights reserved.
//

import UIKit
import SwiftUI

var MSbackgroundColor = UIColor.green
var NewActbackgroundColor = UIColor.green
var buttonColor = UIColor.black

//////////     MAIN SCREEN     //////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//MAIN SCREEN SHOWS THE TABLE OF ACTIVITIES AND WRITES FROM A FILE TO THE TABLE
class MainScreen: UIViewController{
    
    //VARIABLES
    var NewActivityBtn: UIButton = UIButton()
    var SettingsBtn: UIButton = UIButton()
    let tableView: UITableView = UITableView()
    var safeArea: UILayoutGuide!
    var activitylog = [String]()
    var templog = [String]()
    
    //MARK: - TABLEVIEW CONFIGURE
    func setupView(){
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -128).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.isScrollEnabled = true
    }
    //MARK: - CHANGE BACKGROUND COLOR
    func changeBackgroundColor(c: UIColor) {
        self.view.backgroundColor = c
    }
    
    
    
    //MARK: - READ FILE - MAIN SCREEN
    func readFile(){
        
        
        let file = "/tmp/ActivityLog.txt"
        activitylog.removeAll()
        do{
            let data = try String(contentsOfFile: file, encoding: .utf8)
            let parsedString = data.components(separatedBy: "@@@")
            activitylog.append(contentsOf: parsedString)
            print(activitylog)
        } catch { print("DID NOT FIND FILE")}
        
    }
    
    //
    func rewriteFile(){
        let file = "/tmp/ActivityLog.txt"
        var full_string = ""
        
        
        for string in activitylog{
            do{
                if(full_string == ""){
                    try string.write(toFile: file, atomically: true, encoding: .utf8)
                    full_string = full_string + string
                }
                else{
                    full_string = full_string + "@@@" + string
                    try full_string.write(toFile: file, atomically: true, encoding: .utf8)
                }
            }catch {print("DID NOT FIND FILE")}
        }
        
    }
    
    
    //MARK: - BUTTONS & RECOGNIZERS - MAIN SCREEN
    func createBtns(){
        let taskbarbtnwidth = 2 * view.bounds.width / 5
        let taskbarbtnheight = view.bounds.height / 10
        
        NewActivityBtn = UIButton(frame: CGRect(x: view.bounds.width / 4 - taskbarbtnwidth / 2 ,y:view.bounds.height - taskbarbtnheight, width: taskbarbtnwidth  ,height: taskbarbtnheight - taskbarbtnheight / 2))
        
        SettingsBtn = UIButton(frame: CGRect(x: 3 * view.bounds.width / 4  - taskbarbtnwidth/2 ,y:view.bounds.height - taskbarbtnheight, width: taskbarbtnwidth ,height: taskbarbtnheight - taskbarbtnheight / 2))
        
        NewActivityBtn.backgroundColor = buttonColor
        SettingsBtn.backgroundColor = buttonColor
        
        
        
        NewActivityBtn.setTitle("Add New Activity", for: .normal)
        NewActivityBtn.setTitleColor(.white, for: .normal)
        NewActivityBtn.layer.cornerRadius = 10
        NewActivityBtn.layer.borderWidth = 1
        NewActivityBtn.layer.borderColor = UIColor.white.cgColor
        
        
        
        SettingsBtn.setTitle("Settings", for: .normal)
        SettingsBtn.setTitleColor(.white, for: .normal)
        SettingsBtn.layer.cornerRadius = 10
        SettingsBtn.layer.borderWidth = 1
        SettingsBtn.layer.borderColor = UIColor.white.cgColor
        
        
        view.addSubview(NewActivityBtn)
        view.addSubview(SettingsBtn)
        
        NewActivityBtn.addTarget(self, action: #selector(MainScreen.didTapNewActivity(_:)), for: .touchUpInside)
        
        NewActivityBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainScreen.didTapNewActivity(_:))))
        view.addSubview(NewActivityBtn)
        
        
        SettingsBtn.addTarget(self, action: #selector(MainScreen.didTapSettings(_:)), for: .touchUpInside)
        
        SettingsBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainScreen.didTapSettings(_:))))
        view.addSubview(SettingsBtn)
    }
    
    //MARK: - RECOGNIZERS
    @objc func didTapNewActivity(_ recognizer: UITapGestureRecognizer){
        
        
        let mvc: ActivityView = ActivityView()
        mvc.modalPresentationStyle = .fullScreen
        mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(mvc, animated: true, completion: {
            () -> Void in
        })
        
    }
    
    
    @objc func didTapSettings(_ recognizer: UITapGestureRecognizer){
        
        
        let mvc: SettingsView = SettingsView()
        mvc.modalPresentationStyle = .fullScreen
        mvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(mvc, animated: true, completion: {
            () -> Void in
        })
        
    }
    
    //MARK: - MAIN SCREEN OVERRIDE FUNCTIONS
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Activity Log"
        readFile()
        tableView.dataSource = self
        safeArea = view.layoutMarginsGuide
        setupView()
        tableView.register(ActivityCell.self , forCellReuseIdentifier: "cellid")
        tableView.rowHeight = view.bounds.height / 7
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createBtns()
    }
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = MSbackgroundColor
        createBtns()
    }
    
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//MainScreen Class End




//EXTENTION For MainScreen TABLEVIEW DATASOURCE
extension MainScreen: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activitylog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as! ActivityCell
        let temp = activitylog[indexPath.row]
        cell.ActivityTitleLabel.text = temp
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        var temp: String = ""
        if (editingStyle == UITableViewCell.EditingStyle.delete){
            tableView.beginUpdates()
            temp = activitylog[indexPath.row]
            activitylog.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            rewriteFile()
            print(temp)
        }
        
    }
    
}

