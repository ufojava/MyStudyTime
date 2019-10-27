//
//  DeleteRecord_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 22/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import UIKit
import CoreData

//Delete Study Records
class DeleteRecord_VC: UIViewController {
    
    //Outlets for View Controller
    @IBOutlet weak var navbarOutletNavbar: UINavigationBar!
    @IBOutlet weak var navbarItemOutletItem: UIBarButtonItem!
    @IBOutlet weak var pickerviewOutletPickerView: UIPickerView!
    @IBOutlet weak var stdyOutletFromText: UITextField!
    @IBOutlet weak var stdyOutletToText: UITextField!
    @IBOutlet weak var tableviewOutletTableView: UITableView!
    @IBOutlet weak var infoDelRecOutletLabel: UILabel!
    @IBOutlet weak var pickerviewOutletLabel: UILabel!
    @IBOutlet weak var searchOutletButton: UIButton!
    
    
    var subjectArray = ["English", "Literature","History","Biology","Chemistry","Maths","Physics","Geography"]
    
    
    //Variables for holding array values
    var studyDateArray: [String] = []
    var startTimeArray: [String] = []
    var endTimeArray: [String] = []
    var subjectTableViewArray: [String] = []
    var totalTimeArray: [Int32] = []
    
    //Capture Study Date, Subject and Time
    var selStudyDateCell = String()
    var selStudyTimeCell = String()
    var selStudySubCell = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom Functions from here
        formatVC() //Format View Controller
        connDataSourceDelegate() //Connection for PickerView and TableView
        
    }
    
    
    //Function for format ViewController
    func formatVC() {
        
        //Set background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        //Set the image to use
        backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
        
        //Set Image Aspect
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        //Set Navbar Title
        navbarOutletNavbar.topItem?.title = "DELETE STUDY RECORD"
        navbarItemOutletItem.title = "Back"
        navbarOutletNavbar.layer.shadowOpacity = 1
        navbarOutletNavbar.layer.shadowRadius = 5
        navbarOutletNavbar.layer.shadowColor = UIColor.black.cgColor
        navbarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format fields
        pickerviewOutletPickerView.layer.borderColor = UIColor.gray.cgColor
        pickerviewOutletPickerView.layer.borderWidth = 1.0
        
        
        stdyOutletFromText.font = stdyOutletFromText.font?.withSize(14)
        stdyOutletFromText.layer.borderColor = UIColor.gray.cgColor
        stdyOutletFromText.layer.borderWidth = 1.0
        stdyOutletFromText.clearButtonMode = .always
        
       
        stdyOutletToText.font = stdyOutletToText.font?.withSize(14)
        stdyOutletToText.layer.borderColor = UIColor.gray.cgColor
        stdyOutletToText.layer.borderWidth = 1.0
        stdyOutletToText.clearButtonMode = .always
        
        //Search button
        searchOutletButton.setTitleColor(.white, for: .normal)
        searchOutletButton.backgroundColor = UIColor.brown
        searchOutletButton.layer.borderColor = UIColor.gray.cgColor
        searchOutletButton.layer.borderWidth = 1.0
        
        pickerviewOutletLabel.textColor = UIColor.purple
        pickerviewOutletLabel.font = pickerviewOutletLabel.font?.withSize(17)
        pickerviewOutletLabel.layer.borderColor = UIColor.gray.cgColor
        pickerviewOutletLabel.textAlignment = .center
        pickerviewOutletLabel.layer.borderWidth = 1.0
        
        tableviewOutletTableView.layer.borderColor = UIColor.gray.cgColor
        tableviewOutletTableView.layer.borderWidth = 1.0
        tableviewOutletTableView.tableFooterView = UIView()
        
        
        
        
    }
    
    //Configure DatePicker and Date Formatter
    
    let dPicker = UIDatePicker()
    
    
    
    func showDatePicker() {
        
        dPicker.datePickerMode = .date
        
    
    //Configure Toolbar
    let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Configure Done, Adjust and Cancel Objects
        
        //Done Button
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        
        //Space Adjustment
        let spaceAdjust = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //Cancel Button
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        //Call Toolbar
        toolBar.setItems([doneButton,spaceAdjust,cancelButton], animated: false)
        
        //Set inputAccessory and InputViews
        stdyOutletFromText.inputAccessoryView = toolBar
        stdyOutletFromText.inputView = dPicker
        
        stdyOutletToText.inputAccessoryView = toolBar
        stdyOutletToText.inputView = dPicker
        
    }

    
    
    //Configure Date Picker Done and Cancel functions
      @objc func doneDatePicker() {
        
        let dFormatter = DateFormatter()
            dFormatter.dateStyle = .medium
            dFormatter.timeStyle = .none
        
        //Search From Date
        if(stdyOutletFromText.isEditing) {
            stdyOutletFromText.text = dFormatter.string(from: dPicker.date)
            self.view.endEditing(true)
        }
        
        //Saerch To Date
        if(stdyOutletToText.isEditing) {
            stdyOutletToText.text = dFormatter.string(from: dPicker.date)
            self.view.endEditing(true)
            
        }
          
      }
    
    
    //Configure Date Picker Cancel
    
    @objc func cancelDatePicker() {
        
        //Cancel action
        self.view.endEditing(true)
    }
    
    //Input Date Text Fields
    @IBAction func searchDateFrom(_ sender: UITextField) {
        
        //Call DatePicker
        showDatePicker() //From Text Field
        
    }
    
    
    @IBAction func searchDateTo(_ sender: UITextField) {
        
        //Call Date Picker
        showDatePicker() //To Date Field
        
        
    }
    
    //Search Button
    @IBAction func searchButton(_ sender: UIButton) {
        
        getStudyData(inSubject: pickerviewOutletLabel.text!, inStdyDateFrom: stdyOutletFromText.text!, inStudyDateTo: stdyOutletToText.text!)
        
        print(studyDateArray)
        print(startTimeArray)
        print(endTimeArray)
        print(subjectTableViewArray)
        print(totalTimeArray)
        
    }
    
    
    
    
    
    
    //Call Maintenance Menu
    @IBAction func callMaintMenu(_ sender: UIBarButtonItem) {
        
        //Set Main Storyboard
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Set Maint Menu
        let maintMenu = mainStoryboard.instantiateViewController(identifier: "Maintenance_VC") as! Maintenance_VC
            maintMenu.modalPresentationStyle = .fullScreen
        
        //Call Maintenance Menu
        self.present(maintMenu,animated:  true,completion: nil)
        
    }
    
    
    //Connect DataSource and Delegate for PickerView and TableView
    func connDataSourceDelegate() {
        
        //PickerView
        pickerviewOutletPickerView.delegate = self
        pickerviewOutletPickerView.dataSource = self
        
        
        //DataSource
        tableviewOutletTableView.delegate = self
        tableviewOutletTableView.dataSource = self
        
    }
    
    
    
    //CoreData information from Study Entity
    func getStudyData(inSubject: String, inStdyDateFrom: String, inStudyDateTo: String) {
        
        //Set context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Get Fetch Entity
        let studyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
        
        
        //Set Date Formatter
        let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
        
        
        //Check parameters for nil values
        
        //Subject
        guard pickerviewOutletLabel.text != nil else {
            print("Nil value found in Subject field")
            return
        }
        
        //Check Date From
        let convDateFrom = dateFormatter.date(from: inStdyDateFrom)
        guard convDateFrom != nil else {
            print("Nil value found in Study Datde From")
            return
        }
        
        //Check Date To
        let convDateTo = dateFormatter.date(from: inStudyDateTo)
        guard convDateTo != nil else {
            print("Nil value found in Study Date To")
            return
        }
        
        //Set compound predicate
        let studyDateFromPredicate = NSPredicate(format: "studyDate >= %@", convDateFrom! as NSDate)
        let studyDateToPredicate = NSPredicate(format: "studyDate < %@", convDateTo! as NSDate)
        let studySubjectPredicate = NSPredicate(format: "subjectSelection == %@", inSubject)
        
    
        
        //Set compound predicate
        let studyCompundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [studySubjectPredicate,studyDateFromPredicate,studyDateToPredicate])
        
        //Set fault results
        studyEntity.returnsObjectsAsFaults = false
        
        //Assign Entity to Compund Predicate
        studyEntity.predicate = studyCompundPredicate
        
        //Search CoreData for records
        do {
            let results = try context.fetch(studyEntity)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        guard let resStudyDate = result.value(forKey: "studyDate") as? Date else {
                            print("Unable to get Study Date")
                            return
                        }
                        //Assign result to StudyDate Array
                        let convStdyDate = dateFormatter.string(from: resStudyDate)
                        studyDateArray.append(convStdyDate)
                        
                        guard let resStartTime = result.value(forKey: "startTime") as? Date else {
                            print("Unable to get Start Time")
                            return
                        }
                        
                        //Assign to Start Time Array
                        let convStartTime = dateFormatter.string(from: resStartTime)
                        startTimeArray.append(convStartTime)
                        
                        guard let resEndTime = result.value(forKey: "endTime") as? Date else {
                            print("Unable to get End Time")
                            return
                        }
                        
                        //Assign to End Time Array
                        let convEndTime = dateFormatter.string(from: resEndTime)
                        endTimeArray.append(convEndTime)
                        
                        
                        guard let resSubject = result.value(forKey: "subjectSelection") as? String else {
                            print("Unable to get subject")
                            return
                        }
                        
                        //Asign to Subect Array
                        subjectTableViewArray.append(resSubject)
                        
                         
                        
                        guard let resTotalTime = result.value(forKey: "studyTimeTotal") as? Int32 else {
                            print("Unable to get Total Study Time")
                            return
                        }
                        
                        //Assign result to Total Time Array
                        totalTimeArray.append(resTotalTime)
                    }
                    
                    
                    
                } else {
                    print("no record Found!!")
            }
            
            
            
            
            
            
        } catch {
            print("Unable to get records")
        }
        
        
        
    }
    

    

}



//Extention for PickerView
extension DeleteRecord_VC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Number of Components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Number of Rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        subjectArray.count
    }
    
    //Title of Rows
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        subjectArray[row]
        
    }
    
    //Selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //Assign to pickerView laber
        pickerviewOutletLabel.textColor = UIColor.purple
        pickerviewOutletLabel.font = pickerviewOutletLabel.font.withSize(22)
        pickerviewOutletLabel.text = subjectArray[row]
    }
}

extension DeleteRecord_VC: UITableViewDataSource, UITableViewDelegate {
    
    //Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studyDateArray.count
    }
    
    //RowCellAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Configure TableView Cell
        
        //Define Cell
        let cell = tableviewOutletTableView.dequeueReusableCell(withIdentifier: "deleteRecCell", for: indexPath) as! delStudyRecCell_VC
        
        
        //Assign Cell Values
        
        //Study Date
        cell.studyDateOutletCell.textColor = UIColor.blue
        cell.studyDateOutletCell.font = cell.studyDateOutletCell.font.withSize(14)
        cell.stdyHoursOutletCell.text = "Study Date: \(studyDateArray[indexPath.row])"
        
        //Study  From Time
        cell.stdyTimeFromOutletCell.font = cell.stdyTimeFromOutletCell.font.withSize(14)
        cell.stdyTimeFromOutletCell.text = "Start Time: \(startTimeArray[indexPath.row])"
        
        //Study End Time
        cell.stdyTimeToOutletCell.font = cell.stdyTimeToOutletCell.font.withSize(14)
        cell.stdyTimeToOutletCell.text = "End Time: \(endTimeArray[indexPath.row])"
        
        //Study Subject
        cell.stdySubjectOutletCell.font = cell.stdySubjectOutletCell.font.withSize(14)
        cell.stdySubjectOutletCell.text = "Subject: \(subjectTableViewArray[indexPath.row])"
        
        //Total Hours
        cell.stdyHoursOutletCell.font = cell.stdyHoursOutletCell.font.withSize(14)
        cell.stdyHoursOutletCell.textColor = UIColor.green
        cell.stdyHoursOutletCell.text = "Study Hours: \(totalTimeArray[indexPath.row])"
        
        
        return cell
        
    }
    
    //Can edit set to True
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selCell = tableviewOutletTableView.dequeueReusableCell(withIdentifier: "deleteRecCell", for: indexPath) as! delStudyRecCell_VC
        
        //Capture Cell values
        
        //Get Study Date
        guard selCell.studyDateOutletCell.text != nil else {
            print("Nil value found in cell Study Date")
            return
        }
        selStudyDateCell = selCell.studyDateOutletCell.text!
        
        //Get Study Time From
        guard selCell.stdyTimeFromOutletCell.text != nil else {
            print("Nil Value found on cell Study Time From")
            return
        }
        selStudyTimeCell = selCell.stdyTimeFromOutletCell.text!
        
        //Get Study Subject
        guard selCell.stdySubjectOutletCell != nil else {
            print("Nil value found in Subject field")
            return
        }
        selStudySubCell = selCell.stdySubjectOutletCell.text!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableviewOutletTableView.beginUpdates()
        tableviewOutletTableView.deleteRows(at: [indexPath], with: .automatic)
        tableviewOutletTableView.endUpdates()
    }
    
        
        
    
    
}
