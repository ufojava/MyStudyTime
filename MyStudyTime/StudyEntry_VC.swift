//
//  StudyEntry_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 23/09/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//ViewController for Study Time
class StudyEntry_VC: UIViewController {
    
    //Outlet for Text field and buttons
    @IBOutlet weak var navigationbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var backToMainMenuItem: UIBarButtonItem!
    @IBOutlet weak var startTimeOutletText: UITextField!
    @IBOutlet weak var pickerviewOutletLabel: UILabel!
    @IBOutlet weak var subjectPickerviewOutletPickerview: UIPickerView!
    @IBOutlet weak var endTimeOutletText: UITextField!
    @IBOutlet weak var totalTimeOutletLabel: UILabel!
    @IBOutlet weak var saveOutletButton: UIButton!
    @IBOutlet weak var infoSaveOutletLabel: UILabel!
    
    //Subject Array
    var subjectArray = ["English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"]
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom Function
        formatVC() //Format ViewController
        conDelData() // Connect Pickerview
        hideKeyboard() //Hide keyboard
    }
    
    //Function to hide keyboard with gesture
    func hideKeyboard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    
    //Format View Controller
    func formatVC() {
        
        //Set background
        //Set Variable
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Set Image Name
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Image Settings
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Set Navagation Title
        navigationbarOutletNavbar.topItem?.title = "Subject Study Time"
        
        //Set Item Title
        backToMainMenuItem.title = "Back"
        
        //Format Navigation
        navigationbarOutletNavbar.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationbarOutletNavbar.layer.shadowOpacity = 1
        navigationbarOutletNavbar.layer.shadowRadius = 5
        navigationbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format Text fields, lables and button
        startTimeOutletText.layer.shadowOpacity = 1
        startTimeOutletText.layer.shadowRadius = 5
        startTimeOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        startTimeOutletText.clearButtonMode = .always
        startTimeOutletText.font = startTimeOutletText.font?.withSize(17)
        
        endTimeOutletText.layer.shadowOpacity = 1
        endTimeOutletText.layer.shadowRadius = 5
        endTimeOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        endTimeOutletText.clearButtonMode = .always
        endTimeOutletText.font =
            endTimeOutletText.font?.withSize(17)
        
        
        totalTimeOutletLabel.textColor = UIColor.blue
        totalTimeOutletLabel.font = totalTimeOutletLabel.font.withSize(17)
        
        saveOutletButton.setTitleColor(.white, for: .normal)
        saveOutletButton.backgroundColor = UIColor.black
        saveOutletButton.layer.shadowOpacity = 1
        saveOutletButton.layer.shadowRadius = 5
        saveOutletButton.layer.cornerRadius = 10
        saveOutletButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        totalTimeOutletLabel.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        totalTimeOutletLabel.layer.shadowOpacity = 1
        totalTimeOutletLabel.layer.shadowRadius = 5
        totalTimeOutletLabel.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format Boarder for Pickerview
        subjectPickerviewOutletPickerview.layer.borderColor = UIColor.black.cgColor
        subjectPickerviewOutletPickerview.layer.borderWidth = 1
        
                
                
    }
    
    //Function to Connect delegate & Datasource
    func conDelData() {
        subjectPickerviewOutletPickerview.delegate = self
        subjectPickerviewOutletPickerview.dataSource = self
    }
    
    //Call Menu
    @IBAction func callMainMenu(_ sender: UIBarButtonItem) {
        
        //Set Storyboard
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Main Menu
        let mainMenu = mainStoryBoard.instantiateViewController(identifier: "studyMainPahe_VC") as! StudyMainPage_VC
        
        //Call Main menu
        self.present(mainMenu,animated: true,completion: nil)
    }
    



}

extension StudyEntry_VC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Number of sections
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return subjectArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subjectArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerviewOutletLabel.textColor = UIColor.purple
        pickerviewOutletLabel.font = pickerviewOutletLabel.font.withSize(22)
        pickerviewOutletLabel.text = subjectArray[row]
    }
}
