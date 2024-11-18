#Requires AutoHotkey v2.0

tt := "RimWorld by Ludeon Studios"

WinActivate tt
WinWait tt
WinMaximize
Sleep 500

randomButtonX := 1800
randomButtonY := 250

experienceAreaX1 := 775
experienceAreaY1 := 375
experienceAreaX2 := 1150
experienceAreaY2 := 500

workableAreaX1 := 750
workableAreaY1 := 725
workableAreaY2 := 1150
workableAreaX2 := 950

healthyAreaX1 := 1500
healthyAreaY1 := 350
healthyAreaX2 := 2000
healthyAreaY2 := 650

genderAreaX1 := 775
genderAreaY1 := 275
genderAreaX2 := 825
genderAreaY2 := 325

adultExperienceImage := ".\experience\adult\marine-warrior.png"
juniorExperienceImage := ".\experience\junior\wreck-explorer.png"
healthyImage := ".\basics\healthy.png"
fitForAllWorkImage := ".\basics\fully-workable.png"
genderImage := ".\basics\gender-male.png"

genderCheck := true
adultExperienceCheck := true
juniorExperienceCheck := false
healthyCheck := true
fitForAllWorkCheck := true

loop {
    if (GetKeyState("F1", "P")) {
        MsgBox("手动退出循环！")
        break
    }
    if (!genderCheck or ImageSearch(&outputX, &outputY, genderAreaX1, genderAreaY1, genderAreaX2,
        genderAreaY2,
        genderImage)) {
        if (!adultExperienceCheck or ImageSearch(&outputX, &outputY, experienceAreaX1, experienceAreaY1,
            experienceAreaX2,
            experienceAreaY2,
            adultExperienceImage)) {
            if (!juniorExperienceCheck or ImageSearch(&outputX, &outputY, experienceAreaX1, experienceAreaY1,
                experienceAreaX2, experienceAreaY2,
                juniorExperienceImage)) {
                if (!healthyCheck or ImageSearch(&outputX, &outputY, healthyAreaX1, healthyAreaY1, healthyAreaX2,
                    healthyAreaY2,
                    healthyImage)) {
                    if (!fitForAllWorkCheck or ImageSearch(&outputX, &outputY, workableAreaX1, workableAreaY1,
                        workableAreaX2,
                        workableAreaY2, fitForAllWorkImage)) {
                        SoundBeep(250, 500)
                        MsgBox("满足条件的殖民者已找到！")
                        break
                    }
                }
            }
        }
    }

    Click(randomButtonX, randomButtonY)

    ; 等待一段时间，确保新的属性页面加载完成
    Sleep(40)
}
