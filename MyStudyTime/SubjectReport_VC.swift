//
//  SubjectReport_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 16/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//Subject Report
class SubjectReport_VC: UIViewController {
    
    //Subject Report Outlets
    
    //Navigation Bar
    @IBOutlet weak var navbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var navbarOutletItem: UIBarButtonItem!
    
    //Label and Text Fields
    @IBOutlet weak var pickerOutletLabel: UILabel!
    @IBOutlet weak var pickerviewOutletPickerview: UIPickerView!
    @IBOutlet weak var totalStudyOutletLabel: UILabel!
    @IBOutlet weak var infoOutletLabel: UILabel!
    @IBOutlet weak var startDateOutletText: UITextField!
    @IBOutlet weak var endDateOutletText: UITextField!
    @IBOutlet weak var searchOutletButton: UIButton!
    

    
    //TableView View
    @IBOutlet weak var tableviewOutletTableview: UITableView!
    

    
    //Variables for holding array values
    var studyDate_V3Array: [String] = []
    var startTime_V3Array: [String] = []
    var endTime_V3Array: [String] = []
    var subject_V3Array: [String] = []
    var totalTime_V3Array: [Int32] = []
    
    //Variable to hold Report Total Study Time
    var reportTotalStudyTime = Int32(0)
    
    //Variable to hold PickerView Array
    var pickerSubArray = ["English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"]
    
    
    //Set Variable for DatePicker
    let datePicker = UIDatePicker()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Set Custom from here
        formatVC() //Format View Controller
        conDelegateDatasource() //Connect PickerView
       
    }
    
    //Format ViewController
    func formatVC() {
        
        //Set Viewcontroller backgound and image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Set Image
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Set Image fill
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Format Navgation bar
        navbarOutletNavbar.topItem?.title = "STUDY SUBJECT REPORT"
        navbarOutletNavbar.layer.shadowColor = UIColor.black.cgColor
        navbarOutletNavbar.layer.shadowOpacity = 1
        navbarOutletNavbar.layer.shadowRadius = 5
        navbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        navbarOutletItem.title = "Back"
        
        //Format label and text field
        pickerOutletLabel.textColor = UIColor.purple
        pickerOutletLabel.textAlignment = .center
        pickerOutletLabel.font = pickerOutletLabel.font.withSize(14)
        pickerOutletLabel.layer.borderColor = UIColor.gray.cgColor
        pickerOutletLabel.layer.borderWidth = 1.0
        
        startDateOutletText.font = startDateOutletText.font?.withSize(14)
        startDateOutletText.textAlignment = .left
        startDateOutletText.clearButtonMode = .always
        startDateOutletText.layer.borderColor = UIColor.gray.cgColor
        startDateOutletText.layer.borderWidth = 1.0
        
        endDateOutletText.font = startDateOutletText.font?.withSize(14)
        endDateOutletText.textAlignment = .left
        endDateOutletText.clearButtonMode = .always
        endDateOutletText.layer.borderColor = UIColor.gray.cgColor
        endDateOutletText.layer.borderWidth = 1.0
        
        //Format Search Button
        searchOutletButton.setTitleColor(.white, for: .normal)
        searchOutletButton.backgroundColor = UIColor.brown
        searchOutletButton.layer.borderColor = UIColor.gray.cgColor
        searchOutletButton.layer.borderWidth = 1.0
        
        
        
        
        
        pickerviewOutletPickerview.layer.borderColor = UIColor.gray.cgColor
        pickerviewOutletPickerview.layer.borderWidth = 1.0
        
        totalStudyOutletLabel.textColor = UIColor.systemYellow
        totalStudyOutletLabel.textAlignment = .left
        totalStudyOutletLabel.font = totalStudyOutletLabel.font.withSize(14)
        totalStudyOutletLabel.layer.borderColor = UIColor.gray.cgColor
        totalStudyOutletLabel.layer.borderWidth = 1.0
        
        
        
        //Hide Unused cells
        tableviewOutletTableview.tableFooterView = UIView()
        tableviewOutletTableview.layer.borderColor = UIColor.gray.cgColor
        tableviewOutletTableview.layer.borderWidth = 1
        
        
    }
    
    
    //Setup DatePicker Start
    func startEndDatePicker() {
        
        //Format Date for DatePicker
        datePicker.datePickerMode = .date
        
        //Set Toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Done Button
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        
        //Sapce Creation
        let spaceAdjust = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Cancel Button
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        //Set ToolBar
        toolBar.setItems([doneButton,spaceAdjust,cancelButton], animated: false)
        startDateOutletText.inputAccessoryView = toolBar
        startDateOutletText.inputView = datePicker
        endDateOutletText.inputAccessoryView = toolBar
        endDateOutletText.inputView = datePicker
        
        
    }
    

    
    
    //Function for the Done Button
    @objc func doneDatePicker() {
        
        let dFormatter = DateFormatter()
        dFormatter.dateStyle = .medium
        
        if (startDateOutletText.isEditing) {
            //Set conditions for Start and End dates
            startDateOutletText.text = dFormatter.string(from: datePicker.date)
            self.view.endEditing(true)
            
        }
        
        if (endDateOutletText.isEditing) {
        //Set conditions for End dates
        endDateOutletText.text = dFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
            
        }
        
       
    }
    
    
    
    //Function for Cancel
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
    
    //Enter Start Dates
    @IBAction func startDateEditing(_ sender: UITextField) {
        //Call Dated Picker
        startEndDatePicker()
    }
    
    //Enter End Date
    @IBAction func endDateEditing(_ sender: UITextField) {
        startEndDatePicker()
    }
 
 
    
    @IBAction func searchButton(_ sender: UIButton) {
        resetArray()
             getStudySubject(inSubject: pickerOutletLabel.text!)
             tableviewOutletTableview.reloadData()
             
             print(studyDate_V3Array)
             print(startTime_V3Array)
             print(endTime_V3Array)
             print(subject_V3Array)
             print(totalTime_V3Array)
    }
    
    

   

    
    //Funciton to get CoreData Subjects
    func getStudySubject(inSubject: String) {
        
        let dFormatter = DateFormatter()
            dFormatter.dateStyle = .medium
        
        let tFormatter = DateFormatter()
            tFormatter.timeStyle = .medium
            tFormatter.dateStyle = .none
        
        var cal = Calendar.current
                cal.timeZone = NSTimeZone.local
        

 
        
        //Set Context
               let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
                //Convert String to Date format
                let convStartDate = dFormatter.date(from: startDateOutletText.text!)
                let convEndDate = dFormatter.date(from: endDateOutletText.text!)
        
        
        
                //Date Predicate
           
                let dateFromPredicate = NSPredicate(format: "studyDate >= %@", convStartDate! as NSDate)
                let dateToPredicate = NSPredicate(format: "studyDate < %@", convEndDate! as NSDate)
        
        
                let studyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
        
                let subJectPredicate = NSPredicate(format: "subjectSelection == %@", inSubject)
        
                let datePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [dateFromPredicate, dateToPredicate,subJectPredicate])
        
                    studyEntity.predicate = datePredicate
               
        
                

               
               
               //Set fault result
               studyEntity.returnsObjectsAsFaults = false
               
               //Retreive subject from CoreData
        
        do {
            
            let results = try context.fetch(studyEntity)
            if results.count > 0 {
                for result in results as!  [NSManagedObject] {
                    
                    guard let resStdyDate = result.value(forKey: "studyDate") as? Date else {
                        print("Unable to get Study Date")
                        return
                    }
                    
                    let convStudyDate = dFormatter.string(from: resStdyDate)
                    //Assign result value to array
                    studyDate_V3Array.append(convStudyDate)
                    
                    //Start Time
                    
                    guard let resStartTime = result.value(forKey: "startTime") as? Date else {
                        print("Unable to get Start Time")
                        return
                    }
                    
                    let convStartTime = tFormatter.string(from: resStartTime)
                    //Assign result value to array
                    startTime_V3Array.append(convStartTime)
                    
                    
                    guard let resEndTime = result.value(forKey: "endTime") as? Date else {
                        print("Unable to get End Time")
                        return
                    }
                    
                    let convEndTime = tFormatter.string(from: resEndTime)
                    //Assign result value to array
                    endTime_V3Array.append(convEndTime)
                    
                    
                    subject_V3Array.append(result.value(forKey: "subjectSelection") as! String)
                    
                    guard let resTimeTotal = result.value(forKey: "studyTimeTotal") as? Int32 else {
                        print("Unable to get Time Total")
                        return
                    }
                    
                    totalTime_V3Array.append(resTimeTotal)
                    
                    //Total number of hours
                    reportTotalStudyTime = totalTime_V3Array.reduce(0, +)
                    totalStudyOutletLabel.text = "Total Hours \(reportTotalStudyTime)"
                    
                    
                }
            } else {
                print("No records found")
            }
        } catch {
            print("Unable to retreive records")
        }
        
        
    }
    
    
    
    //Function to reset Arrays
    func resetArray() {
        //Reset Array
        studyDate_V3Array.removeAll()
        startTime_V3Array.removeAll()
        endTime_V3Array.removeAll()
        subject_V3Array.removeAll()
        totalTime_V3Array.removeAll()
    }
    
    
    
    //Call Report Menu
    @IBAction func callReportMenu(_ sender: UIBarButtonItem) {
        
        //Main Storyboard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Call Report Menu
        let reportMenu = mainStoryboard.instantiateViewController(identifier: "reportMenu_VC") as! ReportnMenu_VC
            reportMenu.modalPresentationStyle = .fullScreen
        //Call Function
        self.present(reportMenu,animated: true,completion: nil)
    }
    
    //Function to set Pickerview  & TableView Delegta and Datasource
    func conDelegateDatasource() {
        //PickerView
        pickerviewOutletPickerview.delegate = self
        pickerviewOutletPickerview.dataSource = self
        
        //TableView
        tableviewOutletTableview.delegate = self
        tableviewOutletTableview.dataSource = self
        
    }
    
    


}

//Extension for Pickerview
extension SubjectReport_VC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Number of section
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    //Number of Section
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerSubArray.count
    }
    
    //The title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerSubArray[row]
    }
    
    //The selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //Assign Array value to label
        pickerOutletLabel.textColor = UIColor.purple
        pickerOutletLabel.font = pickerOutletLabel.font.withSize(22)
        pickerOutletLabel.text = pickerSubArray[row]
    }
    
}

//Extension for TableView
extension SubjectReport_VC: UITableViewDataSource, UITableViewDelegate {
    
    //Set number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of Row in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studyDate_V3Array.count
    }
    
    //Cell in Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableviewOutletTableview.dequeueReusableCell(withIdentifier: "subRptCell", for: indexPath) as! SubjectReportCell_VC
        
        //Study Date
        cell.studyDateOutletCell.textColor = UIColor.blue
        cell.studyDateOutletCell.font = cell.studyDateOutletCell.font.withSize(14)
        cell.studyDateOutletCell.text = "Study Date: \(studyDate_V3Array[indexPath.row])"
        
        //Start Time
        cell.startOutletCell.font = cell.startOutletCell.font.withSize(14)
        cell.startOutletCell.text = "Start Time: \(startTime_V3Array[indexPath.row])"
        
        //End Time
        cell.endOutletCell.font = cell.endOutletCell.font.withSize(14)
        cell.endOutletCell.text = "End Time: \(endTime_V3Array[indexPath.row])"
        
        //Subject
        cell.subjectOutletCell.font = cell.subjectOutletCell.font.withSize(14)
        cell.subjectOutletCell.text = subject_V3Array[indexPath.row]
        
        //Total Study Time
        cell.totalTimeOutletCell.textColor = UIColor.green
        cell.totalTimeOutletCell.font = cell.totalTimeOutletCell.font.withSize(14)
        cell.totalTimeOutletCell.text = "Study Time: \(totalTime_V3Array[indexPath.row]) Hour(s)"
        
        
        return cell
    }
    
}
