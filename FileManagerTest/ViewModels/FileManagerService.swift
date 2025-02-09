import SwiftUI


class FileManagerService {
    static let shared = FileManagerService()
    private let fileName = "sample.txt"
    
    private init() {}
    
    private var documentDirectory: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    private var fileURL: URL {
        documentDirectory.appendingPathComponent(fileName)
    }
    
    func saveFile(content: String){
        do{
            try content.write(to: fileURL, atomically: true, encoding: .utf8)
            print("✅ 파일 저장 성공")
        } catch {
            print("파일 저장 실패: \(error.localizedDescription)")
        }
    }
    
    
    func loadFile() -> String {
        do{
            return try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            print("파일 로드 실패 : \(error.localizedDescription)")
            return ""
        }
    }
    
    func deleteFile(){
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print("파일 삭제 실패 : \(error.localizedDescription)")
        }
    }
    
    
    func fileExists() -> Bool {
        FileManager.default.fileExists(atPath: fileURL.path)
    }
    
}
