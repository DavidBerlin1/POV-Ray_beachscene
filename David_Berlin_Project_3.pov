// POV-Ray 3.6/3.7 Scene File "HF_by_function_32.pov"
// author: Friedrich A. Lohmueller, Oct-2008/Aug-2009/Jan-2011
// email:  Friedrich.Lohmueller_at_t-online.de 
// homepage: http://www.f-lohmueller.de
//--------------------------------------------------------------------------
#version 3.6; // 3.7;
 
//--------------------------------------------------------------------------           


#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"        


global_settings { assumed_gamma 1.2 }

// camera -----------------------------------------------------------
#declare Cam0 = camera {/*ultra_wide_angle*/ angle 85
                        location <5.0 , 4.0 ,17.50>
                        look_at   <4.0 , -1.5, 35.0>} 
                        
#declare Cam1 = camera {angle 85
                        location <5,1,24.5>
                        look_at <4,-1.5,35>}
camera{Cam0}
// sun ---------------------------------------------------------------
light_source{<10000,20000,100000> color Orange}   
  
        
     
    light_source
    {<0,0,250> 
    rgb <1,0,0>
    spotlight
    radius 80
    falloff  100
    tightness 0
    point_at <1,1,0>}   
                       
   
    

          
// sky ----------------------------------
sky_sphere{
 pigment{ gradient <0,1,0>
          color_map{
     [0.00 color rgb<0.24,0.32,1> *1]
     [0.23 color rgb<0.16,0.32,0.9> *0.9]
     [0.37 color rgb<1,0.1,0> ]
     [0.52 color rgb<1,0.2,0> ]
     [0.70 color rgb<0.36,0.32,1> *0.7 ]
     [0.80 color rgb<0.14,0.32,1> *0.5 ]
     [1.00 color rgb<0.24,0.32,1> *0.3 ]
                   } // end color_map
     scale 2
     rotate <-20,0,0>
     translate <0,0.7,0>
 } // end pigment
} // end sky_sphere ---------------------
               //---------------------------------------------------------------------
height_field{ png "Mount1.png" smooth double_illuminate
              // file types: 
              // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
              // [water_level N] // truncate/clip below N (0.0 ... 1.0)
              translate<-0.5,-.1,-0.5>
              scale<20,.8,20>*1 
              texture {

        pigment {color rgb <1,0.9, 0.45>}
        normal {granite 0.2 scale 0.0005
        }
        normal {bumps 0.4 scale 4
        }
        
        finish {
        brilliance 1.6
        specular 0.3
        ambient 0.05
        }
        }
              rotate<0, 0,0>
              translate<2,0,30>
            } // end of height_field ----------------------------------
//---------------------------------------------------------------------
      
// fog ---------------------------------------------------------------
fog{fog_type   2   distance 55  color rgb<1,0.99,0.9>
    fog_offset 0.1 fog_alt  2.0 turbulence 1.2 turb_depth 0.3}
// Water plane --------------------------------------------------------------------

plane{<0,1,0>, 0 
      texture{pigment{ rgb <0.2, 0.2, 0.2> } 
              normal {bumps 0.08 scale <1,0.25,0.35>*1 turbulence 0.6 }
              finish { ambient 0.05 diffuse 0.55 
                       brilliance 6.0 phong 0.8 phong_size 120
                       reflection 0.6 } 
                     
             }
     }

   
// End water plane ----------------------------------------------------------------


#declare Teepee_Outside = cone 

                {<5, 0, 27.5>, 1.0, <5, 2.5, 27.5>, 0     open

                     texture{ T_Wood2 
                        
                finish { phong 1 }  
                }     
                }
                
#declare Teepee = intersection

        {
            object {Teepee_Outside}
            object {Teepee_Outside scale <1,1,1> translate <0,-.5,-.4> inverse}
            
           // sphere{<5,.55,27>, 0.55 inverse}
            }               
   object {Teepee }
//Flora as palm trees -------------------------------------------------
#include "Palm_2.inc"

object{ Palm_2(2.00,
                   7
                   )
                   
            scale<1,1,1>*1    
            rotate<0,30,0>
            translate<-3,0,27.5>
            }        
 object{ Palm_2(2.00,
                   7
                   )
                   
            scale<1,1,1>*1    
            rotate<0,30,0>
            translate<8.5,0,23.5>
            }   
            
            
            
            
            
            
 object{ Palm_2(2.00,
                   7
                   )
                   
            scale<1,1,1>*1.5    
            rotate<0,30,0>
            translate<5.5,0,33.0>
            }     
                      
            
//End flora ------------------------------------------------------------              









//Begin fire -----------------------------------------------------------

       #include "Candle_2.inc"
#declare Candle_Texture = 
  texture{ pigment{ rgb<1,1,0.95>*1.3}
           normal { bumps 0.15 scale <0.05,0.1,0.05>*2} 
           finish { reflection {0.02}}
         } // end texture
#declare Candle_Wax_Liquid_Texture = 
  texture{ pigment{ rgbf<1,0.9,0.6,0.05>*1.3}
           normal { bumps 0.15 scale <0.05,0.1,0.05>*2} 
           finish { reflection {0.30}}
         } // end texture
         
         
         
object{ Candle_2( 0.3,  // Shining_On, 0= off, >0 = intensity of candle light 
                  0, // Flame_Shadow, // >0 = intensity ; 0 = off
                  1.0,  // Candle_Height, relative to diameter (d=1) 
                  1.2,  // Candle_Intensity,  
                  0.7   // Candle_Flame_Scale
                  4, // Fade_Distance, //  3 ~ 5    
                  3 // Fade_Power //   2,3,4
                 ) // -------------------------
        scale 1
        rotate<0,0,0>
        translate<5.2,-.9,26.2> 
      }  
      
      
      
      
   cylinder {<5.1,0.1,26.2>, <5.3,0.3,26.2>, .03
   
             texture{  
             pigment{DMFWood1 scale .01 turbulence 1 phase .5} 
            
              
              
              
              }
              
   
   } 
     
     
     cylinder {<5.1,0.3,26.1>, <5.25,0.1,26.25>, .03
   
             texture{  
             pigment{DMFWood1 scale .01 turbulence 1 phase .5} 
            
              
              
              
              }
              
   
   }
   
   cylinder {<5.2,0.1,26.1>, <5.2,0.3,26.25>, .03
   
             texture{  
             pigment{DMFWood1 scale .01 turbulence 1 phase .5} 
            
              
              
              
              }
              
   
   }
   
   cylinder {<5.1,0.3,26.25>, <5.3,0.1,26.1>, .03
   
             texture{  
             pigment{DMFWood1 scale .01 turbulence 1 phase .5} 
            
              
              
              
              }
              
   
   } 
   
   
   
   
   
   
   


