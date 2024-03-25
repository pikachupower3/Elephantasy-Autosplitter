state("Elephant") {
    double gems : "Elephant.exe", 0x445C40, 0x60, 0x10, 0x190, 0x90;
    double moles: "Elephant.exe", 0x445C40, 0x60, 0x10, 0x190, 0x10;
}

startup {
    refreshRate = 60;

    settings.Add("gems", true, "Gems");
    settings.Add("1_gem", false, "1 Gem Collected", "gems");
    for (int i = 2; i <= 60; i++) {
        settings.Add(i.ToString() + "_gem", false, i.ToString() + " Gem Collected", "gems");
    }

    settings.Add("moles", true, "Moles");
    settings.Add("1_mole", true, "1 Mole Collected", "moles");
    settings.Add("2_mole", true, "2 Mole Collected", "moles");
    settings.Add("3_mole", true, "3 Mole Collected", "moles");
    settings.Add("4_mole", true, "Warp Whistle Collected", "moles");
}

update {

}

split {
    if (settings["gems"]) {
        if (current.gems != old.gems) {
            int gems = (int)current.gems;
            if (settings[gems.ToString() + "_gem"]) {
                return true;
            }
        }
    }
    
    if (settings["moles"]) {
        if (current.moles != old.moles) {
            int moles = (int)current.moles;
            if (settings[moles.ToString() + "_mole"]) {
                return true;
            }
        }
    }

    return false;
}