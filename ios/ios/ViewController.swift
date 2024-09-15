import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // widget connection
    
    @IBOutlet weak var conversionSelector: UISegmentedControl!
    @IBOutlet weak var sizePicker: UIPickerView!
    
    @IBOutlet weak var resultlabel: UILabel!
    
    @IBAction func conversionChanged(_ sender: UISegmentedControl) {
        // get the selected line
        let selectedRow = sizePicker.selectedRow(inComponent: 0)
        updateResult(for: selectedRow)
    }
    // data
    let boltSizes = [ "1/64", "1/32", "3/64", "1/16", "5/64", "3/32", "7/64", "1/8", "9/64", "5/32", "11/64", "3/16", "13/64", "7/32", "15/64", "1/4", "17/64", "9/32", "19/64", "5/16" ]
    let sizeInMM = [ 0.40, 0.79, 1.19, 1.59, 1.98, 2.38, 2.78, 3.18, 3.57, 3.97, 4.37, 4.76, 5.16, 5.56, 5.95, 6.35, 6.75, 7.14, 7.54, 7.94 ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                sizePicker.dataSource = self
                sizePicker.delegate = self
                conversionSelector.addTarget(self, action: #selector(conversionChanged), for: .valueChanged)
        resultlabel.text = "select the size"
    }
    
    // UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return boltSizes.count
        }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return boltSizes[row]
        }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            updateResult(for: row)
        }
    
    // output result
    func updateResult(for row: Int) {
        let inches = boltSizes[row]  // get the selected inch
        let sizeMM = sizeInMM[row]  // get the selected mm

        if conversionSelector.selectedSegmentIndex == 0 {
            resultlabel.text = "\(sizeMM) mm"
        } else {	
            // convert the fraction first and calculate the mm
                    if let inchValue = fractionToDouble(inches) {
                        let convertedMM = inchValue * 25.4
                        resultlabel.text = String(format: "%.2f mm", convertedMM)
                    } else {
                        resultlabel.text = "calculation failed"
                    }
                }
            }
    
    func fractionToDouble(_ fraction: String) -> Double? {
        let components = fraction.split(separator: "/")
        if components.count == 2, let numerator = Double(components[0]), let denominator = Double(components[1]) {
            return numerator / denominator
        }
        return nil
    }

    
    
    
    @IBAction func showConversionViewController(_ sender: UIButton) {
            performSegue(withIdentifier: "showConvertor", sender: self)
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showConvertor" {
                
            }
        }
    
    

}
