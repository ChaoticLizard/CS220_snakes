(*Taxonomic datatypes*)

datatype Snake = Genus of PupilShape * LorealScale * DorsalScaleCharacter list * HeadScales * Venom;
(*datatype Specimen = PupilShape * LorealScale * DorsalScaleCharacter * Headscales;*)

(*Character datatypes*)

datatype PupilShape = Round | VerticallyElliptical;

datatype LorealScale = Absent | Present;
datatype DorsalScaleCharacter = Keeled | Smooth | KeeledAndSmooth;
datatype HeadScales = Undifferentiated | LargePlatelike;

datatype Venom = Venomous | NonVenomous; 

val Bitis = Genus(VerticallyElliptical,Absent, Keeled,Undifferentiated,Venomous);
val Causus = Genus(Round,Present, SmoothAndKeeled,LargePlatelike,Venomous);
val Cerastes = Genus(VerticallyElliptical,Absent, Keeled,Undifferentiated,Venomous);

val Boaedon = Genus(VerticallyElliptical,Present,Smooth,LargePlatelike,NonVenomous);
val Crotaphopeltis = Genus(VerticallyElliptical,Present,SmoothAndKeeled,LargePlatelike,NonVenomous);
val Dasypeltis = Genus(VerticallyElliptical,Absent,Keeled,LargePlatelike,NonVenomous);

val unknownsnake = Specimen(VerticallyElliptical,Absent,Keeled,Undifferentiated);
