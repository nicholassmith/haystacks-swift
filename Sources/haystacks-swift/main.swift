import Foundation
import Utility

let arguments = Array(ProcessInfo.processInfo.arguments.dropFirst())

let parser = ArgumentParser(usage: "--needles --haystacks", overview: "This is what this tool is for")

let needlesFile: OptionArgument<String> = parser.add(option: "--needles", kind: String.self)

let parsedArguments = try parser.parse(arguments)

let needlesData = try String(contentsOfFile: parsedArguments.get(needlesFile)!)
var needlesArray = Set(needlesData.components(separatedBy: "\n"))


print("running hay")

while let line: String = readLine() {
    if needlesArray.contains(line) {
        needlesArray.remove(line)
        print(line)
    }
}


