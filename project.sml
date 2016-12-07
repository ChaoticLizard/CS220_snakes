(*Character datatypes*)

datatype PupilShape = Round | VerticallyElliptical;

datatype LorealScale = Absent | Present;
datatype DorsalScaleCharacter = Keeled | Smooth;
datatype HeadScales = Undifferentiated | LargePlatelike;

datatype Venom = Venomous | Nonvenomous;

datatype 'a option = NONE | SOME of 'a;

(*Taxonomic datatype*)

(* Defines a Genus by a pared down list of characters. The last two characters identify whether a snake is venomous or not, and what it's name is called*)

datatype Snake = Genus of PupilShape * LorealScale * DorsalScaleCharacter option list * HeadScales * Venom * string;

datatype specimen = Specimen of PupilShape option * LorealScale option * DorsalScaleCharacter option * HeadScales option; (* Specimen datatype for input *)

(* Venomous Snakes *)
val Bitis = Genus(VerticallyElliptical,Absent,[SOME Keeled],Undifferentiated,Venomous,"Bitis");
val Causus = Genus(Round,Present,[SOME Smooth, SOME Keeled],LargePlatelike,Venomous,"Causus");
val Cerastes = Genus(VerticallyElliptical,Absent,[SOME Keeled],Undifferentiated,Venomous,"Cerastes");

(* Nonvenomous Snakes *)
val Boaedon = Genus(VerticallyElliptical,Present,[SOME Smooth],LargePlatelike,Nonvenomous,"Boaedon");
val Crotaphopeltis = Genus(VerticallyElliptical,Present,[SOME Smooth, SOME Keeled],LargePlatelike,Nonvenomous,"Crotaphopeltis");
val Dasypeltis = Genus(VerticallyElliptical,Absent,[SOME Keeled],LargePlatelike,Nonvenomous,"Dasypelits");

val Genera = [Bitis, Causus, Cerastes, Boaedon, Crotaphopeltis, Dasypeltis];

(* Test specimens *)

val unknownsnake = Specimen(SOME VerticallyElliptical, SOME Absent, SOME Keeled, SOME Undifferentiated);
val maybefriendlysnake = Specimen(NONE, SOME Present, SOME Keeled, SOME LargePlatelike);
val friendlysnake = Specimen(SOME VerticallyElliptical, SOME Absent, SOME Keeled, SOME LargePlatelike);

fun contains(x, []) = false
  | contains(x, y::rest) =
     x = y orelse contains(x, rest);

fun filter(f, []) = []
  | filter(f, a::rest) = if f(a) 
			 then a::filter(f,rest) 
			 else filter(f,rest);

(* This function checks a specimen against a single genus description *)

fun checkSnake(Specimen(sPupil, sLoreal, sDorsal, sHead),Genus(gPupil, gLoreal, gDorsal, gHead, venom, name)) = 
   let fun checkCharacter(NONE, target) = true
         | checkCharacter(character, target) = character = target;
       fun containsOPTION(NONE, []) = true
         | containsOPTION(x, []) = false
         | containsOPTION(NONE, y::rest) = true
         | containsOPTION(x, y::rest) =
            x = y orelse containsOPTION(x, rest);
   in
   (checkCharacter(sPupil, SOME gPupil) andalso checkCharacter(sLoreal, SOME gLoreal) andalso containsOPTION(sDorsal, gDorsal) andalso checkCharacter(sHead, SOME gHead))
   end;

(* This function returns a list of snake genera matching the specimen in quesiton *)

fun identify(snek,generalist) = 
   let 
     fun matchGenera(snek,generalist) = filter(fn(x) => checkSnake(snek, x), generalist);
     fun getNames([]) = []
       | getNames(Genus(gPupil, gLoreal, gDorsal, gHead, venom, name)::rest) = name::getNames(rest);
   in
     getNames(matchGenera(snek,generalist))
   end;

(* This function checks if a snake is venomous or not *)

fun isVenomous(snek,generalist) =
   let 
     fun matchGenera(snek,generalist) = filter(fn(x) => checkSnake(snek, x), generalist);
     fun checkVenom([]) = []
       | checkVenom(Genus(gPupil, gLoreal, gDorsal, gHead, venom, name)::rest) = if venom = Venomous then true::checkVenom(rest) else false::checkVenom(rest);
     fun weighvenom(lst) = if contains(false, lst) andalso contains(true, lst) then "This snake may be venomous - Exercise Caution" 
                           else if contains(false, lst) then "This snake is nonvenomous"
                           else if contains(true, lst) then "This snake is venomous"
                           else "Something went wrong";
   in
     weighvenom(checkVenom(matchGenera(snek,generalist)))
   end;

(* Using the functions *)

identify(unknownsnake, Genera); (*Should return the two genera that match this snake's description, both venomous *)
isVenomous(unknownsnake, Genera); (* Should return "Venomous" *)
identify(maybefriendlysnake, Genera);
isVenomous(maybefriendlysnake, Genera);
identify(friendlysnake, Genera); (* Should return a single genus, which is nonvenomous *)
isVenomous(friendlysnake, Genera); (*Should return "nonvenomous" *)

