(*Taxonomic datatypes*)

datatype Family = Genera of Genus list;
datatype Genus = ;

(*Character datatypes*)

datatype HeadShape = Triangular | Flat | Short | Elongated | Broad | Oval;
datatype SnoutShape = Rounded | Wedge | Square | Short_Blunt | Elongate | Pointed | Beak_like;
datatype NeckCharacter = Indistinct | MildlyDistinct | Distinct; (*May remove later*)
datatype BodyShape = LaterallyCompressed | Elongate | TransverselyFlattened | Short_Stout | Triangular;
datatype TailCharacter = Short | Medium | Long | Blunt | Pointed | Slender | Prehensile | Rounded | Tapered; (*May remove later*)
datatype PupilShape = Round | VerticallyElliptical | HorizontallyElliptical | TearShaped;
datatype EyeSize = Small | Medium | Large;
datatype Rostral = Rounded | Shieldlike | Small | Pointed | Large | Protruding | LeafShaped | Flattened_Shovellike | PointingDownwards;
datatype Nasal = Single | Semidivided | Divided;
datatype Internasals = Absent | PairedOrOther | Single;
datatype Prefrontals = Absent | Single | PairedOrOther;
datatype ChinShields = Absent | OnexOne | TwoxTwo | OnexTwoFalseChinShields | TwoxTwoFalseChinShields; 

