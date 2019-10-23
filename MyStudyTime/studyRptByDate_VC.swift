//
//  studyRptByDate_VC.swift
//  MyStudyTime
//
//  Created by Ufuoma Okoro on 06/10/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

//Study Report by Date
import UIKit
import CoreData

//Study Report by Date
class studyRptByDate_VC: UIViewController {
    
    //Report Form Outlets
    @IBOutlet weak var navBarOutletNavbar: UINavigationBar!
    @IBOutlet weak var navBarOutletItem: UIBarButtonItem!
    @IBOutlet weak var searchFromOutletText: UITextField!
    @IBOutlet weak var searchToOutletText: UITextField!
    @IBOutlet weak var searchOutletButton: UIButton!
    @IBOutlet weak var tableviewOutletView: UITableView!
    @IBOutlet weak var rptTotalTimeOutletLabel: UILabel!
 
    
    
    //Array to hold Data
    var studyDateArray: [String] = []
    var startTimeArray: [String] = []
    var endTimeArray: [String] = []
    var subjectArray: [String] = []
    var timeTotalArray: [Int32] = []
    
  //Variable to hold Report Total Study Time
    var reportTotalStudyTime = Int32(0)

    override func viewDidLoad() {
        super.viewDidLoad()

        //Custom function
        formatVC() //Format ViewController
        ConnDelegateDataSouce() //Connect Delegat and Datasource
    }
    
    //Format ViewController
    func formatVC() {
        
        //Set Viewcontroller background
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "Other_VCBackground.jpg")
            backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Format navigation bar
        navBarOutletNavbar.topItem?.title = "STUDY REPORT BY DATE"
        navBarOutletNavbar.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navBarOutletNavbar.layer.shadowOpacity = 1
        navBarOutletNavbar.layer.shadowRadius = 5
        navBarOutletNavbar.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Format navigation Item
        navBarOutletItem.title = "Back"
        
    
        
        //Format Text Field
        searchFromOutletText.textColor = UIColor.red
        searchFromOutletText.font = searchFromOutletText.font?.withSize(14)
        searchFromOutletText.clearButtonMode = .always
        searchFromOutletText.textAlignment = .left
        searchFromOutletText.layer.borderColor = UIColor.gray.cgColor
        searchFromOutletText.layer.borderWidth = 1
        
        searchToOutletText.textColor = UIColor.red
        searchToOutletText.font = searchFromOutletText.font?.withSize(14)
        searchToOutletText.clearButtonMode = .always
        searchToOutletText.textAlignment = .left
        searchToOutletText.layer.borderColor = UIColor.gray.cgColor
        searchToOutletText.layer.borderWidth = 1
        
        searchOutletButton.setTitleColor(.white, for: .normal)
        searchOutletButton.backgroundColor = UIColor.brown
        searchOutletButton.layer.borderColor = UIColor.gray.cgColor
        searchOutletButton.layer.borderWidth = 1
       
        
        //Hide Table footer
        tableviewOutletView.layer.borderColor = UIColor.gray.cgColor
        tableviewOutletView.layer.borderWidth = 1
        tableviewOutletView.tableFooterView = UIView()
    
        
        
    }
    
    //Configure Date Picker
    let datePicker = UIDatePicker()
    
    
    //Function to show DatePicker
    func showDatePicker() {
        
        //Format Date and Time
        datePicker.datePickerMode = .date
        
        //Configure Toolbar
        let toolbar = UIToolbar()
            toolbar.sizeToFit()
        
        //Configure Done and Cancel buttons
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        
        //Create Space
        let spaceAdjust = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        //Call Toolbar
        toolbar.setItems([doneButton,spaceAdjust,cancelButton], animated: false)
        searchFromOutletText.inputAccessoryView = toolbar
        searchFromOutletText.inputView = datePicker
        
        searchToOutletText.inputAccessoryView = toolbar
        searchToOutletText.inputView = datePicker
        
    }
    
    
    
    
    //Function for Done for Date Picker
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        if (searchFromOutletText.isEditing) {
            searchFromOutletText.text = formatter.string(from: datePicker.date)
            self.view.endEditing(true)
        }
        
        if (searchToOutletText.isEditing) {
            searchToOutletText.text = formatter.string(from: datePicker.date)
            self.view.endEditing(true)
        }
        
    }
    
    //Function to cancel DatePicker
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
    
    
    
    //Enter date From
    @IBAction func searchDateFromText(_ sender: UITextField) {
        showDatePicker() //Start Search Date
    }
    
    
    //Enter Date To
    @IBAction func searchDateToText(_ sender: UITextField) {
        showDatePicker() //End Search Date
    }
    
    //Search Button
    @IBAction func searchButton(_ sender: UIButton) {
        resetArray()
        //allStudyRecords()
        allStudyRecords(inDateFrom: searchFromOutletText.text!, inDateTo: searchToOutletText.text!)
        tableviewOutletView.reloadData()
       
    
    }
    
    
    
    
    //Menu call
    @IBAction func backToRptMenu(_ sender: UIBarButtonItem) {
        
        //Storybaord
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let reportMenu = mainStoryBoard.instantiateViewController(identifier: "reportMenu_VC") as! ReportnMenu_VC
        reportMenu.modalPresentationStyle = .fullScreen
        
        //Call Menu
        self.present(reportMenu,animated: true,completion: nil)
    }
    
    
    //Import Study Entity from CoreData
    func allStudyRecords(inDateFrom: String, inDateTo: String) {
        

        
        //Set Context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Format Date and Time
        let dateFomrmatter = DateFormatter()
            dateFomrmatter.dateStyle = .medium
    
        
        let timeFormatter = DateFormatter()
            timeFormatter.dateStyle = .none
            timeFormatter.timeStyle = .short
        
        guard searchFromOutletText.text != nil else {
            print("search from has a nil value")
            return
        }
        
        let convDateFrom = dateFomrmatter.date(from: inDateFrom)
        
        guard convDateFrom != nil else {
            print("ConvertFrom has nil value")
            return
            
        }
        
        guard searchToOutletText.text != nil else {
        print("search to has a nil value")
        return
        }
        
        let convDateTo = dateFomrmatter.date(from: inDateTo)
        //Configure Data Picker String to Date
        
        guard convDateTo != nil else {
            print("Convert To has nil")
            return
        }
        
        
        
        
        //Set Search Predicate
        let dateFromPredicate = NSPredicate(format: "studyDate >= %@", convDateFrom! as NSDate)
        
        let dateToPredicate = NSPredicate(format: "studyDate < %@", convDateTo! as NSDate)
        
        //Study Entity
        let studyEntity = NSFetchRequest<NSFetchRequestResult>(entityName: "Study")
        
        //Set Compoubd Predicate
        let dateRangePredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [dateFromPredicate, dateToPredicate])
        
        studyEntity.predicate = dateRangePredicate

        //Chack fault reports
        studyEntity.returnsObjectsAsFaults = false
        
        //Serach Core Data database
        
        
        
        
        do {
            let results = try context.fetch(studyEntity)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                   //Append search results into Arrays
                    
                    guard let resStdyDate = result.value(forKey: "studyDate") as? Date else {
                        print("Unable to get Study Date")
                        return
                    }
                    
                    let convResStudyDate = dateFomrmatter.string(from: resStdyDate)
                    //Assign Study Date Array
                    studyDateArray.append(convResStudyDate)
                    
                    guard let resStartTime = result.value(forKey: "startTime") as? Date else {
                        print("Unable to get Start Time")
                        return
                    }
                    let convResStartTime = timeFormatter.string(from: resStartTime)
                    //Assign Start Time Array
                    startTimeArray.append(convResStartTime)
                    
                    guard let resEndTime = result.value(forKey: "startTime") as? Date else {
                        print("Unable to get End Time")
                        return
                    }
                    let convResEndTime = timeFormatter.string(from: resEndTime)
                    //Assign Start Time Array
                    endTimeArray.append(convResEndTime)
                    
            
                    subjectArray.append(result.value(forKey: "subjectSelection") as! String)
                    
                    guard let resTimeTotal = result.value(forKey: "studyTimeTotal") as? Int32 else {
                        print("Unable to to get Total Study Time")
                        return
                    }
                    //Assign the total time to the Array
                    timeTotalArray.append(resTimeTotal)
                    
                   
                  
                  
                    
                }
               
                print(timeTotalArray)
    
                //Total number of hours
                reportTotalStudyTime = timeTotalArray.reduce(0, +)
                rptTotalTimeOutletLabel.textColor = UIColor.yellow
                rptTotalTimeOutletLabel.text = "Total Hours \(reportTotalStudyTime)"
        
            } else {
                print("No Data found")
            }
        } catch {
            print("Unable to get results")
        }
        
        
    }
    
   
    //Reset Array
    func resetArray() {
        studyDateArray.removeAll()
        startTimeArray.removeAll()
        endTimeArray.removeAll()
        subjectArray.removeAll()
        timeTotalArray.removeAll()
    }
    
    //Connect Tableviw Delegate and Datasource
    func ConnDelegateDataSouce() {
        
        tableviewOutletView.delegate = self
        tableviewOutletView.dataSource = self
    }
    
    
                    
                    
    
    
    
    

}

//Extension for tableview
extension studyRptByDate_VC: UITableViewDataSource, UITableViewDelegate {
    
    //Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studyDateArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewOutletView.dequeueReusableCell(withIdentifier: "reportCell", for: indexPath) as! stdyRptByDateCell_VC
        
        //Assign cell values from arrays and format font and color
        
        //Study Date
        cell.studyDateOutletLabel.text  = "Study Date: \(studyDateArray[indexPath.row])"
        cell.studyDateOutletLabel.textColor = UIColor.blue
        cell.studyDateOutletLabel.textAlignment = .left
        cell.studyDateOutletLabel.font = cell.studyDateOutletLabel.font.withSize(14)
        
        
        //Start Time
        cell.startTimeOutletLabel.text =  "Start Time: \(startTimeArray[indexPath.row])"
        cell.startTimeOutletLabel.textAlignment = .left
        cell.startTimeOutletLabel.font = cell.startTimeOutletLabel.font.withSize(14)
        
        //End Time
        cell.endTimeOutletLabel.text = "End Time: \(endTimeArray[indexPath.row])"
        cell.endTimeOutletLabel.textAlignment = .left
        cell.endTimeOutletLabel.font = cell.endTimeOutletLabel.font.withSize(14)
        
        //Study Subject
        cell.subjectOutletLabel.text = "Subject: \(subjectArray[indexPath.row])"
        cell.subjectOutletLabel.textAlignment = .left
        cell.subjectOutletLabel.font = cell.subjectOutletLabel.font.withSize(14)
        
        //Total Time
        cell.totalTimeOutletLabel.text = "Study Time \(timeTotalArray[indexPath.row]) Hrs"
        cell.totalTimeOutletLabel.textAlignment = .left
        cell.totalTimeOutletLabel.font = cell.totalTimeOutletLabel.font.withSize(14)
        
        return cell
    }
    
}
