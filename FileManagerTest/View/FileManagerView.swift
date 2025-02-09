import SwiftUI


struct FileManagerView : View {
    @StateObject private var viewModel = FileManagerViewModel()
    @State private var inputText: String = ""
    
    var body: some View {
        Text("")
        
        
        VStack(spacing: 20 ){
            TextField("파일에 저장할 내용을 입력하세요", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
            Button("파일 저장"){
                viewModel.saveContent(content: inputText)
            }
            .buttonStyle(.borderedProminent)
            
            
            Button("파일 불러오기"){
                viewModel.loadContent()
            }
            .buttonStyle(.bordered)
            
            Button("파일 삭제"){
                viewModel.deleteFile()
            }
            .buttonStyle(.bordered)
            .tint(.red)
            
            Text("파일 내용")
                .font(.headline)
            
            Text(viewModel.fileContent)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .border(Color.gray, width: 1)
                .padding()
        } // v
        .padding()
        .onAppear{
            if viewModel.checkFileExists(){
                viewModel.loadContent()
            }
        }
        
    }
}
