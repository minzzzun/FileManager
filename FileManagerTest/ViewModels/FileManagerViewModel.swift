import SwiftUI

final class FileManagerViewModel : ObservableObject {
    @Published var fileContent: String = ""
    
    private let fileManager = FileManagerService.shared
    
    func saveContent(content: String){
        fileManager.saveFile(content: content)
        fileContent = content
    }
    
    func loadContent(){
        fileContent = fileManager.loadFile()
    }
    
    func deleteFile(){
        fileManager.deleteFile()
        fileContent = ""
    }
    
    func checkFileExists() -> Bool {
        fileManager.fileExists()
    }
    
}
