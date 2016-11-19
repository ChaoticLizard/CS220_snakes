(*Taxonomic datatype*)

datatype Snake = Genus of PupilShape * LorealScale * DorsalScaleCharacter * HeadScales;

(*Character datatypes*)

datatype PupilShape = Round | VerticallyElliptical;

datatype LorealScale = Absent | Present;
datatype DorsalScaleCharacter = Keeled | Smooth | KeeledAndSmooth;
datatype HeadScales = Undifferentiated | LargePlatelike;

(*Venomous Snakes*)
val Bitis = Genus(VerticallyElliptical,Absent, Keeled,Undifferentiated);
val Causus = Genus(Round,Present, KeeledAndSmooth,LargePlatelike);
val Cerastes = Genus(VerticallyElliptical,Absent, Keeled,Undifferentiated);

(*NonVenomous Snakes*)
val Boaedon = Genus(VerticallyElliptical,Present,Smooth,LargePlatelike);
val Crotaphopeltis = Genus(VerticallyElliptical,Present,KeeledAndSmooth,LargePlatelike);
val Dasypeltis = Genus(VerticallyElliptical,Absent,Keeled,LargePlatelike);

val unknownsnake = Specimen(VerticallyElliptical,Absent,Keeled,Undifferentiated);

fun checkCharacter (character, target) = character = target;

fun hasVenomousCharacteristics (PupilShape, LorealScale, DorsalScaleCharacter, HeadScales) = if (checkCharacter(PupilShape, Round)) then true else if (checkCharacter(HeadScales, Undifferentiated)) then true else false;

fun isSnakeVenomous (Genus(list)) = isVenomous(list); 
