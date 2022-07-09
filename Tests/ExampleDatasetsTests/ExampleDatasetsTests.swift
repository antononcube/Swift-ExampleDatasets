import XCTest
import TabularData
@testable import ExampleDatasets

final class ExampleDatasetsTests: XCTestCase {
    func testMetadata() throws {
        
        XCTAssertTrue(ExampleDatasets.dfRdatasets.shape.rows > 1000)
    }
    
    func testRetrieval() throws {
        
        let dsIris: DataFrame = ExampleDatasets.retrieveDataset(itemSpec: "iris3")!
            
        XCTAssertTrue(dsIris.shape.rows >= 50)
        XCTAssertTrue(dsIris.shape.columns >= 12)
    }
}
