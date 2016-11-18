(*Taxonomic datatypes*)

datatype Genus = PupilShape * LorealScale * DorsalScaleCharacter list * Headscales * Venomous;
datatype Specimen = PupilShape * LorealScale * DorsalScaleCharacter * Headscales;

(*Character datatypes*)

datatype PupilShape = Round | VerticallyElliptical;

datatype LorealScale = Absent | Present;
datatype DorsalScaleCharacter = Keeled | Smooth;
datatype HeadScales = Undifferentiated | LargePlatelike;


datatype Venom = Venomous | NonVenomous;

val Bitis = Genus(VerticallyElliptical,Absent,[Keeled],Undifferentiated,Venomous);
val Causus = Genus(Round,Present,[Smooth,Keeled],LargePlatelike,Venomous);
val Cerastes = Genus(VerticallyElliptical,Absent,[Keeled],Undifferentiated,Venomous);

val Boaedon = Genus(VerticallyElliptical,Present,[Smooth],LargePlatelike,NonVenomous);
val Crotaphopeltis = Genus(VerticallyElliptical,Present,[Smooth,Keeled],LargePlatelike,NonVenomous);
val Dasypeltis = Genus(VerticallyElliptical,Absent,[Keeled],LargePlatelike,NonVenomous);

val unknownsnake = Specimen(VerticallyElliptical,Absent,Keeled,Undifferentiated);
