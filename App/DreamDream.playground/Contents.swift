// For문을 이용해서 해결 가능한 문제를 최소 5개이상 만들어봅시다.

import UIKit

// 1st
print("\n\n\t\t\t\t1st")
// 구구단 만들기

let numbers = Array(2...9)
let operands = Array(1...9)
for number in numbers {
    for operand in operands{
        let multiply = number*operand
        print (String(number) + " * " + String(operand) + " = " + String(multiply))
    }
}




// 2nd
print("\n\n\t\t\t\t2nd")
// 아파트 출력하기

let housesPerFloor = Array(01...12)
let floors = Array(01...15)
for floor in floors.reversed() {
    if (floor == floors.last) {
        print("\n\n\t", terminator: "")
        for _ in housesPerFloor { print("-------", terminator: "") }
        print("-")
    }
    for house in housesPerFloor {
        var strhouse = String()
        var strfloor = String()
        
        if (house < 10) { strhouse = "0" + String(house) }
        else { strhouse = String(house) }
        if (floor < 10) {strfloor = " " + String(floor) }
        else { strfloor = String(floor) }
        
        if (house == 1) { print("\t| ", terminator: "") }
        print (strfloor + strhouse, terminator: " | ")
    }
    print("\n" + "\t", terminator: "")
    for _ in housesPerFloor { print("-------", terminator: "") }
    print("-")
}




// 3rd
print("\n\n\t\t\t\t3rd")
// 폴더 내부의 파일 출력하기

let files = ["screenshot.png", "screenshot(1).png", "screenshot(2).png", "untitled.txt", "untitled(1).txt", "untitled(2).txt", "untitled(3).txt", "SWstudioAssignment.docx", "SWstudioAssignment_final.docx", "SWstudioAssignment_final.pdf", "SWstudioAssignment_DreamDream.pdf", "SWstudioAssignment_DreamDream_final.pdf"]

var pngFiles = Array<String>()
var txtFiles = Array<String>()
var docxFiles = Array<String>()
var pdfFiles = Array<String>()

for file in files {
    let _nsrange = NSRange(location: 0, length: file.count)
    let _png = try? NSRegularExpression(pattern: ".png$")
    if let _ = _png?.firstMatch(in: file, options: [], range: _nsrange) {
        pngFiles.append(file)
    }
    let _txt = try? NSRegularExpression(pattern: ".txt$")
    if let _ = _txt?.firstMatch(in: file, options: [], range: _nsrange) {
        txtFiles.append(file)
    }
    let _docx = try? NSRegularExpression(pattern: ".docx$")
    if let _ = _docx?.firstMatch(in: file, options: [], range: _nsrange) {
        docxFiles.append(file)
    }
    let _pdf = try? NSRegularExpression(pattern: ".pdf$")
    if let _ = _pdf?.firstMatch(in: file, options: [], range: _nsrange) {
        pdfFiles.append(file)
    }
}
print("\n\n\tpng 파일들")
for file in pngFiles {
    print(file)
}
print("\n\n\ttxt 파일들")
for file in txtFiles {
    print(file)
}
print("\n\n\tdocx 파일들")
for file in docxFiles {
    print(file)
}
print("\n\n\tpdf 파일들")
for file in pdfFiles {
    print(file)
}




// 4th
print("\n\n\t\t\t\t4th")
// for...in loop 를 function에 넣기

let shouldMascotChangeVotes: [Bool] = [true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, true, true, false, true, false, true, true, false, true, false]

func withVotes(votes:Array<Bool>) -> String{
    var cntYes = 0
    var cntNo = 0
    for vote in votes {
        if vote { cntYes += 1 }
        else { cntNo += 1 }
    }
    return "\(cntYes) yes, \(cntNo) no"
}

print("Should we change the mascot?", withVotes(votes: shouldMascotChangeVotes))




// 5th
print("\n\n\t\t\t\t5th")
// Contain method 활용하기

let lyrics_Dynamite = [["[정국]", "Cos ah ah I’m in the stars tonight So watch me bring the fire and set the night alight"], ["[정국]", "Shoes on get up in the morn Cup of milk let’s rock and roll King Kong kick the drum rolling on like a rolling stone Sing song when I’m walking home Jump up to the top LeBron Ding dong call me on my phone Ice tea and a game of ping pong"], ["[RM]", "This is getting heavy Can you hear the bass boom, I’m ready Life is sweet as honey Yeah this beat cha ching like money"], ["[제이홉]", "Disco overload I’m into that I’m good to go I'm diamond you know I glow up"], ["[RM]", "Hey, so let’s go"], ["[정국]", "Cos ah ah I’m in the stars tonight So watch me bring the fire and set the night alight"], ["[지민]", "Shining through the city with a little funk and soul So I’mma light it up like dynamite, woah"], ["[뷔]", "Bring a friend join the crowd Whoever wanna come along Word up talk the talk just move like we off the wall Day or night the sky’s alight So we dance to the break of dawn"], ["[RM]", "Ladies and gentlemen, I got the medicine so you should keep ya eyes on the ball"], ["[정국]", "huh"], ["[슈가]", "This is getting heavy Can you hear the bass boom, I’m ready Life is sweet as honey Yeah this beat cha ching like money"], ["[지민]", "Disco overload I’m into that I’m good to go I'm diamond you know I glow up"], ["[RM]", "Let’s go"], ["[정국]", "Cos ah ah I’m in the stars tonight So watch me bring the fire and set the night alight"], ["[뷔]", "Shining through the city with a little funk and soul So I’mma light it up like dynamite, woah"], ["[지민]", "Dynnnnnanana"], ["[정국]", "life is dynamite"], ["[지민]", "Dynnnnnanana"], ["[정국]", "life is dynamite"], ["[진]", "Shining through the city with a little funk and soul So I’mma light it up like dynamite, woah"], ["[정국]", "Dynnnnnanana eh Dynnnnnanana eh"], ["[지민]" ,"Dynnnnnanana eh Light it up like dynamite"], ["[정국]", "Dynnnnnanana eh Dynnnnnanana eh"], ["[뷔]", "Dynnnnnanana eh"], ["[진]", "Light it up like dynamite"], ["[지민]", "Cos ah ah I’m in the stars tonight So watch me bring the fire and set the night alight"], ["[정국]", "Shining through the city with a little funk and soul So I’mma light it up like dynamite"], ["[지민]", "Cos ah ah I’m in the stars tonight So watch me bring the fire and set the night alight"], ["[진]", "Shining through the city with a little funk and soul So I’mma light it up like dynamite, woah"], ["[지민]", "Dynnnnnanana, life is dynamite Dynnnnnanana, life is dynamite"], ["[뷔]", "Shining through the city with a little funk and soul So I’mma light it up like dynamite, woah"]]

for lyricsLine in lyrics_Dynamite {
    if lyricsLine.contains("[뷔]") {
        print(lyricsLine[0] + " " + lyricsLine[1])
    }
}
