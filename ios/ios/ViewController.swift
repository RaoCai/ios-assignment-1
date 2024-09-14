import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // widget connection
    
    @IBOutlet weak var sizePicker: UIPickerView!
    
    @IBOutlet weak var resultlabel: UILabel!
    
    // test data
    let boltSizes = ["1/4\"", "3/8\"", "1/2\""]
    let sizeInMM = [6.35, 9.525, 12.7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sizePicker.dataSource = self
        sizePicker.delegate = self
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
    
    // when the size be selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateResult(for: row)
    }
    
    // output result
    func updateResult(for row: Int) {
        resultlabel.text = "\(sizeInMM[row]) mm"
    }
    
    // convert button
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        let selectedRow = sizePicker.selectedRow(inComponent: 0)
        updateResult(for: selectedRow)
    }
}
