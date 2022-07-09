import Foundation
import TabularData



public struct ExampleDatasets {
    

    public static var dfRdatasets: DataFrame {

        let dataURL = Bundle.module.url(forResource: "dfRdatasets", withExtension: "csv")

        let fname: String = (dataURL?.absoluteString)!.replacingOccurrences(of: "file://", with: "");

        let options = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")

        let fileUrl = URL(fileURLWithPath: fname)
        
        let data = try! DataFrame(
            contentsOfCSVFile: fileUrl,
            types : ["Package" : .string , "Item" : .string, "Title" : .string,
                     "Rows" : .integer, "Cols" : .integer, "n_binary" : .integer,
                     "n_character"  : .integer, "n_factor" : .integer, "n_logical"  : .integer, "n_numeric"  : .integer,
                     "CSV" : .string, "Doc" : .string],
            options: options)
        
        return data
    }
    
    public init() {
    }
    
    
    static public func retrieveDataset(itemSpec: String = "", packageSpec: String = "", keep: Bool = false) -> DataFrame? {
        
        //var objRow: DataFrame.Row;
        var objSlice: DataFrame.Slice;

        if itemSpec.isEmpty && packageSpec.isEmpty {
            // let rind: Int = Int.random(in: 0..<dfRdatasets.shape.rows)
            // csvURL = ExampleDatasets.dfRdatasets["CSV"][rind]
            // objRow = ExampleDatasets.dfRdatasets[ row: rind ]
            print("At least one of the arguments itemSpec and packageSpec have to be non-empty.")
            return nil
        } else if packageSpec.isEmpty {
            objSlice = ExampleDatasets.dfRdatasets.filter(on: "Item", String.self) { $0 == itemSpec }
        } else {
            objSlice = ExampleDatasets.dfRdatasets.filter(on: "Item", String.self) { $0 == itemSpec }
            objSlice = objSlice.filter(on: "Package", String.self) { $0 == packageSpec }
        }
        
        if objSlice.shape.rows == 0 {
            print("No datasets found with the given source spec.")
            return nil
        }
        
        if objSlice.shape.rows > 1 {
            print("Found more than one dataset with the given spec:")
            print(objSlice)
            return nil
        }
        
        let csvLink = String(describing: objSlice["CSV"].first!!)

        let optionsURL = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")
        
        guard let fileURL = URL(string: csvLink) else {
            fatalError("Error creating URL.")
        }
        
        let dfTest = try! DataFrame(
            contentsOfCSVFile: fileURL,
            options: optionsURL)
        
        return dfTest
    }
    
}
