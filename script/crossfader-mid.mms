@scriptname="Madrix Crossfader";
@author="Kasper @ Rapenburg Plaza";
@version="1.0";
@description="Sets and keeps crossfader at 0";

//variables
int debug = 0; //set to 1 for monitoring script

//initial load
void InitEffect() {
    SetFadeType(1);
    SetFadeValue(127);
    if (debug == 1) {
        Log("Fader Script loaded, initial values active");
    }
}

//keep the fader centered on change
void PreRenderEffect() {
    if (GetFadeValue() != 127) {
        SetFadeValue(127);
        if (debug == 1) {
            Log("Script forced fader to be at 0");
        }
    }
    
    if (GetFadeType() != 1) {
        SetFadeType(1);  
        if (debug == 1) {
            Log("Script forced fader to WF-mode");  
        }
    }
}

void Log(string msg) {
    WriteText(msg);
}

void PostRenderEffect() {}

//call initial load
void MatrixSizeChanged() {
    InitEffect();
}