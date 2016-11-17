(*Taxonomic datatypes*)

datatype Genus = PupilShape * LorealScale * DorsalScaleCharacter list * Headscales * Venomous;

(*Character datatypes*)

datatype PupilShape = Round | VerticallyElliptical;

datatype LorealScale = Absent | Present;
datatype DorsalScaleCharacter = Keeled | Smooth;
datatype HeadScales = Undifferentiated | LargePlatelike;


datatype Venom = Venomous | NonVenomous;

val Bitis = Genus(VerticallyElliptical,Absent,[Keeled],Undifferentiated);
val Causus = Genus(Round,Present,[Smooth,Keeled],LargePlatelike);
val Cerastes = Genus(VerticallyElliptical,Absent,[Keeled],Undifferentiated);
val Boaedon = Genus(VerticallyElliptical,Present,[Smooth],LargePlatelike);
val Crotaphopeltis = Genus(VerticallyElliptical,Present,[Smooth,Keeled],LargePlatelike);
val Dasypeltis = Genus(VerticallyElliptical,Absent,[Keeled],LargePlatelike);
