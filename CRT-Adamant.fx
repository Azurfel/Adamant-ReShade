#include "ReShade.fxh"

//#pragma format A2B10G10R10_UNORM_PACK32

uniform float HCRT_HDR                             <ui_category = "Your Display's Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 1.0;  ui_label = "SDR | HDR";> = 1.0;
uniform float HCRT_LCD_RESOLUTION                  <ui_category = "Your Display's Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 2.0;     ui_step = 1.0;  ui_label = "Display's Resolution: 1080p | 4K | 8K";> = 1.0;
uniform float HCRT_LCD_SUBPIXEL                    <ui_category = "Your Display's Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 2.0;     ui_step = 1.0;  ui_label = "Display's Subpixel Layout: RGB | RWBG (OLED) | BGR";> = 0.0;

uniform float HCRT_MAX_NITS                        <ui_category = "HDR Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 10000.0; ui_step = 10.0; ui_label = "HDR: Display's Peak Luminance";> = 1000.0;
uniform float HCRT_PAPER_WHITE_NITS                <ui_category = "HDR Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 10000.0; ui_step = 10.0; ui_label = "HDR: Display's Paper White Luminance";> = 200.0;
uniform float HCRT_CONTENT_GAMUT                   <ui_category = "HDR Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 27.0;     ui_step = 1.0;  ui_label = "HDR: Content Color Gamut";> = 17.0;

uniform float gamutsupport1                        <ui_category = "Content Color Gamut Key"; ui_type = "drag"; ui_min = 0.0; ui_max = 0.0;    ui_step = 0.0;  ui_label = "0:CBS1951 | 1:1953 | 2:1953RP | 3:1961RP | 4:1964";> = 0.0;
uniform float gamutsupport2                        <ui_category = "Content Color Gamut Key"; ui_type = "drag"; ui_min = 0.0; ui_max = 0.0;    ui_step = 0.0;  ui_label = "5:PAL | 6:Rec601 | 7:P22-J | 8:1970sRP";> = 0.0;
uniform float gamutsupport3                        <ui_category = "Content Color Gamut Key"; ui_type = "drag"; ui_min = 0.0; ui_max = 0.0;    ui_step = 0.0;  ui_label = "9:1980sRP | 10:AppleRGB | 11:PhilipsPC | 12:P22-80";> = 0.0;
uniform float gamutsupport4                        <ui_category = "Content Color Gamut Key"; ui_type = "drag"; ui_min = 0.0; ui_max = 0.0;    ui_step = 0.0;  ui_label = "13:P22-90 | 14:RPTV | 15:GBA | 16:PSP | 17:Rec709";> = 0.0;
uniform float gamutsupport5                        <ui_category = "Content Color Gamut Key"; ui_type = "drag"; ui_min = 0.0; ui_max = 0.0;    ui_step = 0.0;  ui_label = "18:AdobeRGB | 19:DSLite | 20:OldiPhone | 21:PSP3K(PH)";> = 0.0;
uniform float gamutsupport6                        <ui_category = "Content Color Gamut Key"; ui_type = "drag"; ui_min = 0.0; ui_max = 0.0;    ui_step = 0.0;  ui_label = "22:DisplayP3 | 23:AMOLED | 24:PSV(PH) | 25:PSV2K(PH)";> = 0.0;
uniform float gamutsupport7                        <ui_category = "Content Color Gamut Key"; ui_type = "drag"; ui_min = 0.0; ui_max = 0.0;    ui_step = 0.0;  ui_label = "26:Ex709 | 27:Rec2020";> = 0.0;

uniform float HCRT_CRT_SCREEN_TYPE                 <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 2.0;     ui_step = 1.0;  ui_label = "Screen Type: APERTURE GRILLE | SHADOW MASK | SLOT MASK";> = 0.0;
uniform float HCRT_CRT_RESOLUTION                  <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 3.0;     ui_step = 1.0;  ui_label = "Resolution: 300TVL | 600TVL | 800TVL | 1000TVL";> = 1.0;
uniform float HCRT_DOWNSAMPLE                      <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 1.0;  ui_label = "Downsample: Point | Box";> = 1.0;
uniform float HCRT_WHITE_TEMPERATURE_D65           <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 18500.0; ui_step = 100.0; ui_label = "D65 White Temperature (Kelvin)";> = 6504.0;
uniform float HCRT_WHITE_TEMPERATURE_D93           <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 18500.0; ui_step = 100.0; ui_label = "D93 White Temperature (Kelvin)";> = 9305.0;
uniform float HCRT_BRIGHTNESS                      <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = -1.0; ui_max = 1.0;    ui_step = 0.01;  ui_label = "Brightness";> = 0.0;
uniform float HCRT_CONTRAST                        <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = -1.0; ui_max = 1.0;    ui_step = 0.01;  ui_label = "Contrast";> = 0.0;
uniform float HCRT_SATURATION                      <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = -1.0; ui_max = 1.0;    ui_step = 0.01;  ui_label = "Saturation";> = 0.0;
uniform float HCRT_GAMMA_IN                        <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = 1.0;  ui_max = 5.0;    ui_step = 0.01;  ui_label = "Gamma";> = 2.22;
uniform float HCRT_GAMMA_CUTOFF                    <ui_category = "CRT Settings"; ui_type = "drag"; ui_min = 0.0;  ui_max = 100.0;  ui_step = 1.0;   ui_label = "Inverse Gamma Cutoff (x1000)";> = 1.0;

uniform float HCRT_V_SIZE                          <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Vertical Size";> = 1.0;
uniform float HCRT_V_CENT                          <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = -200.0; ui_max = 200.0;ui_step = 1.0;   ui_label = "Vertical Center";> = 0.0;
uniform float HCRT_RED_VERTICAL_CONVERGENCE        <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = -10.0 ; ui_max = 10.0; ui_step = 0.01;  ui_label = "Red Vertical Deconvergence";> = -0.14;
uniform float HCRT_GREEN_VERTICAL_CONVERGENCE      <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = -10.0 ; ui_max = 10.0; ui_step = 0.01;  ui_label = "Green Vertical Deconvergence";> = 0.0;
uniform float HCRT_BLUE_VERTICAL_CONVERGENCE       <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = -10.0 ; ui_max = 10.0; ui_step = 0.01;  ui_label = "Blue Vertical Deconvergence";> = 0.0;
uniform float HCRT_RED_SCANLINE_MIN                <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Red Scanline Min";> = 0.55;
uniform float HCRT_RED_SCANLINE_MAX                <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Red Scanline Max";> = 0.82;
uniform float HCRT_RED_SCANLINE_ATTACK             <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Red Scanline Attack";> = 0.65;
uniform float HCRT_GREEN_SCANLINE_MIN              <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Green Scanline Min";> = 0.55;
uniform float HCRT_GREEN_SCANLINE_MAX              <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Green Scanline Max";> = 0.90;
uniform float HCRT_GREEN_SCANLINE_ATTACK           <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Green Scanline Attack";> = 0.13;
uniform float HCRT_BLUE_SCANLINE_MIN               <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Blue Scanline Min";> = 0.72;
uniform float HCRT_BLUE_SCANLINE_MAX               <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Blue Scanline Max";> = 1.0;
uniform float HCRT_BLUE_SCANLINE_ATTACK            <ui_category = "Vertical Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Blue Scanline Attack";> = 0.65;

uniform float HCRT_H_SIZE                          <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 0.01;  ui_label = "Horizontal Size";> = 1.0;
uniform float HCRT_H_CENT                          <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = -200.0; ui_max = 200.0;ui_step = 1.0;   ui_label = "Horizontal Center";> = 0.0;
uniform float HCRT_RED_HORIZONTAL_CONVERGENCE      <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = -10.0 ; ui_max = 10.0; ui_step = 0.01;  ui_label = "Red Horizontal Deconvergence";> = 0.0;
uniform float HCRT_GREEN_HORIZONTAL_CONVERGENCE    <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = -10.0 ; ui_max = 10.0; ui_step = 0.01;  ui_label = "Green Horizontal Deconvergence";> = 0.0;
uniform float HCRT_BLUE_HORIZONTAL_CONVERGENCE     <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = -10.0 ; ui_max = 10.0; ui_step = 0.01;  ui_label = "Blue Horizontal Deconvergence";> = 0.0;
uniform float HCRT_RED_BEAM_SHARPNESS              <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 5.0;     ui_step = 0.05;  ui_label = "Red Beam Sharpness";> = 1.75;
uniform float HCRT_RED_BEAM_ATTACK                 <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 2.0;     ui_step = 0.01;  ui_label = "Red Beam Attack";> = 0.72;
uniform float HCRT_GREEN_BEAM_SHARPNESS            <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 5.0;     ui_step = 0.05;  ui_label = "Green Beam Sharpness";> = 1.60;
uniform float HCRT_GREEN_BEAM_ATTACK               <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 2.0;     ui_step = 0.01;  ui_label = "Green Beam Attack";> = 0.80;
uniform float HCRT_BLUE_BEAM_SHARPNESS             <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 5.0;     ui_step = 0.05;  ui_label = "Blue Beam Sharpness";> = 1.90;
uniform float HCRT_BLUE_BEAM_ATTACK                <ui_category = "Horizontal Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 2.0;     ui_step = 0.01;  ui_label = "Blue Beam Attack";> = 0.45;

uniform float HCRT_COLOUR_ACCURATE                 <ui_category = "Legacy/Support Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 1.0;     ui_step = 1.0;  ui_label = "Mask Accurate/Colour Accurate";> = 1.0;
uniform float HCRT_CRT_COLOUR_SYSTEM               <ui_category = "Legacy/Support Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 3.0;     ui_step = 1.0;  ui_label = "Colour System: r709 | PAL | NTSC-U | NTSC-J";> = 0.0;
uniform float HCRT_CRT_PHOSPHOR_SET                <ui_category = "Legacy/Support Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 5.0;     ui_step = 1.0;  ui_label = "Phosphors: NONE | P22-J | P22-80 | P22-90 | RPTV | 1953";> = 0.0;
uniform float HCRT_PIN_PHASE                       <ui_category = "Legacy/Support Settings"; ui_type = "drag"; ui_min = -0.2; ui_max = 0.2;    ui_step = 0.01;  ui_label = "Pin Phase";> = 0.0;
uniform float HCRT_PIN_AMP                         <ui_category = "Legacy/Support Settings"; ui_type = "drag"; ui_min = -0.2; ui_max = 0.2;    ui_step = 0.01;  ui_label = "Pin Amp";> = 0.0;

uniform float HCRT_OUTPUT_COLOUR_SPACE             <ui_category = "SDR Mode Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 2.0;     ui_step = 1.0;  ui_label = "SDR: Display's Colour Space: r709 | sRGB | DCI-P3";> = 1.0;
uniform float HCRT_R709_GAMMA_OUT                  <ui_category = "SDR Mode Settings"; ui_type = "drag"; ui_min = 1.0; ui_max = 5.0;     ui_step = 0.01; ui_label = "SDR: r709 Gamma";> = 2.22;
uniform float HCRT_SRGB_GAMMA_OUT                  <ui_category = "SDR Mode Settings"; ui_type = "drag"; ui_min = 1.0; ui_max = 5.0;     ui_step = 0.01; ui_label = "SDR: sRGB Gamma";> = 2.4;
uniform float HCRT_P3_GAMMA_OUT                    <ui_category = "SDR Mode Settings"; ui_type = "drag"; ui_min = 1.0; ui_max = 5.0;     ui_step = 0.01; ui_label = "SDR: DCI-P3 Gamma";> = 2.6;
uniform float HCRT_R709_GAMMA_CUTOFF               <ui_category = "SDR Mode Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 100.0;   ui_step = 1.0;  ui_label = "SDR: r709 Gamma Cutoff (x1000)";> = 1.0;
uniform float HCRT_SRGB_GAMMA_CUTOFF               <ui_category = "SDR Mode Settings"; ui_type = "drag"; ui_min = 0.0; ui_max = 100.0;   ui_step = 1.0;  ui_label = "SDR: sRGB Gamma Cutoff (x1000)";> = 1.0;


#define COMPAT_TEXTURE(c, d) tex2D(c, d)

#ifndef CRT_WIDTH
#define CRT_WIDTH    BUFFER_WIDTH
#endif

#ifndef CRT_HEIGHT
#define CRT_HEIGHT   480.0f
#endif

texture SourceTexture { Width = CRT_WIDTH; Height = CRT_HEIGHT; Format = RGBA8; };
sampler Source {Texture = SourceTexture; MagFilter = POINT; MinFilter = POINT; MipFilter = POINT; };

texture SDRTexture { Width = CRT_WIDTH; Height = CRT_HEIGHT; Format = RGBA16F; };
sampler SourceSDR {Texture = SDRTexture; MagFilter = POINT; MinFilter = POINT; MipFilter = POINT; };

texture HDRTexture { Width = CRT_WIDTH; Height = CRT_HEIGHT; Format = RGBA16F; };
sampler SourceHDR {Texture = HDRTexture; MagFilter = POINT; MinFilter = POINT; MipFilter = POINT; };


#define kChannelMask          3
#define kFirstChannelShift    2
#define kSecondChannelShift   4
#define kThirdChannelShift    6

#define kRedId   0
#define kGreenId 1
#define kBlueId  2

#define kRed     (1 | (kRedId << kFirstChannelShift))
#define kGreen   (1 | (kGreenId << kFirstChannelShift))
#define kBlue    (1 | (kBlueId << kFirstChannelShift))
#define kMagenta (2 | (kRedId << kFirstChannelShift) | (kBlueId << kSecondChannelShift))
#define kYellow  (2 | (kRedId << kFirstChannelShift) | (kGreenId << kSecondChannelShift))
#define kCyan    (2 | (kGreenId << kFirstChannelShift) | (kBlueId << kSecondChannelShift))
#define kWhite   (3 | (kRedId << kFirstChannelShift) | (kGreenId << kSecondChannelShift) | (kBlueId << kThirdChannelShift))
#define kBlack   0

#define kRedChannel     float3(1.0, 0.0, 0.0)
#define kGreenChannel   float3(0.0, 1.0, 0.0)
#define kBlueChannel    float3(0.0, 0.0, 1.0)

static const float3 kColourMask[3] = { kRedChannel, kGreenChannel, kBlueChannel };

#define kApertureGrille    0
#define kShadowMask        1
#define kSlotMask          2
#define kBlackWhiteMask    3

#define kBGRAxis           3
#define kTVLAxis           4
#define kResolutionAxis    3

// APERTURE GRILLE MASKS

static const float kApertureGrilleMaskSize[kResolutionAxis * kTVLAxis] = { 
     4.0f, 2.0f, 1.0f, 1.0f ,      // 1080p:   300 TVL, 600 TVL, 800 TVL, 1000 TVL 
     7.0f, 4.0f, 3.0f, 2.0f ,      // 4K:      300 TVL, 600 TVL, 800 TVL, 1000 TVL   
    13.0f, 7.0f, 5.0f, 4.0f   };   // 8K:      300 TVL, 600 TVL, 800 TVL, 1000 TVL


// 1080p 

// 300TVL
#define kMaxApertureGrilleSize       4

#define kRGBX             kRed, kGreen, kBlue, kBlack  
#define kRBGX             kRed, kBlue, kGreen, kBlack  
#define kBGRX             kBlue, kGreen, kRed, kBlack  

static const uint kApertureGrilleMasks1080p300TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{
   kRGBX, kRBGX, kBGRX
};

#undef kMaxApertureGrilleSize

#undef kRGBX           
#undef kRBGX           
#undef kBGRX  

// 600TVL
#define kMaxApertureGrilleSize       2

#define kMG               kMagenta, kGreen  
#define kYB               kYellow, kBlue  
#define kGM               kGreen, kMagenta  

static const uint kApertureGrilleMasks1080p600TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{
   kMG, kYB, kGM
};

#undef kMaxApertureGrilleSize

#undef kMG             
#undef kYB             
#undef kGM             

// 800TVL
#define kMaxApertureGrilleSize       1

#define kW                kWhite  

static const uint kApertureGrilleMasks1080p800TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{
   kW, kW, kW
};

// 1000TVL
static const uint kApertureGrilleMasks1080p1000TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{
   kW, kW, kW
};

#undef kMaxApertureGrilleSize   

#undef kW              


// 4K 

// 300TVL
#define kMaxApertureGrilleSize       7

#define kRRGGBBX          kRed, kRed, kGreen, kGreen, kBlue, kBlue, kBlack  
#define kRRBBGGX          kRed, kRed, kBlue, kBlue, kGreen, kGreen, kBlack  
#define kBBGGRRX          kBlue, kBlue, kGreen, kGreen, kRed, kRed, kBlack  

static const uint kApertureGrilleMasks4K300TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{ 
   kRRGGBBX, kRRBBGGX, kBBGGRRX
};

#undef kMaxApertureGrilleSize 

#undef kRRGGBBX        
#undef kRRBBGGX       
#undef kBBGGRRX  

// 600TVL
#define kMaxApertureGrilleSize       4

#define kRGBX             kRed, kGreen, kBlue, kBlack  
#define kRBGX             kRed, kBlue, kGreen, kBlack  
#define kBGRX             kBlue, kGreen, kRed, kBlack  

static const uint kApertureGrilleMasks4K600TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{ 
   kRGBX, kRBGX, kBGRX 
};

#undef kMaxApertureGrilleSize 

#undef kRGBX           
#undef kRBGX           
#undef kBGRX             

// 800TVL
#define kMaxApertureGrilleSize       3

#define kRGB              kRed, kGreen, kBlue  
#define kGBR              kGreen, kBlue, kRed  
#define kBGR              kBlue, kGreen, kRed  

static const uint kApertureGrilleMasks4K800TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{ 
   kBGR, kGBR, kRGB 
};

#undef kMaxApertureGrilleSize 

#undef kRGB            
#undef kGBR            
#undef kBGR            

// 1000TVL
#define kMaxApertureGrilleSize       2

#define kMG               kMagenta, kGreen  
#define kYB               kYellow, kBlue  
#define kGM               kGreen, kMagenta  

static const uint kApertureGrilleMasks4K1000TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{ 
   kMG, kYB, kGM
};

#undef kMaxApertureGrilleSize  

#undef kMG             
#undef kYB             
#undef kGM             


// 8K 

// 300 TVL
#define kMaxApertureGrilleSize       13

#define kRRRRGGGGBBBBX    kRed, kRed, kRed, kRed, kGreen, kGreen, kGreen, kGreen, kBlue, kBlue, kBlue, kBlue, kBlack  
#define kRRRRBBBBGGGGX    kRed, kRed, kRed, kRed, kBlue, kBlue, kBlue, kBlue, kGreen, kGreen, kGreen, kGreen, kBlack  
#define kBBBBGGGGRRRRX    kBlue, kBlue, kBlue, kBlue, kGreen, kGreen, kGreen, kGreen, kRed, kRed, kRed, kRed, kBlack  

static const uint kApertureGrilleMasks8K300TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{ 
   kRRRRGGGGBBBBX, kRRRRBBBBGGGGX, kBBBBGGGGRRRRX
};

#undef kMaxApertureGrilleSize 

#undef kRRRRGGGGBBBBX  
#undef kRRRRBBBBGGGGX  
#undef kBBBBGGGGRRRRX  

// 600 TVL
#define kMaxApertureGrilleSize       7

#define kRRGGBBX          kRed, kRed, kGreen, kGreen, kBlue, kBlue, kBlack  
#define kRRBBGGX          kRed, kRed, kBlue, kBlue, kGreen, kGreen, kBlack  
#define kBBGGRRX          kBlue, kBlue, kGreen, kGreen, kRed, kRed, kBlack  

static const uint kApertureGrilleMasks8K600TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{ 
   kRRGGBBX, kRRBBGGX, kBBGGRRX 
};

#undef kMaxApertureGrilleSize 

#undef kRRGGBBX        
#undef kRRBBGGX       
#undef kBBGGRRX        

// 800 TVL
#define kMaxApertureGrilleSize       5

#define kRYCBX            kRed, kYellow, kCyan, kBlue, kBlack  
#define kRMCGX            kRed, kMagenta, kCyan, kGreen, kBlack  
#define kBCYRX            kBlue, kCyan, kYellow, kRed, kBlack  

static const uint kApertureGrilleMasks8K800TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{ 
   kRYCBX, kRMCGX, kBCYRX
};

#undef kMaxApertureGrilleSize 

#undef kRYCBX          
#undef kRMCGX          
#undef kBCYRX          

// 1000 TVL
#define kMaxApertureGrilleSize       4

#define kRGBX             kRed, kGreen, kBlue, kBlack  
#define kRBGX             kRed, kBlue, kGreen, kBlack  
#define kBGRX             kBlue, kGreen, kRed, kBlack  

static const uint kApertureGrilleMasks8K1000TVL[kBGRAxis * kMaxApertureGrilleSize] = 
{ 
   kRGBX, kRBGX, kBGRX 
};

#undef kMaxApertureGrilleSize  

#undef kRGBX           
#undef kRBGX           
#undef kBGRX            


// SHADOW MASKS

static const float kShadowMaskSizeX[kResolutionAxis * kTVLAxis] = {   6.0f, 2.0f, 1.0f, 1.0f  ,   12.0f, 6.0f, 2.0f, 2.0f  ,   12.0f, 12.0f, 6.0f, 6.0f   }; 
static const float kShadowMaskSizeY[kResolutionAxis * kTVLAxis] = {   4.0f, 2.0f, 1.0f, 1.0f  ,    8.0f, 4.0f, 2.0f, 2.0f  ,    8.0f,  8.0f, 4.0f, 4.0f   }; 


// 1080p 


#define kXXXX                kBlack, kBlack, kBlack, kBlack, kBlack, kBlack  

// 300 TVL
#define kMaxShadowMaskSizeX     6
#define kMaxShadowMaskSizeY     4

#define kGRRBBG              kGreen, kRed, kRed, kBlue, kBlue, kGreen  
#define kBBGGRR              kBlue, kBlue, kGreen, kGreen, kRed, kRed  

#define kBRRGGB              kBlue, kRed, kRed, kGreen, kGreen, kBlue  
#define kGGBBRR              kGreen, kGreen, kBlue, kBlue, kRed, kRed  

#define kGBBRRG              kGreen, kBlue, kBlue, kRed, kRed, kGreen  
#define kRRGGBB              kRed, kRed, kGreen, kGreen, kBlue, kBlue  

#define kGRRBBG_GRRBBG_BBGGRR_BBGGRR    kGRRBBG, kGRRBBG, kBBGGRR, kBBGGRR  
#define kBRRGGB_BRRGGB_GGBBRR_GGBBRR    kBRRGGB, kBRRGGB, kGGBBRR, kGGBBRR  
#define kGBBRRG_GBBRRG_RRGGBB_RRGGBB    kGBBRRG, kGBBRRG, kRRGGBB, kRRGGBB  

static const uint kShadowMasks1080p300TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kGRRBBG_GRRBBG_BBGGRR_BBGGRR, kBRRGGB_BRRGGB_GGBBRR_GGBBRR, kGBBRRG_GBBRRG_RRGGBB_RRGGBB        // 300 TVL
};

#undef kMaxShadowMaskSizeX 
#undef kMaxShadowMaskSizeY 

#undef kGRRBBG           
#undef kBBGGRR       
    
#undef kBRRGGB            
#undef kGGBBRR       

#undef kGBBRRG            
#undef kRRGGBB            

#undef kGRRBBG_GRRBBG_BBGGRR_BBGGRR  
#undef kBRRGGB_BRRGGB_GGBBRR_GGBBRR  
#undef kGBBRRG_GBBRRG_RRGGBB_RRGGBB 


// 600 TVL
#define kMaxShadowMaskSizeX     2
#define kMaxShadowMaskSizeY     2

#define kMG                  kMagenta, kGreen  
#define kGM                  kGreen, kMagenta  

#define kYB                  kYellow, kBlue  
#define kBY                  kBlue, kYellow  

#define kMG_GM               kMG, kGM  
#define kYB_BY               kYB, kBY  
#define kGM_MG               kGM, kMG  

static const uint kShadowMasks1080p600TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kMG_GM, kYB_BY, kGM_MG                                                                          // 600 TVL
};

#undef kMaxShadowMaskSizeX 
#undef kMaxShadowMaskSizeY 

#undef kMG               
#undef kGM    

#undef kYB                
#undef kBY           

#undef kMG_GM             
#undef kYB_BY             
#undef kGM_MG             

// 800 TVL
#define kMaxShadowMaskSizeX     1
#define kMaxShadowMaskSizeY     1

#define kW                   kWhite  
#define kW_W                 kW  

static const uint kShadowMasks1080p800TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kW_W, kW_W, kW_W                                                                                // 800 TVL
};

// 1000 TVL
static const uint kShadowMasks1080p1000TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kW_W, kW_W, kW_W                                                                                // 1000 TVL
};

#undef kMaxShadowMaskSizeX 
#undef kMaxShadowMaskSizeY 

#undef kW       
#undef kW_W


// 4K

// 300 TVL

#define kMaxShadowMaskSizeX     12
#define kMaxShadowMaskSizeY     8

#define kGGRRRRBBBBGG        kGreen, kGreen, kRed, kRed, kRed, kRed, kBlue, kBlue, kBlue, kBlue, kGreen, kGreen  
#define kBBBBGGGGRRRR        kBlue, kBlue, kBlue, kBlue, kGreen, kGreen, kGreen, kGreen, kRed, kRed, kRed, kRed  

#define kBBRRRRGGGGBB        kBlue, kBlue, kRed, kRed, kRed, kRed, kGreen, kGreen, kGreen, kGreen, kBlue, kBlue  
#define kGGGGBBBBRRRR        kGreen, kGreen, kGreen, kGreen, kBlue, kBlue, kBlue, kBlue, kRed, kRed, kRed, kRed  

#define kGGBBBBRRRRGG        kGreen, kGreen, kBlue, kBlue, kBlue, kBlue, kRed, kRed, kRed, kRed, kGreen, kGreen  
#define kRRRRGGGGBBBB        kRed, kRed, kRed, kRed, kGreen, kGreen, kGreen, kGreen, kBlue, kBlue, kBlue, kBlue  

#define kGGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR    kGGRRRRBBBBGG, kGGRRRRBBBBGG, kGGRRRRBBBBGG, kGGRRRRBBBBGG, kBBBBGGGGRRRR, kBBBBGGGGRRRR, kBBBBGGGGRRRR, kBBBBGGGGRRRR  
#define kBBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR    kBBRRRRGGGGBB, kBBRRRRGGGGBB, kBBRRRRGGGGBB, kBBRRRRGGGGBB, kGGGGBBBBRRRR, kGGGGBBBBRRRR, kGGGGBBBBRRRR, kGGGGBBBBRRRR  
#define kGGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB    kGGBBBBRRRRGG, kGGBBBBRRRRGG, kGGBBBBRRRRGG, kGGBBBBRRRRGG, kRRRRGGGGBBBB, kRRRRGGGGBBBB, kRRRRGGGGBBBB, kRRRRGGGGBBBB  

static const uint kShadowMasks4K300TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kGGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR, 
   kBBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR,
   kGGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB                                                                                         
};

#undef kMaxShadowMaskSizeX 
#undef kMaxShadowMaskSizeY 

#undef kGGRRRRBBBBGG      
#undef kBBBBGGGGRRRR   

#undef kBBRRRRGGGGBB     
#undef kGGGGBBBBRRRR    

#undef kGGBBBBRRRRGG      
#undef kRRRRGGGGBBBB      

#undef kGGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR  
#undef kBBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR  
#undef kGGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB  


// 600 TVL

#define kMaxShadowMaskSizeX     6
#define kMaxShadowMaskSizeY     4

#define kGRRBBG              kGreen, kRed, kRed, kBlue, kBlue, kGreen  
#define kBBGGRR              kBlue, kBlue, kGreen, kGreen, kRed, kRed  

#define kBRRGGB              kBlue, kRed, kRed, kGreen, kGreen, kBlue  
#define kGGBBRR              kGreen, kGreen, kBlue, kBlue, kRed, kRed  

#define kGBBRRG              kGreen, kBlue, kBlue, kRed, kRed, kGreen  
#define kRRGGBB              kRed, kRed, kGreen, kGreen, kBlue, kBlue  

#define kGRRBBG_GRRBBG_BBGGRR_BBGGRR    kGRRBBG, kGRRBBG, kBBGGRR, kBBGGRR  
#define kBRRGGB_BRRGGB_GGBBRR_GGBBRR    kBRRGGB, kBRRGGB, kGGBBRR, kGGBBRR  
#define kGBBRRG_GBBRRG_RRGGBB_RRGGBB    kGBBRRG, kGBBRRG, kRRGGBB, kRRGGBB  

static const uint kShadowMasks4K600TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kGRRBBG_GRRBBG_BBGGRR_BBGGRR, kBRRGGB_BRRGGB_GGBBRR_GGBBRR, kGBBRRG_GBBRRG_RRGGBB_RRGGBB
};

#undef kGRRBBG_GRRBBG_BBGGRR_BBGGRR  
#undef kBRRGGB_BRRGGB_GGBBRR_GGBBRR  
#undef kGBBRRG_GBBRRG_RRGGBB_RRGGBB 

#undef kMaxShadowMaskSizeX 
#undef kMaxShadowMaskSizeY 

#undef kGRRBBG           
#undef kBBGGRR    

#undef kBRRGGB            
#undef kGGBBRR      

#undef kGBBRRG            
#undef kRRGGBB         


// 800 TVL

#define kMaxShadowMaskSizeX     2
#define kMaxShadowMaskSizeY     2

#define kMG                  kMagenta, kGreen  
#define kGM                  kGreen, kMagenta  

#define kYB                  kYellow, kBlue  
#define kBY                  kBlue, kYellow  

#define kMG_GM               kMG, kGM  
#define kYB_BY               kYB, kBY  
#define kGM_MG               kGM, kMG  

static const uint kShadowMasks4K800TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kMG_GM, kYB_BY, kGM_MG
};

// 1000 TVL
static const uint kShadowMasks4K1000TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kMG_GM, kYB_BY, kGM_MG
};

#undef kMaxShadowMaskSizeX 
#undef kMaxShadowMaskSizeY 

#undef kXXXX     

#undef kMG               
#undef kGM    

#undef kYB                
#undef kBY         

#undef kMG_GM             
#undef kYB_BY             
#undef kGM_MG         


// 8K 

// 300 TVL
#define kMaxShadowMaskSizeX     12
#define kMaxShadowMaskSizeY     8

#define kGGRRRRBBBBGG        kGreen, kGreen, kRed, kRed, kRed, kRed, kBlue, kBlue, kBlue, kBlue, kGreen, kGreen  
#define kBBBBGGGGRRRR        kBlue, kBlue, kBlue, kBlue, kGreen, kGreen, kGreen, kGreen, kRed, kRed, kRed, kRed  

#define kBBRRRRGGGGBB        kBlue, kBlue, kRed, kRed, kRed, kRed, kGreen, kGreen, kGreen, kGreen, kBlue, kBlue  
#define kGGGGBBBBRRRR        kGreen, kGreen, kGreen, kGreen, kBlue, kBlue, kBlue, kBlue, kRed, kRed, kRed, kRed  

#define kGGBBBBRRRRGG        kGreen, kGreen, kBlue, kBlue, kBlue, kBlue, kRed, kRed, kRed, kRed, kGreen, kGreen  
#define kRRRRGGGGBBBB        kRed, kRed, kRed, kRed, kGreen, kGreen, kGreen, kGreen, kBlue, kBlue, kBlue, kBlue  

#define kGGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR    kGGRRRRBBBBGG, kGGRRRRBBBBGG, kGGRRRRBBBBGG, kGGRRRRBBBBGG, kBBBBGGGGRRRR, kBBBBGGGGRRRR, kBBBBGGGGRRRR, kBBBBGGGGRRRR  
#define kBBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR    kBBRRRRGGGGBB, kBBRRRRGGGGBB, kBBRRRRGGGGBB, kBBRRRRGGGGBB, kGGGGBBBBRRRR, kGGGGBBBBRRRR, kGGGGBBBBRRRR, kGGGGBBBBRRRR  
#define kGGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB    kGGBBBBRRRRGG, kGGBBBBRRRRGG, kGGBBBBRRRRGG, kGGBBBBRRRRGG, kRRRRGGGGBBBB, kRRRRGGGGBBBB, kRRRRGGGGBBBB, kRRRRGGGGBBBB  

static const uint kShadowMasks8K300TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kGGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR,
   kBBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR,
   kGGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB                    
};

// 600 TVL
static const uint kShadowMasks8K600TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kGGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR, 
   kBBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR,
   kGGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB
};

#undef kMaxShadowMaskSizeX 
#undef kMaxShadowMaskSizeY 

#undef kGGRRRRBBBBGG      
#undef kBBBBGGGGRRRR      

#undef kBBRRRRGGGGBB     
#undef kGGGGBBBBRRRR      

#undef kGGBBBBRRRRGG      
#undef kRRRRGGGGBBBB      

#undef kGGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_GGRRRRBBBBGG_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR_BBBBGGGGRRRR  
#undef kBBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_BBRRRRGGGGBB_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR_GGGGBBBBRRRR  
#undef kGGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_GGBBBBRRRRGG_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB_RRRRGGGGBBBB  

// 800 TVL
#define kMaxShadowMaskSizeX     6
#define kMaxShadowMaskSizeY     4

#define kGRRBBG              kGreen, kRed, kRed, kBlue, kBlue, kGreen  
#define kBBGGRR              kBlue, kBlue, kGreen, kGreen, kRed, kRed  

#define kBRRGGB              kBlue, kRed, kRed, kGreen, kGreen, kBlue  
#define kGGBBRR              kGreen, kGreen, kBlue, kBlue, kRed, kRed  

#define kGBBRRG              kGreen, kBlue, kBlue, kRed, kRed, kGreen  
#define kRRGGBB              kRed, kRed, kGreen, kGreen, kBlue, kBlue  

#define kGRRBBG_GRRBBG_BBGGRR_BBGGRR    kGRRBBG, kGRRBBG, kBBGGRR, kBBGGRR  
#define kBRRGGB_BRRGGB_GGBBRR_GGBBRR    kBRRGGB, kBRRGGB, kGGBBRR, kGGBBRR  
#define kGBBRRG_GBBRRG_RRGGBB_RRGGBB    kGBBRRG, kGBBRRG, kRRGGBB, kRRGGBB  

static const uint kShadowMasks8K800TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kGRRBBG_GRRBBG_BBGGRR_BBGGRR, kBRRGGB_BRRGGB_GGBBRR_GGBBRR, kGBBRRG_GBBRRG_RRGGBB_RRGGBB
};

// 1000 TVL
static const uint kShadowMasks8K1000TVL[kBGRAxis * kMaxShadowMaskSizeY * kMaxShadowMaskSizeX]  = 
{
   kGRRBBG_GRRBBG_BBGGRR_BBGGRR, kBRRGGB_BRRGGB_GGBBRR_GGBBRR, kGBBRRG_GBBRRG_RRGGBB_RRGGBB
};

#undef kMaxShadowMaskSizeX 
#undef kMaxShadowMaskSizeY 

#undef kGRRBBG           
#undef kBBGGRR            

#undef kBRRGGB            
#undef kGGBBRR            

#undef kGBBRRG            
#undef kRRGGBB         

#undef kGRRBBG_GRRBBG_BBGGRR_BBGGRR  
#undef kBRRGGB_BRRGGB_GGBBRR_GGBBRR  
#undef kGBBRRG_GBBRRG_RRGGBB_RRGGBB 

// SLOT MASKS

#define kMaxSlotSizeX      2

static const float kSlotMaskSizeX[kResolutionAxis * kTVLAxis] = {   4.0f, 2.0f, 1.0f, 1.0f  ,   7.0f, 4.0f, 3.0f, 2.0f  ,   7.0f, 7.0f, 5.0f, 4.0f   }; //1080p: 300 TVL, 600 TVL, 800 TVL, 1000 TVL   4K: 300 TVL, 600 TVL, 800 TVL, 1000 TVL   8K: 300 TVL, 600 TVL, 800 TVL, 1000 TVL
static const float kSlotMaskSizeY[kResolutionAxis * kTVLAxis] = {   4.0f, 4.0f, 1.0f, 1.0f  ,   8.0f, 6.0f, 4.0f, 4.0f  ,   6.0f, 6.0f, 4.0f, 4.0f   }; //1080p: 300 TVL, 600 TVL, 800 TVL, 1000 TVL   4K: 300 TVL, 600 TVL, 800 TVL, 1000 TVL   8K: 300 TVL, 600 TVL, 800 TVL, 1000 TVL


// 1080p 


// 300 TVL
#define kMaxSlotMaskSize   4
#define kMaxSlotSizeY      4

#define kXXXX       kBlack, kBlack, kBlack, kBlack  

#define kRGBX       kRed, kGreen, kBlue, kBlack  
#define kRBGX       kRed, kBlue, kGreen, kBlack  
#define kBGRX       kBlue, kGreen, kRed, kBlack  

#define kRGBXRGBX_RGBXXXXX_RGBXRGBX_XXXXRGBX       kRGBX, kRGBX  ,   kRGBX, kXXXX  ,   kRGBX, kRGBX  ,   kXXXX, kRGBX    
#define kRBGXRBGX_RBGXXXXX_RBGXRBGX_XXXXRBGX       kRBGX, kRBGX  ,   kRBGX, kXXXX  ,   kRBGX, kRBGX  ,   kXXXX, kRBGX    
#define kBGRXBGRX_BGRXXXXX_BGRXBGRX_XXXXBGRX       kBGRX, kBGRX  ,   kBGRX, kXXXX  ,   kBGRX, kBGRX  ,   kXXXX, kBGRX    

static const uint kSlotMasks1080p300TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kRGBXRGBX_RGBXXXXX_RGBXRGBX_XXXXRGBX, kRBGXRBGX_RBGXXXXX_RBGXRBGX_XXXXRBGX, kBGRXBGRX_BGRXXXXX_BGRXBGRX_XXXXBGRX                                                                                       
};

#undef kMaxSlotMaskSize  
#undef kMaxSlotSizeY     

#undef kXXXX

#undef kRGBX     
#undef kRBGX
#undef kBGRX     

#undef kRGBXRGBX_RGBXXXXX_RGBXRGBX_XXXXRGBX   
#undef kRBGXRBGX_RBGXXXXX_RBGXRBGX_XXXXRBGX   
#undef kBGRXBGRX_BGRXXXXX_BGRXBGRX_XXXXBGRX     


// 600 TVL
#define kMaxSlotMaskSize   2
#define kMaxSlotSizeY      4

#define kXX       kBlack, kBlack  

#define kMG         kMagenta, kGreen  
#define kYB         kYellow, kBlue  
#define kGM         kGreen, kMagenta  

#define kMGMG_MGXX_MGMG_XXMG       kMG, kMG  ,   kMG, kXX  ,   kMG, kMG  ,   kXX, kMG    
#define kYBYB_YBXX_YBYB_XXYB       kYB, kYB  ,   kYB, kXX  ,   kYB, kYB  ,   kXX, kYB    
#define kGMGM_GMXX_GMGM_XXGM       kGM, kGM  ,   kGM, kXX  ,   kGM, kGM  ,   kXX, kGM    

static const uint kSlotMasks1080p600TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kMGMG_MGXX_MGMG_XXMG, kYBYB_YBXX_YBYB_XXYB, kGMGM_GMXX_GMGM_XXGM
};

#undef kMaxSlotMaskSize  
#undef kMaxSlotSizeY     

#undef kXX

#undef kMG     
#undef kYB  
#undef kGM        

#undef kMGMG_MGXX_MGMG_XXMG  
#undef kYBYB_YBXX_YBYB_XXYB   
#undef kGMGM_GMXX_GMGM_XXGM  


// 800 TVL
#define kMaxSlotMaskSize   1
#define kMaxSlotSizeY      4

#define kX          kBlack  
#define kW          kWhite  

#define kW_W_W_W       kW, kW  ,   kW, kX  ,   kW, kW  ,   kX, kW    

static const uint kSlotMasks1080p800TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kW_W_W_W, kW_W_W_W, kW_W_W_W
};

// 1000 TVL
static const uint kSlotMasks1080p1000TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kW_W_W_W, kW_W_W_W, kW_W_W_W 
};

#undef kMaxSlotMaskSize  
#undef kMaxSlotSizeY     

#undef kX  
#undef kW   

#undef kW_W_W_W 


// 4K

// 300 TVL
#define kMaxSlotMaskSize   7
#define kMaxSlotSizeY      8

#define kXXXX       kBlack, kBlack, kBlack, kBlack, kBlack, kBlack, kBlack  

#define kRRGGBBX    kRed, kRed, kGreen, kGreen, kBlue, kBlue, kBlack  
#define kRRBBGGX    kRed, kRed, kBlue, kBlue, kGreen, kGreen, kBlack  
#define kBBGGRRX    kBlue, kBlue, kGreen, kGreen, kRed, kRed, kBlack  

#define kRRGGBBXRRGGBBX_RRGGBBXRRGGBBX_RRGGBBXXXXX_RRGGBBXRRGGBBX_RRGGBBXRRGGBBX_XXXXRRGGBBX       kRRGGBBX, kRRGGBBX  ,   kRRGGBBX, kRRGGBBX  ,   kRRGGBBX, kRRGGBBX  ,   kRRGGBBX, kXXXX  ,   kRRGGBBX, kRRGGBBX  ,   kRRGGBBX, kRRGGBBX  ,   kRRGGBBX, kRRGGBBX  ,   kXXXX, kRRGGBBX    
#define kRRBBGGXRRBBGGX_RRBBGGXRRBBGGX_RRBBGGXXXXX_RRBBGGXRRBBGGX_RRBBGGXRRBBGGX_XXXXRRBBGGX       kRRBBGGX, kRRBBGGX  ,   kRRBBGGX, kRRBBGGX  ,   kRRBBGGX, kRRBBGGX  ,   kRRBBGGX, kXXXX  ,   kRRBBGGX, kRRBBGGX  ,   kRRBBGGX, kRRBBGGX  ,   kRRBBGGX, kRRBBGGX  ,   kXXXX, kRRBBGGX    
#define kBBGGRRXBBGGRRX_BBGGRRXBBGGRRX_BBGGRRXXXXX_BBGGRRXBBGGRRX_BBGGRRXBBGGRRX_XXXXBBGGRRX       kBBGGRRX, kBBGGRRX  ,   kBBGGRRX, kBBGGRRX  ,   kBBGGRRX, kBBGGRRX  ,   kBBGGRRX, kXXXX  ,   kBBGGRRX, kBBGGRRX  ,   kBBGGRRX, kBBGGRRX  ,   kBBGGRRX, kBBGGRRX  ,   kXXXX, kBBGGRRX    

static const uint kSlotMasks4K300TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kRRGGBBXRRGGBBX_RRGGBBXRRGGBBX_RRGGBBXXXXX_RRGGBBXRRGGBBX_RRGGBBXRRGGBBX_XXXXRRGGBBX, kRRBBGGXRRBBGGX_RRBBGGXRRBBGGX_RRBBGGXXXXX_RRBBGGXRRBBGGX_RRBBGGXRRBBGGX_XXXXRRBBGGX, kBBGGRRXBBGGRRX_BBGGRRXBBGGRRX_BBGGRRXXXXX_BBGGRRXBBGGRRX_BBGGRRXBBGGRRX_XXXXBBGGRRX
};

#undef kMaxSlotMaskSize   
#undef kMaxSlotSizeY   

#undef kXXXX    
  
#undef kRRGGBBX  
#undef kRRBBGGX  
#undef kBBGGRRX 

#undef kRRGGBBXRRGGBBX_RRGGBBXRRGGBBX_RRGGBBXXXXX_RRGGBBXRRGGBBX_RRGGBBXRRGGBBX_XXXXRRGGBBX   
#undef kRRBBGGXRRBBGGX_RRBBGGXRRBBGGX_RRBBGGXXXXX_RRBBGGXRRBBGGX_RRBBGGXRRBBGGX_XXXXRRBBGGX   
#undef kBBGGRRXBBGGRRX_BBGGRRXBBGGRRX_BBGGRRXXXXX_BBGGRRXBBGGRRX_BBGGRRXBBGGRRX_XXXXBBGGRRX   


// 600 TVL
#define kMaxSlotMaskSize   4
#define kMaxSlotSizeY      6

#define kXXXX       kBlack, kBlack, kBlack, kBlack  

#define kRGBX       kRed, kGreen, kBlue, kBlack  
#define kRBGX       kRed, kBlue, kGreen, kBlack  
#define kBGRX       kBlue, kGreen, kRed, kBlack  

#define kRGBXRGBX_RGBXXXXX_RGBXRGBX_XXXXRGBX       kRGBX, kRGBX  ,   kRGBX, kRGBX  ,   kRGBX, kXXXX  ,   kRGBX, kRGBX  ,   kRGBX, kRGBX  ,   kXXXX, kRGBX   
#define kRBGXRBGX_RBGXXXXX_RBGXRBGX_XXXXRBGX       kRBGX, kRBGX  ,   kRBGX, kRBGX  ,   kRBGX, kXXXX  ,   kRBGX, kRBGX  ,   kRBGX, kRBGX  ,   kXXXX, kRBGX   
#define kBGRXBGRX_BGRXXXXX_BGRXBGRX_XXXXBGRX       kBGRX, kBGRX  ,   kBGRX, kBGRX  ,   kBGRX, kXXXX  ,   kBGRX, kBGRX  ,   kBGRX, kBGRX  ,   kXXXX, kBGRX   

static const uint kSlotMasks4K600TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kRGBXRGBX_RGBXXXXX_RGBXRGBX_XXXXRGBX, kRBGXRBGX_RBGXXXXX_RBGXRBGX_XXXXRBGX, kBGRXBGRX_BGRXXXXX_BGRXBGRX_XXXXBGRX
};

#undef kMaxSlotMaskSize   
#undef kMaxSlotSizeY   

#undef kXXXX     

#undef kRGBX     
#undef kRBGX
#undef kBGRX

#undef kRGBXRGBX_RGBXXXXX_RGBXRGBX_XXXXRGBX   
#undef kRBGXRBGX_RBGXXXXX_RBGXRBGX_XXXXRBGX   
#undef kBGRXBGRX_BGRXXXXX_BGRXBGRX_XXXXBGRX   


// 800 TVL
#define kMaxSlotMaskSize   3
#define kMaxSlotSizeY      4

#define kXXXX       kBlack, kBlack, kBlack  

#define kBGR        kBlue, kGreen, kRed  
#define kGBR        kGreen, kBlue, kRed  
#define kRGB        kRed, kGreen, kBlue  

#define kBGRBGR_BGRXXX_BGRBGR_XXXBGR       kBGR, kBGR  ,   kBGR, kXXXX  ,   kBGR, kBGR  ,   kXXXX, kBGR    
#define kGBRGBR_GBRXXX_GBRGBR_XXXGBR       kGBR, kGBR  ,   kGBR, kXXXX  ,   kGBR, kGBR  ,   kXXXX, kGBR    
#define kRGBRGB_RGBXXX_RGBRGB_XXXRGB       kRGB, kRGB  ,   kRGB, kXXXX  ,   kRGB, kRGB  ,   kXXXX, kRGB    

static const uint kSlotMasks4K800TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kBGRBGR_BGRXXX_BGRBGR_XXXBGR, kGBRGBR_GBRXXX_GBRGBR_XXXGBR, kRGBRGB_RGBXXX_RGBRGB_XXXRGB
};

#undef kMaxSlotMaskSize   
#undef kMaxSlotSizeY   

#undef kXXXX     

#undef kBGR    
#undef kGBR 
#undef kRGB      

#undef kBGRBGR_BGRXXX_BGRBGR_XXXBGR   
#undef kGBRGBR_GBRXXX_GBRGBR_XXXGBR   
#undef kRGBRGB_RGBXXX_RGBRGB_XXXRGB   


// 1000 TVL
#define kMaxSlotMaskSize   2
#define kMaxSlotSizeY      4

#define kXX       kBlack, kBlack  

#define kMG         kMagenta, kGreen  
#define kYB         kYellow, kBlue  
#define kGM         kGreen, kMagenta  

#define kMGMG_MGXX_MGMG_XXMG       kMG, kMG  ,   kMG, kXX  ,   kMG, kMG  ,   kXX, kMG    
#define kYBYB_YBXX_YBYB_XXYB       kYB, kYB  ,   kYB, kXX  ,   kYB, kYB  ,   kXX, kYB    
#define kGMGM_GMXX_GMGM_XXGM       kGM, kGM  ,   kGM, kXX  ,   kGM, kGM  ,   kXX, kGM    

static const uint kSlotMasks4K1000TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kMGMG_MGXX_MGMG_XXMG, kYBYB_YBXX_YBYB_XXYB, kGMGM_GMXX_GMGM_XXGM
};

#undef kMaxSlotMaskSize   
#undef kMaxSlotSizeY   

#undef kXX     

#undef kMG     
#undef kYB  
#undef kGM        

#undef kMGMG_MGXX_MGMG_XXMG  
#undef kYBYB_YBXX_YBYB_XXYB   
#undef kGMGM_GMXX_GMGM_XXGM   
#undef kBBGGRRXBBGGRRX_BBGGRRXBBGGRRX_BBGGRRXXXXX_BBGGRRXBBGGRRX_BBGGRRXBBGGRRX_XXXXBBGGRRX   


// 8K

// 300 TVL
#define kMaxSlotMaskSize   7
#define kMaxSlotSizeY      6

#define kXXXX       kBlack, kBlack, kBlack, kBlack, kBlack, kBlack, kBlack  

#define kRRGGBBX    kRed, kRed, kGreen, kGreen, kBlue, kBlue, kBlack  
#define kRRBBGGX    kRed, kRed, kBlue, kBlue, kGreen, kGreen, kBlack  
#define kBBGGRRX    kBlue, kBlue, kGreen, kGreen, kRed, kRed, kBlack  

#define kRRGGBBXRRGGBBX_RRGGBBXRRGGBBX_RRGGBBXXXXX_RRGGBBXRRGGBBX_RRGGBBXRRGGBBX_XXXXRRGGBBX       kRRGGBBX, kRRGGBBX  ,   kRRGGBBX, kRRGGBBX  ,   kRRGGBBX, kXXXX  ,   kRRGGBBX, kRRGGBBX  ,   kRRGGBBX, kRRGGBBX  ,   kXXXX, kRRGGBBX    
#define kRRBBGGXRRBBGGX_RRBBGGXRRBBGGX_RRBBGGXXXXX_RRBBGGXRRBBGGX_RRBBGGXRRBBGGX_XXXXRRBBGGX       kRRBBGGX, kRRBBGGX  ,   kRRBBGGX, kRRBBGGX  ,   kRRBBGGX, kXXXX  ,   kRRBBGGX, kRRBBGGX  ,   kRRBBGGX, kRRBBGGX  ,   kXXXX, kRRBBGGX    
#define kBBGGRRXBBGGRRX_BBGGRRXBBGGRRX_BBGGRRXXXXX_BBGGRRXBBGGRRX_BBGGRRXBBGGRRX_XXXXBBGGRRX       kBBGGRRX, kBBGGRRX  ,   kBBGGRRX, kBBGGRRX  ,   kBBGGRRX, kXXXX  ,   kBBGGRRX, kBBGGRRX  ,   kBBGGRRX, kBBGGRRX  ,   kXXXX, kBBGGRRX    

static const uint kSlotMasks8K300TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kRRGGBBXRRGGBBX_RRGGBBXRRGGBBX_RRGGBBXXXXX_RRGGBBXRRGGBBX_RRGGBBXRRGGBBX_XXXXRRGGBBX, kRRBBGGXRRBBGGX_RRBBGGXRRBBGGX_RRBBGGXXXXX_RRBBGGXRRBBGGX_RRBBGGXRRBBGGX_XXXXRRBBGGX, kBBGGRRXBBGGRRX_BBGGRRXBBGGRRX_BBGGRRXXXXX_BBGGRRXBBGGRRX_BBGGRRXBBGGRRX_XXXXBBGGRRX 
};

// 600 TVL
static const uint kSlotMasks8K600TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kRRGGBBXRRGGBBX_RRGGBBXRRGGBBX_RRGGBBXXXXX_RRGGBBXRRGGBBX_RRGGBBXRRGGBBX_XXXXRRGGBBX, kRRBBGGXRRBBGGX_RRBBGGXRRBBGGX_RRBBGGXXXXX_RRBBGGXRRBBGGX_RRBBGGXRRBBGGX_XXXXRRBBGGX, kBBGGRRXBBGGRRX_BBGGRRXBBGGRRX_BBGGRRXXXXX_BBGGRRXBBGGRRX_BBGGRRXBBGGRRX_XXXXBBGGRRX 
};

#undef kMaxSlotMaskSize   
#undef kMaxSlotSizeY   

#undef kXXXX    

#undef kRRGGBBX  
#undef kRRBBGGX  
#undef kBBGGRRX 

#undef kRRGGBBXRRGGBBX_RRGGBBXRRGGBBX_RRGGBBXXXXX_RRGGBBXRRGGBBX_RRGGBBXRRGGBBX_XXXXRRGGBBX   
#undef kRRBBGGXRRBBGGX_RRBBGGXRRBBGGX_RRBBGGXXXXX_RRBBGGXRRBBGGX_RRBBGGXRRBBGGX_XXXXRRBBGGX   
#undef kBBGGRRXBBGGRRX_BBGGRRXBBGGRRX_BBGGRRXXXXX_BBGGRRXBBGGRRX_BBGGRRXBBGGRRX_XXXXBBGGRRX   

// 800 TVL
#define kMaxSlotMaskSize   5
#define kMaxSlotSizeY      4

#define kXXXX       kBlack, kBlack, kBlack, kBlack, kBlack  

#define kRYCBX      kRed, kYellow, kCyan, kBlue, kBlack  
#define kRMCGX      kRed, kMagenta, kCyan, kGreen, kBlack  
#define kBCYRX      kBlue, kCyan, kYellow, kRed, kBlack  

#define kRYCBXRYCBX_RYCBXXXXX_RYCBXRYCBX_XXXXRYCBX       kRYCBX, kRYCBX  ,   kRYCBX, kXXXX  ,   kRYCBX, kRYCBX  ,   kXXXX, kRYCBX    
#define kRMCGXRMCGX_RMCGXXXXX_RMCGXRMCGX_XXXXRMCGX       kRMCGX, kRMCGX  ,   kRMCGX, kXXXX  ,   kRMCGX, kRMCGX  ,   kXXXX, kRMCGX    
#define kBCYRXBCYRX_BCYRXXXXX_BCYRXBCYRX_XXXXBCYRX       kBCYRX, kBCYRX  ,   kBCYRX, kXXXX  ,   kBCYRX, kBCYRX  ,   kXXXX, kBCYRX    

static const uint kSlotMasks8K800TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kRYCBXRYCBX_RYCBXXXXX_RYCBXRYCBX_XXXXRYCBX, kRMCGXRMCGX_RMCGXXXXX_RMCGXRMCGX_XXXXRMCGX, kBCYRXBCYRX_BCYRXXXXX_BCYRXBCYRX_XXXXBCYRX
};

#undef kMaxSlotMaskSize   
#undef kMaxSlotSizeY   

#undef kXXXX    

#undef kRYCBX    
#undef kRMCGX
#undef kBCYRX    

#undef kRYCBXRYCBX_RYCBXXXXX_RYCBXRYCBX_XXXXRYCBX   
#undef kRMCGXRMCGX_RMCGXXXXX_RMCGXRMCGX_XXXXRMCGX   
#undef kBCYRXBCYRX_BCYRXXXXX_BCYRXBCYRX_XXXXBCYRX   


// 1000 TVL
#define kMaxSlotMaskSize   4
#define kMaxSlotSizeY      4

#define kXXXX       kBlack, kBlack, kBlack, kBlack  

#define kRGBX       kRed, kGreen, kBlue, kBlack  
#define kRBGX       kRed, kBlue, kGreen, kBlack  
#define kBGRX       kBlue, kGreen, kRed, kBlack  

#define kRGBXRGBX_RGBXXXXX_RGBXRGBX_XXXXRGBX       kRGBX, kRGBX  ,   kRGBX, kXXXX  ,   kRGBX, kRGBX  ,   kXXXX, kRGBX    
#define kRBGXRBGX_RBGXXXXX_RBGXRBGX_XXXXRBGX       kRBGX, kRBGX  ,   kRBGX, kXXXX  ,   kRBGX, kRBGX  ,   kXXXX, kRBGX    
#define kBGRXBGRX_BGRXXXXX_BGRXBGRX_XXXXBGRX       kBGRX, kBGRX  ,   kBGRX, kXXXX  ,   kBGRX, kBGRX  ,   kXXXX, kBGRX    

static const uint kSlotMasks8K1000TVL[kBGRAxis * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize] = 
{
   kRGBXRGBX_RGBXXXXX_RGBXRGBX_XXXXRGBX, kRBGXRBGX_RBGXXXXX_RBGXRBGX_XXXXRBGX, kBGRXBGRX_BGRXXXXX_BGRXBGRX_XXXXBGRX 
};

#undef kMaxSlotMaskSize   
#undef kMaxSlotSizeY   

#undef kXXXX     

#undef kRGBX    
#undef kRBGX  
#undef kBGRX     
 
#undef kRGBXRGBX_RGBXXXXX_RGBXRGBX_XXXXRGBX   
#undef kRBGXRBGX_RBGXXXXX_RBGXRBGX_XXXXRBGX   
#undef kBGRXBGRX_BGRXXXXX_BGRXBGRX_XXXXBGRX   

////////////////////////////////////////
// REPLACE THESE

float mod(float x, float y)
{
    return x - y * floor(x / y);
}

float2 mod(float2 x, float2 y)
{
    return x - y * floor(x / y);
}

float3 mod(float3 x, float3 y)
{
    return x - y * floor(x / y);
}

float4 mod(float4 x, float4 y)
{
    return x - y * floor(x / y);
}

////////////////////////////////////////

#define k1080p     0
#define k4K        1
#define k8K        2

#define k300TVL    0
#define k600TVL    1
#define k800TVL    2
#define k1000TVL   3

#define kColourSystems  4
#define kPhosphorSets   5

#define kD50            5003.0f
#define kD55            5503.0f
#define kD65            6504.0f
#define kD75            7504.0f
#define kD93            9305.0f

static const float3x3 k709_to_XYZ = float3x3(
   0.412391f, 0.357584f, 0.180481f,
   0.212639f, 0.715169f, 0.072192f,
   0.019331f, 0.119195f, 0.950532f);

static const float3x3 kPAL_to_XYZ = float3x3(
   0.430554f, 0.341550f, 0.178352f,
   0.222004f, 0.706655f, 0.071341f,
   0.020182f, 0.129553f, 0.939322f);

static const float3x3 kNTSC_to_XYZ = float3x3(
   0.393521f, 0.365258f, 0.191677f,
   0.212376f, 0.701060f, 0.086564f,
   0.018739f, 0.111934f, 0.958385f);

// Phosphor Sets - These override the colour standards above when used

// NTSC-J P22
static const float3x3 kNTSCJ_P22_to_XYZ = float3x3(
   0.458432f, 0.309549f, 0.182474f,
   0.256722f, 0.668848f, 0.074430f,
   0.018337f, 0.127136f, 0.943584f);

//P22 (80’s)
static const float3x3 kP2280_to_XYZ = float3x3(
   0.460844f, 0.307613f, 0.181910f,
   0.244311f, 0.676311f, 0.079378f,
   0.007123f, 0.106901f, 0.975034f);

//P22 (90’s/tinted phosphors)
static const float3x3 kP2290_to_XYZ = float3x3(
   0.404151f, 0.354887f, 0.191418f,
   0.201984f, 0.714530f, 0.083485f,
   0.000607f, 0.062960f, 1.025491f);

//RPTV (late 90’s/early 00’s)
static const float3x3 kRPTV00_to_XYZ = float3x3(
   0.331718f, 0.429476f, 0.189261f,
   0.173634f, 0.738044f, 0.088322f,
   0.012958f, 0.091941f, 0.984159f);

//  NTSC-FCC 1953 Standard Phosphor
static const float3x3 k1953_to_XYZ = float3x3(
   0.588010f, 0.179133f, 0.183224f,
   0.289661f, 0.605640f, 0.104699f,
   0.000000f, 0.068241f, 1.020817f);

// Output Colour Standards

static const float3x3 kXYZ_to_709 = float3x3(
    3.240970f, -1.537383f, -0.498611f,
   -0.969244f,  1.875968f,  0.041555f,
    0.055630f, -0.203977f,  1.056972f);

static const float3x3 kStandardsColourGamut[kColourSystems] = { k709_to_XYZ, kPAL_to_XYZ, kNTSC_to_XYZ, kNTSC_to_XYZ };
static const float3x3 kPhosphorColourGamut[kPhosphorSets] = { kNTSCJ_P22_to_XYZ, kP2280_to_XYZ, kP2290_to_XYZ, kRPTV00_to_XYZ, k1953_to_XYZ };

//static const float kTemperatures[kColourSystems] = { kD65, kD65, kD65, kD93 }; 

  // Values from: http://blenderartists.org/forum/showthread.php?270332-OSL-Goodness&p=2268693&viewfull=1#post2268693   
static const float3x3 kWarmTemperature = float3x3(
   float3(0.0, -2902.1955373783176,   -8257.7997278925690),
	float3(0.0,  1669.5803561666639,    2575.2827530017594),
	float3(1.0,     1.3302673723350029,    1.8993753891711275));

static const float3x3 kCoolTemperature = float3x3(
   float3( 1745.0425298314172,      1216.6168361476490,    -8257.7997278925690),
   float3(-2666.3474220535695,     -2173.1012343082230,     2575.2827530017594),
	float3(    0.55995389139931482,     0.70381203140554553,    1.8993753891711275));

static const float4x4 kCubicBezier = float4x4( 1.0f,  0.0f,  0.0f,  0.0f,
                               -3.0f,  3.0f,  0.0f,  0.0f,
                                3.0f, -6.0f,  3.0f,  0.0f,
                               -1.0f,  3.0f, -3.0f,  1.0f );

float Bezier(const float t0, const float4 control_points)
{
   float4 t = float4(1.0, t0, t0*t0, t0*t0*t0);
   return dot(t, mul(kCubicBezier, control_points));
}

float3 WhiteBalance(float temperature, float3 colour)
{
   float3x3 m;
   
   if(temperature < kD65)
   { 
      m = kWarmTemperature;
   } 
   else
   {
      m = kCoolTemperature;
   }

   const float3 rgb_temperature = lerp(clamp(float3(m[0] / (clamp(temperature, 1000.0f, 40000.0f).xxx + m[1]) + m[2]), 0.0f.xxx, 1.0f.xxx), 1.0f.xxx, smoothstep(1000.0f, 0.0f, temperature));

   float3 result = colour * rgb_temperature;

   result *= dot(colour, float3(0.2126, 0.7152, 0.0722)) / max(dot(result, float3(0.2126, 0.7152, 0.0722)), 1e-5); // Preserve luminance

   return result;
}

float r601r709ToLinear_1(const float channel)
{
	//return (channel >= 0.081f) ? pow((channel + 0.099f) * (1.0f / 1.099f), (1.0f / 0.45f)) : channel * (1.0f / 4.5f);
   return (channel >= (HCRT_GAMMA_CUTOFF * (1.0f / 1000.0f))) ? pow((channel + 0.099f) * (1.0f / 1.099f), HCRT_GAMMA_IN) : channel * (1.0f / 4.5f);
}

float3 r601r709ToLinear(const float3 colour)
{
	return float3(r601r709ToLinear_1(colour.r), r601r709ToLinear_1(colour.g), r601r709ToLinear_1(colour.b));
}

// XYZ Yxy transforms found in Dogway's Grade.slang shader

float3 XYZtoYxy(const float3 XYZ)
{
   const float XYZrgb   = XYZ.r + XYZ.g + XYZ.b;
   const float Yxyg     = (XYZrgb <= 0.0f) ? 0.3805f : XYZ.r / XYZrgb;
   const float Yxyb     = (XYZrgb <= 0.0f) ? 0.3769f : XYZ.g / XYZrgb;
   return float3(XYZ.g, Yxyg, Yxyb);
}

float3 YxytoXYZ(const float3 Yxy)
{
   const float Xs    = Yxy.r * (Yxy.g / Yxy.b);
   const float Xsz   = (Yxy.r <= 0.0f) ? 0.0f : 1.0f;
   const float3 XYZ    = float3(Xsz, Xsz, Xsz) * float3(Xs, Yxy.r, (Xs / Yxy.g) - Xs - Yxy.r);
   return XYZ;
}

static const float4 kTopBrightnessControlPoints    = float4(0.0f, 1.0f, 1.0f, 1.0f);
static const float4 kMidBrightnessControlPoints    = float4(0.0f, 1.0f / 3.0f, (1.0f / 3.0f) * 2.0f, 1.0f);
static const float4 kBottomBrightnessControlPoints = float4(0.0f, 0.0f, 0.0f, 1.0f);

float Brightness(const float luminance)
{
   if(HCRT_BRIGHTNESS >= 0.0f)
   {
      return Bezier(luminance, lerp(kMidBrightnessControlPoints, kTopBrightnessControlPoints, HCRT_BRIGHTNESS));
   }
   else
   {
      return Bezier(luminance, lerp(kMidBrightnessControlPoints, kBottomBrightnessControlPoints, abs(HCRT_BRIGHTNESS)));
   }
}

static const float4 kTopContrastControlPoints    = float4(0.0f, 0.0f, 1.0f, 1.0f);
static const float4 kMidContrastControlPoints    = float4(0.0f, 1.0f / 3.0f, (1.0f / 3.0f) * 2.0f, 1.0f);
static const float4 kBottomContrastControlPoints = float4(0.0f, 1.0f, 0.0f, 1.0f);

float Contrast(const float luminance)
{
   if(HCRT_CONTRAST >= 0.0f)
   {
      return Bezier(luminance, lerp(kMidContrastControlPoints, kTopContrastControlPoints, HCRT_CONTRAST));
   }
   else
   {
      return Bezier(luminance, lerp(kMidContrastControlPoints, kBottomContrastControlPoints, abs(HCRT_CONTRAST)));
   }
}

float3 Saturation(const float3 colour)
{
   const float luma           = dot(colour, float3(0.2125, 0.7154, 0.0721));
   const float saturation     = 0.5f + HCRT_SATURATION * 0.5f;

   return clamp(lerp(luma.xxx, colour, saturation.xxx * 2.0f), 0.0f.xxx, 1.0f.xxx);
}

float3 BrightnessContrastSaturation(const float3 xyz)
{
   const float3 Yxy              = XYZtoYxy(xyz);
   const float Y_gamma           = clamp(pow(Yxy.x, 1.0f / 2.4f), 0.0f, 1.0f);
   
   const float Y_brightness      = Brightness(Y_gamma);

   const float Y_contrast        = Contrast(Y_brightness);

   const float3 contrast_linear  = float3(pow(Y_contrast, 2.4f), Yxy.y, Yxy.z);
   const float3 contrast         = clamp(mul(kXYZ_to_709, YxytoXYZ(contrast_linear)), 0.0f, 1.0f);

   const float3 saturation       = Saturation(contrast);

   return saturation;
}

float3 ColourGrade(const float3 colour)
{
   const uint colour_system      = uint(HCRT_CRT_COLOUR_SYSTEM);
   const uint phosphor_set       = uint(HCRT_CRT_PHOSPHOR_SET);

   const float temperature[kColourSystems] = { HCRT_WHITE_TEMPERATURE_D65, HCRT_WHITE_TEMPERATURE_D65, HCRT_WHITE_TEMPERATURE_D65, HCRT_WHITE_TEMPERATURE_D93 };

   const float3 white_point      = WhiteBalance(temperature[colour_system], colour);

   const float3 _linear          = pow(white_point, (HCRT_GAMMA_IN).xxx); // r601r709ToLinear(white_point); //

   const float3 xyz              = phosphor_set == 0 ? mul(kStandardsColourGamut[colour_system], _linear) : mul(kPhosphorColourGamut[phosphor_set - 1], _linear);

   const float3 graded           = BrightnessContrastSaturation(xyz); 

   return graded;
}

////////////////////////////////////////

#define kMaxNitsFor2084     10000.0f
#define kEpsilon            0.0001f

float3 InverseTonemap(const float3 sdr_linear, const float max_nits, const float paper_white_nits)
{
   const float input_val = max(sdr_linear.r, max(sdr_linear.g, sdr_linear.b));

   if (input_val < kEpsilon) return sdr_linear;

   const float peak_ratio = max_nits / paper_white_nits;

   const float numerator = input_val;
   const float denominator = 1.0 - input_val * (1.0 - (1.0 / peak_ratio));
   const float tonemapped_val = numerator / max(denominator, kEpsilon);

   return sdr_linear * (tonemapped_val / input_val);
}

float3 InverseTonemapConditional(const float3 _linear)
{
   if(HCRT_HDR < 1.0f)
   {
      return _linear;
   }
   else
   {
      return InverseTonemap(_linear, HCRT_MAX_NITS, HCRT_PAPER_WHITE_NITS);
   }
}

////////////////////////////////////////

//#define kMaxNitsFor2084     10000.0f

static const float3x3 k709_to_2020 = float3x3 (   
   0.627403895934699f, 0.329283038377884f, 0.043313065687417f,
   0.069097289358232f, 0.919540395075458f, 0.011362315566309f,
   0.016391438875150f, 0.088013307877226f, 0.895595253247624f);

// START Converted from (Copyright (c) Microsoft Corporation - Licensed under the MIT License.)  https://github.com/microsoft/Xbox-ATG-Samples/tree/master/Kits/ATGTK/HDR 
static const float3x3 kExpanded709_to_2020 = float3x3 (
    0.6274040f,  0.3292820f, 0.0433136f,
    0.0457456f,  0.941777f,  0.0124772f,
   -0.00121055f, 0.0176041f, 0.983607f);
   
static const float3x3 kNTSC1953_to_2020 = float3x3 (
   0.906538f, 0.074810f, 0.018652f,
   0.076155f, 0.860656f, 0.063189f,
   -0.002015f, 0.041546f, 0.960469f);
   
//NTSC (1987)/SMPTE 240M/SMPTE C
static const float3x3 k601_to_2020 = float3x3 (
   0.595254206376441f, 0.349313919749775f, 0.055431873873783f,
   0.081243661805292f, 0.891503295602217f, 0.027253042592490f,
   0.015512341244385f, 0.081911642143068f, 0.902576016612547f);

//Pal/Secam/ITU-R BT.470 - 625
static const float3x3 kPAL_to_2020 = float3x3 (
   0.655036776701967f, 0.302160964978908f, 0.042802258319126f,
   0.072140555698383f, 0.916631128820964f, 0.011228315480653f,
   0.017113370439452f, 0.097853469923833f, 0.885033159636715f);

//EBU Tech. 3213-E
static const float3x3 k3213E_to_2020 = float3x3 (
   0.656656353779129f, 0.300719063748279f, 0.042624582472592f,
   0.072525428085101f, 0.916271070705580f, 0.011203501209319f,
   0.017188500243598f, 0.097872586557247f, 0.884938913199155f);

//DCI-P3
static const float3x3 kaDCIP3_to_2020 = float3x3 (
   0.707334754484899f, 0.247569002167623f, 0.045096243347478f,
   0.036801714143967f, 0.965390705258538f, -0.002192419402504f,
   0.000222194187031f, 0.029426016456367f, 0.970351789356603f);

//Display P3/P3-D65
static const float3x3 kaDisplayP3_to_2020 = float3x3 (
   0.753833034361721f, 0.198597369052617f, 0.047569596585662f,
   0.045743848965358f, 0.941777219811693f, 0.012478931222948f,
   -0.001210340354518f, 0.017601717301090f, 0.983608623053428f);

//sRGB
static const float3x3 ksRGB_to_2020 = float3x3 (
   0.627441372057978f, 0.329297459521909f, 0.043351458394495f,
   0.069027617147078f, 0.919580666887028f, 0.011361422575401f,
   0.016364235071681f, 0.088017162471727f, 0.895564972725983f);

//Adobe RGB (1998)
static const float3x3 kAdobeRGB1998_to_2020 = float3x3 (
   0.877337599133789f, 0.077497709099687f, 0.045174670424343f,
   0.096613889523141f, 0.891520398792844f, 0.011846866967978f,
   0.022920009813905f, 0.043037949654269f, 0.934044659100325f);

//Adobe Wide Gamut RGB
static const float3x3 kAdobeWGRGB_to_2020 = float3x3 (
   1.032815f, -0.099761f, 0.066946f,
   -0.053957f, 1.132758f, -0.078800f,
   0.001428f, 0.019514f, 0.979059f);

//Apple RGB
static const float3x3 kAppleRGB_to_2020 = float3x3 (
   0.678529391873470f, 0.268103222741389f, 0.053367385385141f,
   0.096031750282729f, 0.877730211467603f, 0.026238038249668f,
   0.021192740493379f, 0.109846519921590f, 0.868960739585031f);

//ITU-R BT.2020
static const float3x3 k2020_to_2020 = float3x3 (
   1.000000000000000f, 0.000000000000000f, 0.000000000000000f,
   0.000000000000000f, 1.000000000000000f, -0.000000000000000f,
   0.000000000000000f, 0.000000000000000f, 1.000000000000000f);
   
static const float3x3 kNTSCJP22_to_2020 = float3x3 (
    0.691014f, 0.261287f, 0.047700f,
    0.109646f, 0.876813f, 0.013541f,
    0.014382f, 0.096629f, 0.888989f);

// P22_80
static const float3x3 kP2280_to_2020 = float3x3 (
   0.702409f, 0.260434f, 0.037157f,
   0.087800f, 0.889849f, 0.022351f,
   0.004390f, 0.077212f, 0.918398f);

// P22 improved with tinted phosphors
static const float3x3 kP2290_to_2020 = float3x3 (
   0.621792f, 0.339128f, 0.039080f,
   0.057073f, 0.919420f, 0.023508f,
   -0.000938f, 0.035014f, 0.965924f);

// RPTV (Rear Projection TV) for NTSC-U late 90s, early 00s
static const float3x3 kRPTV_to_2020 = float3x3 (
   0.504405f, 0.451465f, 0.044129f,
   0.059729f, 0.908159f, 0.032112f,
   0.010633f, 0.062627f, 0.926741f);

// XXA (P22 sul?de/silicate/phosphate)
static const float3x3 kXXA_to_2020 = float3x3 (
   0.867034f, 0.096021f, 0.036945f,
   0.064650f, 0.936157f, -0.000808f,
   -0.001711f, 0.036583f, 0.965127f);
   
// XXB (P22 all-sulﬁde)/1958
static const float3x3 kXXB_to_2020 = float3x3 (
   0.651821f, 0.292537f, 0.055642f,
   0.065768f, 0.926913f, 0.007319f,
   -0.001740f, 0.104000f, 0.897740f);

// XXC (P22 sulﬁde/vanadate)/1964
static const float3x3 kXXC_to_2020 = float3x3 (
   0.706425f, 0.235501f, 0.058074f,
   0.065679f, 0.952661f, -0.018340f,
   0.015010f, 0.132171f, 0.852819f);

// XXD (P22 sul?de/oxysul?de)
static const float3x3 kXXD_to_2020 = float3x3 (
//   0.526084f, 0.418310f, 0.055607f,
//   0.073322f, 0.901471f, 0.025207f,
//   0.001097f, 0.052624f, 0.946279f);

   0.639371f, 0.317872f, 0.042756f,
   0.085284f, 0.887675f, 0.027041f,
   0.019961f, 0.084963f, 0.895076f);

//Conrac 7211N19
static const float3x3 kConrac_to_2020 = float3x3 (
   0.848016f, 0.103509f, 0.048476f,
   0.090261f, 0.893984f, 0.015755f,
   0.030765f, 0.064658f, 0.904577f);

//Sony Trinitron KV-20M20
static const float3x3 kTT96_to_2020 = float3x3 (
   0.678529f, 0.268103f, 0.053367f,
   0.096032f, 0.877730f, 0.026238f,
   0.021193f, 0.109847f, 0.868961f);

//SMPTE-C - Measured Average Phosphor (1979-1994)
static const float3x3 kMA7994_to_2020 = float3x3 (
   0.708152f, 0.257311f, 0.034538f,
   0.103842f, 0.879177f, 0.016980f,
   0.002749f, 0.076286f, 0.920965f);

//NTSC-J - Standard Phosphor
static const float3x3 kNTSCJSt_to_2020 = float3x3 (
   0.693529f, 0.259060f, 0.047411f,
   0.115249f, 0.869342f, 0.015409f,
   0.019484f, 0.095806f, 0.884711f);

//Philips Monitors
static const float3x3 kPhilips_to_2020 = float3x3 (
   0.634936f, 0.310278f, 0.054786f,
   0.082458f, 0.909159f, 0.008382f,
   0.013977f, 0.061264f, 0.924759f);
   
//CBS field-sequential color
static const float3x3 kCBS1951_to_2020 = float3x3 (
   0.783661f,  0.174126f, 0.042214,
   0.046420f,  0.977702f, -0.024122,
   -0.001088f,  0.033960f, 0.967129);
   
//1953 Reciever Phosphors Matrices (TV Display Phosphors/Primaries — Some History)
static const float3x3 k1953RP_to_2020 = float3x3 (
    0.849799f, 0.093430f, 0.056770f,
    0.063365f, 0.910900f, 0.025734f,
    0.001677f, 0.035596f, 0.966080f);
	
//1961 Reciever Phosphors Matrices (TV Display Phosphors/Primaries — Some History)
static const float3x3 k1961RP_to_2020 = float3x3 (
	0.662328f, 0.294562f, 0.043110f,
	0.066828f, 0.921863f, 0.011309f,
	0.001768f, 0.110371f, 0.891397f);
	
//1970s Reciever Phosphors Matrices (TV Display Phosphors/Primaries — Some History)
static const float3x3 k1970sRP_to_2020 = float3x3 (
    0.550286f, 0.404906f, 0.044808f,
    0.076695f, 0.911550f, 0.011755f,
    0.001148f, 0.072336f, 0.926516f);
	
//1980s Reciever Phosphors Matrices (TV Display Phosphors/Primaries — Some History)
static const float3x3 k1980sRP_to_2020 = float3x3 (
    0.486929f, 0.460664f, 0.052407f,
    0.068735f, 0.924036f, 0.007230f,
    0.017765f, 0.055913f, 0.926322f);   

static const float3x3 kGBC_to_2020 = float3x3 (
    0.480664f, 0.030999f, 0.488336f,
    0.254689f, 0.039603f, 0.705707f,
    0.201495f, 0.020874f, 0.777631f);

static const float3x3 kGBA_to_2020 = float3x3 (
    0.613887f, 0.241502f, 0.144611f,
    0.225416f, 0.376913f, 0.397672f,
    0.213884f, 0.160997f, 0.625119f);

static const float3x3 kVBA_to_2020 = float3x3 (
    0.511009f, 0.370072f, 0.118920f,
    0.147996f, 0.640980f, 0.211024f,
    0.113711f, 0.259285f, 0.627004f);

static const float3x3 kVBANDStopB_to_2020 = float3x3 (
    0.574458f, 0.378632f, 0.046910f,
    0.166372f, 0.655806f, 0.177822f,
    0.127830f, 0.265282f, 0.606888f);

static const float3x3 kGBASP001_to_2020 = float3x3 (
    0.657312f, 0.129653f, 0.213034f,
    0.276151f, 0.172264f, 0.551585f,
    0.219421f, 0.071942f, 0.708637f);

static const float3x3 kNDStop_to_2020 = float3x3 (
    0.505180f, 0.449925f, 0.044895f,
    0.135502f, 0.694312f, 0.170186f,
    0.128643f, 0.290528f, 0.580829f);

static const float3x3 kNDSbot_to_2020 = float3x3 (
    0.552550f, 0.400108f, 0.047343f,
    0.158357f, 0.634676f, 0.206967f,
    0.135599f, 0.250715f, 0.613686f);

static const float3x3 kPSP_to_2020 = float3x3 (
    0.616974f, 0.370480f, 0.012546f,
    0.110186f, 0.742632f, 0.147183f,
    0.042149f, 0.086750f, 0.871101f);

static const float3x3 kGBAMic_to_2020 = float3x3 (
    0.527771f, 0.440056f, 0.032174f,
    0.156245f, 0.699673f, 0.144082f,
    0.165485f, 0.205985f, 0.628531f);

static const float3x3 kGBASP101_to_2020 = float3x3 (
    0.601413f, 0.369949f, 0.028638f,
    0.097055f, 0.833935f, 0.069010f,
    0.021480f, 0.043474f, 0.935046f);

static const float3x3 kNDSLtop_to_2020 = float3x3 (
    0.559068f, 0.394156f, 0.046776f,
    0.086367f, 0.848814f, 0.064820f,
    0.032753f, 0.048467f, 0.918780f);

static const float3x3 kNDSLbot_to_2020 = float3x3 (
    0.588690f, 0.369212f, 0.042098f,
    0.091811f, 0.822779f, 0.085410f,
    0.029350f, 0.047630f, 0.923020f);

static const float3x3 k3DStop_to_2020 = float3x3 (
    0.617901f, 0.348510f, 0.033588f,
    0.120870f, 0.846257f, 0.032874f,
    0.044942f, 0.045950f, 0.909108f);

static const float3x3 k3DSbot_to_2020 = float3x3 (
    0.609204f, 0.356901f, 0.033896f,
    0.119225f, 0.848015f, 0.032760f,
    0.051185f, 0.052276f, 0.896540f);

static const float3x3 k3DStop2_to_2020 = float3x3 (
    0.578434f, 0.384236f, 0.037330f,
    0.103178f, 0.853935f, 0.042887f,
    0.041183f, 0.042332f, 0.916485f);

static const float3x3 kN3DSXLtop_to_2020 = float3x3 (
    0.642314f, 0.324900f, 0.032786f,
    0.123906f, 0.801357f, 0.074737f,
    0.027595f, 0.041134f, 0.931271f);

static const float3x3 kLaterDSavg_to_2020 = float3x3 (
    0.599544f, 0.364028f, 0.036429f,
    0.105486f, 0.837465f, 0.057049f,
    0.035303f, 0.045922f, 0.918776f);

static const float3x3 kOGiPhone_to_2020 = float3x3 (
    0.619409f, 0.364157f, 0.016434f,
    0.116594f, 0.826725f, 0.056681f,
    0.030036f, 0.114926f, 0.855038f);

static const float3x3 kAMOLED_to_2020 = float3x3 (
    0.887936f, 0.088571f, 0.023493f,
    0.091811f, 0.918098f, -0.009910f,
    -0.000385f, 0.025545f, 0.974840f);

static const float3x3 kSwitchVivid_to_2020 = float3x3 (
    0.883178f, 0.102520f, 0.014303f,
    0.055890f, 0.949264f, -0.005154f,
    0.000029f, 0.019424f, 0.980546f);

//static const float3x3 k2020Gamuts[15] = { k709_to_2020, kExpanded709_to_2020, kNTSC1953_to_2020, kXXB_to_2020, kXXC_to_2020, k601_to_2020, kPAL_to_2020, kNTSCJP22_to_2020, kP2280_to_2020, kAppleRGB_to_2020, kPhilips_to_2020, kP2290_to_2020, kRPTV_to_2020, kaDisplayP3_to_2020, k2020_to_2020 };

static const float3x3 k2020Gamuts[29] = { kCBS1951_to_2020, kNTSC1953_to_2020, k1953RP_to_2020, k1961RP_to_2020, kXXC_to_2020, kPAL_to_2020, k601_to_2020, kNTSCJP22_to_2020, k1970sRP_to_2020, k1980sRP_to_2020, kAppleRGB_to_2020, kPhilips_to_2020, kP2280_to_2020, kP2290_to_2020, kRPTV_to_2020, kVBANDStopB_to_2020, kPSP_to_2020, k709_to_2020, kAdobeRGB1998_to_2020, kLaterDSavg_to_2020, kOGiPhone_to_2020, k709_to_2020, kaDisplayP3_to_2020, kAMOLED_to_2020, kAMOLED_to_2020, k709_to_2020, kExpanded709_to_2020, k2020_to_2020, kSwitchVivid_to_2020 };

float3 LinearToST2084(float3 normalizedLinearValue)
{
   float3 ST2084 = pow((0.8359375f.xxx + (pow(normalizedLinearValue, 0.1593017578125f.xxx) * 18.8515625f)) / (1.0f.xxx + (pow(normalizedLinearValue, 0.1593017578125f.xxx) * 18.6875f)), 78.84375f.xxx);
   return ST2084;  // Don't clamp between [0..1], so we can still perform operations on scene values higher than 10,000 nits
}
// END Converted from (Copyright (c) Microsoft Corporation - Licensed under the MIT License.)  https://github.com/microsoft/Xbox-ATG-Samples/tree/master/Kits/ATGTK/HDR 

//Convert into HDR10
float3 Hdr10(float3 hdr_linear, float paper_white_nits, float expand_gamut)
{
   float3 rec2020       = mul(k2020Gamuts[uint(expand_gamut)], hdr_linear);
   float3 linearColour  = rec2020 * (paper_white_nits / kMaxNitsFor2084);
   float3 hdr10         = LinearToST2084(linearColour);

   return hdr10;
}

////////////////////////////////////////

static const float3x3 k709_to_XYZ = float3x3(
   0.412391f, 0.357584f, 0.180481f,
   0.212639f, 0.715169f, 0.072192f,
   0.019331f, 0.119195f, 0.950532f);

static const float3x3 kXYZ_to_DCIP3 = float3x3 (
    2.4934969119f, -0.9313836179f, -0.4027107845f,
   -0.8294889696f,  1.7626640603f,  0.0236246858f,
    0.0358458302f, -0.0761723893f,  0.9568845240f);

float LinearTosRGB_1(const float channel)
{
   return (channel > (HCRT_SRGB_GAMMA_CUTOFF * (1.0f / 1000.0f))) ? (1.055f * pow(channel, 1.0f / HCRT_SRGB_GAMMA_OUT)) - 0.055f : channel * 12.92f; 
}

float3 LinearTosRGB(const float3 colour)
{
	return float3(LinearTosRGB_1(colour.r), LinearTosRGB_1(colour.g), LinearTosRGB_1(colour.b));
}

float LinearTo709_1(const float channel)
{
   return (channel >= (HCRT_R709_GAMMA_CUTOFF * (1.0f / 1000.0f))) ? pow(channel * 1.099f, 1.0f / HCRT_R709_GAMMA_OUT) - 0.099f : channel * 4.5f;
}

float3 LinearTo709(const float3 colour)
{
	return float3(LinearTo709_1(colour.r), LinearTo709_1(colour.g), LinearTo709_1(colour.b));
}

float3 LinearToDCIP3(const float3 colour)
{
   return pow(colour, 1.0f.xxx / HCRT_P3_GAMMA_OUT.xxx);
}

void GammaCorrect(const float3 scanline_colour, inout float3 gamma_corrected)
{
   if(HCRT_HDR < 1.0f)
   {
      if(HCRT_OUTPUT_COLOUR_SPACE == 0.0f)
      {
         gamma_corrected = LinearTo709(scanline_colour);
      }
      else if(HCRT_OUTPUT_COLOUR_SPACE == 1.0f)
      {
         gamma_corrected = LinearTosRGB(scanline_colour);
      }
      else
      {
         gamma_corrected = LinearToDCIP3(scanline_colour);
      }
   }
   else
   {
      gamma_corrected = LinearToST2084(scanline_colour);
   }
}

////////////////////////////////////////

#define kPi    3.1415926536f
#define kEuler 2.718281828459f
#define kMax   1.0f

#define kBeamWidth 0.5f

static const float4 kFallOffControlPoints    = float4(0.0f, 0.0f, 0.0f, 1.0f);
static const float4 kAttackControlPoints     = float4(0.0f, 1.0f, 1.0f, 1.0f);
//static const float4 kScanlineControlPoints = float4(1.0f, 1.0f, 0.0f, 0.0f);

//static const float4x4 kCubicBezier = float4x4( 1.0f,  0.0f,  0.0f,  0.0f,
//                               -3.0f,  3.0f,  0.0f,  0.0f,
//                                3.0f, -6.0f,  3.0f,  0.0f,
//                               -1.0f,  3.0f, -3.0f,  1.0f );

//float Bezier(const float t0, const float4 control_points)
//{
//   float4 t = float4(1.0, t0, t0*t0, t0*t0*t0);
//   return dot(t, control_points * kCubicBezier);
//}

float4 BeamControlPoints(const float beam_attack, const bool falloff)
{
   const float inner_attack = clamp(beam_attack, 0.0f, 1.0);
   const float outer_attack = clamp(beam_attack - 1.0f, 0.0f, 1.0);

   return falloff ? kFallOffControlPoints + float4(0.0f, outer_attack, inner_attack, 0.0f) : kAttackControlPoints - float4(0.0f, inner_attack, outer_attack, 0.0f);
}

float ScanlineColour(const uint channel, 
                  const float2 tex_coord,
                  const float2 source_size, 
                  const float scanline_size, 
                  const float source_tex_coord_x, 
                  const float narrowed_source_pixel_offset, 
                  const float vertical_convergence, 
                  const float beam_attack, 
                  const float scanline_min, 
                  const float scanline_max, 
                  const float scanline_attack, 
                  const float vertical_bias) 
{
   float current_source_position_y  = ((tex_coord.y * source_size.y) - vertical_convergence);

   float center_line                = floor(current_source_position_y) + 0.5 + vertical_bias;
   
   float distance_to_line           = current_source_position_y - center_line;
   
   if (abs(distance_to_line) > 1.5) return 0.0;

   float source_tex_coord_y         = center_line / source_size.y; 

   float scanline_delta             = frac(current_source_position_y) - 0.5;

   // Slightly increase the beam width to get maximum brightness
   float beam_distance                    = abs(scanline_delta - vertical_bias) - (kBeamWidth / scanline_size);
   beam_distance                          = beam_distance < 0.0 ? 0.0 : beam_distance;
   float scanline_distance          = beam_distance * 2.0;

   float2 tex_coord_0                 = float2(source_tex_coord_x, source_tex_coord_y);
   float2 tex_coord_1                 = float2(source_tex_coord_x + (1.0 / source_size.x), source_tex_coord_y);

   float hdr_channel_0              = COMPAT_TEXTURE(SourceHDR, tex_coord_0)[channel];
   float hdr_channel_1              = COMPAT_TEXTURE(SourceHDR, tex_coord_1)[channel];

   // Horizontal interpolation between pixels
   float horiz_interp               = Bezier(narrowed_source_pixel_offset, BeamControlPoints(beam_attack, hdr_channel_0 > hdr_channel_1));  

   float hdr_channel                = lerp(hdr_channel_0, hdr_channel_1, horiz_interp);

   float physics_signal             = pow(max(hdr_channel, 0.0), 1.0 / 2.2);

   float signal_strength            = clamp(physics_signal, 0.0, 2.5); 

   float beam_width                 = lerp(scanline_min, scanline_max, min(signal_strength, 1.0));

   float channel_scanline_distance  = clamp(scanline_distance / beam_width, 0.0f, 1.0f);

   float4 channel_control_points      = float4(1.0f, 1.0f, min(signal_strength, 1.0f) * scanline_attack, 0.0f);
   float luminance                  = Bezier(channel_scanline_distance, channel_control_points);

   return luminance * hdr_channel;
}

float GenerateScanline( const uint channel, 
                        const float2 tex_coord,
                        const float2 source_size, 
                        const float scanline_size, 
                        const float horizontal_convergence, 
                        const float vertical_convergence, 
                        const float beam_sharpness, 
                        const float beam_attack, 
                        const float scanline_min, 
                        const float scanline_max, 
                        const float scanline_attack)
{
   float current_source_position_x      = (tex_coord.x * source_size.x) - horizontal_convergence;
   float current_source_center_x        = floor(current_source_position_x) + 0.5; 
   float source_tex_coord_x             = current_source_center_x / source_size.x; 
   float source_pixel_offset            = frac(current_source_position_x);
   float narrowed_source_pixel_offset   = clamp(((source_pixel_offset - 0.5) * beam_sharpness) + 0.5, 0.0, 1.0);

   float total_light = ScanlineColour( channel, tex_coord, source_size, scanline_size, source_tex_coord_x, 
                                       narrowed_source_pixel_offset, vertical_convergence, beam_attack, 
                                       scanline_min, scanline_max, scanline_attack, 
                                       0.0); 

   total_light += ScanlineColour( channel, tex_coord, source_size, scanline_size, source_tex_coord_x, 
                                 narrowed_source_pixel_offset, vertical_convergence, beam_attack, 
                                 scanline_min, scanline_max, scanline_attack, 
                                 1.0);

   total_light += ScanlineColour( channel, tex_coord, source_size, scanline_size, source_tex_coord_x, 
                                 narrowed_source_pixel_offset, vertical_convergence, beam_attack, 
                                 scanline_min, scanline_max, scanline_attack, 
                                 -1.0);

   return total_light;
}

////////////////////////////////////////

void Downsample(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target0)
{
   float3 source = 0.0f.xxx;
   if(HCRT_DOWNSAMPLE < 1.0f)
      {
         source = COMPAT_TEXTURE(ReShade::BackBuffer, texcoord).rgb;
      }
      else
      {
         const float2 source_size = float2(BUFFER_WIDTH, BUFFER_HEIGHT);
         const float2 output_size = float2(CRT_WIDTH, CRT_HEIGHT);

         const float2 tile_size   = source_size / output_size;

         for(float x = -(tile_size.x / 2.0f); x < tile_size.x / 2.0f; x += 1.0f)
         {
            for(float y = -(tile_size.y / 2.0f); y < tile_size.y / 2.0f; y += 1.0f)
            {
               float2 uv = float2(x, y) / source_size;
               source += COMPAT_TEXTURE(ReShade::BackBuffer, texcoord + uv).rgb;
            }
         }

         source = source / (tile_size.x * tile_size.y);
      }

   fragment = float4(source, 1.0);
}

void ColourPass(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target0)
{
   float3 source = COMPAT_TEXTURE(Source, texcoord).rgb;

   const float3 colour   = ColourGrade(source);

   float3 transformed_colour;

   if((HCRT_HDR < 1.0f) && (HCRT_COLOUR_ACCURATE < 1.0f))
   {
      if(HCRT_OUTPUT_COLOUR_SPACE == 2.0f)
      {
         transformed_colour = mul(kXYZ_to_DCIP3, mul(k709_to_XYZ, colour)); 
      }
      else
      {
         transformed_colour = colour;
      }
   }
   else
   {
      transformed_colour = colour;
   }

   fragment = float4(transformed_colour, 1.0);
}
 
void HDRPass(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target0)
{
   float3 source = COMPAT_TEXTURE(SourceSDR, texcoord).rgb;

   const float3 hdr_colour   = InverseTonemapConditional(source);

   float3 transformed_colour;

   if((HCRT_HDR >= 1.0f) && (HCRT_COLOUR_ACCURATE < 1.0f))
   {
      const float3 rec2020  = mul(k2020Gamuts[uint(HCRT_CONTENT_GAMUT)], hdr_colour);
      transformed_colour  = rec2020 * (HCRT_PAPER_WHITE_NITS / kMaxNitsFor2084);
   }
   else
   {      
      transformed_colour = hdr_colour;
   }

   fragment = float4(transformed_colour, 1.0);
}

void AdamantPass(float4 vpos : SV_Position, float2 texcoord : TEXCOORD, out float4 fragment : SV_Target0)
{
   const float2 output_size = float2(BUFFER_WIDTH, BUFFER_HEIGHT);
   const float2 source_size = float2(CRT_WIDTH, CRT_HEIGHT);

   const uint screen_type           = uint(HCRT_CRT_SCREEN_TYPE);
   const uint crt_resolution        = uint(HCRT_CRT_RESOLUTION);
   const uint lcd_resolution        = uint(HCRT_LCD_RESOLUTION);
   const uint lcd_subpixel_layout   = uint(HCRT_LCD_SUBPIXEL);

   float2 tex_coord                 = texcoord - 0.5f.xx;
   tex_coord                        = tex_coord * float2(1.0f + (HCRT_PIN_PHASE * tex_coord.y), 1.0f);
   tex_coord                        = tex_coord * float2(HCRT_H_SIZE, HCRT_V_SIZE);
   tex_coord                        = tex_coord + 0.5f.xx;
   tex_coord                        = tex_coord + (float2(HCRT_H_CENT, HCRT_V_CENT) / output_size); 

   const float2 current_position      = texcoord * output_size;

   uint colour_mask = 0;

   switch(screen_type)
   {
      case kApertureGrille:
      {
         uint mask = uint(floor(mod(current_position.x, kApertureGrilleMaskSize[(lcd_resolution * kTVLAxis) + crt_resolution])));

         mask = mask;

         switch(lcd_resolution)
         {
            case k1080p:
            { 
               switch(crt_resolution)
               {
                  case k300TVL:
                  { 
                     colour_mask = kApertureGrilleMasks1080p300TVL[(lcd_subpixel_layout * 4) + mask];      
                     
                     break;
                  }
                  case k600TVL:
                  {
                     colour_mask = kApertureGrilleMasks1080p600TVL[(lcd_subpixel_layout * 2) + mask]; 

                     break;
                  }
                  case k800TVL:
                  {
                     colour_mask = kApertureGrilleMasks1080p800TVL[(lcd_subpixel_layout * 1) + mask]; 

                     break;
                  }
                  case k1000TVL:
                  {
                     colour_mask = kApertureGrilleMasks1080p1000TVL[(lcd_subpixel_layout * 1) + mask]; 

                     break;
                  }
                  default:
                  {
                     break;
                  }                 
               }

               break;
            }
            case k4K:
            {
               switch(crt_resolution)
               {
                  case k300TVL:
                  { 
                     colour_mask = kApertureGrilleMasks4K300TVL[(lcd_subpixel_layout * 7) + mask];      
                     
                     break;
                  }
                  case k600TVL:
                  {
                     colour_mask = kApertureGrilleMasks4K600TVL[(lcd_subpixel_layout * 4) + mask]; 

                     break;
                  }
                  case k800TVL:
                  {
                     colour_mask = kApertureGrilleMasks4K800TVL[(lcd_subpixel_layout * 3) + mask]; 

                     break;
                  }
                  case k1000TVL:
                  {
                     colour_mask = kApertureGrilleMasks4K1000TVL[(lcd_subpixel_layout * 2) + mask]; 

                     break;
                  }
                  default:
                  {
                     break;
                  }                 
               }

               break;
            }
            case k8K:
            {
               switch(crt_resolution)
               {
                  case k300TVL:
                  { 
                     colour_mask = kApertureGrilleMasks8K300TVL[(lcd_subpixel_layout * 13) + mask];      
                     
                     break;
                  }
                  case k600TVL:
                  {
                     colour_mask = kApertureGrilleMasks8K600TVL[(lcd_subpixel_layout * 7) + mask]; 

                     break;
                  }
                  case k800TVL:
                  {
                     colour_mask = kApertureGrilleMasks8K800TVL[(lcd_subpixel_layout * 5) + mask]; 

                     break;
                  }
                  case k1000TVL:
                  {
                     colour_mask = kApertureGrilleMasks8K1000TVL[(lcd_subpixel_layout * 4) + mask]; 

                     break;
                  }
                  default:
                  {
                     break;
                  }                 
               }

               break;
            }
            default:
            {
               break;
            }                 
         }

         break;
      }
      case kShadowMask:
      {
         uint shadow_y = uint(floor(mod(current_position.y, kShadowMaskSizeY[(lcd_resolution * kTVLAxis) + crt_resolution])));

         uint mask = uint(floor(mod(current_position.x, kShadowMaskSizeX[(lcd_resolution * kTVLAxis) + crt_resolution])));

         switch(lcd_resolution)
         {
            case k1080p:
            { 
               switch(crt_resolution)
               {
                  case k300TVL:
                  { 
                     colour_mask = kShadowMasks1080p300TVL[(lcd_subpixel_layout * 4 * 6) + (shadow_y * 6) + mask];      
                     
                     break;
                  }
                  case k600TVL:
                  {
                     colour_mask = kShadowMasks1080p600TVL[(lcd_subpixel_layout * 2 * 2) + (shadow_y * 2) + mask]; 

                     break;
                  }
                  case k800TVL:
                  {
                     colour_mask = kShadowMasks1080p800TVL[(lcd_subpixel_layout * 1 * 1) + (shadow_y * 1) + mask]; 

                     break;
                  }
                  case k1000TVL:
                  {
                     colour_mask = kShadowMasks1080p1000TVL[(lcd_subpixel_layout * 1 * 1) + (shadow_y * 1) + mask]; 

                     break;
                  }
                  default:
                  {
                     break;
                  }                 
               }

               break;
            }
            case k4K:
            {
               switch(crt_resolution)
               {
                  case k300TVL:
                  { 
                     colour_mask = kShadowMasks4K300TVL[(lcd_subpixel_layout * 8 * 12) + (shadow_y * 12) + mask];      
                     
                     break;
                  }
                  case k600TVL:
                  {
                     colour_mask = kShadowMasks4K600TVL[(lcd_subpixel_layout * 4 * 6) + (shadow_y * 6) + mask]; 

                     break;
                  }
                  case k800TVL:
                  {
                     colour_mask = kShadowMasks4K800TVL[(lcd_subpixel_layout * 2 * 2) + (shadow_y * 2) + mask]; 

                     break;
                  }
                  case k1000TVL:
                  {
                     colour_mask = kShadowMasks4K1000TVL[(lcd_subpixel_layout * 2 * 2) + (shadow_y * 2) + mask]; 

                     break;
                  }
                  default:
                  {
                     break;
                  }                 
               }

               break;
            }
            case k8K:
            {
               switch(crt_resolution)
               {
                  case k300TVL:
                  { 
                     colour_mask = kShadowMasks8K300TVL[(lcd_subpixel_layout * 8 * 12) + (shadow_y * 12) + mask];      
                     
                     break;
                  }
                  case k600TVL:
                  {
                     colour_mask = kShadowMasks8K600TVL[(lcd_subpixel_layout * 8 * 12) + (shadow_y * 12) + mask]; 

                     break;
                  }
                  case k800TVL:
                  {
                     colour_mask = kShadowMasks8K800TVL[(lcd_subpixel_layout * 4 * 6) + (shadow_y * 6) + mask]; 

                     break;
                  }
                  case k1000TVL:
                  {
                     colour_mask = kShadowMasks8K1000TVL[(lcd_subpixel_layout * 4 * 6) + (shadow_y * 6) + mask]; 

                     break;
                  }
                  default:
                  {
                     break;
                  }                 
               }

               break;
            }
            default:
            {
               break;
            }                 
         }

         break;
      }
      case kSlotMask:
      {
         uint slot_x = uint(floor(mod(current_position.x / kSlotMaskSizeX[(lcd_resolution * kTVLAxis) + crt_resolution], kMaxSlotSizeX)));
         uint slot_y = uint(floor(mod(current_position.y, kSlotMaskSizeY[(lcd_resolution * kTVLAxis) + crt_resolution])));

         uint mask = uint(floor(mod(current_position.x, kSlotMaskSizeX[(lcd_resolution * kTVLAxis) + crt_resolution])));

         switch(lcd_resolution)
         {
            case k1080p:
            { 
               switch(crt_resolution)
               {
                  case k300TVL:
                  { 
                     #define kMaxSlotMaskSize   4
                     #define kMaxSlotSizeY      4
                     
                     colour_mask = kSlotMasks1080p300TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  case k600TVL:
                  {
                     #define kMaxSlotMaskSize   2
                     #define kMaxSlotSizeY      4

                     colour_mask = kSlotMasks1080p600TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  case k800TVL:
                  {
                     #define kMaxSlotMaskSize   1
                     #define kMaxSlotSizeY      4

                     colour_mask = kSlotMasks1080p800TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  case k1000TVL:
                  {
                     #define kMaxSlotMaskSize   1
                     #define kMaxSlotSizeY      4

                     colour_mask = kSlotMasks1080p1000TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  default:
                  {
                     break;
                  }                 
               }

               break;
            }
            case k4K:
            {
               switch(crt_resolution)
               {
                  case k300TVL:
                  { 
                     #define kMaxSlotMaskSize   7
                     #define kMaxSlotSizeY      8

                     colour_mask = kSlotMasks4K300TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];        
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY      
                     
                     break;
                  }
                  case k600TVL:
                  {
                     #define kMaxSlotMaskSize   4
                     #define kMaxSlotSizeY      6

                     colour_mask = kSlotMasks4K600TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  case k800TVL:
                  {
                     #define kMaxSlotMaskSize   3
                     #define kMaxSlotSizeY      4

                     colour_mask = kSlotMasks4K800TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  case k1000TVL:
                  {
                     #define kMaxSlotMaskSize   2
                     #define kMaxSlotSizeY      4

                     colour_mask = kSlotMasks4K1000TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  default:
                  {
                     break;
                  }                 
               }

               break;
            }
            case k8K:
            {
               switch(crt_resolution)
               {
                  case k300TVL:
                  { 
                     #define kMaxSlotMaskSize   7
                     #define kMaxSlotSizeY      6

                     colour_mask = kSlotMasks8K300TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY        
                     
                     break;
                  }
                  case k600TVL:
                  {
                     #define kMaxSlotMaskSize   7
                     #define kMaxSlotSizeY      6

                     colour_mask = kSlotMasks8K600TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  case k800TVL:
                  {
                     #define kMaxSlotMaskSize   5
                     #define kMaxSlotSizeY      4

                     colour_mask = kSlotMasks8K800TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  case k1000TVL:
                  {
                     #define kMaxSlotMaskSize   4
                     #define kMaxSlotSizeY      4

                     colour_mask = kSlotMasks8K1000TVL[(lcd_subpixel_layout * kMaxSlotSizeY * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_y * kMaxSlotSizeX * kMaxSlotMaskSize) + (slot_x * kMaxSlotMaskSize) + mask];      
                     
                     #undef kMaxSlotMaskSize  
                     #undef kMaxSlotSizeY   

                     break;
                  }
                  default:
                  {
                     break;
                  }                 
               }

               break;
            }
            default:
            {
               break;
            }                 
         }

         break;
      }

      default:
      {
         break;
      }
   }

   const float scanline_size           = output_size.y / source_size.y;

   const float3 horizontal_convergence   = float3(HCRT_RED_HORIZONTAL_CONVERGENCE, HCRT_GREEN_HORIZONTAL_CONVERGENCE, HCRT_BLUE_HORIZONTAL_CONVERGENCE);
   const float3 vertical_convergence     = float3(HCRT_RED_VERTICAL_CONVERGENCE, HCRT_GREEN_VERTICAL_CONVERGENCE, HCRT_BLUE_VERTICAL_CONVERGENCE);
   const float3 beam_sharpness           = float3(HCRT_RED_BEAM_SHARPNESS, HCRT_GREEN_BEAM_SHARPNESS, HCRT_BLUE_BEAM_SHARPNESS);
   const float3 beam_attack              = float3(HCRT_RED_BEAM_ATTACK, HCRT_GREEN_BEAM_ATTACK, HCRT_BLUE_BEAM_ATTACK);
   const float3 scanline_min             = float3(HCRT_RED_SCANLINE_MIN, HCRT_GREEN_SCANLINE_MIN, HCRT_BLUE_SCANLINE_MIN);
   const float3 scanline_max             = float3(HCRT_RED_SCANLINE_MAX, HCRT_GREEN_SCANLINE_MAX, HCRT_BLUE_SCANLINE_MAX);
   const float3 scanline_attack          = float3(HCRT_RED_SCANLINE_ATTACK, HCRT_GREEN_SCANLINE_ATTACK, HCRT_BLUE_SCANLINE_ATTACK);

   const uint channel_count            = colour_mask & 3;

   float3 scanline_colour = 0.0f.xxx;

   if(channel_count > 0)
   {
      const uint channel_0             = (colour_mask >> kFirstChannelShift) & 3;

      const float scanline_channel_0   = GenerateScanline(  channel_0,
                                                            tex_coord,
                                                            source_size.xy, 
                                                            scanline_size, 
                                                            horizontal_convergence[channel_0], 
                                                            vertical_convergence[channel_0], 
                                                            beam_sharpness[channel_0], 
                                                            beam_attack[channel_0], 
                                                            scanline_min[channel_0], 
                                                            scanline_max[channel_0], 
                                                            scanline_attack[channel_0]);

      scanline_colour =  scanline_channel_0 * kColourMask[channel_0];
   }

   if(channel_count > 1)
   {
      const uint channel_1             = (colour_mask >> kSecondChannelShift) & 3;

      const float scanline_channel_1   = GenerateScanline(channel_1,
                                                          tex_coord,
                                                          source_size.xy, 
                                                          scanline_size, 
                                                          horizontal_convergence[channel_1], 
                                                          vertical_convergence[channel_1], 
                                                          beam_sharpness[channel_1], 
                                                          beam_attack[channel_1], 
                                                          scanline_min[channel_1], 
                                                          scanline_max[channel_1], 
                                                          scanline_attack[channel_1]);

      scanline_colour += scanline_channel_1 * kColourMask[channel_1];
   }

   if(channel_count > 2)
   {
      const uint channel_2             = (colour_mask >> kThirdChannelShift) & 3;

      const float scanline_channel_2   = GenerateScanline(channel_2,
                                                          tex_coord,
                                                          source_size.xy, 
                                                          scanline_size, 
                                                          horizontal_convergence[channel_2], 
                                                          vertical_convergence[channel_2], 
                                                          beam_sharpness[channel_2], 
                                                          beam_attack[channel_2], 
                                                          scanline_min[channel_2], 
                                                          scanline_max[channel_2], 
                                                          scanline_attack[channel_2]);

      scanline_colour += scanline_channel_2 * kColourMask[channel_2];
   }

   float3 transformed_colour;

   if(HCRT_COLOUR_ACCURATE >= 1.0f)
   {
      if(HCRT_HDR >= 1.0f)
      {
         const float3 rec2020  = mul(k2020Gamuts[uint(HCRT_CONTENT_GAMUT)], scanline_colour);
         transformed_colour  = rec2020 * (HCRT_PAPER_WHITE_NITS / kMaxNitsFor2084);
      }
      else if(HCRT_OUTPUT_COLOUR_SPACE == 2.0f)
      {
         transformed_colour = mul(kXYZ_to_DCIP3, mul(k709_to_XYZ, scanline_colour));
      }
      else
      {
         transformed_colour = scanline_colour;
      }
   } 
   else
   {      
      transformed_colour = scanline_colour;
   }

   float3 gamma_corrected; 
   
   GammaCorrect(transformed_colour, gamma_corrected);

   fragment = float4(gamma_corrected, 1.0f);
}

technique Adamant
{
	pass { VertexShader = PostProcessVS; PixelShader = Downsample; RenderTarget = SourceTexture; }
	pass { VertexShader = PostProcessVS; PixelShader = ColourPass; RenderTarget = SDRTexture; } 
	pass { VertexShader = PostProcessVS; PixelShader = HDRPass; RenderTarget = HDRTexture; }
	pass { VertexShader = PostProcessVS; PixelShader = AdamantPass; }
}
