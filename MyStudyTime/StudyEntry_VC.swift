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
    @IBOutlet weak var studyDateOutletText: UITextField!
    @IBOutlet weak var startTimeOutletText: UITextField!
    @IBOutlet weak var pickerviewOutletLabel: UILabel!
    @IBOutlet weak var subjectPickerviewOutletPickerview: UIPickerView!
    @IBOutlet weak var endTimeOutletText: UITextField!
    @IBOutlet weak var totalTimeOutletLabel: UILabel!
    @IBOutlet weak var calcStudyTimeOutletButton: UIButton!
    @IBOutlet weak var saveOutletButton: UIButton!
    @IBOutlet weak var infoSaveOutletLabel: UILabel!
    
    //Subject Array
    var subjectArray = ["English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"]
    
    var studyDate = Date()
    var studyEndTime = Date()
    var studyStartTime = Date()
    var timeIntVal = 0

    
    
    

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
        navigationbarOutletNavbar.topItem?.title = "MY STUDY TIME"
        
        //Set Item Title
        backToMainMenuItem.title = "Back"
        
        //Format Navigation
        navigationbarOutletNavbar.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationbarOutletNavbar.layer.shadowOpacity = 1
        navigationbarOutletNavbar.layer.shadowRadius = 5
        navigationbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format Text fields, lables and button
        studyDateOutletText.layer.shadowOpacity = 1
        studyDateOutletText.layer.shadowRadius = 5
        studyDateOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        studyDateOutletText.font = studyDateOutletText.font?.withSize(17)
        studyDateOutletText.clearButtonMode = .always
        studyDateOutletText.textAlignment = .center
        
        
        startTimeOutletText.layer.shadowOpacity = 1
        startTimeOutletText.layer.shadowRadius = 5
        startTimeOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        startTimeOutletText.clearButtonMode = .always
        startTimeOutletText.font = startTimeOutletText.font?.withSize(17)
        startTimeOutletText.textColor = UIColor.red
        
        endTimeOutletText.layer.shadowOpacity = 1
        endTimeOutletText.layer.shadowRadius = 5
        endTimeOutletText.layer.shadowOffset = CGSize(width: 3, height: 3)
        endTimeOutletText.clearButtonMode = .always
        endTimeOutletText.font =
            endTimeOutletText.font?.withSize(17)
        endTimeOutletText.textColor = UIColor.red
        
        
        totalTimeOutletLabel.textColor = UIColor.blue
        totalTimeOutletLabel.font = totalTimeOutletLabel.font.withSize(17)
        
        saveOutletButton.setTitleColor(.white, for: .normal)
        saveOutletButton.backgroundColor = UIColor.blue
        saveOutletButton.layer.shadowOpacity = 1
        saveOutletButton.layer.cornerRadius = 8
    
        
        calcStudyTimeOutletButton.setTitleColor(.white, for: .normal)
        calcStudyTimeOutletButton.backgroundColor = UIColor.blue
        calcStudyTimeOutletButton.layer.shadowOpacity = 1
        calcStudyTimeOutletButton.layer.cornerRadius = 8
        
        totalTimeOutletLabel.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        totalTimeOutletLabel.layer.shadowOpacity = 1
        totalTimeOutletLabel.layer.shadowRadius = 5
        totalTimeOutletLabel.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format Boarder for Pickerview
        subjectPickerviewOutletPickerview.layer.borderColor = UIColor.black.cgColor
        subjectPickerviewOutletPickerview.layer.borderWidth = 1
        
                
                
    }
    

    //Text Field Action
    
    //Enter Study Date
    @IBAction func StudyAction(_ sender: UITextField) {
        showDatePickerStudyD()
    }
    
    //Enter Study Start Time
    @IBAction func startTimeAction(_ sender: UITextField) {
        
        showDatePickerStartT()
    }
    
    //Enter Study End Time
    @IBAction func entTimeAction(_ sender: UITextField) {
        showDatePickerEndT()
    }
    
    //Button Function Section
    @IBAction func calcStudyTimeButton(_ sender: UIButton) {
        calcStudyTime()
    }
    
    //Save New  Study Record
    @IBAction func saveNewStudyButton(_ sender: UIButton) {
        
        if studyDateOutletText.text != "" && startTimeOutletText.text != "" && endTimeOutletText.text != "" && pickerviewOutletLabel.text != "" && totalTimeOutletLabel.text != ""{
            
            newStudy() //New Study
            infoSaveOutletLabel.textColor = UIColor.green
            infoSaveOutletLabel.text = "New Study Saved"
            
            //Reset form after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.resetForm() //Reset form after 2 seconds
            }
            
            //Set Message Delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.infoSaveOutletLabel.text = ""
            }
        } else {
            infoSaveOutletLabel.textColor = UIColor.red
            infoSaveOutletLabel.text = "All fields must be filled!!"
            
            //Set Message Delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.infoSaveOutletLabel.text = ""
            }
        }
    }
    
    //Reset Study Input form
    func resetForm() {
        studyDateOutletText.text = ""
        startTimeOutletText.text = ""
        endTimeOutletText.text = ""
        pickerviewOutletLabel.text = ""
        totalTimeOutletLabel.text = ""
    }
    
    
    
    
    //Date Picker for Start Times
    let datePicker = UIDatePicker()
    
    
    
    
     //Study Date Function
    func showDatePickerStudyD() {
        
        //define the datepicker
        datePicker.datePickerMode = .date
        
        //Define the toolbar
        let toolBar = UIToolbar()
            toolBar.sizeToFit()
        
        //Configure Toolbar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(studyDoneDPicker))
        let createSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDTPicker))
        
        //Set Toolbar
        toolBar.setItems([doneButton,createSpace,cancelButton], animated: false)
        
        //Assign Text field
        studyDateOutletText.inputAccessoryView = toolBar
        studyDateOutletText.inputView = datePicker
        
        
    }
    
    
    //DatePicker for Start Date and Time
    func showDatePickerStartT() {
        
        //Get Date and Time
        datePicker.datePickerMode = .time
        
        //Set Toolbar to action date Time selection
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Configure Done and Cancel buttons in toolbar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(startDoneTPicker))
        
        
        //Configure space
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Configure Cancel button
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDTPicker))
        
        //Set Toolbar
        toolBar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        //Assign the
        startTimeOutletText.inputAccessoryView = toolBar
        startTimeOutletText.inputView = datePicker
       
        
               
    }
    
    //Function for End Time toolbat
    func showDatePickerEndT() {
        
        //Get Date and Time
        datePicker.datePickerMode = .time
        
        //Set toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Configure Done toolbar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(endDoneTPicker))
        
        //Configure Space between buttons
        let createSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Configre Cancel button
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDTPicker))
        
        //Set Toolbar
        toolbar.setItems([doneButton,createSpace,cancelButton], animated: false)
        
        //Assign value to End Time
        endTimeOutletText.inputAccessoryView = toolbar
        endTimeOutletText.inputView = datePicker
        

        
    }
    
    //Function for Done buton Study Date
    @objc func studyDoneDPicker(){
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        //Assign forma to text field
        studyDateOutletText.text = formatter.string(from: datePicker.date)
        studyDate = datePicker.date
        self.view.endEditing(true)
    }
    
    
    //Function for Done Button for Start time
    @objc func startDoneTPicker() {
        
        let formatter = DateFormatter()
            formatter.timeStyle = .medium
        
    
        
        //Assign value to Start Time text field
        startTimeOutletText.text = formatter.string(from: datePicker.date)
        studyStartTime = datePicker.date
        print("Start Time: \(studyStartTime)")
        
         self.view.endEditing(true)
     
        
    }
    
    //Function for Done button for End Study Time
    @objc func endDoneTPicker() {
        
        
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        
        //Assign the calue to Ent Time text field
        endTimeOutletText.text = formatter.string(from: datePicker.date)
        
        studyEndTime = datePicker.date
        print("Study Time: \(studyEndTime)")
        self.view.endEditing(true)
        
    }
    
    
    //Function for Cancel Button - Used by all Functions
    @objc func cancelDTPicker() {
        self.view.endEditing(true)
    }
    
    
    
    //Function to calculate total study time
    func calcStudyTime() {
        
        //var dateComponets = DateComponents()
        let cal = Calendar.current
        
        let calComp = cal.dateComponents([.hour], from: studyStartTime, to: studyEndTime)
        timeIntVal = calComp.hour!
        totalTimeOutletLabel.textColor = UIColor.yellow
        print(Int32(timeIntVal))
    
        totalTimeOutletLabel.text = "Study Duration: \(timeIntVal) Hour(s)"
  
        
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
            mainMenu.modalPresentationStyle = .fullScreen
        
        //Call Main menu
        self.present(mainMenu,animated: true,completion: nil)
    }
    
    //Insert study entry into CoreData
        func newStudy() {
        
            //Set Context
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            //Declare Entity with NSEntityDescription
            let studyEntity = NSEntityDescription.entity(forEntityName: "Study", in: context)
            
            let newStudy = NSManagedObject(entity: studyEntity!, insertInto: context)
            
            //Inset new record
            
            newStudy.setValue(studyDate, forKey: "studyDate")
            newStudy.setValue(studyStartTime, forKey: "startTime")
            newStudy.setValue(studyEndTime, forKey: "endTime")
            newStudy.setValue(pickerviewOutletLabel.text, forKey: "subjectSelection")
            newStudy.setValue(Int32(timeIntVal), forKey: "studyTimeTotal")
            
            //Save new record
            do {
                
                try context.save()
                
            } catch {
                print("Unable to save record")
            }
            
                
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
