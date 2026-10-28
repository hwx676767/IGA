//Maya ASCII 2024 scene
//Name: throw.ma
//Last modified: Sat, May 18, 2024 03:31:29 PM
//Codeset: 936
file -rdi 1 -ns "zombie_rig_ver2" -rfn "zombie_rig_ver2RN" -op "v=0;" -typ "mayaAscii"
		 "D:/my_project/IGA/huo_yongzhe/The_scream//scenes/root/zombie_rig_ver2.ma";
file -r -ns "zombie_rig_ver2" -dr 1 -rfn "zombie_rig_ver2RN" -op "v=0;" -typ "mayaAscii"
		 "D:/my_project/IGA/huo_yongzhe/The_scream//scenes/root/zombie_rig_ver2.ma";
requires maya "2024";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" "mtoa" "5.3.4.1";
requires -nodeType "mayaUsdLayerManager" -dataType "pxrUsdStageData" "mayaUsdPlugin" "0.25.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2024";
fileInfo "version" "2024";
fileInfo "cutIdentifier" "202310181224-69282f2959";
fileInfo "osv" "Windows 11 Home China v2009 (Build: 22631)";
fileInfo "UUID" "CFFC79BD-4605-DBDD-6EC1-9DAD58C90EAB";
createNode transform -s -n "persp";
	rename -uid "CB83D6D4-4739-A888-0154-F29C57377E8D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 167.66730155359659 90.537940832403038 350.50149751263052 ;
	setAttr ".r" -type "double3" 0.26164727035618951 23.800000000000463 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "9A053082-468D-083F-6D77-C590299BA0CE";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 380.72105692672261;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -81.043482487581969 140.03165938134737 -4.2616896347353208 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "06D83D29-430D-1D74-0C61-2C89B772A247";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -76.912338408277805 1012.3056343898891 -7.5044070189269654 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "BB50671F-4623-4725-0682-90BA01E31A0C";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 870.15007808994926;
	setAttr ".ow" 20.899268010729621;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" -55.046963962616559 142.15555629993986 -4.4912264385571499 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "F28A28AC-41C9-5B4F-D401-A7A9E05D2B08";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.31806426626715267 157.32177908049385 1013.738817410473 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "CBB99422-4A90-6585-EA9B-14B4AED892C8";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1011.5805613720926;
	setAttr ".ow" 31.442330931624998;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -2.9309887850104133e-14 164.85683423372467 2.1582560383804283 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "BD0519F1-464C-F53B-3BE8-1CB171E956B8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1006.3781955596816 172.83603884885056 0.36675287486528174 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "9D9FB193-4BE2-55FB-95C4-7F86824DB6A9";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1006.3781955596816;
	setAttr ".ow" 36.634976817848177;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" -2.2204460492503131e-16 168.29414451456967 16.889503227232112 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "group1";
	rename -uid "A78D4263-4611-4450-75AB-04A7A5B58C04";
	setAttr ".v" no;
	setAttr ".s" -type "double3" 0.94694749454830129 0.94694749454830129 0.94694749454830129 ;
createNode joint -n "mixamorig5:Hips" -p "group1";
	rename -uid "9FCEC526-4DAA-169B-9FAE-31B76E5FCCA1";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:Spine" -p "mixamorig5:Hips";
	rename -uid "FD5F61C5-4B40-1AB9-3C20-DEA47E8BBE73";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0 8.8360996246337891 -1.36080002784729 ;
	setAttr ".jo" -type "double3" -8.7552 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:Spine1" -p "mixamorig5:Spine";
	rename -uid "FC0AF186-4BB5-B40C-CBD3-FCBF47EFD8E8";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.5419818297045716e-14 10.027239284151719 0.15945203781992845 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:Spine2" -p "mixamorig5:Spine1";
	rename -uid "0A2B69F6-4AC3-EB47-35C8-0C9C2B0F8A61";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.7941337710766528e-14 22.712847905861807 2.1234775773174519 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:Neck" -p "mixamorig5:Spine2";
	rename -uid "ABCCCD89-427B-8156-5000-90AD0ECA4287";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 4.6565057977522517e-14 16.939969747716191 3.186111175540649 ;
	setAttr ".jo" -type "double3" 8.7553 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:Head" -p "mixamorig5:Neck";
	rename -uid "94796712-4082-931C-3FA7-6E9A5C367735";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -6.8766743410213546e-15 8.0701929939698402 4.0936887486982982 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:HeadTop_End" -p "mixamorig5:Head";
	rename -uid "71B2E3BA-4A8E-998D-8A96-B3A81105C93C";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 3.9109518563334422e-15 15.748321666857208 -0.26340010472131326 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftShoulder" -p "mixamorig5:Spine2";
	rename -uid "8F04BDEA-4318-4989-0ED8-33AE65970199";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 10.7821618840822 10.918575297260418 -3.3619755609399284 ;
	setAttr ".jo" -type "double3" -77.1287 87.5577 178.6957 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftArm" -p "mixamorig5:LeftShoulder";
	rename -uid "A0D63731-4146-2260-9CDD-E09B950C18AD";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.029678462188851285 13.914025157978276 0.2280217505927169 ;
	setAttr ".jo" -type "double3" -7.9083 0 1.4379 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftForeArm" -p "mixamorig5:LeftArm";
	rename -uid "92D89DEA-430F-B60B-4D8E-0DB2317479E1";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.14961611996194968 22.923094701703672 -1.7897426020890634 ;
	setAttr ".jo" -type "double3" -7.746 0 4.9094000000000007 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHand" -p "mixamorig5:LeftForeArm";
	rename -uid "3F9AE2CA-4C3B-625B-19DC-B58C5F5EBB10";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.029317290427077758 26.86828609973459 1.0511586903312207 ;
	setAttr ".jo" -type "double3" 7.1417 14.6564 2.0726 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandThumb1" -p "mixamorig5:LeftHand";
	rename -uid "BCF1A6D0-466C-8347-0980-7D8E7F767C73";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.9702983792682147 3.7624024213706235 0.68905140303235157 ;
	setAttr ".jo" -type "double3" 19.9907 0 32.6603 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandThumb2" -p "mixamorig5:LeftHandThumb1";
	rename -uid "FAA6C754-4111-66A1-D877-22BDAF5513A6";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.29106435657332597 3.9075564066538782 -0.035020306687300717 ;
	setAttr ".jo" -type "double3" 8.1684 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandThumb3" -p "mixamorig5:LeftHandThumb2";
	rename -uid "F7A0CD7C-4126-ACC3-A960-22A5FF354DED";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.025435247373806646 3.0101209697037135 -0.38494176085654885 ;
	setAttr ".jo" -type "double3" -6.3411 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandThumb4" -p "mixamorig5:LeftHandThumb3";
	rename -uid "6C2BADD2-467D-4A27-E346-D5AB181E1FC1";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.020438412087781188 3.3687049588334608 -0.013462841142597881 ;
	setAttr ".r" -type "double3" 0 -2.2077613456589531 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandIndex1" -p "mixamorig5:LeftHand";
	rename -uid "D627A8B9-459D-8E6D-9705-42BC95DB73A6";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -2.1385061650721156 9.0909513657020824 -0.80128903333070411 ;
	setAttr ".jo" -type "double3" 10.2216 0 7.0164 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandIndex2" -p "mixamorig5:LeftHandIndex1";
	rename -uid "D9122F3D-4C7B-F36D-F0AF-EC896E595478";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.089952950622169681 5.8618096998635565 -1.0598025299815106 ;
	setAttr ".jo" -type "double3" -0.2177 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandIndex3" -p "mixamorig5:LeftHandIndex2";
	rename -uid "B4A9A1D1-4CAD-BEDB-A92D-4ABE55F1CE99";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.053520789186439544 2.9581797063567521 -0.64345216741011768 ;
	setAttr ".jo" -type "double3" 3.5013 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandIndex4" -p "mixamorig5:LeftHandIndex3";
	rename -uid "743FAB3B-4501-4583-8726-99B75A64B769";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.071620414598585924 2.6953577327204101 -0.95336043962103645 ;
	setAttr ".r" -type "double3" 0 1.8971490671465741 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandMiddle1" -p "mixamorig5:LeftHand";
	rename -uid "E4E7D2BE-4522-AE16-DCC4-6DB4E3EBDFB0";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.43202687524967587 8.9169247444806814 -0.45012664213618336 ;
	setAttr ".jo" -type "double3" 2.972 0 -3.3337 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandMiddle2" -p "mixamorig5:LeftHandMiddle1";
	rename -uid "A61E8E1D-411D-0A5C-2594-1BBFC5E387A7";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.023570060802668991 6.3446847710373362 -0.33371666019900204 ;
	setAttr ".jo" -type "double3" 9.8705 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandMiddle3" -p "mixamorig5:LeftHandMiddle2";
	rename -uid "384D6965-4B71-8696-AC57-E98E75C1F9E5";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.0065125654590847404 3.4564602765961254 -0.4541578850249266 ;
	setAttr ".jo" -type "double3" -1.986 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandMiddle4" -p "mixamorig5:LeftHandMiddle3";
	rename -uid "D7CA19F1-48C9-BC70-92B8-D9BAB7D9B3B9";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.011883528641884578 3.2841573633279353 -0.4329314589797093 ;
	setAttr ".r" -type "double3" -6.7032174916803005 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandRing1" -p "mixamorig5:LeftHand";
	rename -uid "774D6706-4AA2-E1D3-D5CB-E4BEB38B837F";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.9480798044308472 8.8246285920262011 -0.28289790117833036 ;
	setAttr ".jo" -type "double3" 11.4216 0 -7.14 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandRing2" -p "mixamorig5:LeftHandRing1";
	rename -uid "50F425AF-41C8-B7EA-06E9-AEB05CF2F6F5";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.044333023881968359 5.3239522548257696 -1.0239314289729009 ;
	setAttr ".jo" -type "double3" 2.9003 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandRing3" -p "mixamorig5:LeftHandRing2";
	rename -uid "0B4F00B3-4D02-9BF3-FDD6-409E96C96F4D";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.019262009008971237 3.0405730213095055 -0.27004454748333728 ;
	setAttr ".jo" -type "double3" -8.3073 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandRing4" -p "mixamorig5:LeftHandRing3";
	rename -uid "CAAAF781-47FA-BD22-D902-178DA5081FA4";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.043500990942276552 2.5789402187506667 -0.19283828328849495 ;
	setAttr ".r" -type "double3" -7.9854483116545696 4.3867988024298867 -0.61476360622483439 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandPinky1" -p "mixamorig5:LeftHand";
	rename -uid "C77B775C-42D4-E087-D006-309EB6358D31";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 5.2434263073293081 8.9438656635925611 0.50984300469391997 ;
	setAttr ".jo" -type "double3" 15.346500000000002 0 -18.2474 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandPinky2" -p "mixamorig5:LeftHandPinky1";
	rename -uid "C9AAED4D-44C1-2BC7-2B2A-4392E5DACDA2";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.04934733213769249 3.8667139263662413 -1.0862757438279402 ;
	setAttr ".jo" -type "double3" 2.2464 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandPinky3" -p "mixamorig5:LeftHandPinky2";
	rename -uid "4DE08D6E-4D9A-8E3E-2DC5-46AB3C3193EC";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.14980029078403057 2.3819685715757046 -0.64317314637349909 ;
	setAttr ".jo" -type "double3" -8.463 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftHandPinky4" -p "mixamorig5:LeftHandPinky3";
	rename -uid "2BED0E75-4E3A-581A-1392-03A69A58BEF1";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.049846176536433973 2.3378302434353273 -0.43026139061385038 ;
	setAttr ".r" -type "double3" -10.97708951701693 3.12080153131661 -0.60500566677271728 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightShoulder" -p "mixamorig5:Spine2";
	rename -uid "BE411AE7-40FA-FADE-5748-01B8246B79AB";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -10.782161884082136 10.918575297260418 -3.3619755609399284 ;
	setAttr ".jo" -type "double3" -77.2623 -87.998800000000017 -178.4943 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightArm" -p "mixamorig5:RightShoulder";
	rename -uid "F5313146-4C3D-E89F-50DE-0DB2326E6DDF";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.049767777744785135 13.914221901126858 0.21195018569019908 ;
	setAttr ".jo" -type "double3" -7.9973 0 -0.873 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightForeArm" -p "mixamorig5:RightArm";
	rename -uid "CB35ECC0-45EB-B09B-A997-678D54E433C8";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.37974009439945178 22.914929683472149 -1.8589323093084147 ;
	setAttr ".jo" -type "double3" -7.5641000000000007 0 -6.0421 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHand" -p "mixamorig5:RightForeArm";
	rename -uid "E07E0F40-4193-9656-29E1-E3BB554ED10D";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.059463390924644699 26.880308011642491 -0.6753497888777531 ;
	setAttr ".jo" -type "double3" 6.5924 -13.1837 2.1146 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandThumb1" -p "mixamorig5:RightHand";
	rename -uid "14667D9A-44C5-A419-1714-9C88B47982ED";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 2.5119479425874114 3.9900505373300774 1.105780503319977 ;
	setAttr ".jo" -type "double3" 21.3493 0 -34.4028 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandThumb2" -p "mixamorig5:RightHandThumb1";
	rename -uid "B0D91DAD-492B-2349-A371-2E8E28CD1B7A";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.082693441563622017 3.9156341155870584 0.12614626324153733 ;
	setAttr ".jo" -type "double3" 9.528 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandThumb3" -p "mixamorig5:RightHandThumb2";
	rename -uid "669C2C1D-4279-B5D0-2D3A-5599A4F4C579";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.076542562112266843 3.0209094159432155 -0.27911091014334488 ;
	setAttr ".jo" -type "double3" -12.6844 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandThumb4" -p "mixamorig5:RightHandThumb3";
	rename -uid "82C90422-4005-D58C-D019-E5ACDCA8A0F2";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.15882517234299698 3.3367652756588644 0.43536648482952955 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandIndex1" -p "mixamorig5:RightHand";
	rename -uid "E1027D75-4B29-CC97-B7C6-C7B733E57649";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 1.8678724429106155 9.129748224420716 -1.0096629943946311 ;
	setAttr ".jo" -type "double3" 10.316800000000002 0 -9.7126 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandIndex2" -p "mixamorig5:RightHandIndex1";
	rename -uid "641E6A7E-424F-0072-CE18-5394965907D6";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.050078310625646161 5.7671485903644282 -1.4931762095472436 ;
	setAttr ".jo" -type "double3" 0.9954 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandIndex3" -p "mixamorig5:RightHandIndex2";
	rename -uid "078046CE-4115-C73E-7121-5DA8EC136938";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.017130692894660626 2.8870007874974988 -0.91249949812069531 ;
	setAttr ".jo" -type "double3" -2.7427 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandIndex4" -p "mixamorig5:RightHandIndex3";
	rename -uid "D6ECA26E-4313-75EF-AD83-3FB46E56A063";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.0023592072629758931 2.711903446619516 -0.90804903464061226 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandMiddle1" -p "mixamorig5:RightHand";
	rename -uid "D2CE3356-406B-713A-34AE-DEB57FB1ABA4";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.69362709111966314 8.8127181585305507 -1.3250238603141327 ;
	setAttr ".jo" -type "double3" 6.3241 0 2.3689999999999998 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandMiddle2" -p "mixamorig5:RightHandMiddle1";
	rename -uid "630E3856-4820-12D2-411A-08A8DDACF9CE";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.0022176870243582059 6.2547637523306889 -1.1157386276759098 ;
	setAttr ".jo" -type "double3" 4.5375 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandMiddle3" -p "mixamorig5:RightHandMiddle2";
	rename -uid "CEF0FFF1-4E67-DD6A-FE09-78B85B07827E";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.025182271622386843 3.4375785881948318 -0.57951595742173367 ;
	setAttr ".jo" -type "double3" 1.1864 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandMiddle4" -p "mixamorig5:RightHandMiddle3";
	rename -uid "FC7036DB-4AD1-8CE0-2FC5-E4A590F6D0B5";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.014105438007398163 3.2307317379336027 -0.73173345743819596 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandRing1" -p "mixamorig5:RightHand";
	rename -uid "1B6D8329-4335-42BA-6134-719A1346333A";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -3.1576290479673093 8.567243163816336 -1.8102483007769479 ;
	setAttr ".jo" -type "double3" 2.4231 0 4.7049 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandRing2" -p "mixamorig5:RightHandRing1";
	rename -uid "F5DA7E1B-4192-7697-B18A-BBB49153BF66";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.0061665800004162552 5.3912537218075869 -0.57377162730168152 ;
	setAttr ".jo" -type "double3" 13.1386 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandRing3" -p "mixamorig5:RightHandRing2";
	rename -uid "F1B278FC-4AB2-20EE-45C6-4A8C6E001666";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.0098475105027207022 2.9982102744942871 -0.57360052038467302 ;
	setAttr ".jo" -type "double3" -11.9342 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandRing4" -p "mixamorig5:RightHandRing3";
	rename -uid "A1475BB5-46ED-9DE5-E6D3-F499507CC5F2";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.005528116903664726 2.5854130905349493 -0.074967878577155034 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandPinky1" -p "mixamorig5:RightHand";
	rename -uid "E539B077-4D03-2E39-7E0E-5AAEEBCAB7C8";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -5.5838533287734036 8.5922935290066249 -1.6550728843031663 ;
	setAttr ".jo" -type "double3" 8.0299 0 17.8806 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandPinky2" -p "mixamorig5:RightHandPinky1";
	rename -uid "B4CD8F02-4774-E28F-2CA5-C4AF7CFA7AAD";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.0052454948580020755 3.9173331702464935 -0.8879076850904255 ;
	setAttr ".jo" -type "double3" 10.1264 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandPinky3" -p "mixamorig5:RightHandPinky2";
	rename -uid "D23938E5-4625-E698-00FE-93A176CC2AE5";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.044831634986454816 2.3184279510187178 -0.85601872628419073 ;
	setAttr ".jo" -type "double3" -7.5426000000000011 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightHandPinky4" -p "mixamorig5:RightHandPinky3";
	rename -uid "7EC24DAB-4C62-11CC-D703-FC842EA8C065";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.0066443250161549727 2.2806333509770269 -0.67210648266888029 ;
	setAttr ".r" -type "double3" 9.1356945469635704 0 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftUpLeg" -p "mixamorig5:Hips";
	rename -uid "1FE49DEB-4945-16A5-B8BF-A1AAC15449EE";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 9.1539813761732596 -6.3040179196597137 -6.6692716424589245 ;
	setAttr ".jo" -type "double3" -1.9018000000000002 0.14120000000000002 -175.7553 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftLeg" -p "mixamorig5:LeftUpLeg";
	rename -uid "0C12A18C-4FBF-437B-92DF-099C7901977F";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.96240385259293504 38.243825760949953 5.1763020343419246 ;
	setAttr ".jo" -type "double3" 0.224 0 1.5011999999999999 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftFoot" -p "mixamorig5:LeftLeg";
	rename -uid "77263ED6-4397-FE6D-24D9-0890AF4760A4";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.0014599710086411477 49.962501639090192 -1.3966651945354736 ;
	setAttr ".jo" -type "double3" 52.4886 -1.2781 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftToeBase" -p "mixamorig5:LeftFoot";
	rename -uid "E0383B9F-4556-D1EB-9505-B196988E106C";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.29009170796182815 19.049084559617217 4.3124133939750458 ;
	setAttr ".jo" -type "double3" 36.9232 -9.0373 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:LeftToe_End" -p "mixamorig5:LeftToeBase";
	rename -uid "8ACFD529-4FED-53A8-662A-BD8891D07E67";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.07261310844953428 6.9603406542026498 -0.75007571242593429 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightUpLeg" -p "mixamorig5:Hips";
	rename -uid "B1557E75-4A37-42FD-B79E-C39E0C0EE58D";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -9.1539813761732631 -6.3040179196597137 -6.6692716424589245 ;
	setAttr ".jo" -type "double3" -2.1942 -0.16290000000000002 175.7568 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightLeg" -p "mixamorig5:RightUpLeg";
	rename -uid "4D1C8630-4BD3-F4E1-AC77-4493526AA270";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -1.0975592070552196 38.206102068651873 5.4221456322236872 ;
	setAttr ".jo" -type "double3" 0.47560000000000008 0 -1.502 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightFoot" -p "mixamorig5:RightLeg";
	rename -uid "842D1824-4423-2E3B-00AE-FC8E21AEB866";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.97411919144172643 49.95699940829482 -1.2456097303354907 ;
	setAttr ".jo" -type "double3" 52.9517 1.2910000000000001 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightToeBase" -p "mixamorig5:RightFoot";
	rename -uid "B50964DD-4153-DD94-7132-7AB2FCFE2500";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" 0.031854714607527868 19.062225182748545 4.263711907570821 ;
	setAttr ".jo" -type "double3" 36.4989 9.2141 0 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode joint -n "mixamorig5:RightToe_End" -p "mixamorig5:RightToeBase";
	rename -uid "CE895F1F-4818-824D-8D37-F0B0D33E881F";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".t" -type "double3" -0.032816735844024336 6.9521866513891197 -0.82478237705973478 ;
	setAttr ".ssc" no;
	setAttr ".radi" 3;
	setAttr ".fbxID" 5;
createNode transform -n "MoCapConstraints";
	rename -uid "6612A6B2-4CEF-BA94-C7F9-148B8620763C";
	addAttr -ci true -k true -sn "disableConstraints" -ln "disableConstraints" -min 
		0 -max 1 -at "bool";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".disableConstraints";
createNode fosterParent -n "zombie_rig_ver2RNfosterParent1";
	rename -uid "8DDCCC6F-4286-D7E5-479B-EE9513F974D4";
createNode orientConstraint -n "RootX_M_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "8DBCF17B-404E-92A9-3291-C0B0FE8F8E51";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "HipsW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.73024725952084724 -7.7672296896758146 -2.4289565616645623 ;
	setAttr -k on ".w0";
createNode pointConstraint -n "RootX_M_pointConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "BFF0C1B9-4F6C-0163-30BD-9B82DC606F2A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "HipsW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".o" -type "double3" 6.6107096060154444e-24 -1.7219004746493738e-06 -2.778209307052748e-08 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "IKLeg_L_parentConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "0FE1CAD7-4DE6-6F09-BEF0-75B184E16180";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftFootW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 5.2660395866155341e-07 -2.8644889127349416e-07 
		-6.7741938547527525e-07 ;
	setAttr ".tg[0].tor" -type "double3" 51.06985386229745 -1.7316086343044275 -179.93417304881862 ;
	setAttr ".lr" -type "double3" 14.552577789962283 -6.4044699800614966 -6.4921249819687334 ;
	setAttr ".rst" -type "double3" -1.7763568394002505e-15 0 0 ;
	setAttr ".rsrr" -type "double3" 9.1440947092076072e-15 1.590277340731758e-15 1.7269417997008936e-15 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "IKLeg_R_parentConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "A21D352B-4B16-375B-E534-7FBF923940DA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightFootW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -5.3808065558769158e-07 -5.9689122267059247e-07 
		-9.0695526644424262e-07 ;
	setAttr ".tg[0].tor" -type "double3" 51.233471008055524 0.49968460785052876 179.2468412651927 ;
	setAttr ".lr" -type "double3" -0.55315597186879117 -22.324703405687401 4.8957420924292796 ;
	setAttr ".rst" -type "double3" 3.907985046680551e-14 1.7763568394002505e-15 0 ;
	setAttr ".rsrr" -type "double3" -2.9817700138720468e-15 -8.5788008107443687e-15 
		-7.1864345721703286e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKRingFinger1_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "FDF4B373-4B02-F205-54B2-FD8D33A9D08F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandRing1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.63222738107406473 20.320826097408062 106.57397346082999 ;
	setAttr ".o" -type "double3" 14.003752650198697 -10.886218325962835 -90.477116708403074 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317584e-15 3.9756933518293979e-16 1.2970699560343405e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKRingFinger2_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "3A11F8C1-4C8B-3BC1-E97E-788CE21191FB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandRing2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 6.2066338041152145 21.728885056085748 107.65126745821111 ;
	setAttr ".o" -type "double3" -1.1338519167818466 -5.0752715429964486 -89.637034553793072 ;
	setAttr ".rsrr" -type "double3" 7.951386703658787e-16 -1.9878466759146984e-15 3.18303948980841e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKRingFinger3_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "850921B8-473C-E61E-AF89-38AE71076553";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandRing3W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 2.3713440924901974 10.352967354062271 107.07891599928271 ;
	setAttr ".o" -type "double3" -0.43380813711212296 -4.2757087338312347 -90.966365114280137 ;
	setAttr ".rsrr" -type "double3" 1.2931366107568824e-34 1.1927080055488188e-15 1.2424041724466862e-17 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKPinkyFinger1_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "C660E0AB-4B8F-DD7B-DAD9-FC87DA647364";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandPinky1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -3.9628681524545475 16.733538152828928 101.91065143356022 ;
	setAttr ".o" -type "double3" 8.7804814339700155 -15.69036557500743 -89.268821041318631 ;
	setAttr ".rsrr" -type "double3" -4.7708320221952752e-15 -6.3611093629270335e-15 
		-5.2677936911739494e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKPinkyFinger2_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "CF0350A6-4F1D-F671-ED00-54A0B6106321";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandPinky2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 19.184361701834106 11.600346221313966 108.48054816602321 ;
	setAttr ".o" -type "double3" 0.57765054803789162 -15.08217985177494 -86.401455662005972 ;
	setAttr ".rsrr" -type "double3" -5.5173828725626983e-33 3.1805546814635168e-15 -1.987846675914698e-16 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKPinkyFinger3_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "5F3CF404-4EC5-A1CA-0D1B-A984049EF2AF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandPinky3W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 14.345192029651535 10.000590143512067 106.49409643081711 ;
	setAttr ".o" -type "double3" 6.970349918295951 -10.425767203849006 -88.778525536178208 ;
	setAttr ".rsrr" -type "double3" 1.5902773407317588e-15 -6.5598940305185035e-15 -6.1623246953355643e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKIndexFinger1_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "766B17E8-4E43-BCE8-E690-19A941CF5232";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandIndex1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -0.68375302200139076 19.969898327620445 112.53194753876417 ;
	setAttr ".o" -type "double3" 15.351098271717769 -10.24700875012029 -89.120815823609021 ;
	setAttr ".rsrr" -type "double3" 3.1805546814635187e-15 -3.5781240166464568e-15 -3.260068548500106e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKIndexFinger2_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "7628818A-4715-3DBE-81DD-28951F13B244";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandIndex2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 16.701964526509485 21.265324070799572 110.54569534862596 ;
	setAttr ".o" -type "double3" -2.6080736930561055 -12.269671199527084 -88.963487235115309 ;
	setAttr ".rsrr" -type "double3" 3.975693351829396e-15 -6.586375804121721e-31 1.8983935754985366e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKIndexFinger3_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "C2EDD3BB-4938-7AD8-06D8-8985ED6857FB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandIndex3W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -1.0378665178211921 5.3555791083755926 108.21876725656095 ;
	setAttr ".o" -type "double3" -5.1022219138451907 -19.472588673243013 -88.477904251227784 ;
	setAttr ".rsrr" -type "double3" 3.310429723537619e-32 9.5416640443905503e-15 3.975693351829396e-16 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKThumbFinger1_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "0FBA3549-4CA5-4DD2-8E06-33A2997CFB1C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandThumb1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -39.446323780918078 -37.631551157008126 105.49379489436333 ;
	setAttr ".o" -type "double3" -84.575190856906957 -0.5121447102149701 -85.740040196617301 ;
	setAttr ".rsrr" -type "double3" 1.2722218725854067e-14 -6.3611093629270335e-15 -7.0622500768802555e-31 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKThumbFinger2_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "CD301F31-46F5-4EB1-5411-C686980E8FA6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandThumb2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 5.3939531521178576 -65.097351875793095 63.17594490987711 ;
	setAttr ".o" -type "double3" -85.182836052652945 -7.2872321000267819 -90.484134440862192 ;
	setAttr ".rsrr" -type "double3" 0 0 -9.5416640443905519e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKThumbFinger3_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "D07A71CF-4C3E-AA12-F224-BF8FA70E44B5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandThumb3W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -73.255847295576885 -47.687289155403867 130.15361581975634 ;
	setAttr ".o" -type "double3" -87.268771690100536 -0.22880972203068423 -89.652319991258651 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635164e-15 6.3611093629270335e-15 6.3611093629270335e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKMiddleFinger1_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "86B3A08B-420E-9CFF-44C2-739D28E15E8F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandMiddle1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -3.9699166953179059 19.545228774133871 108.41953943134361 ;
	setAttr ".o" -type "double3" 14.064345813495983 -3.0108985284516963 -90.212861444699286 ;
	setAttr ".rsrr" -type "double3" 1.5902773407317584e-15 -1.5902773407317584e-15 9.9392333795734874e-17 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKMiddleFinger2_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "05948AE6-4D49-0B59-1AA4-86BF9D35491D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandMiddle2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 5.693714953999371 23.123959728026712 107.01731110270116 ;
	setAttr ".o" -type "double3" -1.3547570311147912 -7.4853995999672946 -90.107959978902784 ;
	setAttr ".rsrr" -type "double3" -2.3854160110976372e-15 1.5902773407317576e-15 -1.2622826392058329e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKMiddleFinger3_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "F55FB138-4625-4F4B-822F-1396D57E0DFA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandMiddle3W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 2.2868433020039292 9.9229480048164689 107.47798142546465 ;
	setAttr ".o" -type "double3" -3.3566038076892522 -7.5095326338225998 -89.792690405408294 ;
	setAttr ".rsrr" -type "double3" 2.7829853462805768e-15 -3.975693351829396e-15 1.2498585974813663e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKChest_M_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "434E3232-42A6-12C9-3E4F-6D8F3D2D7E56";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Spine2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -78.352335376904762 -88.671161908825425 -40.199713641503088 ;
	setAttr ".o" -type "double3" 90 -10.651890171659597 89.999999999999972 ;
	setAttr ".rsrr" -type "double3" -3.5311250384401269e-31 -1.2722218725854067e-14 
		3.1805546814635168e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKSpine1_M_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "FD9565CD-4B8E-995F-E819-CC838C760391";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Spine1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -77.922275055459949 -84.985700255817733 -13.211829369999835 ;
	setAttr ".o" -type "double3" 90 -5.3411905612979274 89.999999999999972 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635152e-15 -8.8278125961003096e-32 
		-3.1805546814635152e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKHip_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "EF220415-4066-E7DB-EF40-64ACD8D6BFBA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftUpLegW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 80.531120823003988 131.74342273678278 -127.21389308920034 ;
	setAttr ".o" -type "double3" 1.9451833396061993 86.250205886288654 -82.405116689599438 ;
	setAttr ".rsrr" -type "double3" -1.9083328088781101e-14 -9.5416640443905503e-15 
		3.1805546814635183e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKKnee_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "231E3E6B-4C7B-A759-F183-CA91248C88E4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftLegW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 77.547482534082434 -65.316758966997313 31.977282738814925 ;
	setAttr ".o" -type "double3" -0.10673314361034728 86.238909920543733 -91.597684945157425 ;
	setAttr ".rsrr" -type "double3" 3.1805546814635168e-15 -6.3611093629270335e-15 3.1805546814635168e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKAnkle_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "19F0C3B3-4825-B458-5B1B-61A6F93050E9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftFootW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 139.77466194241387 -85.540056471470081 -5.9685800642510642 ;
	setAttr ".o" -type "double3" 179.49139502499 -88.215245524600888 -38.928126779956678 ;
	setAttr ".rsrr" -type "double3" 360 1.2722218725854067e-14 -3.1805546814635152e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKToes_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "CE45C670-4A11-081C-C0CC-C5AC86763A9D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftToeBaseW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 98.65775070937346 4.4204317624792129 95.562642780185769 ;
	setAttr ".o" -type "double3" 76.382574698689737 89.400647196074416 -172.53367620698131 ;
	setAttr ".rsrr" -type "double3" 180.00000000000003 180 -180.00000000000054 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKHip_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "7B5ECD7B-4540-D4B6-9876-6AB2E970289F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightUpLegW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -89.585128095316179 -15.058699170275959 -71.634181082793816 ;
	setAttr ".o" -type "double3" -2.6708625712715102 97.350930714752309 97.796878095795421 ;
	setAttr ".rsrr" -type "double3" -180.00000000000003 180.00000000000003 180.00000000000003 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKKnee_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "0AC12215-497F-1547-9F25-67B03B94DDD4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightLegW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -71.688797457154323 81.284671035746385 -179.19576048876766 ;
	setAttr ".o" -type "double3" 1.2912320153754713 97.379322609262118 88.727265546586523 ;
	setAttr ".rsrr" -type "double3" -180 -180 180 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKAnkle_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "A50AA135-4F1F-3656-0F4C-93BBF7FCF3CA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightFootW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -28.408820158454301 -90.792290919411144 -2.4705276674833656 ;
	setAttr ".o" -type "double3" 0.37260950251719871 88.895646055470323 38.755986710041412 ;
	setAttr ".rsrr" -type "double3" 3.1805546814635168e-15 1.9083328088781101e-14 5.2966875576601903e-31 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKToes_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "BEA6029C-41A2-A421-83D9-208BD5333F49";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightToeBaseW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -81.71058432151878 -5.7642056037395299 -94.368311288323738 ;
	setAttr ".o" -type "double3" -11.85937438043201 86.976114385300562 95.100690042014534 ;
	setAttr ".rsrr" -type "double3" 6.3611093629270462e-15 -6.3611093629270233e-15 2.0991660897659216e-13 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKRingFinger1_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "41379766-4814-92B9-F4C9-278F4B1652E1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandRing1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -176.169423235799 0.15336603592851947 117.24300247329124 ;
	setAttr ".o" -type "double3" 178.5792751199667 6.0749933919572134 89.934463052820121 ;
	setAttr ".rsrr" -type "double3" 180 180 -180 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKRingFinger2_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "0E477080-4AC6-9554-C132-6D9BE6242D1C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandRing2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 175.74014996315032 7.2093266601233337 109.85797800970985 ;
	setAttr ".o" -type "double3" 178.3473539007237 10.8306120902747 90.188183306983419 ;
	setAttr ".rsrr" -type "double3" -7.9513867036587919e-16 -1.5902773407317584e-15 
		360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKRingFinger3_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "79B957B8-42A0-2E8E-F380-C0A2A0428324";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandRing3W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -169.3409896646825 7.1733766758815705 110.12762098931373 ;
	setAttr ".o" -type "double3" 178.87467709693487 1.6609313860283497 90.122513662853322 ;
	setAttr ".rsrr" -type "double3" 9.4422717105948121e-15 4.9696166897867437e-17 360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKPinkyFinger1_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "19946E86-4DA5-A59E-1F1B-5F90EBB59026";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandPinky1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -173.47916282229505 -3.74391929247362 115.86558027062037 ;
	setAttr ".o" -type "double3" -177.5654957450883 12.7708741326288 89.923280550980479 ;
	setAttr ".rsrr" -type "double3" -180 -180 -180 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKPinkyFinger2_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "88F2ECD5-4F6D-4FDE-4461-138C85F3AF2C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandPinky2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -168.5868011135002 8.1665421922271868 111.45083574515276 ;
	setAttr ".o" -type "double3" 178.10174444501908 20.261971259045605 91.107797609342271 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635152e-15 -6.3611093629270335e-15 
		360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKPinkyFinger3_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "94382730-4060-9EF8-7DB3-DF9822DFB1D6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandPinky3W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -160.35846210474946 5.754829655274154 112.11346029816229 ;
	setAttr ".o" -type "double3" -179.89537162832525 16.42015675346893 90.166912065750651 ;
	setAttr ".rsrr" -type "double3" -360 3.1805546814635168e-15 360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKIndexFinger1_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "07B9A061-42F5-B77B-5007-A49D7AF35561";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandIndex1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 171.89089409567433 -0.56148563066444979 117.92042892684537 ;
	setAttr ".o" -type "double3" 176.55617680440616 14.51515572188854 89.502495785677439 ;
	setAttr ".rsrr" -type "double3" -6.3611093629270335e-15 -4.7708320221952752e-15 
		6.3611093629270335e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKIndexFinger2_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "5B384E6A-4343-0519-2DC6-74B22A59D22A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandIndex2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -157.65404649448112 -5.105814017812583 109.76563524010923 ;
	setAttr ".o" -type "double3" 176.50371326172555 17.539994688621327 90.339970283285652 ;
	setAttr ".rsrr" -type "double3" 4.7708320221952752e-15 4.7708320221952752e-15 360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKIndexFinger3_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "11D43E18-4F96-5F15-A727-EC8B67C2DFB1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandIndex3W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -161.68710091570529 0.0240528727123944 110.74926576326088 ;
	setAttr ".o" -type "double3" 174.76653157836861 18.512533582623057 90.049840216067807 ;
	setAttr ".rsrr" -type "double3" 1.5902773407317584e-14 3.9756933518293928e-15 360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKThumbFinger1_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "CFAE0D36-466A-9169-CA37-96B7116266C2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandThumb1W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 110.21345776819705 -45.592258442918606 126.74870074186197 ;
	setAttr ".o" -type "double3" 89.198467868950502 -1.844715214343809 88.790149266269538 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635168e-15 -1.9083328088781097e-14 
		3.1805546814635168e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKThumbFinger2_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "C3A19934-42AC-302D-7F40-5EA98F6816AA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandThumb2W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -98.389037505499616 -74.02989169033458 3.6568244001993069 ;
	setAttr ".o" -type "double3" 92.913188246438267 5.2769758969857277 88.548579249415354 ;
	setAttr ".rsrr" -type "double3" -5.2966875576601921e-31 -3.1805546814635168e-15 
		1.9083328088781101e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKThumbFinger3_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "2A4E4ADA-43C7-4A59-3441-F9B25F9ACBFF";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandThumb3W0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 102.61317849013037 -47.999804096328468 115.21772643539661 ;
	setAttr ".o" -type "double3" 92.317829096460045 -7.4255604853823698 92.725077022317464 ;
	setAttr ".rsrr" -type "double3" 0 1.272221872585407e-14 0 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKMiddleFinger1_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "720C2B89-4FA2-F622-69C5-06AA2A7D92C4";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandMiddle1W0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 178.62963857107994 -1.4724103266819866 116.13276183620144 ;
	setAttr ".o" -type "double3" 175.08563184686184 10.114225534979951 89.979677653295425 ;
	setAttr ".rsrr" -type "double3" -4.7708320221952752e-15 -1.5902773407317584e-15 
		6.6208594470752401e-32 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKMiddleFinger2_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "322E2693-479B-FDA2-39FE-B1A48F847184";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandMiddle2W0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -170.93125166671516 0.042865616449105338 110.699524898387 ;
	setAttr ".o" -type "double3" 175.21309359858682 9.5688214942558432 90.419724371750505 ;
	setAttr ".rsrr" -type "double3" 6.361109362927032e-15 1.1927080055488196e-15 360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKMiddleFinger3_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "2BE05337-4A84-B2AF-3176-099B73465D9B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandMiddle3W0" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -171.50458242691761 5.3344373779324448 109.13945015534672 ;
	setAttr ".o" -type "double3" 175.24045408933964 12.761491839744098 90.250157575228144 ;
	setAttr ".rsrr" -type "double3" 3.1805546814635168e-15 3.975693351829396e-15 360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKScapula_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "F9A63E76-43E0-7EE7-BEE2-8087769AE814";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftShoulderW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 34.873177610921623 11.506525411800252 95.644051412942829 ;
	setAttr ".o" -type "double3" 0.93316175783006383 -2.3175209946368005 -90.160058653264173 ;
	setAttr ".rsrr" -type "double3" 9.9392333795734899e-16 -3.9756933518293969e-16 -6.3517913316336832e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKShoulder_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "F18CAABB-417E-BA65-A42D-C8BC7BD24813";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftArmW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -67.527618864559912 47.422899484062107 158.2013267149099 ;
	setAttr ".o" -type "double3" -4.7288442011158889 -35.350998695827407 -90.457103911714114 ;
	setAttr ".rsrr" -type "double3" 3.1805546814635168e-15 -5.9587735023677157e-31 -2.1468744099878741e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKElbow_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "0A7E677F-4CAD-92D4-35C6-238B22898B16";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftForeArmW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -28.252442972708582 -2.1927914015189818 124.97564947906368 ;
	setAttr ".o" -type "double3" 2.1970893816180226 -34.740954665661143 -90.076021814038825 ;
	setAttr ".rsrr" -type "double3" 1.2722218725854064e-14 9.5416640443905535e-15 2.6239576122074014e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKWrist_L_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "DCC11C2C-4270-BC7F-FE58-52B933915282";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "LeftHandW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -9.2672340540626692 -13.544915557221897 126.82192931249239 ;
	setAttr ".o" -type "double3" -3.6271763977357443 -14.89262458727306 -92.866667934414039 ;
	setAttr ".rsrr" -type "double3" 4.7708320221952752e-15 -7.9513867036587959e-16 -6.5598940305185035e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKScapula_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "61586CC6-417F-096E-524A-06AE6D0AD25E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightShoulderW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -29.399817225465601 -155.67846454146553 72.122970144349438 ;
	setAttr ".o" -type "double3" -0.86015725491455586 -176.85907864292838 89.747584342882277 ;
	setAttr ".rsrr" -type "double3" -7.7526020360673219e-15 -1.7214234562395618e-30 
		2.5444437451708134e-14 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKShoulder_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "D20A9413-49F7-0365-0D16-62BF562BD516";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightArmW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 126.15525935429173 -50.964114737538722 -140.52873792366489 ;
	setAttr ".o" -type "double3" 174.98272040661701 -21.846387756029575 -91.019519633528375 ;
	setAttr ".rsrr" -type "double3" 360 0 -360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKElbow_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "41C45F74-44CE-4B7F-F441-688431326F6A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightForeArmW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 161.89116197872653 -1.1846503860432085 -118.75207523418068 ;
	setAttr ".o" -type "double3" 178.60975129175046 -21.132199629464992 -89.864155120600557 ;
	setAttr ".rsrr" -type "double3" 360 1.5902773407317578e-14 2.2069531490250784e-31 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKWrist_R_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "53896476-4C9C-CC63-4F47-2A8F7F9FFDC5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "RightHandW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 173.56299076511428 14.19568905972177 -112.61879350164003 ;
	setAttr ".o" -type "double3" 171.49496474681217 0.58516217184221064 -94.450739081731953 ;
	setAttr ".rsrr" -type "double3" 360 6.3611093629270335e-15 -360 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKHead_M_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "769D5332-42B8-561D-E5DB-53B6DB6AE6D7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "HeadW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -86.427443471747381 48.48129555972946 -89.370098618984244 ;
	setAttr ".o" -type "double3" 0 89.999999999999972 89.041782939472427 ;
	setAttr ".rsrr" -type "double3" -6.3611093629270335e-15 3.1805546814635155e-14 6.3611093629270335e-15 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "FKNeck_M_orientConstraint1" -p "zombie_rig_ver2RNfosterParent1";
	rename -uid "DB7579C0-4A31-F667-B601-27A1F4B53A7F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "NeckW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -88.647395063430835 41.794646945226624 -87.89129984120909 ;
	setAttr ".o" -type "double3" 0 89.999999999999943 116.89687879745182 ;
	setAttr ".rsrr" -type "double3" -1.590277340731759e-14 5.7249984266343308e-14 9.5416640443905582e-15 ;
	setAttr -k on ".w0";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "03253FDA-4960-94CB-D7FF-47B34606B369";
	setAttr -s 8 ".lnk";
	setAttr -s 8 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "88BD44E2-452A-D8AB-F17E-01B105CF26B9";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "EEF9D240-4EC2-A549-D8F2-D8BD85D1CB13";
createNode displayLayerManager -n "layerManager";
	rename -uid "6C73D516-450B-4F35-BFB2-C1A8BB0BAD4F";
createNode displayLayer -n "defaultLayer";
	rename -uid "1D50F4E8-4820-888A-5708-C3B4EDF2BF9D";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "C0D068B3-4338-27FF-9F8A-7D88FE3D5DAF";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "87BCB229-4A94-BE07-FA2B-16A2536D5516";
	setAttr ".g" yes;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "B5CF1DC3-4B19-680C-EE76-248CF0FB5B09";
	setAttr ".version" -type "string" "5.3.4.1";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "99AD75D9-4746-7E3E-9F24-78AD3016FDB3";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "BD62331F-47E4-F377-176E-82B8A07B7C5A";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "D478EC4E-4777-39CD-2B99-408F91C2FA24";
	setAttr ".ai_translator" -type "string" "maya";
	setAttr ".output_mode" 0;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "50FA643E-4D45-4637-2697-2B90ACB0435B";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 786\n            -height 488\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n"
		+ "            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n"
		+ "            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n"
		+ "            -shadows 0\n            -captureSequenceNumber -1\n            -width 785\n            -height 488\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n"
		+ "            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n"
		+ "            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 786\n            -height 488\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n"
		+ "            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n"
		+ "            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -bluePencil 1\n            -greasePencils 0\n            -excludeObjectPreset \"All\" \n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1579\n            -height 1043\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -autoExpandAllAnimatedShapes 1\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n"
		+ "            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -showUfeItems 1\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n"
		+ "            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"{}\" \n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n"
		+ "            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -autoExpandAllAnimatedShapes 1\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -showUfeItems 1\n"
		+ "            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -autoExpandAllAnimatedShapes 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n"
		+ "                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 1\n                -limitToSelectedCurves 0\n                -constrainDrag 0\n                -valueLinesToggle 0\n                -outliner \"graphEditor1OutlineEd\" \n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -autoExpandAllAnimatedShapes 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -showUfeItems 1\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n"
		+ "                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n"
		+ "                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n"
		+ "                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -connectedGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n"
		+ "                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -showUnitConversions 0\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n"
		+ "\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1579\\n    -height 1043\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1579\\n    -height 1043\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 20 -size 20 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "D4040BE6-46BC-8930-3A77-3AACE92E7375";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 52.8 -ast 1 -aet 52.8 ";
	setAttr ".st" 6;
createNode reference -n "zombie_rig_ver2RN";
	rename -uid "65DE51FC-40C4-9A8F-9105-A4B8B368F415";
	setAttr -s 289 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".phl[12]" 0;
	setAttr ".phl[13]" 0;
	setAttr ".phl[14]" 0;
	setAttr ".phl[15]" 0;
	setAttr ".phl[16]" 0;
	setAttr ".phl[17]" 0;
	setAttr ".phl[18]" 0;
	setAttr ".phl[19]" 0;
	setAttr ".phl[20]" 0;
	setAttr ".phl[21]" 0;
	setAttr ".phl[22]" 0;
	setAttr ".phl[23]" 0;
	setAttr ".phl[24]" 0;
	setAttr ".phl[25]" 0;
	setAttr ".phl[26]" 0;
	setAttr ".phl[27]" 0;
	setAttr ".phl[28]" 0;
	setAttr ".phl[29]" 0;
	setAttr ".phl[30]" 0;
	setAttr ".phl[31]" 0;
	setAttr ".phl[32]" 0;
	setAttr ".phl[33]" 0;
	setAttr ".phl[34]" 0;
	setAttr ".phl[35]" 0;
	setAttr ".phl[36]" 0;
	setAttr ".phl[37]" 0;
	setAttr ".phl[38]" 0;
	setAttr ".phl[39]" 0;
	setAttr ".phl[40]" 0;
	setAttr ".phl[41]" 0;
	setAttr ".phl[42]" 0;
	setAttr ".phl[43]" 0;
	setAttr ".phl[44]" 0;
	setAttr ".phl[45]" 0;
	setAttr ".phl[46]" 0;
	setAttr ".phl[47]" 0;
	setAttr ".phl[48]" 0;
	setAttr ".phl[49]" 0;
	setAttr ".phl[50]" 0;
	setAttr ".phl[51]" 0;
	setAttr ".phl[52]" 0;
	setAttr ".phl[53]" 0;
	setAttr ".phl[54]" 0;
	setAttr ".phl[55]" 0;
	setAttr ".phl[56]" 0;
	setAttr ".phl[57]" 0;
	setAttr ".phl[58]" 0;
	setAttr ".phl[59]" 0;
	setAttr ".phl[60]" 0;
	setAttr ".phl[61]" 0;
	setAttr ".phl[62]" 0;
	setAttr ".phl[63]" 0;
	setAttr ".phl[64]" 0;
	setAttr ".phl[65]" 0;
	setAttr ".phl[66]" 0;
	setAttr ".phl[67]" 0;
	setAttr ".phl[68]" 0;
	setAttr ".phl[69]" 0;
	setAttr ".phl[70]" 0;
	setAttr ".phl[71]" 0;
	setAttr ".phl[72]" 0;
	setAttr ".phl[73]" 0;
	setAttr ".phl[74]" 0;
	setAttr ".phl[75]" 0;
	setAttr ".phl[76]" 0;
	setAttr ".phl[77]" 0;
	setAttr ".phl[78]" 0;
	setAttr ".phl[79]" 0;
	setAttr ".phl[80]" 0;
	setAttr ".phl[81]" 0;
	setAttr ".phl[82]" 0;
	setAttr ".phl[83]" 0;
	setAttr ".phl[84]" 0;
	setAttr ".phl[85]" 0;
	setAttr ".phl[86]" 0;
	setAttr ".phl[87]" 0;
	setAttr ".phl[88]" 0;
	setAttr ".phl[89]" 0;
	setAttr ".phl[90]" 0;
	setAttr ".phl[91]" 0;
	setAttr ".phl[92]" 0;
	setAttr ".phl[93]" 0;
	setAttr ".phl[94]" 0;
	setAttr ".phl[95]" 0;
	setAttr ".phl[96]" 0;
	setAttr ".phl[97]" 0;
	setAttr ".phl[98]" 0;
	setAttr ".phl[99]" 0;
	setAttr ".phl[100]" 0;
	setAttr ".phl[101]" 0;
	setAttr ".phl[102]" 0;
	setAttr ".phl[103]" 0;
	setAttr ".phl[104]" 0;
	setAttr ".phl[105]" 0;
	setAttr ".phl[106]" 0;
	setAttr ".phl[107]" 0;
	setAttr ".phl[108]" 0;
	setAttr ".phl[109]" 0;
	setAttr ".phl[110]" 0;
	setAttr ".phl[111]" 0;
	setAttr ".phl[112]" 0;
	setAttr ".phl[113]" 0;
	setAttr ".phl[114]" 0;
	setAttr ".phl[115]" 0;
	setAttr ".phl[116]" 0;
	setAttr ".phl[117]" 0;
	setAttr ".phl[118]" 0;
	setAttr ".phl[119]" 0;
	setAttr ".phl[120]" 0;
	setAttr ".phl[121]" 0;
	setAttr ".phl[122]" 0;
	setAttr ".phl[123]" 0;
	setAttr ".phl[124]" 0;
	setAttr ".phl[125]" 0;
	setAttr ".phl[126]" 0;
	setAttr ".phl[127]" 0;
	setAttr ".phl[128]" 0;
	setAttr ".phl[129]" 0;
	setAttr ".phl[130]" 0;
	setAttr ".phl[131]" 0;
	setAttr ".phl[132]" 0;
	setAttr ".phl[133]" 0;
	setAttr ".phl[134]" 0;
	setAttr ".phl[135]" 0;
	setAttr ".phl[136]" 0;
	setAttr ".phl[137]" 0;
	setAttr ".phl[138]" 0;
	setAttr ".phl[139]" 0;
	setAttr ".phl[140]" 0;
	setAttr ".phl[141]" 0;
	setAttr ".phl[142]" 0;
	setAttr ".phl[143]" 0;
	setAttr ".phl[144]" 0;
	setAttr ".phl[145]" 0;
	setAttr ".phl[146]" 0;
	setAttr ".phl[147]" 0;
	setAttr ".phl[148]" 0;
	setAttr ".phl[149]" 0;
	setAttr ".phl[150]" 0;
	setAttr ".phl[151]" 0;
	setAttr ".phl[152]" 0;
	setAttr ".phl[153]" 0;
	setAttr ".phl[154]" 0;
	setAttr ".phl[155]" 0;
	setAttr ".phl[156]" 0;
	setAttr ".phl[157]" 0;
	setAttr ".phl[158]" 0;
	setAttr ".phl[159]" 0;
	setAttr ".phl[160]" 0;
	setAttr ".phl[161]" 0;
	setAttr ".phl[162]" 0;
	setAttr ".phl[163]" 0;
	setAttr ".phl[164]" 0;
	setAttr ".phl[165]" 0;
	setAttr ".phl[166]" 0;
	setAttr ".phl[167]" 0;
	setAttr ".phl[168]" 0;
	setAttr ".phl[169]" 0;
	setAttr ".phl[170]" 0;
	setAttr ".phl[171]" 0;
	setAttr ".phl[172]" 0;
	setAttr ".phl[173]" 0;
	setAttr ".phl[174]" 0;
	setAttr ".phl[175]" 0;
	setAttr ".phl[176]" 0;
	setAttr ".phl[177]" 0;
	setAttr ".phl[178]" 0;
	setAttr ".phl[179]" 0;
	setAttr ".phl[180]" 0;
	setAttr ".phl[181]" 0;
	setAttr ".phl[182]" 0;
	setAttr ".phl[183]" 0;
	setAttr ".phl[184]" 0;
	setAttr ".phl[185]" 0;
	setAttr ".phl[186]" 0;
	setAttr ".phl[187]" 0;
	setAttr ".phl[188]" 0;
	setAttr ".phl[189]" 0;
	setAttr ".phl[190]" 0;
	setAttr ".phl[191]" 0;
	setAttr ".phl[192]" 0;
	setAttr ".phl[193]" 0;
	setAttr ".phl[194]" 0;
	setAttr ".phl[195]" 0;
	setAttr ".phl[196]" 0;
	setAttr ".phl[197]" 0;
	setAttr ".phl[198]" 0;
	setAttr ".phl[199]" 0;
	setAttr ".phl[200]" 0;
	setAttr ".phl[201]" 0;
	setAttr ".phl[202]" 0;
	setAttr ".phl[203]" 0;
	setAttr ".phl[204]" 0;
	setAttr ".phl[205]" 0;
	setAttr ".phl[206]" 0;
	setAttr ".phl[207]" 0;
	setAttr ".phl[208]" 0;
	setAttr ".phl[209]" 0;
	setAttr ".phl[210]" 0;
	setAttr ".phl[211]" 0;
	setAttr ".phl[212]" 0;
	setAttr ".phl[213]" 0;
	setAttr ".phl[214]" 0;
	setAttr ".phl[215]" 0;
	setAttr ".phl[216]" 0;
	setAttr ".phl[217]" 0;
	setAttr ".phl[218]" 0;
	setAttr ".phl[219]" 0;
	setAttr ".phl[220]" 0;
	setAttr ".phl[221]" 0;
	setAttr ".phl[222]" 0;
	setAttr ".phl[223]" 0;
	setAttr ".phl[224]" 0;
	setAttr ".phl[225]" 0;
	setAttr ".phl[226]" 0;
	setAttr ".phl[227]" 0;
	setAttr ".phl[228]" 0;
	setAttr ".phl[229]" 0;
	setAttr ".phl[230]" 0;
	setAttr ".phl[231]" 0;
	setAttr ".phl[232]" 0;
	setAttr ".phl[233]" 0;
	setAttr ".phl[234]" 0;
	setAttr ".phl[235]" 0;
	setAttr ".phl[236]" 0;
	setAttr ".phl[237]" 0;
	setAttr ".phl[238]" 0;
	setAttr ".phl[239]" 0;
	setAttr ".phl[240]" 0;
	setAttr ".phl[241]" 0;
	setAttr ".phl[242]" 0;
	setAttr ".phl[243]" 0;
	setAttr ".phl[244]" 0;
	setAttr ".phl[245]" 0;
	setAttr ".phl[246]" 0;
	setAttr ".phl[247]" 0;
	setAttr ".phl[248]" 0;
	setAttr ".phl[249]" 0;
	setAttr ".phl[250]" 0;
	setAttr ".phl[251]" 0;
	setAttr ".phl[252]" 0;
	setAttr ".phl[253]" 0;
	setAttr ".phl[254]" 0;
	setAttr ".phl[255]" 0;
	setAttr ".phl[256]" 0;
	setAttr ".phl[257]" 0;
	setAttr ".phl[258]" 0;
	setAttr ".phl[259]" 0;
	setAttr ".phl[260]" 0;
	setAttr ".phl[261]" 0;
	setAttr ".phl[262]" 0;
	setAttr ".phl[263]" 0;
	setAttr ".phl[264]" 0;
	setAttr ".phl[265]" 0;
	setAttr ".phl[266]" 0;
	setAttr ".phl[267]" 0;
	setAttr ".phl[268]" 0;
	setAttr ".phl[269]" 0;
	setAttr ".phl[270]" 0;
	setAttr ".phl[271]" 0;
	setAttr ".phl[272]" 0;
	setAttr ".phl[273]" 0;
	setAttr ".phl[274]" 0;
	setAttr ".phl[275]" 0;
	setAttr ".phl[276]" 0;
	setAttr ".phl[277]" 0;
	setAttr ".phl[278]" 0;
	setAttr ".phl[279]" 0;
	setAttr ".phl[280]" 0;
	setAttr ".phl[281]" 0;
	setAttr ".phl[282]" 0;
	setAttr ".phl[283]" 0;
	setAttr ".phl[284]" 0;
	setAttr ".phl[285]" 0;
	setAttr ".phl[286]" 0;
	setAttr ".phl[287]" 0;
	setAttr ".phl[288]" 0;
	setAttr ".phl[289]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"zombie_rig_ver2RN"
		"zombie_rig_ver2RN" 0
		"zombie_rig_ver2RN" 502
		0 "|zombie_rig_ver2RNfosterParent1|FKNeck_M_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKHead_M_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKWrist_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKElbow_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKShoulder_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKScapula_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKWrist_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKElbow_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKShoulder_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKScapula_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKMiddleFinger3_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKMiddleFinger2_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKMiddleFinger1_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKThumbFinger3_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKThumbFinger2_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKThumbFinger1_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKIndexFinger3_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKIndexFinger2_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKIndexFinger1_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKPinkyFinger3_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKPinkyFinger2_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKPinkyFinger1_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKRingFinger3_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKRingFinger2_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKRingFinger1_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKToes_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKAnkle_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKKnee_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKHip_R_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKToes_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKAnkle_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKKnee_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKHip_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKSpine1_M_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKChest_M_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKMiddleFinger3_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKMiddleFinger2_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKMiddleFinger1_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKThumbFinger3_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKThumbFinger2_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKThumbFinger1_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKIndexFinger3_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKIndexFinger2_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKIndexFinger1_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKPinkyFinger3_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKPinkyFinger2_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKPinkyFinger1_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKRingFinger3_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKRingFinger2_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|FKRingFinger1_L_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|IKLeg_R_parentConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|IKLeg_L_parentConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|RootX_M_pointConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M" 
		"-s -r "
		0 "|zombie_rig_ver2RNfosterParent1|RootX_M_orientConstraint1" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M" 
		"-s -r "
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"blendParent1" "blendParent1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M" 
		"Global" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"swivel" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"roll" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"rollStartAngle" " -k 1 30"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"rollEndAngle" " -k 1 60"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"rock" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"stretchy" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"antiPop" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"Lenght1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"Lenght2" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"Fatness1" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"Fatness2" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"volume" " -k 1 10"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"swivel" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"roll" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"rollStartAngle" " -k 1 30"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"rollEndAngle" " -k 1 60"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"rock" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"stretchy" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"antiPop" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"Lenght1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"Lenght2" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"Fatness1" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"Fatness2" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"volume" " -k 1 10"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"blendParent1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKIKSystem|zombie_rig_ver2:FKIKParentConstraintArm_R|zombie_rig_ver2:FKIKArm_R" 
		"FKIKBlend" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKIKSystem|zombie_rig_ver2:FKIKParentConstraintLeg_R|zombie_rig_ver2:FKIKLeg_R" 
		"FKIKBlend" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKIKSystem|zombie_rig_ver2:FKIKParentConstraintSpine_M|zombie_rig_ver2:FKIKSpine_M" 
		"FKIKBlend" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKIKSystem|zombie_rig_ver2:FKIKParentConstraintArm_L|zombie_rig_ver2:FKIKArm_L" 
		"FKIKBlend" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKIKSystem|zombie_rig_ver2:FKIKParentConstraintLeg_L|zombie_rig_ver2:FKIKLeg_L" 
		"FKIKBlend" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M" 
		"visibility" " 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M" 
		"CenterBtwFeet" " -k 1 0"
		2 "zombie_rig_ver2:object" "visibility" " 1"
		2 "zombie_rig_ver2:skeleton" "visibility" " 1"
		3 "zombie_rig_ver2:IKLeg_L_translateX.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.translateX" 
		""
		3 "zombie_rig_ver2:IKLeg_L_translateY.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.translateY" 
		""
		3 "zombie_rig_ver2:IKLeg_L_translateZ.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.translateZ" 
		""
		3 "zombie_rig_ver2:IKLeg_L_rotateX.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateX" 
		""
		3 "zombie_rig_ver2:IKLeg_L_rotateY.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateY" 
		""
		3 "zombie_rig_ver2:IKLeg_L_rotateZ.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateZ" 
		""
		3 "zombie_rig_ver2:IKLeg_L_scaleX.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.scaleX" 
		""
		3 "zombie_rig_ver2:IKLeg_L_scaleY.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.scaleY" 
		""
		3 "zombie_rig_ver2:IKLeg_L_scaleZ.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.scaleZ" 
		""
		3 "zombie_rig_ver2:IKLeg_L_swivel.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.swivel" 
		""
		3 "zombie_rig_ver2:IKLeg_L_roll.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.roll" 
		""
		3 "zombie_rig_ver2:IKLeg_L_rollStartAngle.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rollStartAngle" 
		""
		3 "zombie_rig_ver2:IKLeg_L_rollEndAngle.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rollEndAngle" 
		""
		3 "zombie_rig_ver2:IKLeg_L_rock.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rock" 
		""
		3 "zombie_rig_ver2:IKLeg_L_stretchy.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.stretchy" 
		""
		3 "zombie_rig_ver2:IKLeg_L_antiPop.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.antiPop" 
		""
		3 "zombie_rig_ver2:IKLeg_L_Lenght1.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.Lenght1" 
		""
		3 "zombie_rig_ver2:IKLeg_L_Lenght2.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.Lenght2" 
		""
		3 "zombie_rig_ver2:IKLeg_L_Fatness1.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.Fatness1" 
		""
		3 "zombie_rig_ver2:IKLeg_L_Fatness2.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.Fatness2" 
		""
		3 "zombie_rig_ver2:IKLeg_L_volume.output" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.volume" 
		""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[1]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[2]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[3]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[4]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[5]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[6]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[7]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[8]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[9]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[10]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[11]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[12]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[13]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[14]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[15]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[16]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[17]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[18]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[19]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[20]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[21]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[22]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[23]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[24]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[25]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[26]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[27]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[28]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[29]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[30]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[31]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[32]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[33]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[34]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[35]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[36]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[37]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[38]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[39]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[40]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[41]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[42]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[43]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[44]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[45]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[46]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[47]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[48]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[49]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[50]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[51]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[52]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[53]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[54]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[55]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[56]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[57]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[58]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[59]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[60]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[61]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[62]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[63]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[64]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[65]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[66]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[67]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[68]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[69]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[70]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[71]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[72]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[73]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[74]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[75]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[76]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[77]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[78]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[79]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[80]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[81]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[82]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[83]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[84]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[85]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[86]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[87]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[88]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[89]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[90]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[91]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[92]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[93]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[94]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[95]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[96]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[97]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[98]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[99]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[100]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[101]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[102]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[103]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[104]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[105]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[106]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[107]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[108]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[109]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[110]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[111]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[112]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[113]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[114]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[115]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[116]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[117]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[118]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[119]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[120]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[121]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[122]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[123]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[124]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[125]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[126]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[127]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[128]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[129]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[130]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[131]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[132]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[133]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[134]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[135]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[136]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[137]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[138]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[139]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[140]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[141]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[142]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[143]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[144]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[145]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[146]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[147]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[148]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[149]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[150]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[151]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[152]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[153]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[154]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[155]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[156]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[157]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[158]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[159]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[160]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[161]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[162]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[163]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[164]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[165]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[166]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[167]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[168]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[169]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[170]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[171]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[172]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[173]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[174]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[175]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[176]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[177]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[178]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[179]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[180]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[181]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[182]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[183]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[184]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[185]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[186]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[187]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[188]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[189]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[190]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[191]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[192]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[193]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[194]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[195]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[196]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[197]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[198]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[199]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[200]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[201]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[202]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[203]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[204]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[205]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[206]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[207]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[208]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[209]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[210]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[211]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[212]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[213]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[214]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[215]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[216]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[217]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[218]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[219]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[220]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[221]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[222]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[223]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[224]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[225]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[226]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[227]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[228]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[229]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[230]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[231]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[232]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[233]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[234]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[235]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[236]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[237]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[238]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[239]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[240]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[241]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[242]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[243]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[244]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[245]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[246]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[247]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[248]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[249]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[250]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.translateX" 
		"zombie_rig_ver2RN.placeHolderList[251]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.translateY" 
		"zombie_rig_ver2RN.placeHolderList[252]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.translateZ" 
		"zombie_rig_ver2RN.placeHolderList[253]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.rotatePivot" 
		"zombie_rig_ver2RN.placeHolderList[254]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.rotatePivotTranslate" 
		"zombie_rig_ver2RN.placeHolderList[255]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[256]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[257]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[258]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[259]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[260]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.translateX" 
		"zombie_rig_ver2RN.placeHolderList[261]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.translateY" 
		"zombie_rig_ver2RN.placeHolderList[262]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.translateZ" 
		"zombie_rig_ver2RN.placeHolderList[263]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[264]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[265]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[266]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotatePivot" 
		"zombie_rig_ver2RN.placeHolderList[267]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotatePivotTranslate" 
		"zombie_rig_ver2RN.placeHolderList[268]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[269]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[270]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.blendParent1" 
		"zombie_rig_ver2RN.placeHolderList[271]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[272]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.translateX" 
		"zombie_rig_ver2RN.placeHolderList[273]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.translateY" 
		"zombie_rig_ver2RN.placeHolderList[274]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.translateZ" 
		"zombie_rig_ver2RN.placeHolderList[275]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.rotatePivot" 
		"zombie_rig_ver2RN.placeHolderList[276]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.rotatePivotTranslate" 
		"zombie_rig_ver2RN.placeHolderList[277]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[278]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[279]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[280]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.rotateOrder" 
		"zombie_rig_ver2RN.placeHolderList[281]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[282]" ""
		5 3 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.parentInverseMatrix" 
		"zombie_rig_ver2RN.placeHolderList[283]" ""
		5 3 "zombie_rig_ver2RN" "zombie_rig_ver2:IKLeg_L_rotateX.output" "zombie_rig_ver2RN.placeHolderList[284]" 
		"zombie_rig_ver2:IKLeg_L.rx"
		5 3 "zombie_rig_ver2RN" "zombie_rig_ver2:IKLeg_L_rotateY.output" "zombie_rig_ver2RN.placeHolderList[285]" 
		"zombie_rig_ver2:IKLeg_L.ry"
		5 3 "zombie_rig_ver2RN" "zombie_rig_ver2:IKLeg_L_rotateZ.output" "zombie_rig_ver2RN.placeHolderList[286]" 
		"zombie_rig_ver2:IKLeg_L.rz"
		5 3 "zombie_rig_ver2RN" "zombie_rig_ver2:IKLeg_L_translateX.output" 
		"zombie_rig_ver2RN.placeHolderList[287]" "zombie_rig_ver2:IKLeg_L.tx"
		5 3 "zombie_rig_ver2RN" "zombie_rig_ver2:IKLeg_L_translateY.output" 
		"zombie_rig_ver2RN.placeHolderList[288]" "zombie_rig_ver2:IKLeg_L.ty"
		5 3 "zombie_rig_ver2RN" "zombie_rig_ver2:IKLeg_L_translateZ.output" 
		"zombie_rig_ver2RN.placeHolderList[289]" "zombie_rig_ver2:IKLeg_L.tz";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode animCurveTL -n "Hips_translateX";
	rename -uid "10C7D223-4E0B-CFCE-78D8-E48E2509585A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 2.2010879564237011e-15 0.8 -0.11232121288776398
		 1.6 -0.1633799821138382 2.4 -0.17517545819282532 3.2 -0.11394291371107101 4 0.032945811748504639
		 4.8 0.24806079268455505 5.6 0.52299529314041138 6.4 0.8740772008895874 7.2 1.3274972438812256
		 8 1.9101135730743408 8.8 2.6111869812011719 9.6 3.3967030048370361 10.4 4.2815160751342773
		 11.2 5.2819862365722656 12 6.3289098739624023 12.8 7.3178324699401855 13.6 8.1631574630737305
		 14.4 8.7798614501953125 15.2 9.1516036987304688 16 9.3886661529541016 16.8 9.5871562957763672
		 17.6 9.7286491394042969 18.4 9.7407741546630859 19.2 9.5528993606567383 20 9.1045846939086914
		 20.8 8.4629373550415039 21.6 7.9498720169067383 22.4 7.8126087188720703 23.2 7.9213724136352539
		 24 8.0360908508300781 24.8 8.1115255355834961 25.6 8.1908779144287109 26.4 8.3124017715454102
		 27.2 8.4940862655639648 28 8.6701774597167969 28.8 8.7407312393188477 29.6 8.6753749847412109
		 30.4 8.4780521392822266 31.2 8.1229743957519531 32 7.5923571586608887 32.8 6.9086036682128906
		 33.6 6.1054034233093262 34.4 5.2197408676147461 35.2 4.3015151023864746 36 3.4043810367584229
		 36.8 2.5700693130493164 37.6 1.8185112476348877 38.4 1.1682587862014771 39.2 0.65050297975540161
		 40 0.27014666795730591 40.8 -0.0021787062287330627 41.6 -0.19275254011154175 42.4 -0.31713965535163879
		 43.2 -0.39378008246421814 44 -0.43608230352401733 44.8 -0.44805702567100525 45.6 -0.43958508968353271
		 46.4 -0.4234740138053894 47.2 -0.39935129880905151 48 -0.36325764656066895 48.8 -0.31745031476020813
		 49.6 -0.26182985305786133 50.4 -0.19983156025409698 51.2 -0.1456734836101532 52 -0.10089115798473358
		 52.8 -0.047393858432769775;
createNode animCurveTL -n "Hips_translateY";
	rename -uid "43BA0506-4E15-5632-DFD4-B2AA14197DDD";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 103.96715707112189 0.8 103.60509490966797
		 1.6 103.62232208251953 2.4 103.63666534423828 3.2 103.63230133056641 4 103.61182403564453
		 4.8 103.58611297607422 5.6 103.55442810058594 6.4 103.51448059082031 7.2 103.46875
		 8 103.40785217285156 8.8 103.30168151855469 9.6 103.11671447753906 10.4 102.83180236816406
		 11.2 102.43688201904297 12 101.95242309570312 12.8 101.49584197998047 13.6 101.25154876708984
		 14.4 101.30658721923828 15.2 101.65135192871094 16 102.28765869140625 16.8 103.08975219726562
		 17.6 103.84513854980469 18.4 104.566162109375 19.2 105.37005615234375 20 106.16605377197266
		 20.8 106.72628021240234 21.6 106.80577087402344 22.4 106.27230072021484 23.2 105.36679840087891
		 24 104.55606842041016 24.8 104.04378509521484 25.6 103.74359130859375 26.4 103.58155822753906
		 27.2 103.56964111328125 28 103.69667053222656 28.8 103.87403106689453 29.6 103.98944854736328
		 30.4 104.01445770263672 31.2 104.00813293457031 32 104.01520538330078 32.8 104.02452087402344
		 33.6 104.01544189453125 34.4 103.99337005615234 35.2 103.976806640625 36 103.97116088867188
		 36.8 103.96414947509766 37.6 103.94105529785156 38.4 103.9130859375 39.2 103.90851593017578
		 40 103.92634582519531 40.8 103.94016265869141 41.6 103.93582153320312 42.4 103.92333221435547
		 43.2 103.9134521484375 44 103.905029296875 44.8 103.89349365234375 45.6 103.87577056884766
		 46.4 103.84989929199219 47.2 103.81715393066406 48 103.78089904785156 48.8 103.74366760253906
		 49.6 103.70795440673828 50.4 103.67615509033203 51.2 103.64759826660156 52 103.620361328125
		 52.8 103.59609222412109;
createNode animCurveTL -n "Hips_translateZ";
	rename -uid "DB2FB85B-4FA9-A90F-F836-64AD19B2B603";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.66691904447238837 0.8 0.34167459607124329
		 1.6 0.14813560247421265 2.4 -0.066321730613708496 3.2 -0.29552263021469116 4 -0.51429325342178345
		 4.8 -0.67348796129226685 5.6 -0.7196771502494812 6.4 -0.62171155214309692 7.2 -0.37527614831924438
		 8 0.015843987464904785 8.8 0.52827727794647217 9.6 1.1156256198883057 10.4 1.7623932361602783
		 11.2 2.5208156108856201 12 3.4525585174560547 12.8 4.5286746025085449 13.6 5.632443904876709
		 14.4 6.6321988105773926 15.2 7.4476523399353027 16 8.0896358489990234 16.8 8.5230226516723633
		 17.6 8.5306234359741211 18.4 7.998420238494873 19.2 7.2360506057739258 20 6.6945919990539551
		 20.8 6.5458540916442871 21.6 6.7018156051635742 22.4 6.9187507629394531 23.2 6.9306454658508301
		 24 6.7442197799682617 24.8 6.5826992988586426 25.6 6.5091114044189453 26.4 6.4073710441589355
		 27.2 6.2461109161376953 28 6.0960159301757812 28.8 5.9822568893432617 29.6 5.8797397613525391
		 30.4 5.7769355773925781 31.2 5.6735186576843262 32 5.5559415817260742 32.8 5.391848087310791
		 33.6 5.1355361938476562 34.4 4.7719192504882812 35.2 4.3533692359924316 36 3.9361941814422607
		 36.8 3.5145320892333984 37.6 3.0697112083435059 38.4 2.6307046413421631 39.2 2.2493352890014648
		 40 1.9381546974182129 40.8 1.6640360355377197 41.6 1.4055132865905762 42.4 1.179286003112793
		 43.2 1.0014402866363525 44 0.8644413948059082 44.8 0.75775372982025146 45.6 0.67980265617370605
		 46.4 0.62610042095184326 47.2 0.5854451060295105 48 0.55220186710357666 48.8 0.52745461463928223
		 49.6 0.51239198446273804 50.4 0.51016765832901001 51.2 0.51654571294784546 52 0.5183221697807312
		 52.8 0.51364022493362427;
createNode animCurveTA -n "Hips_rotateX";
	rename -uid "98126D3E-40FF-4FC1-8D4F-A08C1297F589";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.39903873205184937 0.8 0.12028054893016814
		 1.6 0.66597634553909302 2.4 1.2684168815612793 3.2 1.9303065538406372 4 2.5965890884399414
		 4.8 3.2660555839538574 5.6 3.9887790679931641 6.4 4.7366437911987305 7.2 5.4298610687255859
		 8 6.0172176361083984 8.8 6.504249095916748 9.6 6.8322296142578125 10.4 6.8247337341308594
		 11.2 6.5166506767272949 12 6.2402224540710449 12.8 6.2503414154052734 13.6 6.4962868690490723
		 14.4 6.5715961456298828 15.2 6.1217331886291504 16 5.2854018211364746 16.8 4.2936396598815918
		 17.6 3.173466682434082 18.4 1.9958097934722903 19.2 0.90234148502349854 20 0.18329104781150818
		 20.8 0.22556692361831668 21.6 0.87021166086196899 22.4 1.5145130157470703 23.2 1.9693955183029177
		 24 2.4994091987609863 24.8 3.2650351524353027 25.6 4.0465664863586426 26.4 4.5338058471679688
		 27.2 4.6811838150024414 28 4.5044565200805664 28.8 3.9996767044067378 29.6 3.3526527881622314
		 30.4 2.7698805332183838 31.2 2.3053836822509766 32 1.9903644323348997 32.8 1.8046437501907349
		 33.6 1.6331393718719482 34.4 1.4402005672454834 35.2 1.2848674058914185 36 1.1697471141815186
		 36.8 1.0467739105224609 37.6 0.92755401134490967 38.4 0.84456241130828857 39.2 0.75320369005203247
		 40 0.60104793310165405 40.8 0.41138726472854614 41.6 0.23614485561847687 42.4 0.10496190935373306
		 43.2 0.01737382635474205 44 -0.045641031116247177 44.8 -0.1036071702837944 45.6 -0.17262402176856995
		 46.4 -0.25926843285560608 47.2 -0.35319295525550842 48 -0.43999466300010681 48.8 -0.50452512502670288
		 49.6 -0.53957772254943848 50.4 -0.56004631519317627 51.2 -0.5528826117515564 52 -0.48803475499153132
		 52.8 -0.39903971552848816;
createNode animCurveTA -n "Hips_rotateY";
	rename -uid "97D03532-4105-4A1A-6104-1699BFB4EF7E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -7.760209083557128 0.8 -9.3930635452270508
		 1.6 -11.46262264251709 2.4 -13.991194725036621 3.2 -16.900754928588867 4 -20.149673461914062
		 4.8 -23.624242782592773 5.6 -27.079090118408203 6.4 -30.282707214355472 7.2 -33.133941650390625
		 8 -35.763851165771484 8.8 -38.534137725830078 9.6 -41.642200469970703 10.4 -44.806037902832031
		 11.2 -47.466716766357422 12 -49.077930450439453 12.8 -49.042263031005859 13.6 -46.645729064941406
		 14.4 -41.750720977783203 15.2 -35.229789733886719 16 -27.88426399230957 16.8 -19.912014007568359
		 17.6 -12.105037689208984 18.4 -5.7182655334472656 19.2 -0.72219175100326538 20 4.0539031028747559
		 20.8 9.1993246078491211 21.6 13.994026184082031 22.4 17.080350875854492 23.2 18.036888122558594
		 24 18.040166854858398 24.8 18.326335906982422 25.6 18.887529373168945 26.4 19.197650909423828
		 27.2 18.992664337158203 28 18.027891159057617 28.8 16.201677322387695 29.6 13.860990524291992
		 30.4 11.392088890075684 31.2 8.9793720245361328 32 6.7889165878295898 32.8 4.8850216865539551
		 33.6 3.1532063484191895 34.4 1.5366673469543457 35.2 0.10538231581449509 36 -1.1051927804946899
		 36.8 -2.1157190799713135 37.6 -2.9966812133789062 38.4 -3.8429443836212158 39.2 -4.6209073066711426
		 40 -5.281989574432373 40.8 -5.9637064933776855 41.6 -6.739830493927002 42.4 -7.4222464561462411
		 43.2 -7.8466286659240723 44 -8.0807008743286133 44.8 -8.2435417175292969 45.6 -8.3586244583129883
		 46.4 -8.4190874099731445 47.2 -8.4285221099853516 48 -8.3820562362670898 48.8 -8.2844133377075195
		 49.6 -8.1675043106079102 50.4 -8.062774658203125 51.2 -7.9651398658752433 52 -7.8596129417419425
		 52.8 -7.7602081298828125;
createNode animCurveTA -n "Hips_rotateZ";
	rename -uid "6E2E52F7-4765-8EC5-5C4C-7BBE722DFC10";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -2.4514260292053223 0.8 -2.3158993721008301
		 1.6 -2.1898245811462402 2.4 -2.0965285301208496 3.2 -2.0167665481567383 4 -1.9105571508407593
		 4.8 -1.8253765106201174 5.6 -1.8369179964065554 6.4 -1.9134367704391482 7.2 -2.0136568546295166
		 8 -2.1557040214538574 8.8 -2.3002963066101074 9.6 -2.322857141494751 10.4 -2.1389930248260498
		 11.2 -1.8986953496932983 12 -1.9501903057098389 12.8 -2.5091195106506348 13.6 -3.5435431003570557
		 14.4 -4.7449398040771484 15.2 -5.7110037803649902 16 -6.3942418098449707 16.8 -6.9257569313049316
		 17.6 -7.1853432655334482 18.4 -7.2441720962524405 19.2 -7.6674618721008292 20 -8.5223569869995117
		 20.8 -9.1885719299316406 21.6 -9.6817111968994141 22.4 -10.310831069946289 23.2 -10.566396713256836
		 24 -10.031661987304688 24.8 -9.1842947006225586 25.6 -8.4831762313842773 26.4 -7.8816084861755362
		 27.2 -7.3141145706176758 28 -6.8615694046020508 28.8 -6.4937224388122559 29.6 -6.0723929405212402
		 30.4 -5.4994721412658691 31.2 -4.7819461822509766 32 -4.0749192237854004 32.8 -3.5146586894989014
		 33.6 -3.0439543724060059 34.4 -2.6053950786590576 35.2 -2.3287868499755859 36 -2.2957537174224854
		 36.8 -2.3516340255737305 37.6 -2.3283829689025879 38.4 -2.2235870361328125 39.2 -2.1208078861236572
		 40 -2.0544323921203613 40.8 -2.0043861865997314 41.6 -1.987789511680603 42.4 -2.0174570083618164
		 43.2 -2.0293483734130859 44 -1.9980199337005617 44.8 -1.9878299236297605 45.6 -2.0324399471282959
		 46.4 -2.0960924625396729 47.2 -2.1502952575683594 48 -2.2086896896362305 48.8 -2.275261402130127
		 49.6 -2.3160912990570068 50.4 -2.3236756324768066 51.2 -2.3489246368408203 52 -2.4095962047576904
		 52.8 -2.4514205455780029;
createNode animCurveTA -n "Spine_rotateX";
	rename -uid "ADF6DC6F-4027-3D4D-F3D0-8FB68EF2827E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.5699851512908936 0.8 3.4070854187011719
		 1.6 3.2749545574188232 2.4 3.1832396984100342 3.2 3.142972469329834 4 3.1455633640289307
		 4.8 3.1442499160766602 5.6 3.0793638229370117 6.4 2.9358744621276855 7.2 2.7615783214569092
		 8 2.6256437301635742 8.8 2.5817878246307373 9.6 2.67854905128479 10.4 2.9520440101623535
		 11.2 3.3402628898620605 12 3.6195487976074219 12.8 3.5232436656951904 13.6 2.9733214378356934
		 14.4 2.1133263111114502 15.2 1.0714871883392334 16 -0.096655093133449554 16.8 -1.0906608104705811
		 17.6 -1.3142441511154175 18.4 -0.4217950701713562 19.2 1.2205872535705566 20 2.8292472362518311
		 20.8 3.9345023632049565 21.6 4.6469964981079102 22.4 5.3119697570800781 23.2 6.1071052551269531
		 24 6.9218268394470215 24.8 7.4973583221435556 25.6 7.6923799514770499 26.4 7.6033382415771484
		 27.2 7.415501594543457 28 7.2349238395690909 28.8 7.0715146064758301 29.6 6.8817653656005859
		 30.4 6.6052942276000977 31.2 6.2040715217590332 32 5.702631950378418 32.8 5.1985812187194824
		 33.6 4.8007974624633789 34.4 4.5377464294433594 35.2 4.3533411026000977 36 4.1907076835632324
		 36.8 4.0397744178771973 37.6 3.9072761535644536 38.4 3.7882165908813472 39.2 3.6821985244750981
		 40 3.6109755039215092 40.8 3.5977785587310791 41.6 3.6309902667999272 42.4 3.662785530090332
		 43.2 3.6522779464721684 44 3.6027834415435787 44.8 3.552403450012207 45.6 3.5385220050811768
		 46.4 3.5728700160980225 47.2 3.6387243270874023 48 3.7056021690368657 48.8 3.7496953010559082
		 49.6 3.7641198635101314 50.4 3.7514173984527588 51.2 3.712205171585083 52 3.6484196186065674
		 52.8 3.5699858665466309;
createNode animCurveTA -n "Spine_rotateY";
	rename -uid "1FFFAAEE-4AE8-E0A5-5A6C-A8BE71120E53";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.149677038192749 0.8 0.65194547176361084
		 1.6 0.19063042104244232 2.4 -0.26095819473266602 3.2 -0.76843875646591187 4 -1.4113917350769043
		 4.8 -2.2425951957702637 5.6 -3.2636134624481201 6.4 -4.4070768356323242 7.2 -5.5248613357543945
		 8 -6.4243907928466797 8.8 -6.9782600402832031 9.6 -7.2257757186889648 10.4 -7.3487396240234375
		 11.2 -7.5620245933532715 12 -8.0768804550170898 12.8 -9.09149169921875 13.6 -10.567401885986328
		 14.4 -11.887831687927246 15.2 -11.929962158203125 16 -9.7507181167602539 16.8 -5.3727350234985352
		 17.6 0.0045286011882126331 18.4 4.6601381301879883 19.2 7.5135302543640128 20 8.7594709396362305
		 20.8 9.2656669616699219 21.6 9.6709508895874023 22.4 10.384454727172852 23.2 11.756027221679688
		 24 13.68004035949707 24.8 15.393795967102051 25.6 16.14051628112793 26.4 15.889982223510742
		 27.2 15.219289779663084 28 14.663424491882322 28.8 14.293552398681641 29.6 13.82298755645752
		 30.4 13.013241767883301 31.2 11.92064380645752 32 10.781425476074219 32.8 9.7671937942504883
		 33.6 8.8800497055053711 34.4 8.0106077194213867 35.2 7.0656547546386719 36 6.061490535736084
		 36.8 5.1010971069335938 37.6 4.2594456672668457 38.4 3.5162193775177002 39.2 2.8232259750366211
		 40 2.2135493755340576 40.8 1.7771847248077393 41.6 1.5264714956283569 42.4 1.3655914068222046
		 43.2 1.2113897800445557 44 1.0699605941772461 44.8 0.98185145854949951 45.6 0.95620948076248169
		 46.4 0.97233462333679199 47.2 1.0034831762313843 48 1.0269677639007568 48.8 1.0336089134216309
		 49.6 1.0353063344955444 50.4 1.0509345531463623 51.2 1.0833998918533325 52 1.1199320554733276
		 52.8 1.1496782302856445;
createNode animCurveTA -n "Spine_rotateZ";
	rename -uid "12A1AB04-4D0F-7DF6-91D0-A697DC3C46BC";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.077625036239624 0.8 3.5237576961517334
		 1.6 4.0558815002441406 2.4 4.6785378456115723 3.2 5.3569369316101074 4 6.0367727279663086
		 4.8 6.6881189346313477 5.6 7.3010578155517578 6.4 7.8545498847961426 7.2 8.3197975158691406
		 8 8.6639032363891602 8.8 8.8296976089477539 9.6 8.7566719055175781 10.4 8.4744100570678711
		 11.2 8.1637535095214844 12 8.0586452484130859 12.8 8.2447080612182617 13.6 8.5371294021606445
		 14.4 8.5519094467163086 15.2 7.9522142410278329 16 6.6232485771179199 16.8 4.6057600975036621
		 17.6 2.1585555076599121 18.4 -0.15565092861652374 19.2 -1.959650993347168 20 -3.3190512657165527
		 20.8 -4.2240891456604004 21.6 -4.3600301742553711 22.4 -3.757843017578125 23.2 -3.0900239944458008
		 24 -2.9598820209503174 24.8 -3.2983851432800293 25.6 -3.6519532203674316 26.4 -3.7074205875396729
		 27.2 -3.4337286949157715 28 -2.9413440227508545 28.8 -2.3665993213653564 29.6 -1.8497917652130127
		 30.4 -1.4995688199996948 31.2 -1.3223297595977783 32 -1.2118170261383057 32.8 -1.0595700740814209
		 33.6 -0.84978795051574707 34.4 -0.5969383716583252 35.2 -0.25365099310874939 36 0.22361655533313751
		 36.8 0.76262640953063965 37.6 1.223258376121521 38.4 1.5427641868591309 39.2 1.7736561298370361
		 40 1.9907517433166504 40.8 2.2270874977111816 41.6 2.4727826118469238 42.4 2.6899926662445068
		 43.2 2.8398983478546143 44 2.9271435737609863 44.8 2.9944589138031006 45.6 3.0642406940460205
		 46.4 3.1207642555236816 47.2 3.1504867076873779 48 3.162287712097168 48.8 3.1631972789764404
		 49.6 3.1465079784393311 50.4 3.1143441200256348 51.2 3.0869369506835938 52 3.077404260635376
		 52.8 3.0776212215423584;
createNode animCurveTA -n "Spine1_rotateX";
	rename -uid "B846D565-4FBE-C0EB-5CDB-7ABF01D48D7F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.93186873197555553 0.8 0.86858206987380981
		 1.6 0.81783044338226318 2.4 0.79015350341796875 3.2 0.79384148120880127 4 0.82187366485595703
		 4.8 0.84820634126663208 5.6 0.8457026481628418 6.4 0.81087774038314819 7.2 0.76653915643692017
		 8 0.74029839038848877 8.8 0.74818480014801025 9.6 0.80069375038146973 10.4 0.90577268600463856
		 11.2 1.0459816455841064 12 1.165062427520752 12.8 1.202207088470459 13.6 1.139529824256897
		 14.4 1.0022919178009033 15.2 0.82751274108886719 16 0.66646939516067505 16.8 0.60003912448883057
		 17.6 0.68508505821228027 18.4 0.88171768188476562 19.2 1.0896155834197998 20 1.2576445341110229
		 20.8 1.4165050983428955 21.6 1.6144928932189941 22.4 1.863871097564697 23.2 2.1410427093505859
		 24 2.3937046527862549 24.8 2.5543994903564453 25.6 2.5880367755889893 26.4 2.5209636688232422
		 27.2 2.4104416370391846 28 2.3021948337554932 28.8 2.2117681503295898 29.6 2.1259555816650391
		 30.4 2.0207829475402832 31.2 1.8799428939819336 32 1.7033523321151733 32.8 1.5146735906600952
		 33.6 1.3529791831970215 34.4 1.2392123937606812 35.2 1.1609210968017578 36 1.099493145942688
		 36.8 1.0533488988876343 37.6 1.0241892337799072 38.4 1.0012011528015137 39.2 0.9736163616180421
		 40 0.94773012399673451 40.8 0.93890649080276478 41.6 0.94954705238342296 42.4 0.96375423669815063
		 43.2 0.96520870923995972 44 0.95366370677947998 44.8 0.94151270389556885 45.6 0.93983173370361328
		 46.4 0.95072853565216053 47.2 0.96895480155944824 48 0.98684358596801747 48.8 0.99834424257278431
		 49.6 1.0008516311645508 50.4 0.99421066045761108 51.2 0.97888576984405518 52 0.95674562454223633
		 52.8 0.93186819553375255;
createNode animCurveTA -n "Spine1_rotateY";
	rename -uid "4144C64A-4EF2-9956-253F-95A8C105D94F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.43354082107543945 0.8 0.26840862631797791
		 1.6 0.11611826717853546 2.4 -0.033039435744285583 3.2 -0.20227749645709991 4 -0.418882817029953
		 4.8 -0.7001451849937439 5.6 -1.0463466644287109 6.4 -1.4353536367416382 7.2 -1.8172166347503662
		 8 -2.1258585453033447 8.8 -2.3169486522674561 9.6 -2.4029662609100342 10.4 -2.4450459480285645
		 11.2 -2.5163938999176025 12 -2.6911966800689697 12.8 -3.0434219837188721 13.6 -3.5671391487121582
		 14.4 -4.0521464347839355 15.2 -4.1077208518981934 16 -3.3985040187835693 16.8 -1.9086354970932007
		 17.6 -0.03585478663444519 18.4 1.6028605699539185 19.2 2.6020514965057373 20 3.023777961730957
		 20.8 3.1798925399780273 21.6 3.3066666126251221 22.4 3.5478575229644775 23.2 4.018803596496582
		 24 4.675605297088623 24.8 5.2549958229064941 25.6 5.5045151710510254 26.4 5.4190750122070312
		 27.2 5.1953935623168945 28 5.0136618614196777 28.8 4.895535945892334 29.6 4.7408161163330078
		 30.4 4.4671339988708496 31.2 4.0945863723754883 32 3.7051622867584229 32.8 3.3580329418182373
		 33.6 3.0538244247436523 34.4 2.755789041519165 35.2 2.4334197044372559 36 2.0928616523742676
		 36.8 1.7679541110992432 37.6 1.4825470447540283 38.4 1.2293719053268433 39.2 0.99304914474487316
		 40 0.78576642274856567 40.8 0.63850265741348267 41.6 0.55525070428848267 42.4 0.50258129835128784
		 43.2 0.45116013288497925 44 0.40301358699798584 44.8 0.37292927503585815 45.6 0.36479082703590393
		 46.4 0.37147614359855652 47.2 0.38341614603996277 48 0.39252263307571411 48.8 0.3954608142375946
		 49.6 0.39617112278938293 50.4 0.40124472975730896 51.2 0.41193905472755432 52 0.42397740483283997
		 52.8 0.43354016542434692;
createNode animCurveTA -n "Spine1_rotateZ";
	rename -uid "409038A2-4DF5-C9ED-B5E4-CF862D3D1FD7";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.1240864992141724 0.8 1.2673730850219727
		 1.6 1.4376029968261719 2.4 1.6362824440002441 3.2 1.8536777496337891 4 2.0750887393951416
		 4.8 2.2921051979064941 5.6 2.4979705810546875 6.4 2.6804184913635254 7.2 2.8281517028808594
		 8 2.933950662612915 8.8 2.9834938049316406 9.6 2.9581410884857178 10.4 2.8681991100311279
		 11.2 2.7776355743408203 12 2.7752254009246826 12.8 2.8966059684753418 13.6 3.0477783679962158
		 14.4 3.0208685398101807 15.2 2.6622381210327148 16 2.0524101257324219 16.8 1.4460647106170654
		 17.6 1.0016125440597534 18.4 0.63047075271606445 19.2 0.15127961337566376 20 -0.44570633769035339
		 20.8 -0.94887602329254139 21.6 -1.1512963771820068 22.4 -1.0887163877487183 23.2 -0.99701535701751698
		 24 -1.0452120304107666 24.8 -1.1904923915863037 25.6 -1.2861946821212769 26.4 -1.2444961071014404
		 27.2 -1.0835169553756714 28 -0.87576580047607422 28.8 -0.68407249450683594 29.6 -0.5340503454208374
		 30.4 -0.42053797841072083 31.2 -0.32605406641960144 32 -0.23768194019794464 32.8 -0.15712273120880127
		 33.6 -0.09266410768032074 34.4 -0.035794075578451157 35.2 0.041775748133659363 36 0.15487575531005859
		 36.8 0.28243532776832581 37.6 0.39431896805763245 38.4 0.48773002624511724 39.2 0.5803302526473999
		 40 0.67973709106445312 40.8 0.77884167432785034 41.6 0.87174075841903687 42.4 0.95484912395477295
		 43.2 1.0198910236358643 44 1.0626945495605469 44.8 1.0922236442565918 45.6 1.1193392276763916
		 46.4 1.1435408592224121 47.2 1.1585206985473633 48 1.1634336709976196 48.8 1.1617974042892456
		 49.6 1.1552340984344482 50.4 1.1447844505310059 51.2 1.1343082189559937 52 1.1274346113204956
		 52.8 1.1240866184234619;
createNode animCurveTA -n "Spine2_rotateX";
	rename -uid "65D1268F-48EF-7D46-BF9E-E184732E5CC4";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.93017053604125977 0.8 0.86713957786560059
		 1.6 0.81677073240280151 2.4 0.78946983814239502 3.2 0.79332751035690308 4 0.82122403383255005
		 4.8 0.84719604253768921 5.6 0.84412902593612671 6.4 0.80828982591629028 7.2 0.76232492923736572
		 8 0.73433512449264526 8.8 0.74108600616455078 9.6 0.79310661554336548 10.4 0.89772534370422352
		 11.2 1.037729024887085 12 1.1592562198638916 12.8 1.2041186094284058 13.6 1.1512387990951538
		 14.4 1.0166001319885254 15.2 0.8353506326675415 16 0.66945791244506836 16.8 0.60138696432113647
		 17.6 0.67111694812774658 18.4 0.833271324634552 19.2 1.0089633464813232 20 1.1664155721664429
		 20.8 1.3327906131744385 21.6 1.5447685718536377 22.4 1.8086727857589722 23.2 2.0956542491912842
		 24 2.3475911617279053 24.8 2.4983060359954834 25.6 2.5196621417999268 26.4 2.4418015480041504
		 27.2 2.322847843170166 28 2.2112197875976562 28.8 2.1251533031463623 29.6 2.049311637878418
		 30.4 1.9538263082504272 31.2 1.8185262680053709 32 1.6450477838516235 32.8 1.4611313343048096
		 33.6 1.3073984384536743 34.4 1.2033646106719971 35.2 1.1348690986633301 36 1.0825585126876831
		 36.8 1.0441344976425171 37.6 1.0202823877334595 38.4 0.99976968765258789 39.2 0.97260469198226929
		 40 0.94645363092422485 40.8 0.93755686283111572 41.6 0.94835495948791493 42.4 0.96265363693237305
		 43.2 0.96404737234115601 44 0.95244467258453369 44.8 0.94030463695526123 45.6 0.93861031532287598
		 46.4 0.9493919014930724 47.2 0.9674648642539978 48 0.98527407646179199 48.8 0.99676328897476207
		 49.6 0.99925768375396729 50.4 0.99256998300552357 51.2 0.97719627618789673 52 0.95504480600357045
		 52.8 0.93017053604125977;
createNode animCurveTA -n "Spine2_rotateY";
	rename -uid "BFE202F5-4820-DBC0-C3E0-B58C63F47BB5";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.45010954141616821 0.8 0.28734183311462402
		 1.6 0.13753055036067963 2.4 -0.0097326235845685005 3.2 -0.17829787731170654 4 -0.39510384202003479
		 4.8 -0.67630481719970703 5.6 -1.0213713645935059 6.4 -1.4084948301315308 7.2 -1.7888685464859009
		 8 -2.0972287654876709 8.8 -2.2894914150238037 9.6 -2.3779852390289307 10.4 -2.422980785369873
		 11.2 -2.4961152076721191 12 -2.671217679977417 12.8 -3.0251085758209229 13.6 -3.556647777557373
		 14.4 -4.0577812194824219 15.2 -4.1344304084777832 16 -3.4435088634490967 16.8 -1.9584834575653074
		 17.6 -0.069905973970890045 18.4 1.5997408628463745 19.2 2.6279184818267822 20 3.0632438659667969
		 20.8 3.2189021110534668 21.6 3.3400297164916992 22.4 3.5756378173828125 23.2 4.0424709320068359
		 24 4.6977262496948242 24.8 5.2781262397766113 25.6 5.530128002166748 26.4 5.447838306427002
		 27.2 5.2272400856018066 28 5.0467867851257324 28.8 4.9270038604736328 29.6 4.7687215805053711
		 30.4 4.4920988082885742 31.2 4.1184287071228027 32 3.7284839153289795 32.8 3.3795199394226074
		 33.6 3.0720245838165283 34.4 2.7706007957458496 35.2 2.4457087516784668 36 2.1032576560974121
		 36.8 1.7765834331512451 37.6 1.4896785020828247 38.4 1.2360095977783203 39.2 1.0005677938461304
		 40 0.79498094320297241 40.8 0.6493302583694458 41.6 0.56731170415878296 42.4 0.5157325267791748
		 43.2 0.46528950333595281 44 0.4177510142326355 44.8 0.38792270421981812 45.6 0.38007113337516785
		 46.4 0.38732486963272095 47.2 0.39993211627006531 48 0.40949621796607971 48.8 0.41262638568878174
		 49.6 0.41340497136116028 50.4 0.41849732398986816 51.2 0.4290943443775177 52 0.44087603688240051
		 52.8 0.45011126995086675;
createNode animCurveTA -n "Spine2_rotateZ";
	rename -uid "8DE5E32C-44A0-BA97-3536-B18E4D51AA9A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.1190834045410156 0.8 1.2647780179977417
		 1.6 1.4370464086532593 2.4 1.6373190879821777 3.2 1.856114983558655 4 2.0792772769927979
		 4.8 2.2989428043365479 5.6 2.5085453987121582 6.4 2.6954445838928223 7.2 2.8473730087280273
		 8 2.956066370010376 8.8 3.0066385269165039 9.6 2.9807267189025879 10.4 2.8895728588104248
		 11.2 2.7983629703521729 12 2.7963104248046875 12.8 2.9164931774139404 13.6 3.0580675601959229
		 14.4 3.0062258243560791 15.2 2.6112194061279297 16 1.9769190549850462 16.8 1.3881964683532715
		 17.6 1.0032130479812622 18.4 0.6882469654083252 19.2 0.21878482401371002 20 -0.40855857729911804
		 20.8 -0.94364339113235474 21.6 -1.1566928625106812 22.4 -1.0907063484191895 23.2 -0.99747496843338013
		 24 -1.0518465042114258 24.8 -1.2072204351425171 25.6 -1.3119529485702515 26.4 -1.276771068572998
		 27.2 -1.120951771736145 28 -0.91738826036453236 28.8 -0.72822111845016479 29.6 -0.57861149311065674
		 30.4 -0.46345630288124084 31.2 -0.3656955361366272 32 -0.2739596962928772 32.8 -0.19176922738552094
		 33.6 -0.12717558443546295 34.4 -0.069637753069400787 35.2 0.010448575019836426 36 0.12757411599159241
		 36.8 0.25973895192146301 37.6 0.37612059712409973 38.4 0.47345176339149475 39.2 0.5691533088684082
		 40 0.67082023620605469 40.8 0.77141201496124268 41.6 0.86522841453552246 42.4 0.94903063774108898
		 43.2 1.0147637128829956 44 1.0581918954849243 44.8 1.0881290435791016 45.6 1.1153794527053833
		 46.4 1.1395034790039062 47.2 1.154293417930603 48 1.1590323448181152 48.8 1.1573048830032349
		 49.6 1.1506941318511963 50.4 1.1401499509811401 51.2 1.1295208930969238 52 1.1225044727325439
		 52.8 1.1190828084945679;
createNode animCurveTA -n "Neck_rotateX";
	rename -uid "DCCA2644-4176-8F2E-F6CB-BCB11B14A070";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -15.718751392851093 0.8 -3.1007459163665771
		 1.6 -3.1634960174560547 2.4 -3.2449023723602295 3.2 -3.3417601585388184 4 -3.4319684505462646
		 4.8 -3.4863641262054443 5.6 -3.4892206192016602 6.4 -3.444350004196167 7.2 -3.3612735271453857
		 8 -3.2378780841827393 8.8 -3.0598399639129639 9.6 -2.8271868228912354 10.4 -2.5798485279083252
		 11.2 -2.3640830516815186 12 -2.1615369319915771 12.8 -1.9017534255981448 13.6 -1.5781391859054565
		 14.4 -1.3078856468200684 15.2 -1.267025351524353 16 -1.624653697013855 16.8 -2.4784910678863525
		 17.6 -3.6926062107086182 18.4 -4.846590518951416 19.2 -5.561225414276123 20 -5.882380485534668
		 20.8 -6.1733989715576172 21.6 -6.670506477355957 22.4 -7.3196296691894531 23.2 -7.9767198562622061
		 24 -8.5483551025390625 24.8 -8.9344863891601562 25.6 -9.018951416015625 26.4 -8.7832012176513672
		 27.2 -8.3423089981079102 28 -7.8330292701721191 28.8 -7.3144192695617676 29.6 -6.7847957611083984
		 30.4 -6.2493414878845215 31.2 -5.7491388320922852 32 -5.3377952575683594 32.8 -5.0423612594604492
		 33.6 -4.8502078056335449 34.4 -4.7288932800292969 35.2 -4.6491546630859375 36 -4.5919070243835449
		 36.8 -4.5476813316345215 37.6 -4.5121526718139648 38.4 -4.4770493507385254 39.2 -4.4315977096557617
		 40 -4.3770632743835449 40.8 -4.327815055847168 41.6 -4.2913312911987305 42.4 -4.2577481269836426
		 43.2 -4.2133626937866211 44 -4.154667854309082 44.8 -4.0869865417480469 45.6 -4.0168805122375488
		 46.4 -3.9461312294006348 47.2 -3.8685543537139897 48 -3.7737355232238774 48.8 -3.6564545631408691
		 49.6 -3.522376537322998 50.4 -3.3848514556884766 51.2 -3.2569150924682617 52 -3.1447803974151611
		 52.8 -3.0485143661499023;
createNode animCurveTA -n "Neck_rotateY";
	rename -uid "9B36EBB6-415E-9EE2-32FC-1CBD49549C42";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.65968388319015503 0.8 0.69216442108154297
		 1.6 0.72826296091079712 2.4 0.78528708219528198 3.2 0.88943171501159668 4 1.0622683763504028
		 4.8 1.3080465793609619 5.6 1.6161512136459351 6.4 1.9711382389068604 7.2 2.3519008159637451
		 8 2.7252798080444336 8.8 3.0583367347717285 9.6 3.3454375267028809 10.4 3.6106419563293457
		 11.2 3.87236499786377 12 4.1111655235290527 12.8 4.2750129699707031 13.6 4.2966270446777344
		 14.4 4.0839223861694336 15.2 3.5106086730957031 16 2.4770224094390869 16.8 1.0523042678833008
		 17.6 -0.44458657503128052 18.4 -1.608558177947998 19.2 -2.2699403762817383 20 -2.6184606552124023
		 20.8 -2.9255397319793701 21.6 -3.2392394542694092 22.4 -3.4872505664825439 23.2 -3.7034018039703365
		 24 -3.9625132083892827 24.8 -4.2131295204162598 25.6 -4.3338298797607422 26.4 -4.29644775390625
		 27.2 -4.183657169342041 28 -4.074491024017334 28.8 -3.9634871482849121 29.6 -3.7926163673400879
		 30.4 -3.536707878112793 31.2 -3.2367527484893799 32 -2.9522902965545654 32.8 -2.7050344944000244
		 33.6 -2.4776668548583984 34.4 -2.2454793453216553 35.2 -1.9984972476959229 36 -1.7473856210708618
		 36.8 -1.5156353712081909 37.6 -1.3205107450485229 38.4 -1.1614542007446289 39.2 -1.0289676189422607
		 40 -0.91727143526077271 40.8 -0.82185280323028564 41.6 -0.7325669527053833 42.4 -0.63891458511352539
		 43.2 -0.5389028787612915 44 -0.43689849972724915 44.8 -0.33615404367446899 45.6 -0.23697565495967865
		 46.4 -0.13774693012237549 47.2 -0.035076577216386795 48 0.073739998042583466 48.8 0.18670642375946045
		 49.6 0.29728823900222778 50.4 0.39947137236595154 51.2 0.49206691980361933 52 0.577842116355896
		 52.8 0.65968215465545654;
createNode animCurveTA -n "Neck_rotateZ";
	rename -uid "5294D173-466A-D73E-3CDC-ACA1A1318A76";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.0429291725158691 0.8 3.0493812561035156
		 1.6 3.0562782287597656 2.4 3.0562782287597656 3.2 3.0375268459320068 4 2.9881770610809326
		 4.8 2.905977725982666 5.6 2.8034565448760986 6.4 2.6979358196258545 7.2 2.5989482402801514
		 8 2.5156989097595215 8.8 2.4695248603820801 9.6 2.47629714012146 10.4 2.5172688961029053
		 11.2 2.5504732131958008 12 2.567042350769043 12.8 2.6537990570068359 13.6 3.0035545825958252
		 14.4 3.7996957302093506 15.2 5.0017623901367188 16 6.242103099822998 16.8 7.0113868713378906
		 17.6 7.0084662437438965 18.4 6.3404731750488281 19.2 5.419102668762207 20 4.6384997367858887
		 20.8 4.1070261001586914 21.6 3.7392489910125728 22.4 3.5356104373931885 23.2 3.6003739833831787
		 24 3.9134385585784917 24.8 4.2582874298095703 25.6 4.418281078338623 26.4 4.3628573417663574
		 27.2 4.2266473770141602 28 4.1524734497070312 28.8 4.1705732345581055 29.6 4.2153434753417969
		 30.4 4.2313151359558105 31.2 4.2250041961669922 32 4.2174057960510254 32.8 4.2018065452575684
		 33.6 4.166684627532959 34.4 4.114255428314209 35.2 4.0401568412780762 36 3.9329984188079834
		 36.8 3.8064417839050293 37.6 3.7015511989593501 38.4 3.6453452110290527 39.2 3.6249394416809086
		 40 3.6083965301513672 40.8 3.5761482715606689 41.6 3.5277912616729736 42.4 3.4706380367279053
		 43.2 3.408085823059082 44 3.3377869129180908 44.8 3.26222825050354 45.6 3.1958513259887695
		 46.4 3.151237964630127 47.2 3.1229457855224609 48 3.0964114665985107 48.8 3.0680501461029053
		 49.6 3.046750545501709 50.4 3.038989782333374 51.2 3.0405809879302979 52 3.0432989597320557
		 52.8 3.0429313182830811;
createNode animCurveTA -n "Head_rotateX";
	rename -uid "EAB8B0CA-45B9-6053-A6F2-38B75C411C66";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 16.710094335482907 0.8 -3.0466513633728027
		 1.6 -3.1142432689666748 2.4 -3.200716495513916 3.2 -3.301856517791748 4 -3.3944833278656006
		 4.8 -3.4488134384155273 5.6 -3.4489500522613525 6.4 -3.3988609313964844 7.2 -3.3085422515869141
		 8 -3.1770651340484619 8.8 -2.9918732643127441 9.6 -2.7541744709014893 10.4 -2.5032947063446045
		 11.2 -2.283266544342041 12 -2.0727920532226562 12.8 -1.7987456321716309 13.6 -1.4546259641647339
		 14.4 -1.1638367176055908 15.2 -1.114539623260498 16 -1.4891617298126221 16.8 -2.3916845321655273
		 17.6 -3.6761236190795898 18.4 -4.8944692611694336 19.2 -5.6417627334594727 20 -5.9625720977783203
		 20.8 -6.2388038635253906 21.6 -6.7227859497070312 22.4 -7.3660593032836923 23.2 -8.0258998870849609
		 24 -8.607487678527832 24.8 -9.0052003860473633 25.6 -9.0970020294189453 26.4 -8.8637456893920898
		 27.2 -8.4239273071289062 28 -7.91695261001587 28.8 -7.4006276130676278 29.6 -6.8708839416503906
		 30.4 -6.3325376510620117 31.2 -5.828343391418457 32 -5.4130043983459473 32.8 -5.1130800247192383
		 33.6 -4.9151606559753418 34.4 -4.7868680953979492 35.2 -4.6994357109069824 36 -4.6342158317565918
		 36.8 -4.5824275016784668 37.6 -4.5404872894287109 38.4 -4.5005793571472168 39.2 -4.4516515731811523
		 40 -4.3943605422973633 40.8 -4.3427276611328125 41.6 -4.3038492202758789 42.4 -4.2672886848449707
		 43.2 -4.2190608978271484 44 -4.1557574272155762 44.8 -4.0830554962158203 45.6 -4.0077929496765137
		 46.4 -3.9318127632141113 47.2 -3.8488039970397954 48 -3.7482199668884277 48.8 -3.6249299049377446
		 49.6 -3.4848568439483643 50.4 -3.3416037559509277 51.2 -3.2083256244659424 52 -3.091264009475708
		 52.8 -2.9903867244720459;
createNode animCurveTA -n "Head_rotateY";
	rename -uid "791083BD-4099-CD28-D63B-6295CB3EAF92";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.60823357105255127 0.8 0.6490020751953125
		 1.6 0.69489860534667969 2.4 0.76371258497238159 3.2 0.88151854276657104 4 1.0686665773391724
		 4.8 1.3276829719543457 5.6 1.6463776826858521 6.4 2.008436918258667 7.2 2.3928132057189941
		 8 2.7669687271118164 8.8 3.0987753868103027 9.6 3.3831915855407715 10.4 3.6455159187316895
		 11.2 3.905739307403564 12 4.1447696685791016 12.8 4.3095102310180664 13.6 4.3315768241882324
		 14.4 4.1197233200073242 15.2 3.554058313369751 16 2.5472147464752197 16.8 1.173323392868042
		 17.6 -0.270586758852005 18.4 -1.4186079502105713 19.2 -2.1154177188873291 20 -2.5226101875305176
		 20.8 -2.8749425411224365 21.6 -3.209693431854248 22.4 -3.4657385349273682 23.2 -3.687867164611816
		 24 -3.9525988101959229 24.8 -4.2062640190124512 25.6 -4.3254785537719727 26.4 -4.2816286087036133
		 27.2 -4.1593475341796875 28 -4.0418663024902344 28.8 -3.9270462989807124 29.6 -3.7563648223876949
		 30.4 -3.5013680458068848 31.2 -3.2009034156799316 32 -2.9158363342285156 32.8 -2.6706578731536865
		 33.6 -2.448293924331665 34.4 -2.2217535972595215 35.2 -1.9792808294296265 36 -1.7315081357955933
		 36.8 -1.5022449493408203 37.6 -1.3083698749542236 38.4 -1.148779034614563 39.2 -1.0142093896865845
		 40 -0.90000301599502563 40.8 -0.8027350902557373 41.6 -0.71256774663925171 42.4 -0.61892294883728027
		 43.2 -0.52010291814804077 44 -0.42085793614387512 44.8 -0.3241991400718689 45.6 -0.22970208525657654
		 46.4 -0.13544508814811707 47.2 -0.038328606635332108 48 0.064100012183189392 48.8 0.1700492799282074
		 49.6 0.27335315942764282 50.4 0.3682156503200531 51.2 0.45362061262130737 52 0.53257864713668823
		 52.8 0.60823285579681396;
createNode animCurveTA -n "Head_rotateZ";
	rename -uid "6A63BC51-49E8-29D8-425E-00A4F334514F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.080070972442627 0.8 3.0842764377593994
		 1.6 3.0881056785583496 2.4 3.0845022201538086 3.2 3.0622043609619141 4 3.0101091861724854
		 4.8 2.9265506267547607 5.6 2.8245120048522949 6.4 2.7214605808258057 7.2 2.6262972354888916
		 8 2.5466809272766113 8.8 2.5020170211791992 9.6 2.5073020458221436 10.4 2.5447568893432617
		 11.2 2.5743522644042969 12 2.588447093963623 12.8 2.6730964183807373 13.6 3.0195415019989014
		 14.4 3.8111121654510498 15.2 5.0098042488098145 16 6.2510442733764648 16.8 7.0240931510925293
		 17.6 7.0193815231323242 18.4 6.336552619934082 19.2 5.3906803131103516 20 4.5867900848388672
		 20.8 4.0409603118896484 21.6 3.6658999919891357 22.4 3.4530184268951416 23.2 3.4985287189483643
		 24 3.7837302684783936 24.8 4.1033844947814941 25.6 4.2520351409912109 26.4 4.2005596160888672
		 27.2 4.0761284828186035 28 4.0143551826477051 28.8 4.0439338684082031 29.6 4.1012601852416992
		 30.4 4.1316571235656738 31.2 4.139885425567627 32 4.1440305709838867 32.8 4.1361880302429199
		 33.6 4.1061673164367676 34.4 4.0585336685180664 35.2 3.9901425838470455 36 3.8894081115722656
		 36.8 3.7693357467651367 37.6 3.670496940612793 38.4 3.6196379661560059 39.2 3.6038081645965572
		 40 3.5910074710845947 40.8 3.5615732669830322 41.6 3.5154294967651367 42.4 3.4606153964996338
		 43.2 3.4010143280029297 44 3.334162712097168 44.8 3.262214183807373 45.6 3.1994020938873291
		 46.4 3.1583273410797119 47.2 3.1336879730224609 48 3.1110658645629883 48.8 3.086867094039917
		 49.6 3.0697858333587646 50.4 3.0660274028778076 51.2 3.0712792873382568 52 3.0773253440856934
		 52.8 3.080073356628418;
createNode animCurveTA -n "LeftShoulder_rotateX";
	rename -uid "EC7FD64C-4818-693C-11C1-0584EBBC1F87";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -4.0550880661768494e-16 0.8 11.682552337646484
		 1.6 11.124637603759766 2.4 10.295008659362793 3.2 9.2316265106201172 4 7.9754362106323242
		 4.8 6.5428104400634766 5.6 4.9411959648132324 6.4 3.2477641105651855 7.2 1.6121612787246704
		 8 0.11535572260618208 8.8 -1.3133302927017212 9.6 -2.7639944553375244 10.4 -4.1781244277954102
		 11.2 -5.3939070701599121 12 -6.4295969009399414 12.8 -7.3490800857543954 13.6 -8.3482704162597656
		 14.4 -9.5617399215698242 15.2 -10.629401206970215 16 -10.741839408874512 16.8 -9.4393014907836914
		 17.6 -7.2157473564147949 18.4 -5.0170040130615234 19.2 -3.3130691051483154 20 -1.9915527105331421
		 20.8 -0.96149826049804688 21.6 -0.38557249307632446 22.4 -0.2942923903465271 23.2 -0.34408873319625854
		 24 -0.15649203956127167 24.8 0.29823750257492065 25.6 0.84035784006118774 26.4 1.3920981884002686
		 27.2 1.9415631294250486 28 2.3778138160705566 28.8 2.5692622661590576 29.6 2.5322213172912598
		 30.4 2.424673318862915 31.2 2.4136137962341309 32 2.5908281803131104 32.8 2.9586498737335205
		 33.6 3.4530553817749023 34.4 3.9937665462493901 35.2 4.5424618721008301 36 5.0899567604064941
		 36.8 5.595299243927002 37.6 6.0044479370117188 38.4 6.3375396728515625 39.2 6.6882390975952148
		 40 7.1093735694885254 40.8 7.5639662742614746 41.6 8.0075922012329102 42.4 8.449737548828125
		 43.2 8.9236202239990234 44 9.4277935028076172 44.8 9.9212799072265625 45.6 10.356514930725098
		 46.4 10.716382026672363 47.2 11.018106460571289 48 11.283228874206543 48.8 11.509617805480957
		 49.6 11.686162948608398 50.4 11.814297676086426 51.2 11.900162696838379 52 11.943635940551758
		 52.8 11.93400764465332;
createNode animCurveTA -n "LeftShoulder_rotateY";
	rename -uid "60E3100F-4AFD-E871-9E40-6A9FF03029A4";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 11.356497941191973 0.8 1.9968805313110352
		 1.6 2.1374435424804688 2.4 2.3131592273712158 3.2 2.5094523429870605 4 2.7143270969390869
		 4.8 2.9132485389709473 5.6 3.0850527286529541 6.4 3.2081208229064941 7.2 3.2654123306274414
		 8 3.2451825141906738 8.8 3.1523253917694092 9.6 3.0218634605407715 10.4 2.9046230316162109
		 11.2 2.8286409378051758 12 2.7948129177093506 12.8 2.7756502628326416 13.6 2.7286686897277832
		 14.4 2.595261812210083 15.2 2.3556864261627197 16 2.1224119663238525 16.8 2.0840528011322021
		 17.6 2.2832555770874023 18.4 2.592562198638916 19.2 2.9051558971405029 20 3.1779139041900635
		 20.8 3.3548469543457031 21.6 3.3805103302001953 22.4 3.2690699100494385 23.2 3.1135025024414062
		 24 3.0022130012512207 24.8 2.9345114231109619 25.6 2.871931791305542 26.4 2.8133437633514404
		 27.2 2.7657558917999268 28 2.70723557472229 28.8 2.617706298828125 29.6 2.5088236331939697
		 30.4 2.4087100028991699 31.2 2.3385782241821289 32 2.3111724853515625 32.8 2.3291084766387939
		 33.6 2.3693292140960693 34.4 2.3908216953277588 35.2 2.3745720386505127 36 2.3372759819030762
		 36.8 2.2960412502288818 37.6 2.2457056045532227 38.4 2.1837551593780518 39.2 2.1296453475952148
		 40 2.1001508235931396 40.8 2.0862247943878174 41.6 2.0722548961639404 42.4 2.05995774269104
		 43.2 2.0592825412750244 44 2.0683553218841553 44.8 2.0740251541137695 45.6 2.066472053527832
		 46.4 2.0466034412384033 47.2 2.0216567516326904 48 1.9975031614303591 48.8 1.9755369424819946
		 49.6 1.9552780389785767 50.4 1.9375222921371458 51.2 1.9237191677093506 52 1.9136422872543335
		 52.8 1.9053641557693481;
createNode animCurveTA -n "LeftShoulder_rotateZ";
	rename -uid "5B80CB5A-4E49-44FC-0088-AF8B8453BDF7";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 11.19289775580496 0.8 2.8696861267089844
		 1.6 3.2748498916625977 2.4 3.695710182189941 3.2 4.0983572006225586 4 4.4592528343200684
		 4.8 4.746243953704834 5.6 4.8987374305725098 6.4 4.851966381072998 7.2 4.5596327781677246
		 8 4.0008783340454102 8.8 3.2401220798492432 9.6 2.4801900386810303 10.4 1.9488615989685059
		 11.2 1.7085391283035278 12 1.6543357372283936 12.8 1.6644935607910156 13.6 1.6172043085098267
		 14.4 1.3412128686904907 15.2 0.7466353178024292 16 0.0079749599099159241 16.8 -0.49495357275009155
		 17.6 -0.46545383334159851 18.4 0.081804223358631134 19.2 0.91702228784561157 20 1.788625955581665
		 20.8 2.4135684967041016 21.6 2.5258297920227051 22.4 2.1487483978271484 23.2 1.6400872468948364
		 24 1.2930492162704468 24.8 1.076528787612915 25.6 0.86929595470428467 26.4 0.69148862361907959
		 27.2 0.58038997650146484 28 0.47103312611579895 28.8 0.31523570418357849 29.6 0.16780939698219299
		 30.4 0.10277818888425827 31.2 0.14772245287895203 32 0.32006648182868958 32.8 0.62923634052276611
		 33.6 1.0001019239425659 34.4 1.2822916507720947 35.2 1.402011513710022 36 1.4313150644302368
		 36.8 1.4554888010025024 37.6 1.4666757583618164 38.4 1.4463950395584106 39.2 1.4506063461303711
		 40 1.5346176624298096 40.8 1.6690592765808105 41.6 1.797983765602112 42.4 1.923846364021301
		 43.2 2.0798740386962891 44 2.258223295211792 44.8 2.4112186431884766 45.6 2.5049443244934082
		 46.4 2.544675350189209 47.2 2.5562546253204346 48 2.5592653751373291 48.8 2.5587155818939209
		 49.6 2.5535807609558105 50.4 2.5458009243011475 51.2 2.5385339260101318 52 2.5294866561889648
		 52.8 2.5109152793884277;
createNode animCurveTA -n "LeftArm_rotateX";
	rename -uid "63F7A2AC-450F-3492-0D65-85ADB4A5CAE8";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 58.870132446289062 0.8 60.031032562255866
		 1.6 61.595184326171875 2.4 63.374534606933587 3.2 65.086479187011719 4 66.472885131835938
		 4.8 67.448570251464844 5.6 68.062271118164062 6.4 68.274185180664062 7.2 67.895416259765625
		 8 66.839599609375 8.8 65.312026977539062 9.6 63.663356781005859 10.4 62.208625793457031
		 11.2 61.316875457763672 12 61.506107330322259 12.8 62.810249328613288 13.6 64.613655090332031
		 14.4 65.996551513671875 15.2 66.104217529296875 16 64.553794860839844 16.8 62.277553558349602
		 17.6 60.693710327148438 18.4 59.842796325683587 19.2 58.905517578125007 20 57.565452575683594
		 20.8 56.118659973144531 21.6 54.586158752441406 22.4 52.629585266113281 23.2 50.405254364013672
		 24 48.660255432128906 24.8 48.066387176513672 25.6 48.786685943603516 26.4 50.512950897216797
		 27.2 52.824298858642578 28 55.370399475097656 28.8 57.821151733398445 29.6 59.939811706542976
		 30.4 61.716693878173821 31.2 63.245262145996087 32 64.473175048828125 32.8 65.192169189453125
		 33.6 65.246543884277344 34.4 64.690963745117188 35.2 63.733295440673835 36 62.549274444580078
		 36.8 61.211097717285149 37.6 59.789653778076179 38.4 58.422004699707031 39.2 57.248680114746094
		 40 56.354549407958984 40.8 55.778129577636719 41.6 55.518192291259766 42.4 55.507946014404297
		 43.2 55.633270263671875 44 55.820350646972656 44.8 56.084125518798828 45.6 56.461235046386719
		 46.4 56.919914245605469 47.2 57.371299743652337 48 57.755947113037102 48.8 58.080062866210945
		 49.6 58.366180419921868 50.4 58.6024169921875 51.2 58.758049011230469 52 58.834629058837898
		 52.8 58.8701171875;
createNode animCurveTA -n "LeftArm_rotateY";
	rename -uid "248C1A66-4F05-3F0B-3C40-4685FE4D2473";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 4.5509676933288574 0.8 4.8339953422546387
		 1.6 4.7272090911865234 2.4 4.2843170166015625 3.2 3.7618374824523926 4 3.5168581008911133
		 4.8 3.7415332794189453 5.6 4.2904491424560547 6.4 4.8077621459960938 7.2 5.0791754722595215
		 8 5.2168130874633789 8.8 5.5833311080932617 9.6 6.6801910400390625 10.4 8.9691238403320312
		 11.2 12.486800193786621 12 16.647037506103516 12.8 20.804418563842773 13.6 24.711151123046875
		 14.4 28.115482330322266 15.2 30.004901885986328 16 28.686674118041992 16.8 22.950912475585938
		 17.6 13.501412391662598 18.4 3.2411885261535645 19.2 -4.8738260269165039 20 -10.268330574035645
		 20.8 -13.853386878967285 21.6 -15.753554344177246 22.4 -15.557736396789549 23.2 -13.85429859161377
		 24 -11.942680358886719 24.8 -10.313408851623535 25.6 -8.465423583984375 26.4 -6.0918455123901367
		 27.2 -3.5094783306121826 28 -1.0282248258590698 28.8 1.4713903665542603 29.6 4.2771158218383789
		 30.4 7.3903293609619141 31.2 10.452194213867188 32 13.003987312316895 32.8 14.746804237365723
		 33.6 15.624567031860352 34.4 15.746880531311033 35.2 15.325967788696289 36 14.67302894592285
		 36.8 14.077289581298828 37.6 13.583747863769531 38.4 12.990801811218262 39.2 12.137598037719727
		 40 11.076974868774414 40.8 9.9316282272338867 41.6 8.7683944702148438 42.4 7.6691179275512695
		 43.2 6.7548036575317383 44 6.0720310211181641 44.8 5.553797721862793 45.6 5.132624626159668
		 46.4 4.8244328498840332 47.2 4.6695575714111328 48 4.6486644744873047 48.8 4.6871871948242188
		 49.6 4.7101469039916992 50.4 4.6846790313720703 51.2 4.6288061141967773 52 4.5785121917724609
		 52.8 4.5509676933288574;
createNode animCurveTA -n "LeftArm_rotateZ";
	rename -uid "3AC502F0-4CE9-D172-F939-27918B79521B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -12.986017197226678 0.8 17.807300567626953
		 1.6 19.425029754638672 2.4 21.046718597412109 3.2 22.424718856811523 4 23.429811477661133
		 4.8 24.079734802246094 5.6 24.414264678955078 6.4 24.324365615844727 7.2 23.474477767944336
		 8 21.554805755615234 8.8 18.71043586730957 9.6 15.532199859619141 10.4 12.503504753112793
		 11.2 9.6853981018066406 12 7.0380120277404785 12.8 4.5370030403137207 13.6 2.0178110599517822
		 14.4 -0.34327131509780884 15.2 -0.93530768156051647 16 3.1240837574005127 16.8 13.318658828735352
		 17.6 26.562826156616211 18.4 36.862422943115234 19.2 40.977176666259766 20 40.237567901611328
		 20.8 37.710651397705078 21.6 35.642147064208984 22.4 35.291351318359375 23.2 37.069412231445312
		 24 40.022308349609375 24.8 42.024143218994141 25.6 41.378791809082031 26.4 38.272235870361328
		 27.2 34.092815399169922 28 29.635833740234379 28.8 24.691461563110352 29.6 19.281017303466797
		 30.4 14.494053840637205 31.2 11.686783790588379 32 11.19281005859375 32.8 12.167154312133789
		 33.6 13.497664451599121 34.4 14.566980361938477 35.2 15.274756431579592 36 15.726677894592285
		 36.8 16.051174163818359 37.6 16.327869415283203 38.4 16.522052764892578 39.2 16.526021957397461
		 40 16.330947875976562 40.8 16.101657867431641 41.6 16.027458190917969 42.4 16.158845901489258
		 43.2 16.418291091918945 44 16.706626892089844 44.8 16.985940933227539 45.6 17.288698196411133
		 46.4 17.634960174560547 47.2 17.952476501464844 48 18.124162673950195 48.8 18.106033325195312
		 49.6 17.945602416992188 50.4 17.688201904296875 51.2 17.331794738769531 52 16.886869430541992
		 52.8 16.409553527832031;
createNode animCurveTA -n "LeftForeArm_rotateX";
	rename -uid "A5E0522F-4301-2099-72CA-88B7C74F9413";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 9.4123802185058594 0.8 9.3137273788452148
		 1.6 9.1402568817138672 2.4 8.9340553283691406 3.2 8.7900619506835938 4 8.7987728118896484
		 4.8 8.9534187316894531 5.6 9.1288785934448242 6.4 9.1791000366210938 7.2 9.0672321319580078
		 8 8.8868045806884766 8.8 8.7539749145507812 9.6 8.7175188064575195 10.4 8.7872095108032227
		 11.2 8.9543018341064453 12 9.1676626205444336 12.8 9.4218111038208008 13.6 9.882573127746582
		 14.4 10.709769248962402 15.2 11.647706985473633 16 12.218860626220703 16.8 12.364230155944824
		 17.6 12.277190208435059 18.4 12.177774429321289 19.2 12.278983116149902 20 12.456002235412598
		 20.8 12.52879810333252 21.6 12.489428520202637 22.4 12.278877258300781 23.2 11.749697685241699
		 24 10.876653671264648 24.8 9.9952640533447266 25.6 9.5157394409179688 26.4 9.4235267639160156
		 27.2 9.4524755477905273 28 9.5212831497192383 28.8 9.7340593338012695 29.6 10.088435173034668
		 30.4 10.397228240966797 31.2 10.501859664916992 32 10.408108711242676 32.8 10.232762336730957
		 33.6 10.082307815551758 34.4 9.9809761047363281 35.2 9.9131650924682617 36 9.90240478515625
		 36.8 10.000475883483887 37.6 10.198866844177246 38.4 10.412432670593262 39.2 10.571939468383789
		 40 10.677644729614258 40.8 10.753555297851562 41.6 10.798351287841797 42.4 10.800263404846191
		 43.2 10.769950866699219 44 10.732329368591309 44.8 10.696056365966797 45.6 10.650210380554199
		 46.4 10.588212966918945 47.2 10.51691722869873 48 10.440646171569824 48.8 10.34654426574707
		 49.6 10.213969230651855 50.4 10.037175178527832 51.2 9.8325386047363281 52 9.6213827133178711
		 52.8 9.4123706817626953;
createNode animCurveTA -n "LeftForeArm_rotateY";
	rename -uid "8E96EB7A-4FD8-1EAB-438D-1C9BD677BF6D";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -1.2633070945739746 0.8 -1.1530196666717529
		 1.6 -0.96516329050064087 2.4 -0.75140923261642456 3.2 -0.60788846015930176 4 -0.61644119024276733
		 4.8 -0.77104157209396362 5.6 -0.95309573411941528 6.4 -1.0065654516220093 7.2 -0.88831502199172974
		 8 -0.70380675792694092 8.8 -0.57266038656234741 9.6 -0.53731751441955566 10.4 -0.60510587692260742
		 11.2 -0.77195990085601807 12 -0.99433815479278576 12.8 -1.2740054130554199 13.6 -1.8273105621337891
		 14.4 -3.0125861167907715 15.2 -4.8513531684875488 16 -6.5776247978210449 16.8 -7.2212166786193848
		 17.6 -6.8175773620605469 18.4 -6.4196872711181641 19.2 -6.8253350257873535 20 -7.7390937805175781
		 20.8 -8.284153938293457 21.6 -7.9673895835876465 22.4 -6.8249163627624512 23.2 -5.106663703918457
		 24 -3.2910678386688232 24.8 -1.9728593826293948 25.6 -1.3817266225814819 26.4 -1.2759398221969604
		 27.2 -1.3088946342468262 28 -1.3881576061248779 28.8 -1.6419339179992676 29.6 -2.0965414047241211
		 30.4 -2.5304627418518066 31.2 -2.6866450309753418 32 -2.5464715957641602 32.8 -2.2945687770843506
		 33.6 -2.088329553604126 34.4 -1.9541623592376709 35.2 -1.8664141893386843 36 -1.8525651693344116
		 36.8 -1.9796848297119143 37.6 -2.2473649978637695 38.4 -2.5528063774108887 39.2 -2.7940998077392578
		 40 -2.9607853889465332 40.8 -3.0841109752655029 41.6 -3.1583960056304932 42.4 -3.1616132259368896
		 43.2 -3.1111738681793213 44 -3.0493249893188477 44.8 -2.9904141426086426 45.6 -2.9170041084289551
		 46.4 -2.8193426132202148 47.2 -2.7095026969909668 48 -2.5946605205535889 48.8 -2.4565079212188721
		 49.6 -2.2683136463165283 50.4 -2.0280954837799072 51.2 -1.7640268802642822 52 -1.5058342218399048
		 52.8 -1.2633225917816162;
createNode animCurveTA -n "LeftForeArm_rotateZ";
	rename -uid "EAE5B481-4E41-56FF-A71C-109AEC9D6EF0";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -3.7553533853900323 0.8 4.9794373512268066
		 1.6 3.822891473770142 2.4 2.478870153427124 3.2 1.5584226846694946 4 1.6136554479598999
		 4.8 2.6036653518676758 5.6 3.7478678226470943 6.4 4.0797581672668457 7.2 3.3432986736297607
		 8 2.175234317779541 8.8 1.3300012350082397 9.6 1.100048303604126 10.4 1.5403405427932739
		 11.2 2.6094598770141602 12 4.0040006637573242 12.8 5.7130732536315918 13.6 8.9665918350219727
		 14.4 15.489953994750978 15.2 24.795560836791992 16 32.990161895751953 16.8 35.964973449707031
		 17.6 34.10308837890625 18.4 32.254920959472656 19.2 34.139015197753906 20 38.338233947753906
		 20.8 40.822441101074219 21.6 39.380203247070312 22.4 34.137088775634766 23.2 26.033172607421875
		 24 16.95281982421875 24.8 9.7976360321044922 25.6 6.3591203689575195 26.4 5.7247872352600098
		 27.2 5.9230337142944336 28 6.3974146842956543 28.8 7.8939433097839347 29.6 10.49665641784668
		 30.4 12.899552345275879 31.2 13.747243881225586 32 12.986820220947266 32.8 11.602394104003906
		 33.6 10.450443267822266 34.4 9.691472053527832 35.2 9.1908388137817383 36 9.1116542816162109
		 36.8 9.8365097045898438 37.6 11.340161323547363 38.4 13.021393775939941 39.2 14.325613021850586
		 40 15.215173721313475 40.8 15.867868423461914 41.6 16.258777618408203 42.4 16.275684356689453
		 43.2 16.010488510131836 44 15.684273719787598 44.8 15.372487068176268 45.6 14.982432365417482
		 46.4 14.46086311340332 47.2 13.870564460754395 48 13.249018669128418 48.8 12.495139122009277
		 49.6 11.456745147705078 50.4 10.110569953918457 51.2 8.6023387908935547 52 7.0956234931945801
		 52.8 5.6486539840698242;
createNode animCurveTA -n "LeftHand_rotateX";
	rename -uid "4308CC0C-4963-4877-BEC3-16A8BF3D2E9C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.16769002377986908 0.8 -0.073670834302902222
		 1.6 -0.10127367824316025 2.4 0.0967702716588974 3.2 0.2544780969619751 4 0.0064797364175319672
		 4.8 -0.70309573411941528 5.6 -1.5851467847824097 6.4 -2.3537228107452393 7.2 -2.9938595294952393
		 8 -3.7459652423858643 8.8 -4.787926197052002 9.6 -5.7584958076477051 10.4 -5.8174080848693848
		 11.2 -4.5447258949279785 12 -2.5842175483703613 12.8 -1.162703275680542 13.6 -1.0468971729278564
		 14.4 -1.8889580965042112 15.2 -2.5643091201782227 16 -2.2822728157043457 16.8 -1.5089453458786011
		 17.6 -1.6953438520431519 18.4 -3.6235039234161381 19.2 -6.398231029510498 20 -8.4776744842529297
		 20.8 -9.1809768676757812 21.6 -8.6100606918334961 22.4 -6.6479039192199707 23.2 -3.4253907203674316
		 24 -0.089530467987060547 24.8 2.4466545581817627 25.6 4.2395586967468262 26.4 5.4800004959106445
		 27.2 6.1368517875671387 28 6.422431468963623 28.8 6.8898501396179199 29.6 7.7548360824584961
		 30.4 8.5311012268066406 31.2 8.7660484313964844 32 8.8375301361083984 32.8 9.5853605270385742
		 33.6 10.990360260009766 34.4 11.715729713439941 35.2 10.473701477050781 36 7.3829636573791504
		 36.8 3.5457289218902588 37.6 0.020767901092767715 38.4 -2.610959529876709 39.2 -4.2389116287231445
		 40 -5.1031126976013184 40.8 -5.5380091667175293 41.6 -5.7273740768432617 42.4 -5.7161955833435059
		 43.2 -5.5161590576171875 44 -5.0871868133544922 44.8 -4.36181640625 45.6 -3.4421939849853516
		 46.4 -2.6409235000610352 47.2 -2.1723213195800781 48 -1.937934875488281 48.8 -1.7211179733276367
		 49.6 -1.4273879528045654 50.4 -1.0617219209671021 51.2 -0.6406177282333374 52 -0.2055731862783432
		 52.8 0.16767071187496185;
createNode animCurveTA -n "LeftHand_rotateY";
	rename -uid "C43CE870-4630-89DF-D699-5BB41DDDB6E1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.84416520595550537 0.8 -0.52047032117843628
		 1.6 -0.23171494901180267 2.4 0.051242571324110031 3.2 0.51842164993286133 4 1.282185435295105
		 4.8 1.9974882602691648 5.6 2.0820515155792236 6.4 1.3408349752426147 7.2 -0.028138265013694763
		 8 -1.8880465030670168 8.8 -4.0055432319641113 9.6 -5.592010498046875 10.4 -5.7541608810424805
		 11.2 -4.3258118629455566 12 -1.8433276414871216 12.8 0.61576151847839355 13.6 1.3955222368240356
		 14.4 -0.75549644231796265 15.2 -5.2051796913146973 16 -9.5572004318237305 16.8 -11.894828796386719
		 17.6 -12.724273681640625 18.4 -13.961557388305664 19.2 -16.764787673950195 20 -20.926004409790039
		 20.8 -25.239694595336914 21.6 -28.032449722290039 22.4 -27.578594207763672 23.2 -22.493541717529297
		 24 -12.673381805419922 24.8 -0.51350247859954834 25.6 9.7063465118408203 26.4 14.968955039978027
		 27.2 15.835844039916994 28 14.909877777099609 28.8 13.548304557800293 29.6 11.205018997192383
		 30.4 7.7930746078491211 31.2 5.2299919128417969 32 5.8105344772338867 32.8 9.4292402267456055
		 33.6 13.358089447021484 34.4 14.760197639465332 35.2 12.933910369873047 36 9.1826391220092773
		 36.8 5.0256147384643555 37.6 1.1188958883285522 38.4 -2.32804274559021 39.2 -5.07720947265625
		 40 -7.0290188789367676 40.8 -8.3272104263305664 41.6 -9.1031904220581055 42.4 -9.2861347198486328
		 43.2 -8.7566299438476562 44 -7.6223344802856436 44.8 -6.27587890625 45.6 -5.1790080070495605
		 46.4 -4.546900749206543 47.2 -4.213935375213623 48 -3.8832032680511479 48.8 -3.4560761451721191
		 49.6 -3.000417947769165 50.4 -2.5301125049591064 51.2 -1.9945862293243406 52 -1.405561089515686
		 52.8 -0.84415906667709351;
createNode animCurveTA -n "LeftHand_rotateZ";
	rename -uid "AC8BDAC1-4645-275E-2DE3-4D83B67E3899";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -4.4979566419614381 0.8 5.5978899002075195
		 1.6 6.5694432258605957 2.4 7.7224326133728027 3.2 8.7875690460205078 4 9.554509162902832
		 4.8 10.074912071228027 5.6 10.562950134277344 6.4 11.075715065002441 7.2 11.393680572509766
		 8 11.343886375427246 8.8 11.123892784118652 9.6 11.052133560180664 10.4 10.983969688415527
		 11.2 10.417290687561035 12 9.2252674102783203 12.8 7.917064666748046 13.6 7.0674648284912109
		 14.4 6.7592964172363281 15.2 6.6851229667663574 16 6.6141886711120605 16.8 6.9264345169067383
		 17.6 8.0896387100219727 18.4 9.4775686264038086 19.2 9.9581642150878906 20 9.2647790908813477
		 20.8 8.1038188934326172 21.6 7.1193056106567383 22.4 6.003448486328125 23.2 4.1487483978271484
		 24 1.582332968711853 24.8 -1.5000448226928711 25.6 -4.6064410209655762 26.4 -6.6253151893615723
		 27.2 -6.9264864921569824 28 -6.1974306106567383 28.8 -5.6791195869445801 29.6 -5.8084712028503418
		 30.4 -6.0207462310791016 31.2 -5.7085995674133301 32 -5.1115536689758301 32.8 -4.8299612998962402
		 33.6 -4.7312736511230469 34.4 -4.3498711585998535 35.2 -3.4959540367126465 36 -2.2304940223693848
		 36.8 -0.99848020076751698 37.6 -0.14419756829738617 38.4 0.60962635278701782 39.2 1.6584193706512451
		 40 2.8847730159759521 40.8 3.8977444171905518 41.6 4.5971770286560059 42.4 5.1350908279418945
		 43.2 5.5047073364257812 44 5.5510239601135254 44.8 5.3308587074279785 45.6 5.1489152908325195
		 46.4 5.2068285942077637 47.2 5.4270124435424805 48 5.6382808685302734 48.8 5.7785935401916504
		 49.6 5.8538756370544434 50.4 5.8036503791809082 51.2 5.5618147850036621 52 5.2076568603515625
		 52.8 4.9283819198608398;
createNode animCurveTA -n "LeftHandThumb1_rotateX";
	rename -uid "B35BF3B9-43CE-7A65-C777-FEBBC76D06EE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.3302520083332718 0.8 -12.369433403015137
		 1.6 -11.204988479614258 2.4 -9.4814739227294922 3.2 -7.3756036758422852 4 -5.0666584968566895
		 4.8 -2.7376196384429932 5.6 -0.5757940411567688 6.4 1.2276791334152222 7.2 2.4791023731231689
		 8 2.9842963218688965 8.8 3.0019948482513428 9.6 3.0019855499267578 10.4 3.0019881725311279
		 11.2 3.0020005702972412 12 3.0019946098327637 12.8 3.0019862651824951 13.6 3.0019934177398682
		 14.4 3.0020036697387695 15.2 3.0019676685333252 16 3.0019993782043457 16.8 3.2580606937408447
		 17.6 5.3665056228637695 18.4 8.8826265335083008 19.2 12.475956916809082 20 14.517620086669922
		 20.8 14.685373306274416 21.6 14.685363769531248 22.4 14.685378074645996 23.2 14.685356140136719
		 24 14.685362815856934 24.8 14.685365676879883 25.6 14.685365676879883 26.4 14.685366630554197
		 27.2 14.685342788696289 28 14.685382843017578 28.8 14.685360908508299 29.6 14.685365676879883
		 30.4 14.685361862182617 31.2 14.685378074645996 32 14.685362815856934 32.8 14.413129806518555
		 33.6 13.289063453674316 34.4 11.401036262512207 35.2 8.9209604263305664 36 6.0193662643432617
		 36.8 2.863520622253418 37.6 -0.3837418258190155 38.4 -3.5626583099365234 39.2 -6.5143294334411621
		 40 -9.0777301788330078 40.8 -11.087779998779297 41.6 -12.375753402709961 42.4 -12.798361778259277
		 43.2 -12.798361778259277 44 -12.798358917236328 44.8 -12.798365592956543 45.6 -12.79835319519043
		 46.4 -12.79835033416748 47.2 -12.798354148864746 48 -12.798367500305176 48.8 -12.798356056213379
		 49.6 -12.798364639282227 50.4 -12.798338890075684 51.2 -12.79836368560791 52 -12.798361778259277
		 52.8 -12.798358917236328;
createNode animCurveTA -n "LeftHandThumb1_rotateY";
	rename -uid "8B00B601-4D7D-2881-39BD-568E6CD8BACD";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -21.377351646801475 0.8 3.1015498638153076
		 1.6 3.4541656970977783 2.4 3.9732854366302486 3.2 4.6025733947753906 4 5.285606861114502
		 4.8 5.9663295745849609 5.6 6.590116024017334 6.4 7.1040463447570801 7.2 7.4569463729858398
		 8 7.5984606742858887 8.8 7.6033954620361328 9.6 7.6033940315246582 10.4 7.6033735275268555
		 11.2 7.6033926010131836 12 7.6033997535705566 12.8 7.6033840179443359 13.6 7.6034097671508798
		 14.4 7.6033940315246582 15.2 7.6033921241760263 16 7.6034064292907715 16.8 7.2162246704101562
		 17.6 4.0349392890930176 18.4 -1.1127051115036011 19.2 -6.0396075248718262 20 -8.6457433700561523
		 20.8 -8.853611946105957 21.6 -8.8536148071289062 22.4 -8.8536396026611328 23.2 -8.8536043167114258
		 24 -8.8536291122436523 24.8 -8.8536214828491211 25.6 -8.8536252975463867 26.4 -8.8536548614501953
		 27.2 -8.8536224365234375 28 -8.8536176681518555 28.8 -8.8536043167114258 29.6 -8.8536090850830078
		 30.4 -8.8536214828491211 31.2 -8.8536138534545898 32 -8.8536176681518555 32.8 -8.7612142562866211
		 33.6 -8.3715324401855469 34.4 -7.6887178421020508 35.2 -6.7415103912353516 36 -5.5681900978088379
		 36.8 -4.2239212989807129 37.6 -2.781649112701416 38.4 -1.3279331922531128 39.2 0.043984338641166687
		 40 1.2417629957199097 40.8 2.1788899898529053 41.6 2.7761492729187012 42.4 2.9713387489318848
		 43.2 2.9713382720947266 44 2.971341609954834 44.8 2.9713442325592041 45.6 2.9713211059570312
		 46.4 2.971341609954834 47.2 2.9713287353515625 48 2.9713413715362549 48.8 2.9713418483734131
		 49.6 2.9713399410247803 50.4 2.9713375568389893 51.2 2.9713423252105713 52 2.9713356494903564
		 52.8 2.971341609954834;
createNode animCurveTA -n "LeftHandThumb1_rotateZ";
	rename -uid "7467A92F-47BB-3FBB-C708-BDB2D1E00FE3";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -5.3178971844274097 0.8 -2.7683455944061279
		 1.6 -1.8276926279067995 2.4 -0.43445822596549988 3.2 1.2698030471801758 4 3.141636848449707
		 4.8 5.0338888168334961 5.6 6.7946815490722656 6.4 8.2672624588012695 7.2 9.2911796569824219
		 8 9.7050485610961914 8.8 9.719548225402832 9.6 9.7195396423339844 10.4 9.7195453643798828
		 11.2 9.7195644378662109 12 9.7195491790771484 12.8 9.7195463180541992 13.6 9.7195549011230469
		 14.4 9.7195682525634766 15.2 9.7195310592651367 16 9.7195730209350586 16.8 9.3076801300048828
		 17.6 5.8301224708557129 18.4 -0.19083642959594727 19.2 -6.4973258972167969 20 -10.098835945129395
		 20.8 -10.395010948181152 21.6 -10.395009994506836 22.4 -10.395017623901367 23.2 -10.395013809204102
		 24 -10.395023345947266 24.8 -10.395008087158203 25.6 -10.395008087158203 26.4 -10.394991874694824
		 27.2 -10.395013809204102 28 -10.395014762878418 28.8 -10.395027160644531 29.6 -10.395023345947266
		 30.4 -10.395010948181152 31.2 -10.39501953125 32 -10.395017623901367 32.8 -10.264056205749512
		 33.6 -9.7344379425048828 34.4 -8.8857555389404297 35.2 -7.8514199256896982 36 -6.7617692947387695
		 36.8 -5.7298679351806641 37.6 -4.8406534194946289 38.4 -4.1441464424133301 39.2 -3.6540064811706539
		 40 -3.3514077663421631 40.8 -3.1939072608947754 41.6 -3.1296453475952148 42.4 -3.1147785186767578
		 43.2 -3.1147682666778564 44 -3.1147868633270264 44.8 -3.1147820949554443 45.6 -3.1147756576538086
		 46.4 -3.1147749423980713 47.2 -3.1147639751434326 48 -3.1147708892822266 48.8 -3.1147809028625488
		 49.6 -3.114769458770752 50.4 -3.114764928817749 51.2 -3.1147851943969727 52 -3.1147835254669189
		 52.8 -3.1147770881652832;
createNode animCurveTA -n "LeftHandThumb2_rotateX";
	rename -uid "2E6690F9-4FC8-8AD4-DCA3-C2BD83DE7559";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.5543943290600748 0.8 -10.030138969421387
		 1.6 -9.9201288223266602 2.4 -9.7415342330932617 3.2 -9.5253171920776367 4 -9.2960596084594727
		 4.8 -9.0596952438354492 5.6 -8.8218450546264648 6.4 -8.6011190414428711 7.2 -8.421295166015625
		 8 -8.3148288726806641 8.8 -8.2752780914306641 9.6 -8.2691869735717773 10.4 -8.2945728302001953
		 11.2 -8.3362932205200195 12 -8.3780250549316406 12.8 -8.4078044891357422 13.6 -8.4227294921875
		 14.4 -8.4287090301513672 15.2 -8.4327783584594727 16 -8.4400224685668945 16.8 -8.4990777969360352
		 17.6 -8.8907375335693359 18.4 -9.473780632019043 19.2 -9.986180305480957 20 -10.240973472595215
		 20.8 -10.256769180297852 21.6 -10.244671821594238 22.4 -10.227177619934082 23.2 -10.210494995117188
		 24 -10.202988624572754 24.8 -10.207555770874023 25.6 -10.21402645111084 26.4 -10.209651947021484
		 27.2 -10.199786186218262 28 -10.203737258911133 28.8 -10.225693702697754 29.6 -10.246343612670898
		 30.4 -10.248936653137207 31.2 -10.236417770385742 32 -10.220213890075684 32.8 -10.207987785339355
		 33.6 -10.204977989196777 34.4 -10.213040351867676 35.2 -10.224236488342285 36 -10.226454734802246
		 36.8 -10.217382431030273 37.6 -10.205455780029297 38.4 -10.197728157043457 39.2 -10.193013191223145
		 40 -10.186935424804688 40.8 -10.179464340209961 41.6 -10.173545837402344 42.4 -10.168059349060059
		 43.2 -10.160581588745117 44 -10.155699729919434 44.8 -10.15841007232666 45.6 -10.161703109741211
		 46.4 -10.155203819274902 47.2 -10.142338752746582 48 -10.133059501647949 48.8 -10.127190589904785
		 49.6 -10.117990493774414 50.4 -10.104965209960938 51.2 -10.091870307922363 52 -10.076865196228027
		 52.8 -10.05247688293457;
createNode animCurveTA -n "LeftHandThumb2_rotateY";
	rename -uid "996C87E7-4031-823D-9AB4-37BC8B76A558";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.8201394065013023 0.8 5.4692883491516113
		 1.6 5.7535610198974609 2.4 6.1675944328308105 3.2 6.67010498046875 4 7.2189006805419913
		 4.8 7.7668113708496103 5.6 8.266484260559082 6.4 8.6730413436889648 7.2 8.9392251968383789
		 8 9.02301025390625 8.8 9.0009965896606445 9.6 8.99884033203125 10.4 9.0210676193237305
		 11.2 9.047032356262207 12 9.0654811859130859 12.8 9.0762300491333008 13.6 9.0821123123168945
		 14.4 9.085301399230957 15.2 9.0874261856079102 16 9.0905113220214844 16.8 9.0121231079101562
		 17.6 8.3293609619140625 18.4 7.1976017951965332 19.2 6.0778465270996094 20 5.4662566184997559
		 20.8 5.4157428741455078 21.6 5.4123697280883789 22.4 5.4074745178222656 23.2 5.4028067588806152
		 24 5.4007582664489746 24.8 5.4020781517028809 25.6 5.4039115905761719 26.4 5.4027166366577148
		 27.2 5.3999834060668945 28 5.4011211395263672 28.8 5.4073729515075684 29.6 5.4132566452026367
		 30.4 5.4140353202819824 31.2 5.410517692565918 32 5.4059543609619141 32.8 5.4025135040283203
		 33.6 5.4017095565795898 34.4 5.4040312767028809 35.2 5.4072475433349609 36 5.4079327583312988
		 36.8 5.4053778648376465 37.6 5.4020280838012695 38.4 5.3998613357543945 39.2 5.3985662460327148
		 40 5.3968782424926758 40.8 5.3947796821594238 41.6 5.3931398391723633 42.4 5.3916306495666504
		 43.2 5.3895292282104492 44 5.3881869316101074 44.8 5.3889875411987305 45.6 5.3899431228637695
		 46.4 5.3881402015686035 47.2 5.3845381736755371 48 5.3819332122802734 48.8 5.3803110122680664
		 49.6 5.3777446746826172 50.4 5.3741021156311035 51.2 5.3704748153686523 52 5.3662858009338379
		 52.8 5.3595128059387207;
createNode animCurveTA -n "LeftHandThumb2_rotateZ";
	rename -uid "EC92ED07-4A8B-8E28-8FC8-EC84AEFE3774";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 6.6915094275674987 0.8 -19.353601455688477
		 1.6 -18.738862991333008 2.4 -17.849349975585938 3.2 -16.74835205078125 4 -15.514285087585449
		 4.8 -14.263767242431641 5.6 -13.12157154083252 6.4 -12.197284698486328 7.2 -11.597477912902832
		 8 -11.414547920227051 8.8 -11.471977233886719 9.6 -11.482405662536621 10.4 -11.436136245727539
		 11.2 -11.362400054931641 12 -11.290253639221191 12.8 -11.239240646362305 13.6 -11.213533401489258
		 14.4 -11.20305061340332 15.2 -11.195881843566895 16 -11.183352470397949 16.8 -11.356399536132812
		 17.6 -12.909794807434082 18.4 -15.426959037780762 19.2 -17.850040435791016 20 -19.148880004882812
		 20.8 -19.260066986083984 21.6 -19.28083610534668 22.4 -19.310922622680664 23.2 -19.339496612548828
		 24 -19.352361679077148 24.8 -19.344533920288086 25.6 -19.333414077758789 26.4 -19.340892791748047
		 27.2 -19.357828140258789 28 -19.350984573364258 28.8 -19.31324577331543 29.6 -19.277727127075195
		 30.4 -19.273229598999023 31.2 -19.294746398925781 32 -19.322586059570312 32.8 -19.343574523925781
		 33.6 -19.348695755004883 34.4 -19.334812164306641 35.2 -19.315509796142578 36 -19.311660766601562
		 36.8 -19.327289581298828 37.6 -19.34771728515625 38.4 -19.360954284667969 39.2 -19.36909294128418
		 40 -19.379501342773438 40.8 -19.392293930053711 41.6 -19.4024658203125 42.4 -19.411870956420898
		 43.2 -19.424686431884766 44 -19.433048248291016 44.8 -19.428348541259766 45.6 -19.422697067260742
		 46.4 -19.433816909790039 47.2 -19.455905914306641 48 -19.471851348876953 48.8 -19.481884002685547
		 49.6 -19.497659683227539 50.4 -19.520090103149414 51.2 -19.542472839355469 52 -19.568233489990234
		 52.8 -19.610151290893555;
createNode animCurveTA -n "LeftHandThumb3_rotateX";
	rename -uid "631093C7-4073-D224-DCAB-C6A82080A697";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.7057931348819384 0.8 -8.0492010116577148
		 1.6 -7.8088626861572266 2.4 -7.4710354804992676 3.2 -7.0629591941833496 4 -6.6057324409484863
		 4.8 -6.1258821487426758 5.6 -5.6741452217102051 6.4 -5.3120837211608887 7.2 -5.0768222808837891
		 8 -4.9763035774230957 8.8 -4.9324202537536621 9.6 -4.8591070175170898 10.4 -4.788759708404541
		 11.2 -4.7487683296203613 12 -4.7435784339904785 12.8 -4.7569060325622559 13.6 -4.7647495269775391
		 14.4 -4.7578668594360352 15.2 -4.7477993965148926 16 -4.7412986755371094 16.8 -4.8045845031738281
		 17.6 -5.3832159042358398 18.4 -6.3336915969848633 19.2 -7.2664909362792969 20 -7.7944655418395987
		 20.8 -7.8829326629638681 21.6 -7.923187255859375 22.4 -7.9551796913146982 23.2 -7.9820399284362793
		 24 -8.0000028610229492 24.8 -8.0138320922851562 25.6 -8.0405483245849609 26.4 -8.0790443420410156
		 27.2 -8.1035022735595703 28 -8.1004581451416016 28.8 -8.0913028717041016 29.6 -8.1062459945678711
		 30.4 -8.1464033126831055 31.2 -8.1878681182861328 32 -8.2153511047363281 32.8 -8.2347192764282227
		 33.6 -8.2545642852783203 34.4 -8.2669696807861328 35.2 -8.2560062408447266 36 -8.2223138809204102
		 36.8 -8.1891946792602539 37.6 -8.1794843673706055 38.4 -8.1875782012939453 39.2 -8.1911859512329102
		 40 -8.1919078826904297 40.8 -8.2079849243164062 41.6 -8.2381467819213867 42.4 -8.2678499221801758
		 43.2 -8.2888717651367188 44 -8.2882976531982422 44.8 -8.2525243759155273 45.6 -8.2008790969848633
		 46.4 -8.1722612380981445 47.2 -8.1702003479003906 48 -8.1695699691772461 48.8 -8.1634330749511719
		 49.6 -8.1583833694458008 50.4 -8.1511268615722656 51.2 -8.1385374069213867 52 -8.1333189010620117
		 52.8 -8.1584920883178711;
createNode animCurveTA -n "LeftHandThumb3_rotateY";
	rename -uid "B27C5A09-4226-E8F7-8C7B-2C8D61BBD770";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -2.0365005251325679 0.8 13.383917808532715
		 1.6 13.449440002441406 2.4 13.555600166320801 3.2 13.68123722076416 4 13.800454139709473
		 4.8 13.891458511352539 5.6 13.955925941467285 6.4 14.01390552520752 7.2 14.07137393951416
		 8 14.101108551025391 8.8 14.073838233947754 9.6 13.995110511779785 10.4 13.902793884277344
		 11.2 13.847089767456055 12 13.83935546875 12.8 13.855484008789062 13.6 13.863890647888184
		 14.4 13.855278015136719 15.2 13.843684196472168 16 13.836371421813965 16.8 13.814048767089844
		 17.6 13.690921783447266 18.4 13.476581573486328 19.2 13.245492935180664 20 13.126689910888672
		 20.8 13.152573585510254 21.6 13.184267997741699 22.4 13.209739685058594 23.2 13.231137275695801
		 24 13.245372772216797 24.8 13.256270408630371 25.6 13.277620315551758 26.4 13.308629989624023
		 27.2 13.328372955322266 28 13.325852394104004 28.8 13.318285942077637 29.6 13.330324172973633
		 30.4 13.363101959228516 31.2 13.397078514099121 32 13.419830322265625 32.8 13.435998916625977
		 33.6 13.452573776245117 34.4 13.462987899780273 35.2 13.454023361206055 36 13.426248550415039
		 36.8 13.399003028869629 37.6 13.391129493713379 38.4 13.397954940795898 39.2 13.401054382324219
		 40 13.401754379272461 40.8 13.415286064147949 41.6 13.440552711486816 42.4 13.465505599975586
		 43.2 13.483315467834473 44 13.483057022094727 44.8 13.453282356262207 45.6 13.410200119018555
		 46.4 13.38634204864502 47.2 13.384703636169434 48 13.38429069519043 48.8 13.379257202148438
		 49.6 13.375127792358398 50.4 13.369136810302734 51.2 13.358644485473633 52 13.354354858398438
		 52.8 13.375461578369141;
createNode animCurveTA -n "LeftHandThumb3_rotateZ";
	rename -uid "64A34140-4F51-803B-BDA8-A29CD7C778C2";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.79457907622598412 0.8 16.315212249755859
		 1.6 16.984661102294922 2.4 17.987981796264648 3.2 19.219760894775391 4 20.562126159667969
		 4.8 21.889997482299805 5.6 23.102787017822266 6.4 24.119331359863281 7.2 24.833585739135742
		 8 25.10496711730957 8.8 25.05259895324707 9.6 24.95521354675293 10.4 24.868442535400391
		 11.2 24.830347061157227 12 24.842136383056641 12.8 24.874128341674805 13.6 24.891183853149414
		 14.4 24.884471893310547 15.2 24.872980117797852 16 24.867761611938477 16.8 24.647073745727539
		 17.6 22.884397506713867 18.4 20.057104110717773 19.2 17.354154586791992 20 15.936102867126465
		 20.8 15.870962142944336 21.6 15.909624099731445 22.4 15.936824798583984 23.2 15.958785057067869
		 24 15.975089073181151 24.8 15.992490768432617 25.6 16.025077819824219 26.4 16.065793991088867
		 27.2 16.088401794433594 28 16.086858749389648 28.8 16.086925506591797 29.6 16.113254547119141
		 30.4 16.159339904785156 31.2 16.199871063232422 32 16.223138809204102 32.8 16.239253997802734
		 33.6 16.260229110717773 34.4 16.278133392333984 35.2 16.271236419677734 36 16.234643936157227
		 36.8 16.193300247192383 37.6 16.176967620849609 38.4 16.182506561279297 39.2 16.184471130371094
		 40 16.182531356811523 40.8 16.197256088256836 41.6 16.22856330871582 42.4 16.259586334228516
		 43.2 16.279941558837891 44 16.277168273925781 44.8 16.238288879394531 45.6 16.181699752807617
		 46.4 16.14647102355957 47.2 16.138139724731445 48 16.133142471313477 48.8 16.123525619506836
		 49.6 16.11359977722168 50.4 16.099365234375 51.2 16.079017639160156 52 16.066116333007812
		 52.8 16.083106994628906;
createNode animCurveTA -n "LeftHandIndex1_rotateX";
	rename -uid "79D1D832-4124-19FA-300F-678061F35E94";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.50598186254501343 0.8 -0.080811962485313416
		 1.6 -1.6909397840499878 2.4 -4.0729246139526367 3.2 -6.9618854522705078 4 -10.078672409057617
		 4.8 -13.153237342834473 5.6 -15.949009895324705 6.4 -18.255466461181641 7.2 -19.859600067138672
		 8 -20.533807754516602 8.8 -20.602054595947266 9.6 -20.62879753112793 10.4 -20.614933013916016
		 11.2 -20.582815170288086 12 -20.563312530517578 12.8 -20.557315826416016 13.6 -20.545953750610352
		 14.4 -20.514644622802734 15.2 -20.469436645507812 16 -20.435731887817383 16.8 -18.895233154296875
		 17.6 -6.2444210052490234 18.4 14.529762268066406 19.2 34.735488891601562 20 45.567508697509766
		 20.8 46.448162078857422 21.6 46.454502105712891 22.4 46.461570739746094 23.2 46.47418212890625
		 24 46.487442016601562 24.8 46.493656158447266 25.6 46.494422912597656 26.4 46.492794036865234
		 27.2 46.479419708251953 28 46.446815490722656 28.8 46.405925750732422 29.6 46.375091552734375
		 30.4 46.364795684814453 31.2 46.374122619628906 32 46.388481140136719 32.8 45.700862884521484
		 33.6 42.892528533935547 34.4 38.303947448730469 35.2 32.467418670654297 36 25.882579803466797
		 36.8 19.076066970825195 37.6 12.631821632385254 38.4 7.1172094345092773 39.2 3.0302965641021729
		 40 0.86678355932235718 40.8 0.57429033517837524 41.6 0.55235487222671509 42.4 0.55940288305282593
		 43.2 0.57418125867843628 44 0.57879197597503662 44.8 0.57746690511703491 45.6 0.57719272375106812
		 46.4 0.5693175196647644 47.2 0.54817408323287964 48 0.53044289350509644 48.8 0.53121006488800049
		 49.6 0.53781837224960327 50.4 0.53011423349380493 51.2 0.51179343461990356 52 0.50096392631530762
		 52.8 0.50598317384719849;
createNode animCurveTA -n "LeftHandIndex1_rotateY";
	rename -uid "61A2F9F6-4982-7815-9F5E-04829061DF64";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.62666422128677368 0.8 -0.62435275316238403
		 1.6 -0.58861720561981201 2.4 -0.45746874809265131 3.2 -0.17293122410774231 4 0.28916788101196289
		 4.8 0.90452677011489879 5.6 1.602330207824707 6.4 2.2751586437225342 7.2 2.7901384830474854
		 8 3.0378744602203369 8.8 3.1134815216064453 9.6 3.2095873355865479 10.4 3.2956173419952393
		 11.2 3.3352477550506592 12 3.3280577659606934 12.8 3.3007662296295166 13.6 3.2770736217498779
		 14.4 3.2614486217498779 15.2 3.2481610774993896 16 3.2373583316802979 16.8 2.8761675357818604
		 17.6 0.49064883589744568 18.4 -1.1285055875778198 19.2 0.055972132831811905 20 1.6827174425125122
		 20.8 1.8183385133743286 21.6 1.7993433475494385 22.4 1.7869200706481934 23.2 1.7811551094055176
		 24 1.7755287885665894 24.8 1.7623188495635986 25.6 1.7447210550308228 26.4 1.7332866191864014
		 27.2 1.7297652959823608 28 1.7275501489639282 28.8 1.7257333993911743 29.6 1.7289038896560669
		 30.4 1.7363110780715942 31.2 1.7416526079177856 32 1.7403485774993896 32.8 1.6668599843978882
		 33.6 1.3996949195861816 34.4 1.0034208297729492 35.2 0.5659480094909668 36 0.15714569389820099
		 36.8 -0.17236329615116119 37.6 -0.39179176092147827 38.4 -0.50423169136047363 39.2 -0.54947894811630249
		 40 -0.5768742561340332 40.8 -0.60583555698394775 41.6 -0.62063002586364746 42.4 -0.61518609523773193
		 43.2 -0.60616773366928101 44 -0.60663688182830811 44.8 -0.61180406808853149 45.6 -0.61367309093475342
		 46.4 -0.61383992433547974 47.2 -0.61688941717147827 48 -0.62189847230911255 48.8 -0.6254304051399231
		 49.6 -0.626628577709198 50.4 -0.62672710418701172 51.2 -0.62667906284332275 52 -0.62668693065643311
		 52.8 -0.62669610977172852;
createNode animCurveTA -n "LeftHandIndex1_rotateZ";
	rename -uid "26D0C85E-41EE-437E-1343-BD82AD55E970";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -4.667450661859557 0.8 -4.2891488075256348
		 1.6 -3.4389405250549316 2.4 -2.187389612197876 3.2 -0.68044877052307129 4 0.92761045694351185
		 4.8 2.4893858432769775 5.6 3.8782963752746582 6.4 4.9890255928039551 7.2 5.7290749549865723
		 8 5.9929952621459961 8.8 5.927344799041748 9.6 5.8088493347167969 10.4 5.6920876502990723
		 11.2 5.6311588287353516 12 5.6350693702697754 12.8 5.6689448356628418 13.6 5.6964597702026367
		 14.4 5.7074775695800781 15.2 5.7112054824829102 16 5.715181827545166 16.8 5.4193558692932129
		 17.6 2.5932159423828125 18.4 -2.8066494464874268 19.2 -7.8673868179321298 20 -10.083158493041992
		 20.8 -10.209664344787598 21.6 -10.183951377868652 22.4 -10.167050361633301 23.2 -10.158748626708984
		 24 -10.150398254394531 24.8 -10.13184928894043 25.6 -10.107526779174805 26.4 -10.09181022644043
		 27.2 -10.087420463562012 28 -10.085573196411133 28.8 -10.084599494934082 29.6 -10.090094566345215
		 30.4 -10.100639343261719 31.2 -10.107539176940918 32 -10.105079650878906 32.8 -10.029006004333496
		 33.6 -9.7450628280639648 34.4 -9.2710437774658203 35.2 -8.6420812606811523 36 -7.8916239738464364
		 36.8 -7.0711007118225098 37.6 -6.2646894454956055 38.4 -5.5623507499694824 39.2 -5.0282282829284668
		 40 -4.7173557281494141 40.8 -4.6365699768066406 41.6 -4.61181640625 42.4 -4.6222476959228516
		 43.2 -4.6396207809448242 44 -4.640596866607666 44.8 -4.6326351165771484 45.6 -4.6294164657592773
		 46.4 -4.6286029815673828 47.2 -4.6224961280822754 48 -4.6122894287109375 48.8 -4.6034865379333496
		 49.6 -4.5981354713439941 50.4 -4.5954041481018066 51.2 -4.5939836502075195 52 -4.5948553085327148
		 52.8 -4.6022963523864746;
createNode animCurveTA -n "LeftHandIndex2_rotateX";
	rename -uid "BC632032-4E83-4538-8A60-6C92CA9614AA";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.0430724657138122e-16 0.8 14.729101181030275
		 1.6 15.142576217651365 2.4 15.763236045837402 3.2 16.511150360107422 4 17.306064605712891
		 4.8 18.08135986328125 5.6 18.792314529418945 6.4 19.400794982910156 7.2 19.837804794311523
		 8 20.011884689331055 8.8 20.008718490600586 9.6 20.006198883056641 10.4 20.014856338500977
		 11.2 20.029563903808594 12 20.04768180847168 12.8 20.061395645141602 13.6 20.066526412963867
		 14.4 20.068233489990234 15.2 20.063518524169922 16 20.043787002563477 16.8 21.011707305908203
		 17.6 29.094375610351559 18.4 42.176498413085938 19.2 54.786285400390625 20 61.53070068359375
		 20.8 62.045017242431634 21.6 62.046333312988281 22.4 62.081398010253906 23.2 62.142173767089851
		 24 62.17875671386718 24.8 62.142673492431641 25.6 62.064029693603516 26.4 62.010734558105469
		 27.2 62.002944946289062 28 62.023567199707031 28.8 62.058849334716804 29.6 62.08610534667968
		 30.4 62.076480865478516 31.2 62.036079406738274 32 62.003425598144531 32.8 61.289863586425781
		 33.6 58.416343688964844 34.4 53.688442230224609 35.2 47.628200531005859 36 40.783405303955078
		 36.8 33.733932495117188 37.6 27.061206817626953 38.4 21.328659057617188 39.2 17.084430694580078
		 40 14.868525505065918 40.8 14.603936195373533 41.6 14.60896682739258 42.4 14.640149116516112
		 43.2 14.672528266906738 44 14.668412208557129 44.8 14.634707450866699 45.6 14.607867240905763
		 46.4 14.601487159729006 47.2 14.607945442199707 48 14.616276741027832 48.8 14.612973213195799
		 49.6 14.598744392395018 50.4 14.589149475097658 51.2 14.589809417724609 52 14.593032836914062
		 52.8 14.59075355529785;
createNode animCurveTA -n "LeftHandIndex2_rotateY";
	rename -uid "FBDFD5BD-4928-E800-2B95-24B0BEC1C923";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -17.658692213238101 0.8 0.22105428576469421
		 1.6 0.23427632451057431 2.4 0.25483369827270508 3.2 0.28072953224182129 4 0.30960041284561157
		 4.8 0.33907386660575867 5.6 0.36724114418029785 6.4 0.39225253462791443 7.2 0.41068154573440552
		 8 0.41813561320304871 8.8 0.4180113673210144 9.6 0.41789653897285461 10.4 0.41826766729354858
		 11.2 0.41889852285385132 12 0.41968584060668945 12.8 0.42028713226318359 13.6 0.42049643397331238
		 14.4 0.42057111859321594 15.2 0.42036697268486023 16 0.41951212286949158 16.8 0.46224501729011536
		 17.6 0.89601695537567139 18.4 1.8711539506912234 19.2 3.0886669158935547 20 3.831437349319458
		 20.8 3.8902854919433594 21.6 3.890447854995728 22.4 3.8944604396820068 23.2 3.9014363288879395
		 24 3.9056475162506104 24.8 3.9014897346496578 25.6 3.8924722671508789 26.4 3.8863575458526611
		 27.2 3.8854646682739262 28 3.8878345489501949 28.8 3.8918783664703369 29.6 3.8949990272521973
		 30.4 3.8939054012298588 31.2 3.8892662525177002 32 3.885516881942749 32.8 3.8039734363555908
		 33.6 3.4814994335174561 34.4 2.973275899887085 35.2 2.3673346042633057 36 1.7523765563964844
		 36.8 1.2048701047897339 37.6 0.77416950464248657 38.4 0.47666722536087036 39.2 0.30141061544418335
		 40 0.22546473145484922 40.8 0.21711927652359009 41.6 0.21727564930915833 42.4 0.21826320886611938
		 43.2 0.21926739811897278 44 0.21913206577301025 44.8 0.21807441115379333 45.6 0.21724830567836761
		 46.4 0.21704083681106567 47.2 0.21724359691143036 48 0.21750085055828094 48.8 0.21740773320198059
		 49.6 0.21696694195270538 50.4 0.21665115654468536 51.2 0.21669185161590576 52 0.21678407490253448
		 52.8 0.2167159765958786;
createNode animCurveTA -n "LeftHandIndex2_rotateZ";
	rename -uid "7A51EEE9-43AE-6FDE-9CF0-C0BF5FE29D87";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.1414413451373813 0.8 -1.8510181903839111
		 1.6 -1.9032231569290161 2.4 -1.9814279079437254 3.2 -2.0753610134124756 4 -2.1748435497283936
		 4.8 -2.2714557647705078 5.6 -2.3596973419189453 6.4 -2.4349405765533447 7.2 -2.4888269901275635
		 8 -2.5102560520172119 8.8 -2.5098609924316406 9.6 -2.5095489025115967 10.4 -2.5106174945831299
		 11.2 -2.512413501739502 12 -2.5146675109863281 12.8 -2.5163419246673584 13.6 -2.5169680118560791
		 14.4 -2.5172059535980225 15.2 -2.516618013381958 16 -2.514190673828125 16.8 -2.6328611373901367
		 17.6 -3.5923981666564937 18.4 -4.990074634552002 19.2 -6.0967540740966797 20 -6.572028636932373
		 20.8 -6.6046500205993652 21.6 -6.6047215461730957 22.4 -6.6069378852844238 23.2 -6.6107378005981445
		 24 -6.6130452156066895 24.8 -6.6107802391052246 25.6 -6.6058516502380371 26.4 -6.6024942398071289
		 27.2 -6.6020030975341797 28 -6.6033053398132324 28.8 -6.6055188179016113 29.6 -6.6072311401367188
		 30.4 -6.6066303253173828 31.2 -6.6041030883789062 32 -6.6020236015319824 32.8 -6.556574821472168
		 33.6 -6.3633937835693359 34.4 -6.0112771987915039 35.2 -5.5010685920715332 36 -4.8521652221679688
		 36.8 -4.1129007339477539 37.6 -3.3568556308746338 38.4 -2.6715857982635498 39.2 -2.1471304893493652
		 40 -1.8686368465423586 40.8 -1.8351902961730955 41.6 -1.835822582244873 42.4 -1.8397635221481325
		 43.2 -1.8438628911972046 44 -1.8433593511581421 44.8 -1.8390775918960571 45.6 -1.8356963396072385
		 46.4 -1.8348815441131594 47.2 -1.8356938362121584 48 -1.8367476463317869 48.8 -1.8363373279571535
		 49.6 -1.834533214569092 50.4 -1.8333231210708618 51.2 -1.8334050178527834 52 -1.8338055610656738
		 52.8 -1.8335195779800417;
createNode animCurveTA -n "LeftHandIndex3_rotateX";
	rename -uid "B0723B0E-4DF1-7D19-AD4B-2DA588CAAFAD";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -3.0035042762756348 0.8 -2.7678811550140381
		 1.6 -2.1289567947387695 2.4 -1.1846691370010376 3.2 -0.035778466612100601 4 1.2112410068511963
		 4.8 2.4546232223510742 5.6 3.6130714416503911 6.4 4.6066703796386719 7.2 5.309351921081543
		 8 5.5726933479309082 8.8 5.5546541213989258 9.6 5.5789980888366699 10.4 5.6768441200256348
		 11.2 5.7908658981323242 12 5.8454666137695312 12.8 5.8109521865844727 13.6 5.7346072196960449
		 14.4 5.6893124580383301 15.2 5.692741870880127 16 5.7071776390075684 16.8 6.3796429634094238
		 17.6 11.940506935119629 18.4 20.999748229980469 19.2 29.826929092407227 20 34.598663330078125
		 20.8 34.920600891113281 21.6 34.756843566894531 22.4 34.637683868408203 23.2 34.668704986572266
		 24 34.794822692871094 24.8 34.878715515136719 25.6 34.847785949707031 26.4 34.75054931640625
		 27.2 34.690937042236328 28 34.726142883300781 28.8 34.817874908447266 29.6 34.885025024414062
		 30.4 34.917587280273438 31.2 34.976356506347656 32 35.059967041015625 32.8 34.505725860595703
		 33.6 32.098526000976562 34.4 28.195320129394531 35.2 23.341663360595703 36 17.948665618896484
		 36.8 12.364941596984863 37.6 7.0407395362854004 38.4 2.4884788990020752 39.2 -0.87341845035552979
		 40 -2.675006628036499 40.8 -2.944542407989502 41.6 -2.9563829898834229 42.4 -2.9414896965026855
		 43.2 -2.9651577472686768 44 -2.9978392124176025 44.8 -2.9662907123565674 45.6 -2.877718448638916
		 46.4 -2.8079237937927246 47.2 -2.811279296875 48 -2.8815505504608154 48.8 -2.9664855003356934
		 49.6 -3.0126025676727295 50.4 -3.0138819217681885 51.2 -3.0024311542510986 52 -2.9998512268066406
		 52.8 -3.0034770965576172;
createNode animCurveTA -n "LeftHandIndex3_rotateY";
	rename -uid "8163C1BD-4087-AE06-EE0D-2A9071709D42";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.67932106308388673 0.8 -0.023868484422564507
		 1.6 -0.025189144536852837 2.4 -0.025446586310863495 3.2 -0.023037057369947433 4 -0.017020253464579582
		 4.8 -0.0075100841931998721 5.6 0.0045166425406932831 6.4 0.017242264002561569 7.2 0.027595221996307373
		 8 0.03177274763584137 8.8 0.031477011740207672 9.6 0.031862836331129074 10.4 0.033461906015872955
		 11.2 0.035335112363100052 12 0.036232739686965942 12.8 0.035671964287757874 13.6 0.034402582794427872
		 14.4 0.033647000789642334 15.2 0.033719535917043686 16 0.033967722207307816 16.8 0.045513194054365158
		 17.6 0.17994298040866852 18.4 0.54470348358154297 19.2 1.0662373304367065 20 1.4123414754867554
		 20.8 1.43724524974823 21.6 1.4245498180389404 22.4 1.4153618812561035 23.2 1.4177422523498535
		 24 1.4274871349334717 24.8 1.4339903593063354 25.6 1.431591272354126 26.4 1.4240622520446777
		 27.2 1.4194668531417847 28 1.4221857786178589 28.8 1.4292721748352051 29.6 1.4344754219055176
		 30.4 1.4370155334472656 31.2 1.4415698051452637 32 1.4480786323547363 32.8 1.4051833152770996
		 33.6 1.2255966663360596 34.4 0.95798754692077637 35.2 0.66751599311828613 36 0.40204185247421265
		 36.8 0.19302652776241302 37.6 0.057866301387548454 38.4 -0.007186905015259982 39.2 -0.025103278458118439
		 40 -0.024104572832584381 40.8 -0.023331621661782265 41.6 -0.023288995027542114 42.4 -0.023345842957496643
		 43.2 -0.023255208507180214 44 -0.023150982335209846 44.8 -0.023264234885573387 45.6 -0.023547884076833725
		 46.4 -0.023744553327560425 47.2 -0.023737933486700058 48 -0.023520173504948616 48.8 -0.023251144215464592
		 49.6 -0.023123279213905334 50.4 -0.023105531930923462 51.2 -0.023131173104047775
		 52 -0.023150645196437836 52.8 -0.023142527788877487;
createNode animCurveTA -n "LeftHandIndex3_rotateZ";
	rename -uid "96F24BDD-4A72-EEC7-09B8-0BB034EA620F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.358480304479599 0.8 -0.38915508985519409
		 1.6 -0.47239282727241511 2.4 -0.59543222188949585 3.2 -0.74508029222488403 4 -0.90745198726654042
		 4.8 -1.0691614151000977 5.6 -1.2196290493011475 6.4 -1.3484690189361572 7.2 -1.4394361972808838
		 8 -1.4735091924667358 8.8 -1.4711742401123047 9.6 -1.4743103981018066 10.4 -1.4869588613510132
		 11.2 -1.5016965866088867 12 -1.5087554454803467 12.8 -1.5042885541915894 13.6 -1.4944380521774292
		 14.4 -1.4885857105255127 15.2 -1.489020824432373 16 -1.4908900260925293 16.8 -1.5777498483657837
		 17.6 -2.2896153926849365 18.4 -3.4119014739990234 19.2 -4.4379057884216309 20 -4.9560642242431641
		 20.8 -4.9899702072143555 21.6 -4.9727306365966797 22.4 -4.9601712226867676 23.2 -4.9634437561035156
		 24 -4.9767217636108398 24.8 -4.9855608940124512 25.6 -4.9823107719421387 26.4 -4.9720730781555176
		 27.2 -4.965782642364502 28 -4.9694805145263672 28.8 -4.9791665077209473 29.6 -4.9862227439880371
		 30.4 -4.9896330833435059 31.2 -4.995819091796875 32 -5.0045919418334961 32.8 -4.9462442398071289
		 33.6 -4.6881318092346191 34.4 -4.2544140815734863 35.2 -3.6916539669036865 36 -3.0404403209686279
		 36.8 -2.3433794975280762 37.6 -1.6630076169967651 38.4 -1.0735846757888794 39.2 -0.63596951961517334
		 40 -0.40124970674514771 40.8 -0.36613819003105164 41.6 -0.36459875106811523 42.4 -0.36654168367385864
		 43.2 -0.36346739530563354 44 -0.35920000076293945 44.8 -0.36331132054328918 45.6 -0.37485438585281372
		 46.4 -0.38394239544868469 47.2 -0.38351622223854065 48 -0.37435820698738098 48.8 -0.36329254508018494
		 49.6 -0.35727924108505249 50.4 -0.3571128249168396 51.2 -0.35859695076942444 52 -0.35893896222114563
		 52.8 -0.3584790825843811;
createNode animCurveTA -n "LeftHandMiddle1_rotateX";
	rename -uid "B8451595-4B93-8312-C1D8-0F9CCA242258";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 5.1531190872192383 0.8 4.9180283546447754
		 1.6 4.3628063201904297 2.4 3.5455420017242432 3.2 2.5449361801147461 4 1.4782636165618896
		 4.8 0.44342824816703796 5.6 -0.51231437921524048 6.4 -1.3332536220550537 7.2 -1.9222375154495239
		 8 -2.1909942626953125 8.8 -2.2863974571228027 9.6 -2.412163257598877 10.4 -2.5077710151672363
		 11.2 -2.5357840061187744 12 -2.5252511501312256 12.8 -2.5116479396820068 13.6 -2.5008828639984131
		 14.4 -2.4884731769561768 15.2 -2.476165771484375 16 -2.4680335521697998 16.8 -1.2257364988327026
		 17.6 8.9418487548828125 18.4 25.420045852661133 19.2 41.38165283203125 20 49.991783142089844
		 20.8 50.722244262695312 21.6 50.783786773681641 22.4 50.836669921875 23.2 50.846931457519531
		 24 50.836971282958984 24.8 50.856929779052734 25.6 50.903614044189453 26.4 50.921825408935547
		 27.2 50.884925842285156 28 50.825874328613281 28.8 50.783130645751953 29.6 50.758560180664062
		 30.4 50.740974426269531 31.2 50.735092163085938 32 50.745620727539062 32.8 50.345447540283203
		 33.6 48.63031005859375 34.4 45.720043182373047 35.2 41.878284454345703 36 37.35516357421875
		 36.8 32.372627258300781 37.6 27.157464981079102 38.4 21.965381622314453 39.2 17.067527770996094
		 40 12.730887413024902 40.8 9.1922922134399414 41.6 6.6556353569030762 42.4 5.3417425155639648
		 43.2 5.1811914443969727 44 5.1626019477844238 44.8 5.1188230514526367 45.6 5.0702571868896484
		 46.4 5.0521588325500488 47.2 5.0710272789001465 48 5.1021685600280762 48.8 5.1190185546875
		 49.6 5.1122555732727051 50.4 5.0879397392272949 51.2 5.0649209022521973 52 5.0745959281921387
		 52.8 5.153109073638916;
createNode animCurveTA -n "LeftHandMiddle1_rotateY";
	rename -uid "ABAFC4B7-4CA3-95FE-5B9C-E89C97C27F81";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.3989245593547821 0.8 0.38890662789344788
		 1.6 0.36663353443145752 2.4 0.33522880077362061 3.2 0.2990250289440155 4 0.26313558220863342
		 4.8 0.23053175210952759 5.6 0.20229262113571167 6.4 0.18005520105361938 7.2 0.16578072309494019
		 8 0.1590636670589447 8.8 0.15373462438583374 9.6 0.14470776915550232 10.4 0.1359841525554657
		 11.2 0.13182865083217621 12 0.13166075944900513 12.8 0.13271379470825195 13.6 0.1336987167596817
		 14.4 0.13485841453075409 15.2 0.13641084730625153 16 0.13767649233341217 16.8 0.17683728039264679
		 17.6 0.64054208993911743 18.4 1.8319693803787231 19.2 3.3106157779693604 20 4.1733546257019043
		 20.8 4.2367615699768066 21.6 4.2276782989501953 22.4 4.2170491218566895 23.2 4.2087721824645996
		 24 4.2057785987854004 24.8 4.2091274261474609 25.6 4.2132139205932617 26.4 4.2067465782165527
		 27.2 4.1869659423828125 28 4.1658434867858887 28.8 4.1557741165161133 29.6 4.1549773216247559
		 30.4 4.1536507606506348 31.2 4.1477131843566895 32 4.1393671035766602 32.8 4.0883927345275879
		 33.6 3.9041876792907715 34.4 3.6023588180541997 35.2 3.2161588668823242 36 2.7775936126708984
		 36.8 2.3108186721801758 37.6 1.8441320657730103 38.4 1.4173855781555176 39.2 1.0624814033508301
		 40 0.78836673498153687 40.8 0.59005463123321533 41.6 0.46215412020683294 42.4 0.40128877758979797
		 43.2 0.39395549893379211 44 0.39520987868309021 44.8 0.39561155438423157 45.6 0.39405545592308044
		 46.4 0.39220377802848816 47.2 0.39167621731758118 48 0.39228126406669617 48.8 0.3929678201675415
		 49.6 0.39311230182647705 50.4 0.39244651794433594 51.2 0.39166715741157532 52 0.39293462038040161
		 52.8 0.3989274799823761;
createNode animCurveTA -n "LeftHandMiddle1_rotateZ";
	rename -uid "667ACCFB-451B-186B-0917-A699C3F4D074";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 8.4422127443583737 0.8 4.1602058410644531
		 1.6 4.2341752052307129 2.4 4.3424124717712402 3.2 4.4732317924499512 4 4.6057829856872559
		 4.8 4.7308249473571777 5.6 4.8565950393676758 6.4 4.9855771064758301 7.2 5.0918140411376953
		 8 5.1206903457641602 8.8 5.0470404624938965 9.6 4.9054141044616699 10.4 4.7601466178894043
		 11.2 4.6776156425476074 12 4.6637959480285645 12.8 4.6782569885253906 13.6 4.6931862831115723
		 14.4 4.7122402191162109 15.2 4.7415261268615723 16 4.7674360275268555 16.8 4.5974373817443848
		 17.6 3.2107386589050293 18.4 1.3529105186462402 19.2 0.061070233583450317 20 -0.43198549747467041
		 20.8 -0.45895826816558843 21.6 -0.44955131411552429 22.4 -0.43925857543945312 23.2 -0.43221727013587952
		 24 -0.43011608719825745 24.8 -0.43217799067497253 25.6 -0.43397808074951172 26.4 -0.42818424105644226
		 27.2 -0.41340827941894531 28 -0.39818581938743591 28.8 -0.39135390520095825 29.6 -0.39148163795471191
		 30.4 -0.39096149802207947 31.2 -0.38633006811141968 32 -0.37923064827919006 32.8 -0.34990555047988892
		 33.6 -0.2477195858955383 34.4 -0.067645907402038574 35.2 0.19009940326213837 36 0.52595674991607666
		 36.8 0.94741064310073864 37.6 1.455074667930603 38.4 2.0171964168548584 39.2 2.579258918762207
		 40 3.101435661315918 40.8 3.5655903816223145 41.6 3.9400191307067871 42.4 4.1560602188110352
		 43.2 4.1855502128601074 44 4.1671910285949707 44.8 4.1498398780822754 45.6 4.1516046524047852
		 46.4 4.1660623550415039 47.2 4.1773319244384766 48 4.1801600456237793 48.8 4.1779131889343262
		 49.6 4.174410343170166 50.4 4.1742124557495117 51.2 4.1755666732788086 52 4.1649336814880371
		 52.8 4.125187873840332;
createNode animCurveTA -n "LeftHandMiddle2_rotateX";
	rename -uid "7425A694-4DCF-95F6-13FD-00BCAAC61306";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.76185400231117495 0.8 9.2358665466308594
		 1.6 9.9023523330688477 2.4 10.892190933227539 3.2 12.102767944335938 4 13.423142433166504
		 4.8 14.742109298706053 5.6 15.95570182800293 6.4 16.965051651000977 7.2 17.668575286865234
		 8 17.957040786743164 8.8 17.967765808105469 9.6 17.959371566772461 10.4 17.947536468505859
		 11.2 17.938211441040039 12 17.930763244628906 12.8 17.924734115600586 13.6 17.924905776977539
		 14.4 17.931011199951172 15.2 17.934635162353516 16 17.933807373046875 16.8 18.839982986450195
		 17.6 26.239322662353516 18.4 38.200206756591797 19.2 49.747474670410156 20 55.949211120605469
		 20.8 56.444038391113281 21.6 56.44512939453125 22.4 56.443855285644531 23.2 56.440528869628906
		 24 56.440013885498047 24.8 56.442798614501953 25.6 56.446231842041016 26.4 56.449432373046875
		 27.2 56.451324462890625 28 56.448410034179688 28.8 56.440242767333984 29.6 56.432605743408203
		 30.4 56.430881500244141 31.2 56.433418273925781 32 56.435436248779297 32.8 56.008575439453125
		 33.6 54.235637664794922 34.4 51.236049652099609 35.2 47.256614685058594 36 42.549896240234375
		 36.8 37.373600006103516 37.6 31.981496810913082 38.4 26.61988639831543 39.2 21.5369873046875
		 40 16.991312026977539 40.8 13.243456840515137 41.6 10.547701835632324 42.4 9.1578006744384766
		 43.2 8.992314338684082 44 8.9956836700439453 44.8 8.9981975555419922 45.6 8.9961719512939453
		 46.4 8.9921598434448242 47.2 8.9899520874023438 48 8.9896755218505859 48.8 8.9899520874023438
		 49.6 8.9915285110473633 50.4 8.9960670471191406 51.2 9.0023317337036133 52 9.0034456253051758
		 52.8 8.9887208938598633;
createNode animCurveTA -n "LeftHandMiddle2_rotateY";
	rename -uid "C7147E1E-43E7-04E3-567C-54B2D28A6178";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -15.115191546833291 0.8 -0.024256084114313126
		 1.6 -0.0069104209542274475 2.4 0.020718522369861603 3.2 0.057551737874746323 4 0.10155250132083893
		 4.8 0.149444580078125 5.6 0.19698436558246613 6.4 0.23903235793113708 7.2 0.26968082785606384
		 8 0.28256812691688538 8.8 0.28305917978286743 9.6 0.28268459439277649 10.4 0.28215324878692627
		 11.2 0.28173425793647766 12 0.28138884902000427 12.8 0.28113299608230591 13.6 0.28112336993217468
		 14.4 0.28140658140182495 15.2 0.28156650066375732 16 0.28151971101760864 16.8 0.32317018508911133
		 17.6 0.72987467050552368 18.4 1.6247633695602417 19.2 2.734973669052124 20 3.4155502319335938
		 20.8 3.4720385074615479 21.6 3.4721760749816895 22.4 3.4720475673675537 23.2 3.4716620445251465
		 24 3.4716064929962158 24.8 3.4719192981719971 25.6 3.47231125831604 26.4 3.4726772308349609
		 27.2 3.472893238067627 28 3.4725615978240967 28.8 3.4716167449951172 29.6 3.4707465171813965
		 30.4 3.4705493450164795 31.2 3.4708473682403564 32 3.4710719585418701 32.8 3.4223039150238037
		 33.6 3.2222692966461182 34.4 2.8934450149536133 35.2 2.4771785736083984 36 2.0168275833129883
		 36.8 1.554090142250061 37.6 1.1244616508483887 38.4 0.75393474102020264 39.2 0.45775443315505981
		 40 0.24015925824642181 40.8 0.095330372452735901 41.6 0.010837776586413383 42.4 -0.026199871674180031
		 43.2 -0.030314682051539421 44 -0.030249495059251785 44.8 -0.030189676210284233 45.6 -0.030220156535506248
		 46.4 -0.030325170606374741 47.2 -0.030391491949558262 48 -0.03038465604186058 48.8 -0.030375955626368523
		 49.6 -0.030340271070599552 50.4 -0.030234562233090401 51.2 -0.030070492997765541
		 52 -0.030038785189390186 52.8 -0.030416343361139297;
createNode animCurveTA -n "LeftHandMiddle2_rotateZ";
	rename -uid "CB24D1F8-488A-2980-3BAC-6E8EE9748A26";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.3062726836507927 0.8 -3.0652632713317871
		 1.6 -3.1531414985656738 2.4 -3.2832860946655273 3.2 -3.4417870044708252 4 -3.6137244701385502
		 4.8 -3.7844564914703369 5.6 -3.9405581951141353 6.4 -4.0695962905883789 7.2 -4.1591310501098633
		 8 -4.1956968307495117 8.8 -4.1970500946044922 9.6 -4.1959948539733887 10.4 -4.1945152282714844
		 11.2 -4.1932992935180664 12 -4.1923828125 12.8 -4.1915793418884277 13.6 -4.1916193962097168
		 14.4 -4.1924004554748535 15.2 -4.1928620338439941 16 -4.1927495002746582 16.8 -4.3073019981384277
		 17.6 -5.2153263092041016 18.4 -6.5518832206726074 19.2 -7.6412305831909189 20 -8.1285209655761719
		 20.8 -8.1641950607299805 21.6 -8.1642618179321289 22.4 -8.1641807556152344 23.2 -8.1639375686645508
		 24 -8.1638956069946289 24.8 -8.1641035079956055 25.6 -8.1643362045288086 26.4 -8.1645669937133789
		 27.2 -8.1647186279296875 28 -8.1644926071166992 28.8 -8.163914680480957 29.6 -8.1633634567260742
		 30.4 -8.1632328033447266 31.2 -8.1634349822998047 32 -8.1635799407958984 32.8 -8.1328029632568359
		 33.6 -8.0012569427490234 34.4 -7.7648401260375985 35.2 -7.4254031181335449 36 -6.9880776405334473
		 36.8 -6.4657301902770996 37.6 -5.8799762725830078 38.4 -5.2605381011962891 39.2 -4.6441769599914551
		 40 -4.0729470252990723 40.8 -3.5903863906860347 41.6 -3.2380406856536865 42.4 -3.0549571514129639
		 43.2 -3.0331017971038818 44 -3.0335395336151123 44.8 -3.0338656902313232 45.6 -3.0336189270019531
		 46.4 -3.0330748558044434 47.2 -3.0327951908111572 48 -3.0327587127685547 48.8 -3.0327987670898438
		 49.6 -3.0329928398132324 50.4 -3.033595085144043 51.2 -3.0344200134277344 52 -3.0345664024353027
		 52.8 -3.0326244831085205;
createNode animCurveTA -n "LeftHandMiddle3_rotateX";
	rename -uid "B894EADE-4899-C932-0226-31B088EB1100";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 11.173392295837402 0.8 11.715398788452148
		 1.6 13.142728805541992 2.4 15.245128631591797 3.2 17.810018539428711 4 20.614292144775391
		 4.8 23.425590515136719 5.6 26.014129638671875 6.4 28.158718109130859 7.2 29.638046264648438
		 8 30.225872039794918 8.8 30.231260299682617 9.6 30.217687606811523 10.4 30.214912414550781
		 11.2 30.221408843994137 12 30.22688102722168 12.8 30.224466323852543 13.6 30.217092514038086
		 14.4 30.213659286499023 15.2 30.218873977661129 16 30.225460052490234 16.8 30.657035827636719
		 17.6 34.199203491210938 18.4 39.941555023193359 19.2 45.500198364257812 20 48.49029541015625
		 20.8 48.729377746582031 21.6 48.732028961181641 22.4 48.742752075195312 23.2 48.759384155273438
		 24 48.771938323974609 24.8 48.770919799804688 25.6 48.760353088378906 26.4 48.755050659179688
		 27.2 48.761032104492188 28 48.769683837890625 28.8 48.772682189941406 29.6 48.770755767822266
		 30.4 48.765960693359375 31.2 48.757591247558594 32 48.749523162841797 32.8 48.410888671875
		 33.6 47.014381408691406 34.4 44.643341064453125 35.2 41.483474731445312 36 37.739082336425781
		 36.8 33.626995086669922 37.6 29.353836059570309 38.4 25.112138748168945 39.2 21.09425163269043
		 40 17.499151229858398 40.8 14.532024383544922 41.6 12.401698112487793 42.4 11.31147575378418
		 43.2 11.186522483825684 44 11.183038711547852 44.8 11.174046516418457 45.6 11.170486450195312
		 46.4 11.176011085510254 47.2 11.18397331237793 48 11.187027931213379 48.8 11.183565139770508
		 49.6 11.176755905151367 50.4 11.172079086303711 51.2 11.172440528869629 52 11.174626350402832
		 52.8 11.173376083374023;
createNode animCurveTA -n "LeftHandMiddle3_rotateY";
	rename -uid "8B16280F-481E-A575-C726-72A8CB53B4B9";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -2.0285587718981239 0.8 0.17635162174701691
		 1.6 0.22030244767665863 2.4 0.29348304867744446 3.2 0.39626085758209229 4 0.52537888288497925
		 4.8 0.6721045970916748 5.6 0.8221970796585083 6.4 0.95721954107284546 7.2 1.0559110641479492
		 8 1.0963337421417236 8.8 1.0967270135879517 9.6 1.0957767963409424 10.4 1.0955857038497925
		 11.2 1.0960251092910767 12 1.0964149236679077 12.8 1.0962424278259277 13.6 1.0957323312759399
		 14.4 1.0954933166503906 15.2 1.0958575010299683 16 1.0963176488876343 16.8 1.1264634132385254
		 17.6 1.3878474235534668 18.4 1.8626254796981809 19.2 2.3784422874450684 20 2.6771135330200195
		 20.8 2.7015912532806396 21.6 2.7018716335296631 22.4 2.7029526233673096 23.2 2.704679012298584
		 24 2.7059564590454102 24.8 2.7058568000793457 25.6 2.7047688961029053 26.4 2.7042253017425537
		 27.2 2.7048423290252686 28 2.7057225704193115 28.8 2.7060344219207764 29.6 2.7058336734771729
		 30.4 2.7053353786468506 31.2 2.7044880390167236 32 2.7036628723144531 32.8 2.6689863204956055
		 33.6 2.5279185771942139 34.4 2.2955160140991211 35.2 2.0003726482391357 36 1.673271656036377
		 36.8 1.3439493179321289 37.6 1.0365921258926392 38.4 0.76828694343566895 39.2 0.54922616481781006
		 40 0.38302662968635559 40.8 0.26755321025848389 41.6 0.19688968360424042 42.4 0.16473992168903351
		 43.2 0.16124048829078674 44 0.16114017367362976 44.8 0.16090674698352814 45.6 0.16078867018222809
		 46.4 0.16094636917114258 47.2 0.16119106113910675 48 0.16126386821269989 48.8 0.16116084158420563
		 49.6 0.16097350418567657 50.4 0.16084460914134979 51.2 0.16084021329879761 52 0.16090776026248932
		 52.8 0.16087953746318817;
createNode animCurveTA -n "LeftHandMiddle3_rotateZ";
	rename -uid "F0DC7366-4374-0F66-61E9-DE8060C277BF";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -1.1192085742950439 0.8 -1.1903491020202637
		 1.6 -1.3769639730453491 2.4 -1.6497530937194824 3.2 -1.9786980152130125 4 -2.3327453136444092
		 4.8 -2.6810288429260254 5.6 -2.995112419128418 6.4 -3.2500491142272949 7.2 -3.422914981842041
		 8 -3.4908969402313232 8.8 -3.4915368556976318 9.6 -3.4899570941925049 10.4 -3.4896430969238281
		 11.2 -3.4904017448425293 12 -3.4910132884979248 12.8 -3.4907474517822266 13.6 -3.489884614944458
		 14.4 -3.4894876480102539 15.2 -3.4901108741760254 16 -3.4908535480499268 16.8 -3.5405035018920898
		 17.6 -3.939241886138916 18.4 -4.549476146697998 19.2 -5.0925712585449219 20 -5.3634243011474609
		 20.8 -5.3844099044799805 21.6 -5.384645938873291 22.4 -5.3855853080749512 23.2 -5.3870415687561035
		 24 -5.3881344795227051 24.8 -5.3880457878112793 25.6 -5.3871307373046875 26.4 -5.3866591453552246
		 27.2 -5.3871870040893555 28 -5.3879313468933105 28.8 -5.3882064819335938 29.6 -5.3880329132080078
		 30.4 -5.387631893157959 31.2 -5.3868813514709473 32 -5.3861732482910156 32.8 -5.3564448356628418
		 33.6 -5.2316575050354004 34.4 -5.0121045112609863 35.2 -4.7050461769104004 36 -4.3210086822509766
		 36.8 -3.8759083747863774 37.6 -3.3899002075195312 38.4 -2.8864510059356689 39.2 -2.3927216529846191
		 40 -1.9390681982040403 40.8 -1.5575263500213623 41.6 -1.2802196741104126 42.4 -1.1373509168624878
		 43.2 -1.1209257841110229 44 -1.1204824447631836 44.8 -1.119296669960022 45.6 -1.1188300848007202
		 46.4 -1.1195614337921143 47.2 -1.120602011680603 48 -1.1209951639175415 48.8 -1.120537281036377
		 49.6 -1.1196503639221191 50.4 -1.119036078453064 51.2 -1.1190863847732544 52 -1.1193840503692627
		 52.8 -1.1192156076431274;
createNode animCurveTA -n "LeftHandRing1_rotateX";
	rename -uid "98E5FD9C-4CB2-CC49-8B65-B9A5E1497A16";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.3413543701171875 0.8 0.32086995244026184
		 1.6 0.31239452958106995 2.4 0.31666713953018188 3.2 0.31561625003814697 4 0.30092671513557434
		 4.8 0.28650790452957153 5.6 0.28276354074478149 6.4 0.28591009974479675 7.2 0.28673312067985535
		 8 0.25921368598937988 8.8 0.16173368692398071 9.6 0.0009464084287174045 10.4 -0.1395660787820816
		 11.2 -0.19275869429111481 12 -0.17888839542865753 12.8 -0.15154971182346344 13.6 -0.13151675462722778
		 14.4 -0.11425716429948807 15.2 -0.10082989931106567 16 -0.10005556046962738 16.8 0.95330411195755005
		 17.6 9.6516551971435547 18.4 23.807321548461914 19.2 37.565982818603516 20 44.985557556152344
		 20.8 45.598678588867188 21.6 45.624523162841797 22.4 45.652923583984375 23.2 45.675373077392578
		 24 45.694965362548828 24.8 45.715496063232422 25.6 45.733631134033203 26.4 45.743427276611328
		 27.2 45.739665985107422 28 45.721866607666016 28.8 45.699031829833984 29.6 45.684879302978516
		 30.4 45.686489105224609 31.2 45.698673248291016 32 45.709766387939453 32.8 45.520290374755859
		 33.6 44.702426910400391 34.4 43.280426025390625 35.2 41.318340301513672 36 38.877250671386719
		 36.8 36.043708801269531 37.6 32.926006317138672 38.4 29.610189437866211 39.2 26.146310806274414
		 40 22.599239349365234 40.8 19.067920684814453 41.6 15.63717842102051 42.4 12.363419532775879
		 43.2 9.314788818359375 44 6.5786137580871582 44.8 4.2378902435302734 45.6 2.3731429576873779
		 46.4 1.0682578086853027 47.2 0.40068334341049194 48 0.32238301634788513 48.8 0.33362460136413574
		 49.6 0.34931337833404541 50.4 0.35450243949890137 51.2 0.34074488282203674 52 0.32539361715316772
		 52.8 0.34134483337402344;
createNode animCurveTA -n "LeftHandRing1_rotateY";
	rename -uid "25ED79F3-4521-E9DA-DF59-C19868B816BD";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.80270320177078247 0.8 0.80400335788726807
		 1.6 0.81014204025268555 2.4 0.82145273685455322 3.2 0.83651447296142578 4 0.85331636667251587
		 4.8 0.87162542343139648 5.6 0.89125579595565796 6.4 0.90962255001068115 7.2 0.92227697372436523
		 8 0.92272502183914196 8.8 0.90849268436431885 9.6 0.88599801063537598 10.4 0.8668065071105957
		 11.2 0.8602529764175415 12 0.86303132772445679 12.8 0.86713564395904541 13.6 0.86988675594329834
		 14.4 0.87230229377746582 15.2 0.87428790330886841 16 0.87425005435943604 16.8 1.0442835092544556
		 17.6 2.3709592819213867 18.4 4.1412820816040039 19.2 5.2727813720703125 20 5.6270551681518555
		 20.8 5.6481490135192871 21.6 5.6495065689086914 22.4 5.6470837593078613 23.2 5.6401076316833496
		 24 5.6340909004211426 24.8 5.6333093643188477 25.6 5.6341972351074219 26.4 5.6313347816467285
		 27.2 5.6257953643798828 28 5.6223034858703613 28.8 5.6219930648803711 29.6 5.6216139793395996
		 30.4 5.617985725402832 31.2 5.6117367744445801 32 5.6072635650634766 32.8 5.5836973190307617
		 33.6 5.4859437942504883 34.4 5.3122329711914062 35.2 5.0692734718322754 36 4.7653241157531738
		 36.8 4.4136772155761719 37.6 4.0340046882629395 38.4 3.6424705982208252 39.2 3.2430758476257324
		 40 2.8377230167388916 40.8 2.4406270980834961 41.6 2.0741174221038818 42.4 1.7530204057693481
		 43.2 1.4798578023910522 44 1.2531363964080811 44.8 1.0724847316741943 45.6 0.93826884031295776
		 46.4 0.84994453191757202 47.2 0.80665796995162964 48 0.80163919925689697 48.8 0.80230206251144409
		 49.6 0.80321711301803589 50.4 0.80341213941574097 51.2 0.802581787109375 52 0.8017694354057312
		 52.8 0.8027072548866272;
createNode animCurveTA -n "LeftHandRing1_rotateZ";
	rename -uid "FCFB308A-4C64-D7DA-8FE4-8FAA13114148";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 11.793405855836028 0.8 5.2277321815490723
		 1.6 4.826378345489502 2.4 4.2199254035949707 3.2 3.4664857387542725 4 2.6449854373931885
		 4.8 1.827237606048584 5.6 1.0711238384246826 6.4 0.44557857513427734 7.2 0.031180452555418018
		 8 -0.12110951542854309 8.8 -0.15449477732181549 9.6 -0.2574191689491272 10.4 -0.38683873414993286
		 11.2 -0.47146874666213989 12 -0.49299594759941101 12.8 -0.47892928123474127 13.6 -0.45721429586410522
		 14.4 -0.4415736198425293 15.2 -0.43428364396095276 16 -0.42797762155532837 16.8 -0.45527246594429016
		 17.6 -0.60732448101043701 18.4 -0.38073483109474182 19.2 0.17159049212932587 20 0.50238162279129028
		 20.8 0.52861851453781128 21.6 0.52919811010360718 22.4 0.53356671333312988 23.2 0.54191750288009644
		 24 0.54907464981079102 24.8 0.55130523443222046 25.6 0.55174803733825684 26.4 0.55518072843551636
		 27.2 0.56022173166275024 28 0.56230747699737549 28.8 0.56098014116287231 29.6 0.56031525135040283
		 30.4 0.56391072273254395 31.2 0.57077991962432861 32 0.57586675882339478 32.8 0.58502638339996338
		 33.6 0.62163913249969482 34.4 0.69229799509048462 35.2 0.80086493492126465 36 0.95152491331100464
		 36.8 1.1462693214416504 37.6 1.379631519317627 38.4 1.6451923847198486 39.2 1.9498769044876101
		 40 2.3114829063415527 40.8 2.7326762676239014 41.6 3.1837613582611084 42.4 3.6245243549346924
		 43.2 4.0357308387756348 44 4.4161467552185059 44.8 4.7595729827880859 45.6 5.0471773147583008
		 46.4 5.25634765625 47.2 5.3675651550292969 48 5.3831758499145508 48.8 5.3837013244628906
		 49.6 5.387122631072998 50.4 5.3936481475830078 51.2 5.3936104774475098 52 5.3862142562866211
		 52.8 5.3888859748840332;
createNode animCurveTA -n "LeftHandRing2_rotateX";
	rename -uid "34854A40-49AA-E37D-BA76-7E904786BF75";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.6490899351648638 0.8 11.655684471130371
		 1.6 13.536079406738281 2.4 16.307771682739258 3.2 19.679840087890625 4 23.360076904296875
		 4.8 27.048372268676758 5.6 30.444503784179691 6.4 33.260673522949219 7.2 35.209644317626953
		 8 35.991756439208984 8.8 36.012401580810547 9.6 36.014080047607422 10.4 36.024192810058594
		 11.2 36.022712707519531 12 36.004150390625 12.8 35.989707946777344 13.6 35.993209838867188
		 14.4 36.003261566162109 15.2 36.006500244140625 16 36.003932952880859 16.8 37.043361663818359
		 17.6 45.568805694580078 18.4 59.363979339599609 19.2 72.715972900390625 20 79.912002563476562
		 20.8 80.490425109863281 21.6 80.489906311035156 22.4 80.489334106445312 23.2 80.488792419433594
		 24 80.48822021484375 24.8 80.487655639648438 25.6 80.487091064453125 26.4 80.486534118652344
		 27.2 80.485946655273438 28 80.485382080078125 28.8 80.484825134277344 29.6 80.484321594238281
		 30.4 80.483718872070312 31.2 80.482986450195312 32 80.482376098632812 32.8 80.182563781738281
		 33.6 78.91546630859375 34.4 76.710411071777344 35.2 73.687904357910156 36 69.97296142578125
		 36.8 65.690605163574219 37.6 60.956127166748047 38.4 55.875076293945312 39.2 50.557655334472656
		 40 45.126380920410156 40.8 39.704704284667969 41.6 34.410301208496094 42.4 29.36536979675293
		 43.2 24.696832656860352 44 20.520784378051758 44.8 16.945127487182617 45.6 14.091899871826172
		 46.4 12.095526695251465 47.2 11.076692581176758 48 10.954590797424316 48.8 10.955451011657715
		 49.6 10.958373069763184 50.4 10.964773178100586 51.2 10.970516204833984 52 10.969993591308594
		 52.8 10.961089134216309;
createNode animCurveTA -n "LeftHandRing2_rotateY";
	rename -uid "1A54036B-45C3-852D-3932-54A3977FF4D6";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -14.474961852795815 0.8 0.1958831399679184
		 1.6 0.26341512799263 2.4 0.37969344854354858 3.2 0.54770117998123169 4 0.76374679803848267
		 4.8 1.0135974884033203 5.6 1.2723509073257446 6.4 1.507138729095459 7.2 1.6800409555435181
		 8 1.7517611980438232 8.8 1.7536795139312744 9.6 1.7538326978683472 10.4 1.7547461986541748
		 11.2 1.754619836807251 12 1.7529069185256958 12.8 1.7515811920166016 13.6 1.7518863677978516
		 14.4 1.7528066635131836 15.2 1.7531110048294067 16 1.7528783082962036 16.8 1.8502854108810423
		 17.6 2.7331514358520508 18.4 4.4387373924255371 19.2 6.3313412666320801 20 7.4124889373779297
		 20.8 7.500494956970214 21.6 7.5004210472106925 22.4 7.5003376007080078 23.2 7.500248908996582
		 24 7.5001711845397949 24.8 7.5000863075256348 25.6 7.4999804496765137 26.4 7.4999098777770987
		 27.2 7.4998173713684082 28 7.4997310638427725 28.8 7.4996476173400879 29.6 7.4995746612548819
		 30.4 7.4994807243347168 31.2 7.499370574951171 32 7.4992671012878409 32.8 7.4536428451538086
		 33.6 7.2611522674560547 34.4 6.9279413223266602 35.2 6.4755430221557617 36 5.9282622337341309
		 36.8 5.3122639656066895 37.6 4.653968334197998 38.4 3.9791939258575439 39.2 3.3140065670013428
		 40 2.6838438510894775 40.8 2.1101045608520508 41.6 1.6081078052520752 42.4 1.1872075796127319
		 43.2 0.85050183534622192 44 0.5940970778465271 44.8 0.40923699736595154 45.6 0.28513205051422119
		 46.4 0.2108561098575592 47.2 0.17695535719394684 48 0.17305909097194672 48.8 0.17309997975826263
		 49.6 0.17318278551101685 50.4 0.17338274419307709 51.2 0.17356416583061218 52 0.17354422807693481
		 52.8 0.17326845228672028;
createNode animCurveTA -n "LeftHandRing2_rotateZ";
	rename -uid "1A7DB9C8-4D24-264E-2658-8F97E1AD41BF";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 2.5951423874366046 0.8 -2.3360257148742676
		 1.6 -2.6168553829193115 2.4 -3.0265121459960938 3.2 -3.5167410373687744 4 -4.0397510528564453
		 4.8 -4.5491690635681152 5.6 -5.0034160614013672 6.4 -5.3681421279907227 7.2 -5.6137003898620605
		 8 -5.7105979919433594 8.8 -5.7131209373474121 9.6 -5.713343620300293 10.4 -5.7145838737487793
		 11.2 -5.7144026756286621 12 -5.7121095657348633 12.8 -5.7103509902954102 13.6 -5.7107548713684082
		 14.4 -5.7120256423950195 15.2 -5.7124037742614746 16 -5.7120752334594727 16.8 -5.8393139839172363
		 17.6 -6.8126993179321289 18.4 -8.082148551940918 19.2 -8.8903932571411133 20 -9.1370334625244141
		 20.8 -9.1508588790893555 21.6 -9.1508722305297852 22.4 -9.1508541107177734 23.2 -9.1508455276489258
		 24 -9.1508407592773438 24.8 -9.1508293151855469 25.6 -9.1507978439331055 26.4 -9.1508092880249023
		 27.2 -9.1507806777954102 28 -9.1507759094238281 28.8 -9.1507596969604492 29.6 -9.1507530212402344
		 30.4 -9.1507377624511719 31.2 -9.1507120132446289 32 -9.1507120132446289 32.8 -9.1436252593994141
		 33.6 -9.1110601425170898 34.4 -9.044189453125 35.2 -8.9316501617431641 36 -8.7607917785644531
		 36.8 -8.5201635360717773 37.6 -8.2014226913452148 38.4 -7.8002781867980957 39.2 -7.3185281753540039
		 40 -6.7654671669006348 40.8 -6.1569786071777344 41.6 -5.5136880874633789 42.4 -4.8607144355773926
		 43.2 -4.2261853218078613 44 -3.6374363899230957 44.8 -3.1199064254760742 45.6 -2.6994311809539795
		 46.4 -2.4018890857696533 47.2 -2.2491183280944824 48 -2.2307796478271484 48.8 -2.2309081554412842
		 49.6 -2.2313408851623535 50.4 -2.2323060035705566 51.2 -2.2331669330596924 52 -2.2330935001373291
		 52.8 -2.2317309379577637;
createNode animCurveTA -n "LeftHandRing3_rotateX";
	rename -uid "5989ED96-4627-7522-8267-35A3BD9D55D3";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 4.743279440042719 0.8 18.625354766845703
		 1.6 19.132152557373047 2.4 19.887046813964844 3.2 20.80689811706543 4 21.801296234130859
		 4.8 22.79057502746582 5.6 23.710844039916992 6.4 24.486080169677734 7.2 25.017244338989258
		 8 25.210693359375 8.8 25.18792724609375 9.6 25.169395446777344 10.4 25.172187805175781
		 11.2 25.185007095336914 12 25.187089920043945 12.8 25.171300888061523 13.6 25.153242111206055
		 14.4 25.14826774597168 15.2 25.151229858398438 16 25.1494140625 16.8 25.400760650634766
		 17.6 27.525234222412109 18.4 30.980709075927734 19.2 34.332546234130859 20 36.137920379638672
		 20.8 36.282302856445312 21.6 36.283988952636719 22.4 36.298210144042969 23.2 36.319156646728516
		 24 36.330501556396484 24.8 36.325271606445312 25.6 36.313858032226562 26.4 36.309989929199219
		 27.2 36.312210083007812 28 36.309402465820312 28.8 36.303070068359375 29.6 36.306510925292969
		 30.4 36.321769714355469 31.2 36.336174011230469 32 36.3433837890625 32.8 36.273059844970703
		 33.6 35.952869415283203 34.4 35.378681182861328 35.2 34.583065032958984 36 33.614715576171875
		 36.8 32.510406494140625 37.6 31.291532516479496 38.4 29.984924316406254 39.2 28.625864028930664
		 40 27.243959426879883 40.8 25.85748291015625 41.6 24.487831115722656 42.4 23.175003051757812
		 43.2 21.965944290161133 44 20.893564224243164 44.8 19.983427047729492 45.6 19.265720367431641
		 46.4 18.7669677734375 47.2 18.50770378112793 48 18.467538833618164 48.8 18.457674026489258
		 49.6 18.457929611206055 50.4 18.47007942199707 51.2 18.479633331298828 52 18.472116470336914
		 52.8 18.448097229003906;
createNode animCurveTA -n "LeftHandRing3_rotateY";
	rename -uid "2CC81429-459E-AAAD-C505-C89D9BAC294A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.2424041724466862e-17 0.8 0.28249689936637878
		 1.6 0.30606567859649658 2.4 0.34240466356277466 3.2 0.38865247368812561 4 0.44106510281562805
		 4.8 0.49566903710365301 5.6 0.5486605167388916 6.4 0.59494459629058838 7.2 0.62751805782318115
		 8 0.6395525336265564 8.8 0.63813662528991699 9.6 0.6369621753692627 10.4 0.63714104890823364
		 11.2 0.63794988393783569 12 0.63806283473968506 12.8 0.637073814868927 13.6 0.63596987724304199
		 14.4 0.6356547474861145 15.2 0.63584870100021362 16 0.63572156429290771 16.8 0.65146946907043457
		 17.6 0.79066050052642822 18.4 1.0402772426605225 19.2 1.3091753721237183 20 1.4646197557449341
		 20.8 1.4773522615432739 21.6 1.4775125980377197 22.4 1.4787610769271851 23.2 1.4806339740753174
		 24 1.481630802154541 24.8 1.48116135597229 25.6 1.4801596403121948 26.4 1.4798129796981812
		 27.2 1.4799991846084595 28 1.4797688722610474 28.8 1.4792124032974243 29.6 1.4795039892196655
		 30.4 1.4808603525161743 31.2 1.482136607170105 32 1.4827694892883301 32.8 1.4765490293502808
		 33.6 1.4483449459075928 34.4 1.3983588218688965 35.2 1.3303012847900391 36 1.2494180202484131
		 36.8 1.1597853899002075 37.6 1.0641207695007324 38.4 0.96542692184448231 39.2 0.8670734167098999
		 40 0.77160197496414185 40.8 0.68045765161514282 41.6 0.59504622220993042 42.4 0.51754897832870483
		 43.2 0.44998109340667725 44 0.39313080906867981 44.8 0.34715571999549866 45.6 0.3123970627784729
		 46.4 0.28901714086532593 47.2 0.27711331844329834 48 0.27528297901153564 48.8 0.27484419941902161
		 49.6 0.27485549449920654 50.4 0.27540317177772522 51.2 0.27582299709320068 52 0.27551117539405823
		 52.8 0.27440360188484192;
createNode animCurveTA -n "LeftHandRing3_rotateZ";
	rename -uid "27D25552-486D-6B17-AFDB-E0A25B62CDA6";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.3587173221120108 0.8 -1.2157191038131714
		 1.6 -1.2899844646453857 2.4 -1.4002153873443604 3.2 -1.5338547229766846 4 -1.6774983406066895
		 4.8 -1.8195297718048096 5.6 -1.9507589340209959 6.4 -2.0606734752655029 7.2 -2.1356258392333984
		 8 -2.1628406047821045 8.8 -2.1596412658691406 9.6 -2.157027006149292 10.4 -2.1574325561523438
		 11.2 -2.1592354774475098 12 -2.159520149230957 12.8 -2.1572787761688232 13.6 -2.1547615528106689
		 14.4 -2.1540400981903076 15.2 -2.154482364654541 16 -2.154219388961792 16.8 -2.1895575523376465
		 17.6 -2.4853641986846924 18.4 -2.955047607421875 19.2 -3.395749568939209 20 -3.6265120506286621
		 20.8 -3.644742488861084 21.6 -3.6449601650238042 22.4 -3.6467511653900146 23.2 -3.649376392364502
		 24 -3.6508157253265376 24.8 -3.6501622200012207 25.6 -3.6487283706665039 26.4 -3.6482312679290771
		 27.2 -3.6485109329223633 28 -3.6481599807739258 28.8 -3.6473517417907715 29.6 -3.6477971076965336
		 30.4 -3.6497192382812496 31.2 -3.6515321731567383 32 -3.6524484157562251 32.8 -3.6435718536376958
		 33.6 -3.6030726432800293 34.4 -3.5300359725952148 35.2 -3.4280571937561035 36 -3.30267333984375
		 36.8 -3.1580796241760254 37.6 -2.9965567588806152 38.4 -2.8212049007415771 39.2 -2.6365528106689453
		 40 -2.4464800357818604 40.8 -2.2535619735717773 41.6 -2.0609128475189209 42.4 -1.8744469881057737
		 43.2 -1.7012008428573608 44 -1.5464138984680176 44.8 -1.4142425060272217 45.6 -1.3095214366912842
		 46.4 -1.2364988327026367 47.2 -1.1984618902206421 48 -1.1925628185272217 48.8 -1.1911077499389648
		 49.6 -1.1911571025848389 50.4 -1.1929410696029663 51.2 -1.1943413019180298 52 -1.1932417154312134
		 52.8 -1.1897233724594116;
createNode animCurveTA -n "LeftHandPinky1_rotateX";
	rename -uid "89FB34FB-415F-3FDF-334A-E0BE673FB61E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -7.4377021789550781 0.8 -7.1049513816833496
		 1.6 -6.228508472442627 2.4 -4.9422664642333984 3.2 -3.3677682876586914 4 -1.6324913501739502
		 4.8 0.11216842383146286 5.6 1.702302098274231 6.4 2.9911816120147705 7.2 3.8569257259368901
		 8 4.1703372001647949 8.8 4.0865201950073242 9.6 3.932670116424561 10.4 3.7916610240936284
		 11.2 3.7216439247131348 12 3.6998975276947021 12.8 3.6808290481567383 13.6 3.6549670696258549
		 14.4 3.6243727207183842 15.2 3.582890510559082 16 3.5422873497009277 16.8 4.3029084205627441
		 17.6 10.681342124938965 18.4 21.126514434814453 19.2 31.295509338378903 20 36.781143188476562
		 20.8 37.252899169921875 21.6 37.280277252197266 22.4 37.311592102050781 23.2 37.345611572265625
		 24 37.377311706542969 24.8 37.408351898193359 25.6 37.441799163818359 26.4 37.469429016113281
		 27.2 37.476116180419922 28 37.463157653808594 28.8 37.449958801269531 29.6 37.44561767578125
		 30.4 37.443809509277344 31.2 37.449226379394531 32 37.47320556640625 32.8 37.378337860107422
		 33.6 36.857517242431641 34.4 35.916038513183594 35.2 34.604991912841797 36 32.954364776611328
		 36.8 30.989585876464844 37.6 28.768239974975586 38.4 26.360918045043945 39.2 23.805059432983398
		 40 21.122722625732422 40.8 18.357721328735352 41.6 15.553520202636721 42.4 12.72858715057373
		 43.2 9.9077482223510742 44 7.1498050689697266 44.8 4.5186915397644043 45.6 2.049522876739502
		 46.4 -0.23397071659564972 47.2 -2.2848398685455322 48 -4.0404067039489746 48.8 -5.4547595977783203
		 49.6 -6.5035586357116699 50.4 -7.1629133224487296 51.2 -7.3999257087707528 52 -7.4200987815856934
		 52.8 -7.4377079010009775;
createNode animCurveTA -n "LeftHandPinky1_rotateY";
	rename -uid "4EA148DB-4E66-7794-1879-DFA8954F8B7C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.6606144905090332 0.8 1.6098366975784302
		 1.6 1.4994286298751831 2.4 1.3965038061141968 3.2 1.369140625 4 1.464998722076416
		 4.8 1.6926240921020508 5.6 2.0140824317932129 6.4 2.3560786247253418 7.2 2.6277174949645996
		 8 2.7311737537384033 8.8 2.6928701400756836 9.6 2.6279478073120117 10.4 2.5726816654205322
		 11.2 2.5533559322357178 12 2.5594604015350342 12.8 2.5666599273681641 13.6 2.564739465713501
		 14.4 2.5540144443511963 15.2 2.5379247665405273 16 2.5242860317230225 16.8 2.6597638130187988
		 17.6 3.5890421867370605 18.4 4.3260860443115234 19.2 4.1658368110656738 20 3.7598962783813472
		 20.8 3.7268192768096924 21.6 3.7337932586669926 22.4 3.7407963275909428 23.2 3.7483162879943843
		 24 3.7554423809051514 24.8 3.7624166011810303 25.6 3.7698686122894292 26.4 3.7760558128356934
		 27.2 3.7776601314544678 28 3.7748744487762451 28.8 3.7719600200653072 29.6 3.7709474563598633
		 30.4 3.7704772949218746 31.2 3.7717077732086182 32 3.7772095203399658 32.8 3.7698988914489751
		 33.6 3.7125918865203862 34.4 3.6081771850585938 35.2 3.4669938087463379 36 3.2947876453399658
		 36.8 3.0962824821472168 37.6 2.8834695816040039 38.4 2.6718406677246094 39.2 2.4699287414550781
		 40 2.2809979915618896 40.8 2.1100201606750488 41.6 1.9611002206802366 42.4 1.8344112634658816
		 43.2 1.7303545475006104 44 1.6524331569671631 44.8 1.6022979021072388 45.6 1.5763399600982666
		 46.4 1.5688323974609375 47.2 1.5758886337280273 48 1.5942509174346924 48.8 1.6183960437774658
		 49.6 1.641227126121521 50.4 1.6563715934753418 51.2 1.6606316566467285 52 1.6591213941574097
		 52.8 1.66062331199646;
createNode animCurveTA -n "LeftHandPinky1_rotateZ";
	rename -uid "84CF415E-4397-6EA6-9F12-9E94206A958D";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 24.48912945342428 0.8 13.97598934173584
		 1.6 12.908555030822754 2.4 11.341849327087402 3.2 9.431614875793457 4 7.3440518379211435
		 4.8 5.2503485679626465 5.6 3.3179178237915039 6.4 1.7125059366226196 7.2 0.59656447172164917
		 8 0.11901389807462692 8.8 0.039650406688451767 9.6 -0.029211528599262241 10.4 -0.053200762718915939
		 11.2 0.0026296288706362247 12 0.11927516758441925 12.8 0.23587831854820249 13.6 0.29734417796134949
		 14.4 0.30141213536262512 15.2 0.29414582252502441 16 0.30409413576126099 16.8 0.45765435695648193
		 17.6 1.6810790300369263 18.4 3.7114107608795166 19.2 5.5235457420349121 20 6.3652548789978027
		 20.8 6.447357177734375 21.6 6.4616546630859375 22.4 6.4651575088500977 23.2 6.4623894691467285
		 24 6.4596138000488281 24.8 6.4616327285766602 25.6 6.4668312072753906 26.4 6.4654483795166016
		 27.2 6.4539899826049805 28 6.442589282989502 28.8 6.4383726119995117 29.6 6.4406905174255371
		 30.4 6.4470076560974121 31.2 6.4472036361694336 32 6.4350795745849609 32.8 6.4473848342895508
		 33.6 6.5426521301269531 34.4 6.7013006210327148 35.2 6.8967933654785156 36 7.1382579803466797
		 36.8 7.4381446838378906 37.6 7.7817826271057129 38.4 8.1625699996948242 39.2 8.6047201156616211
		 40 9.114649772644043 40.8 9.6444063186645508 41.6 10.14601993560791 42.4 10.633527755737305
		 43.2 11.143215179443359 44 11.665210723876953 44.8 12.16254711151123 45.6 12.624154090881348
		 46.4 13.058310508728027 47.2 13.455538749694824 48 13.78672981262207 48.8 14.035209655761719
		 49.6 14.210018157958984 50.4 14.319796562194824 51.2 14.357741355895996 52 14.364522933959961
		 52.8 14.394847869873045;
createNode animCurveTA -n "LeftHandPinky2_rotateX";
	rename -uid "30639FE5-4718-B914-9A86-F78E0E317525";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.050081590745343907 0.8 15.952763557434084
		 1.6 18.287628173828125 2.4 21.743051528930664 3.2 25.984594345092773 4 30.595848083496094
		 4.8 35.187297821044922 5.6 39.439388275146484 6.4 43.017925262451172 7.2 45.520278930664062
		 8 46.530242919921875 8.8 46.549907684326172 9.6 46.527740478515625 10.4 46.549575805664062
		 11.2 46.628074645996094 12 46.695743560791016 12.8 46.664108276367188 13.6 46.534458160400391
		 14.4 46.386360168457031 15.2 46.273727416992188 16 46.203853607177734 16.8 46.551250457763672
		 17.6 49.591110229492188 18.4 54.506900787353516 19.2 59.221256256103516 20 61.715030670166023
		 20.8 61.885215759277344 21.6 61.880111694335938 22.4 61.877708435058601 23.2 61.875713348388672
		 24 61.912368774414062 24.8 61.989200592041023 25.6 62.049148559570312 26.4 62.062831878662116
		 27.2 62.044242858886719 28 61.992675781250007 28.8 61.925868988037109 29.6 61.906093597412109
		 30.4 61.946804046630859 31.2 61.976295471191406 32 61.94828796386718 32.8 61.771850585937493
		 33.6 61.193321228027351 34.4 60.203746795654304 35.2 58.822978973388672 36 57.111484527587891
		 36.8 55.139965057373047 37.6 52.935588836669922 38.4 50.4892578125 39.2 47.803482055664062
		 40 44.9205322265625 40.8 41.92724609375 41.6 38.921031951904297 42.4 35.953704833984375
		 43.2 33.034641265869141 44 30.182891845703129 44.8 27.44398307800293 45.6 24.868867874145508
		 46.4 22.501276016235352 47.2 20.381671905517578 48 18.552082061767578 48.8 17.056015014648438
		 49.6 15.936785697937012 50.4 15.237085342407227 51.2 14.997561454772949 52 14.998300552368162
		 52.8 14.999059677124023;
createNode animCurveTA -n "LeftHandPinky2_rotateY";
	rename -uid "B097F0FF-411F-C044-5DC9-F4AF74C47AD9";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -8.0694195767212769 0.8 0.40934944152832031
		 1.6 0.53903037309646606 2.4 0.762137770652771 3.2 1.0858317613601685 4 1.4982439279556274
		 4.8 1.9690518379211426 5.6 2.4561088085174561 6.4 2.9020612239837646 7.2 3.2325024604797363
		 8 3.3700571060180664 8.8 3.3727428913116455 9.6 3.3696963787078857 10.4 3.37270188331604
		 11.2 3.383500337600708 12 3.3928260803222656 12.8 3.3884470462799072 13.6 3.370633602142334
		 14.4 3.3503239154815674 15.2 3.3349068164825439 16 3.3253462314605713 16.8 3.3729321956634521
		 17.6 3.8009743690490723 18.4 4.534782886505127 19.2 5.2822747230529785 20 5.6932063102722168
		 20.8 5.7216033935546875 21.6 5.7207632064819336 22.4 5.7203593254089355 23.2 5.720026969909668
		 24 5.7261404991149902 24.8 5.738983154296875 25.6 5.749021053314209 26.4 5.7512955665588379
		 27.2 5.7481932640075684 28 5.7395601272583008 28.8 5.7283945083618164 29.6 5.7250957489013672
		 30.4 5.7319087982177734 31.2 5.7368273735046387 32 5.7321505546569824 32.8 5.7026915550231934
		 33.6 5.6064081192016602 34.4 5.442965030670166 35.2 5.2176070213317871 36 4.9427967071533203
		 36.8 4.6327791213989258 37.6 4.2948956489562988 38.4 3.9313383102416992 39.2 3.5467698574066162
		 40 3.151961088180542 40.8 2.7627623081207275 41.6 2.3941903114318848 42.4 2.0533020496368408
		 43.2 1.7410393953323364 44 1.4588090181350708 44.8 1.2096384763717651 45.6 0.99544829130172729
		 46.4 0.81600016355514526 47.2 0.66983771324157715 48 0.55479246377944946 48.8 0.4684884250164032
		 49.6 0.4085296094417572 50.4 0.37302467226982117 51.2 0.36125138401985168 52 0.36127886176109314
		 52.8 0.36130163073539734;
createNode animCurveTA -n "LeftHandPinky2_rotateZ";
	rename -uid "4BFA45B3-4EC7-9D49-3E1F-0790D17BB0D5";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.35677106640187034 0.8 -3.409048318862915
		 1.6 -3.8280260562896733 2.4 -4.4378666877746582 3.2 -5.1669478416442871 4 -5.9308342933654785
		 4.8 -6.6569352149963379 5.6 -7.2945909500122079 6.4 -7.8026270866394043 7.2 -8.1411609649658203
		 8 -8.273716926574707 8.8 -8.2762718200683594 9.6 -8.2733983993530273 10.4 -8.2762470245361328
		 11.2 -8.2864284515380859 12 -8.2952136993408203 12.8 -8.2911128997802734 13.6 -8.2742719650268555
		 14.4 -8.2549819946289062 15.2 -8.2402753829956055 16 -8.2311429977416992 16.8 -8.2764492034912109
		 17.6 -8.6605739593505859 18.4 -9.2327489852905273 19.2 -9.7210102081298828 20 -9.954132080078125
		 20.8 -9.9693918228149414 21.6 -9.9689149856567383 22.4 -9.968714714050293 23.2 -9.9685440063476562
		 24 -9.9717912673950195 24.8 -9.9786520004272461 25.6 -9.9840011596679688 26.4 -9.9852104187011719
		 27.2 -9.9835577011108398 28 -9.9789581298828125 28.8 -9.9730100631713867 29.6 -9.9712505340576172
		 30.4 -9.9748821258544922 31.2 -9.9775094985961914 32 -9.9750165939331055 32.8 -9.9592247009277344
		 33.6 -9.9068374633789062 34.4 -9.8149747848510742 35.2 -9.6821517944335938 36 -9.510066032409668
		 36.8 -9.3018369674682617 37.6 -9.0566644668579102 38.4 -8.7697505950927734 39.2 -8.4373960494995117
		 40 -8.0613174438476562 40.8 -7.6506953239440918 41.6 -7.218775749206543 42.4 -6.7744579315185547
		 43.2 -6.3211021423339844 44 -5.8637785911560059 44.8 -5.4121561050415039 45.6 -4.9774575233459473
		 46.4 -4.5698771476745605 47.2 -4.1991643905639648 48 -3.8751361370086665 48.8 -3.6076402664184566
		 49.6 -3.4061553478240967 50.4 -3.2796297073364258 51.2 -3.2362270355224609 52 -3.236356258392334
		 52.8 -3.2364888191223145;
createNode animCurveTA -n "LeftHandPinky3_rotateX";
	rename -uid "C83C8A3C-44D5-2C1E-A32D-10AB22CEFE71";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -1.244890220492454e-17 0.8 17.641504287719727
		 1.6 20.847429275512695 2.4 25.570009231567383 3.2 31.313438415527344 4 37.568656921386719
		 4.8 43.821922302246094 5.6 49.575572967529297 6.4 54.348579406738281 7.2 57.657520294189453
		 8 59.003833770751953 8.8 59.066619873046868 9.6 59.076137542724602 10.4 59.078506469726562
		 11.2 59.080314636230469 12 59.084720611572273 12.8 59.089694976806634 13.6 59.099052429199219
		 14.4 59.122127532958984 15.2 59.155784606933587 16 59.181755065917962 16.8 59.060630798339851
		 17.6 58.001808166503913 18.4 56.286949157714844 19.2 54.626228332519531 20 53.725692749023438
		 20.8 53.641319274902344 21.6 53.632217407226562 22.4 53.629913330078125 23.2 53.629596710205078
		 24 53.625869750976562 24.8 53.619964599609375 25.6 53.615013122558594 26.4 53.610305786132812
		 27.2 53.603599548339844 28 53.594741821289062 28.8 53.586097717285156 29.6 53.581375122070312
		 30.4 53.581333160400391 31.2 53.581710815429688 32 53.577484130859375 32.8 53.462875366210938
		 33.6 53.006446838378906 34.4 52.222335815429688 35.2 51.148723602294922 36 49.807224273681641
		 36.8 48.21624755859375 37.6 46.407428741455078 38.4 44.420326232910156 39.2 42.289871215820312
		 40 40.05047607421875 40.8 37.742759704589844 41.6 35.403736114501953 42.4 33.0579833984375
		 43.2 30.732070922851562 44 28.466947555541992 44.8 26.303438186645508 45.6 24.269186019897461
		 46.4 22.388505935668945 47.2 20.696537017822266 48 19.238941192626953 48.8 18.058971405029297
		 49.6 17.18657112121582 50.4 16.640678405761719 51.2 16.444211959838867 52 16.434162139892578
		 52.8 16.445615768432617;
createNode animCurveTA -n "LeftHandPinky3_rotateY";
	rename -uid "6C6F25DD-49CB-9FE5-1D60-32A4908D50BE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.6215889951715079 0.8 0.39082685112953186
		 1.6 0.5897490382194519 2.4 0.94015365839004517 3.2 1.4555048942565918 4 2.1226372718811035
		 4.8 2.8924591541290283 5.6 3.683854341506958 6.4 4.3949036598205566 7.2 4.9140310287475586
		 8 5.1309089660644531 8.8 5.1410961151123047 9.6 5.1426515579223633 10.4 5.1430354118347168
		 11.2 5.1433115005493164 12 5.144038200378418 12.8 5.1448574066162109 13.6 5.1463522911071777
		 14.4 5.1501097679138184 15.2 5.1555805206298828 16 5.1597967147827148 16.8 5.1401190757751465
		 17.6 4.9691963195800781 18.4 4.6965608596801758 19.2 4.437678337097168 20 4.299501895904541
		 20.8 4.2866358757019043 21.6 4.2852435111999512 22.4 4.2849011421203613 23.2 4.2848577499389648
		 24 4.284273624420166 24.8 4.283383846282959 25.6 4.2826313972473145 26.4 4.2819128036499023
		 27.2 4.2808880805969238 28 4.2795352935791016 28.8 4.2782225608825684 29.6 4.277503490447998
		 30.4 4.2775006294250488 31.2 4.2775492668151855 32 4.2769126892089844 32.8 4.259458065032959
		 33.6 4.1902809143066406 34.4 4.0723972320556641 35.2 3.9130184650421143 36 3.7172672748565674
		 36.8 3.4901223182678223 37.6 3.2387094497680664 38.4 2.9711918830871582 39.2 2.6948084831237793
		 40 2.4163351058959961 40.8 2.1427285671234131 41.6 1.879675030708313 42.4 1.6307429075241089
		 43.2 1.3989955186843872 44 1.1881036758422852 44.8 1.000598669052124 45.6 0.83691263198852539
		 46.4 0.69665396213531494 47.2 0.57965439558029175 48 0.48595452308654785 48.8 0.41491878032684326
		 49.6 0.36518362164497375 50.4 0.33529916405677795 51.2 0.32476931810379028 52 0.32422074675559998
		 52.8 0.32485020160675049;
createNode animCurveTA -n "LeftHandPinky3_rotateZ";
	rename -uid "A256D63C-4791-3779-6E4D-8C8766A5F4F9";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.3783800530705068 0.8 -1.6695094108581543
		 1.6 -2.2378056049346924 2.4 -3.053217887878418 3.2 -4.0029797554016113 4 -4.9745244979858398
		 4.8 -5.8690090179443359 5.6 -6.6147937774658203 6.4 -7.171506404876709 7.2 -7.5221571922302246
		 8 -7.6561884880065918 8.8 -7.6623244285583487 9.6 -7.663259506225585 10.4 -7.6634902954101571
		 11.2 -7.6636524200439453 12 -7.6640791893005371 12.8 -7.6645898818969735 13.6 -7.665471076965332
		 14.4 -7.6677403450012207 15.2 -7.671011447906495 16 -7.6735215187072745 16.8 -7.6617331504821768
		 17.6 -7.5569167137145996 18.4 -7.3805155754089355 19.2 -7.202063560485839 20 -7.1022043228149414
		 20.8 -7.0927290916442871 21.6 -7.0917119979858398 22.4 -7.0914468765258789 23.2 -7.0914154052734375
		 24 -7.0910048484802246 24.8 -7.0903315544128418 25.6 -7.0897870063781738 26.4 -7.0892462730407715
		 27.2 -7.0884928703308105 28 -7.0874953269958496 28.8 -7.0865340232849121 29.6 -7.0860109329223633
		 30.4 -7.0859932899475098 31.2 -7.0860357284545898 32 -7.0855584144592285 32.8 -7.0726490020751953
		 33.6 -7.020906925201416 34.4 -6.9307413101196289 35.2 -6.804725170135498 36 -6.643150806427002
		 36.8 -6.4457159042358398 37.6 -6.2137961387634277 38.4 -5.950171947479248 39.2 -5.6575746536254883
		 40 -5.3393654823303223 40.8 -5.0005297660827637 41.6 -4.6463932991027832 42.4 -4.2809944152832031
		 43.2 -3.9091796875 44 -3.5385489463806152 44.8 -3.1772360801696777 45.6 -2.8314571380615234
		 46.4 -2.506927490234375 47.2 -2.2113096714019775 48 -1.9540266990661623 48.8 -1.7441153526306152
		 49.6 -1.5880268812179565 50.4 -1.4899991750717163 51.2 -1.4546512365341187 52 -1.4528375864028931
		 52.8 -1.4549082517623901;
createNode animCurveTA -n "RightShoulder_rotateX";
	rename -uid "1D6CF8C3-42EB-E323-151E-BFA69B9EC835";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0 0.8 22.745059967041016 1.6 22.441205978393555
		 2.4 21.940744400024414 3.2 21.230930328369141 4 20.319957733154297 4.8 19.238887786865234
		 5.6 18.040220260620117 6.4 16.799629211425781 7.2 15.578853607177734 8 14.30427360534668
		 8.8 12.589743614196777 9.6 10.246486663818359 10.4 7.2823681831359872 11.2 3.7295703887939453
		 12 -0.50269448757171631 12.8 -5.5191912651062012 13.6 -11.110383033752441 14.4 -16.581411361694336
		 15.2 -21.095922470092773 16 -24.706874847412109 16.8 -30.160652160644535 17.6 -38.279747009277344
		 18.4 -41.602828979492188 19.2 -43.689826965332031 20 -32.345500946044922 20.8 -17.184909820556641
		 21.6 -3.7140257358551021 22.4 3.3543879985809326 23.2 5.1992793083190918 24 5.4759049415588379
		 24.8 5.8574056625366211 25.6 6.4076080322265625 26.4 6.691767692565918 27.2 6.8440442085266113
		 28 7.2992148399353027 28.8 8.0933380126953125 29.6 8.8546943664550781 30.4 9.3621368408203125
		 31.2 9.7929716110229492 32 10.394392013549805 32.8 11.168734550476074 33.6 11.994080543518066
		 34.4 12.848671913146973 35.2 13.766180038452148 36 14.700739860534666 36.8 15.555497169494631
		 37.6 16.280374526977539 38.4 16.891603469848633 39.2 17.43364143371582 40 17.931785583496094
		 40.8 18.37031364440918 41.6 18.73613166809082 42.4 19.068365097045898 43.2 19.420028686523438
		 44 19.79145622253418 44.8 20.156036376953125 45.6 20.528858184814453 46.4 20.947059631347656
		 47.2 21.398227691650391 48 21.819454193115234 48.8 22.161575317382812 49.6 22.420671463012695
		 50.4 22.612880706787109 51.2 22.748712539672852 52 22.832195281982422 52.8 22.86640739440918;
createNode animCurveTA -n "RightShoulder_rotateY";
	rename -uid "46938C59-430D-80C8-2040-59B3DBDF8BAE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -12.087953195982488 0.8 -2.9663727283477783
		 1.6 -2.9540314674377441 2.4 -2.9338784217834473 3.2 -2.9074447154998779 4 -2.886789083480835
		 4.8 -2.8855578899383545 5.6 -2.9080049991607666 6.4 -2.953791618347168 7.2 -3.029402494430542
		 8 -3.0004961490631104 8.8 -1.9764621257781985 9.6 0.11994908750057222 10.4 3.1264727115631104
		 11.2 6.8767814636230469 12 11.187094688415527 12.8 15.885077476501467 13.6 20.861295700073242
		 14.4 25.989145278930664 15.2 30.890705108642578 16 35.486698150634766 16.8 41.935718536376953
		 17.6 47.535953521728516 18.4 50.365558624267578 19.2 43.217552185058594 20 28.499578475952148
		 20.8 9.9481887817382812 21.6 -4.7607197761535645 22.4 -8.1064434051513672 23.2 -7.7002415657043457
		 24 -7.8236503601074219 24.8 -7.7813920974731454 25.6 -7.5445728302001953 26.4 -7.3363571166992188
		 27.2 -7.1622357368469238 28 -6.9117641448974609 28.8 -6.5863914489746094 29.6 -6.2775845527648926
		 30.4 -6.0182685852050781 31.2 -5.7544102668762207 32 -5.4525637626647949 32.8 -5.1463446617126465
		 33.6 -4.8710803985595703 34.4 -4.6201362609863281 35.2 -4.3729496002197266 36 -4.129448413848877
		 36.8 -3.9047741889953613 37.6 -3.7083559036254883 38.4 -3.5394060611724854 39.2 -3.3969106674194336
		 40 -3.2868025302886963 40.8 -3.2135782241821289 41.6 -3.1669397354125977 42.4 -3.126589298248291
		 43.2 -3.0821046829223633 44 -3.0399003028869629 44.8 -3.0093080997467041 45.6 -2.991459846496582
		 46.4 -2.9825439453125 47.2 -2.9793860912322998 48 -2.9795072078704834 48.8 -2.9800336360931396
		 49.6 -2.979001522064209 50.4 -2.9767129421234131 51.2 -2.9748620986938477 52 -2.9745676517486572
		 52.8 -2.9755828380584717;
createNode animCurveTA -n "RightShoulder_rotateZ";
	rename -uid "AA0CB8F6-439E-240E-D2CE-A3A7ABA8A0DB";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -10.844296867942399 0.8 -7.3738641738891602
		 1.6 -7.5380105972290039 2.4 -7.7562522888183603 3.2 -7.9765367507934579 4 -8.2216777801513672
		 4.8 -8.5190610885620117 5.6 -8.829951286315918 6.4 -9.1137170791625977 7.2 -9.4045581817626953
		 8 -9.701167106628418 8.8 -9.7457618713378906 9.6 -9.4339323043823242 10.4 -8.8347501754760742
		 11.2 -8.1444005966186523 12 -7.5761232376098642 12.8 -7.1810693740844727 13.6 -6.7812590599060059
		 14.4 -6.3063011169433594 15.2 -6.3236393928527832 16 -8.2640438079833984 16.8 -14.722131729125977
		 17.6 -25.864717483520508 18.4 -33.571945190429688 19.2 -39.323532104492188 20 -32.67376708984375
		 20.8 -25.871919631958008 21.6 -25.127204895019531 22.4 -26.583200454711914 23.2 -27.550416946411133
		 24 -28.526205062866211 24.8 -29.071357727050781 25.6 -28.908914566040036 26.4 -28.229475021362305
		 27.2 -27.399803161621094 28 -26.647640228271484 28.8 -25.994495391845703 29.6 -25.301557540893555
		 30.4 -24.402580261230469 31.2 -23.283763885498047 32 -22.108236312866211 32.8 -21.054965972900391
		 33.6 -20.177255630493164 34.4 -19.398740768432617 35.2 -18.594173431396484 36 -17.679359436035156
		 36.8 -16.655157089233398 37.6 -15.576929092407227 38.4 -14.504022598266602 39.2 -13.50595760345459
		 40 -12.675766944885254 40.8 -12.057395935058594 41.6 -11.571673393249512 42.4 -11.084880828857422
		 43.2 -10.545246124267578 44 -10.006454467773438 44.8 -9.5375137329101562 45.6 -9.1559953689575195
		 46.4 -8.8409061431884766 47.2 -8.5672340393066406 48 -8.3156671524047852 48.8 -8.0728874206542969
		 49.6 -7.8387188911437988 50.4 -7.6294846534728995 51.2 -7.4693717956542969 52 -7.3755154609680167
		 52.8 -7.3518090248107901;
createNode animCurveTA -n "RightArm_rotateX";
	rename -uid "13A02F14-45FA-8BFF-BE5A-FC946AD4B1A4";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -2.0511535505786982e-16 0.8 50.351486206054688
		 1.6 49.943885803222656 2.4 49.57476806640625 3.2 49.358642578125 4 49.208755493164062
		 4.8 48.60809326171875 5.6 47.130584716796875 6.4 44.899742126464844 7.2 42.214855194091797
		 8 39.499744415283203 8.8 37.189899444580078 9.6 35.143051147460938 10.4 32.760883331298828
		 11.2 29.412073135375977 12 24.788040161132812 12.8 19.511981964111328 13.6 15.803599357604979
		 14.4 16.734617233276367 15.2 23.138736724853516 16 31.863716125488285 16.8 38.637763977050781
		 17.6 36.530376434326172 18.4 30.704830169677734 19.2 29.621051788330082 20 20.30949592590332
		 20.8 17.679424285888672 21.6 24.034557342529297 22.4 30.183748245239254 23.2 34.836101531982422
		 24 39.186916351318359 24.8 43.379306793212891 25.6 47.061515808105469 26.4 49.641075134277344
		 27.2 50.760868072509766 28 50.834506988525391 28.8 50.947116851806641 29.6 51.866867065429688
		 30.4 53.376331329345703 31.2 54.544071197509766 32 54.336616516113281 32.8 52.899200439453125
		 33.6 51.481349945068359 34.4 50.792976379394531 35.2 50.729560852050781 36 51.092250823974609
		 36.8 51.785213470458984 37.6 52.577075958251953 38.4 53.060626983642578 39.2 52.962905883789062
		 40 52.363712310791016 40.8 51.590976715087891 41.6 50.924591064453125 42.4 50.403881072998047
		 43.2 49.950794219970703 44 49.566616058349609 44.8 49.314292907714844 45.6 49.200031280517578
		 46.4 49.172523498535156 47.2 49.205085754394531 48 49.311214447021484 48.8 49.494590759277344
		 49.6 49.731697082519531 50.4 49.995708465576172 51.2 50.266315460205078 52 50.523681640625
		 52.8 50.75042724609375;
createNode animCurveTA -n "RightArm_rotateY";
	rename -uid "F0FAB8DE-4FE2-751A-2045-34A16B021D99";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 14.27208297795168 0.8 -1.8663655519485474
		 1.6 -1.1514338254928589 2.4 -0.075415089726448059 3.2 1.3640106916427612 4 2.2569384574890137
		 4.8 1.1719377040863037 5.6 -2.3239731788635254 6.4 -6.6833529472351074 7.2 -9.1773920059204102
		 8 -8.2393827438354492 8.8 -5.3246946334838867 9.6 -2.1303019523620605 10.4 0.67841237783432007
		 11.2 3.428281307220459 12 6.7586889266967773 12.8 11.132594108581543 13.6 16.65740966796875
		 14.4 23.177402496337891 15.2 30.927013397216797 16 40.953636169433594 16.8 51.041507720947266
		 17.6 55.961849212646484 18.4 47.453834533691406 19.2 25.591529846191406 20 5.3612980842590332
		 20.8 -0.96900969743728638 21.6 5.3634705543518066 22.4 8.0574302673339844 23.2 6.88861083984375
		 24 6.5767755508422852 24.8 7.3492512702941886 25.6 7.8137130737304696 26.4 6.4043688774108887
		 27.2 2.5609190464019775 28 -3.1159632205963135 28.8 -8.7223405838012695 29.6 -11.654718399047852
		 30.4 -11.06389045715332 31.2 -9.2420845031738281 32 -9.2294406890869141 32.8 -11.920820236206055
		 33.6 -15.646710395812988 34.4 -18.226791381835938 35.2 -19.122940063476562 36 -18.935544967651367
		 36.8 -17.96653938293457 37.6 -16.087394714355469 38.4 -13.430601119995117 39.2 -10.67524528503418
		 40 -8.6521224975585938 40.8 -7.7254781723022452 41.6 -7.5529274940490714 42.4 -7.4907574653625488
		 43.2 -7.1399340629577637 44 -6.4969191551208496 44.8 -5.7734293937683105 45.6 -5.1524820327758789
		 46.4 -4.6686992645263672 47.2 -4.2646584510803223 48 -3.8915922641754155 48.8 -3.5312924385070801
		 49.6 -3.1821670532226562 50.4 -2.8716459274291992 51.2 -2.6510405540466309 52 -2.5432872772216797
		 52.8 -2.5229897499084473;
createNode animCurveTA -n "RightArm_rotateZ";
	rename -uid "B40070EC-4023-F667-1D91-D69837E7030E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 11.008755673681339 0.8 -2.9539484977722168
		 1.6 -2.8213114738464355 2.4 -2.5487627983093262 3.2 -1.928154468536377 4 -0.83845442533493042
		 4.8 0.19156801700592041 5.6 0.60832893848419189 6.4 1.3719154596328735 7.2 4.5443110466003418
		 8 10.765471458435059 8.8 17.989721298217773 9.6 24.009969711303711 10.4 27.641460418701172
		 11.2 28.879798889160153 12 28.263402938842773 12.8 26.171453475952148 13.6 22.629884719848633
		 14.4 17.981801986694336 15.2 13.713990211486816 16 11.232799530029297 16.8 8.000457763671875
		 17.6 -3.2190442085266113 18.4 -16.606786727905273 19.2 -12.922411918640137 20 -15.353099822998047
		 20.8 -25.799276351928711 21.6 -34.749202728271484 22.4 -38.403915405273438 23.2 -42.098583221435547
		 24 -45.022861480712891 24.8 -44.625953674316406 25.6 -41.595771789550781 26.4 -38.238742828369141
		 27.2 -35.648979187011719 28 -33.209983825683594 28.8 -29.603319168090817 29.6 -23.826868057250977
		 30.4 -16.335372924804688 31.2 -9.7221307754516602 32 -6.5838608741760254 32.8 -6.287236213684082
		 33.6 -6.1310744285583496 34.4 -5.0139436721801758 35.2 -3.7017025947570796 36 -2.8581266403198242
		 36.8 -2.2027630805969238 37.6 -0.99674558639526367 38.4 1.1370279788970947 39.2 3.6304769515991211
		 40 5.2930388450622559 40.8 5.3741965293884277 41.6 4.1160426139831543 42.4 2.3606541156768799
		 43.2 0.8798905611038208 44 -0.035340514034032822 44.8 -0.56387436389923096 45.6 -1.0050539970397949
		 46.4 -1.4699268341064453 47.2 -1.9004100561141968 48 -2.2436411380767822 48.8 -2.4985501766204834
		 49.6 -2.6666204929351807 50.4 -2.7557718753814697 51.2 -2.8091411590576172 52 -2.8723545074462891
		 52.8 -2.9534108638763428;
createNode animCurveTA -n "RightForeArm_rotateX";
	rename -uid "B8A9BC71-482E-11D0-58C9-2AA70705E7F0";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.6738921536114959 0.8 7.8141560554504386
		 1.6 7.9059677124023438 2.4 7.9678740501403809 3.2 8.0574073791503906 4 8.3888664245605469
		 4.8 9.1035547256469727 5.6 10.023383140563965 6.4 10.852740287780762 7.2 11.49046802520752
		 8 11.981796264648438 8.8 12.336492538452148 9.6 12.488435745239258 10.4 12.33521842956543
		 11.2 11.753982543945312 12 10.714299201965332 12.8 9.5319185256958008 13.6 8.7497806549072266
		 14.4 8.423375129699707 15.2 7.9229001998901376 16 6.9769086837768555 16.8 7.0200176239013672
		 17.6 9.7544221878051758 18.4 12.40252685546875 19.2 11.565375328063965 20 10.290444374084473
		 20.8 10.558920860290527 21.6 11.222066879272461 22.4 11.493851661682129 23.2 11.380617141723633
		 24 11.09836483001709 24.8 10.907495498657227 25.6 10.894503593444824 26.4 10.959186553955078
		 27.2 11.021624565124512 28 11.07318115234375 28.8 11.102155685424805 29.6 11.05267333984375
		 30.4 10.83725643157959 31.2 10.403407096862793 32 9.8656396865844727 32.8 9.5179367065429688
		 33.6 9.50848388671875 34.4 9.6380290985107422 35.2 9.6507015228271484 36 9.4869279861450195
		 36.8 9.2173671722412109 37.6 8.9058399200439453 38.4 8.5811920166015625 39.2 8.2807159423828125
		 40 8.0569076538085938 40.8 7.9308562278747559 41.6 7.8664817810058594 42.4 7.8117976188659668
		 43.2 7.7519168853759757 44 7.7050585746765137 44.8 7.6829280853271493 45.6 7.6785197257995605
		 46.4 7.6819295883178711 47.2 7.6899528503417978 48 7.7023129463195801 48.8 7.7173280715942392
		 49.6 7.732231616973877 50.4 7.7440228462219238 51.2 7.7499308586120597 52 7.7482862472534171
		 52.8 7.7388644218444824;
createNode animCurveTA -n "RightForeArm_rotateY";
	rename -uid "F1D0880E-4B08-FFD2-39E0-5087A6ED096B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.056395486164677808 0.8 -0.16847530007362366
		 1.6 -0.093514785170555115 2.4 -0.042151607573032379 3.2 0.033353742212057114 4 0.32571017742156982
		 4.8 1.03351891040802 5.6 2.1414413452148438 6.4 3.4203228950500488 7.2 4.7141551971435547
		 8 6.0891904830932617 8.8 7.6677041053771964 9.6 9.48809814453125 10.4 11.542733192443848
		 11.2 13.772726058959961 12 15.912148475646973 12.8 17.507471084594727 13.6 18.315105438232422
		 14.4 18.610677719116211 15.2 19.024215698242188 16 19.694002151489258 16.8 19.666326522827148
		 17.6 17.247308731079102 18.4 11.061591148376465 19.2 4.8947486877441406 20 2.5176210403442383
		 20.8 2.9275846481323242 21.6 4.1235747337341309 22.4 4.7221508026123047 23.2 4.4626650810241699
		 24 3.8758742809295659 24.8 3.5181479454040527 25.6 3.4947459697723389 26.4 3.6123118400573735
		 27.2 3.7286884784698486 28 3.827006340026855 28.8 3.8832943439483643 29.6 3.7876694202423096
		 30.4 3.3930864334106445 31.2 2.6858932971954346 32 1.9322904348373411 32.8 1.5009701251983643
		 33.6 1.4897729158401489 34.4 1.6456030607223511 35.2 1.661141037940979 36 1.4643058776855469
		 36.8 1.1572995185852051 37.6 0.8261529803276062 38.4 0.50520414113998413 39.2 0.22802256047725677
		 40 0.032930698245763779 40.8 -0.072928868234157562 41.6 -0.12591959536075592 42.4 -0.17036782205104828
		 43.2 -0.2184327095746994 44 -0.25565570592880249 44.8 -0.27312016487121582 45.6 -0.27658599615097046
		 46.4 -0.27387106418609619 47.2 -0.26756852865219116 48 -0.25783702731132507 48.8 -0.24593840539455414
		 49.6 -0.23411652445793155 50.4 -0.22474776208400726 51.2 -0.22004875540733337 52 -0.22133515775203705
		 52.8 -0.22883927822113034;
createNode animCurveTA -n "RightForeArm_rotateZ";
	rename -uid "66832622-4464-E8DB-A8FE-5BAF6848B9C7";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 5.4470411762930295 0.8 4.3408565521240234
		 1.6 3.797837495803833 2.4 3.4294590950012207 3.2 2.8931183815002441 4 0.87029093503952026
		 4.8 -3.7283060550689702 5.6 -10.299565315246582 6.4 -17.241159439086914 7.2 -23.801769256591797
		 8 -30.442420959472656 8.8 -37.811267852783203 9.6 -46.1607666015625 10.4 -55.6339111328125
		 11.2 -66.313835144042969 12 -77.4212646484375 12.8 -86.729484558105469 13.6 -92.000724792480469
		 14.4 -94.064262390136719 15.2 -97.105384826660156 16 -102.53042602539062 16.8 -102.29096984863281
		 17.6 -85.125335693359375 18.4 -53.396846771240234 19.2 -24.69024658203125 20 -12.400707244873047
		 20.8 -14.631283760070799 21.6 -20.853069305419922 22.4 -23.841215133666992 23.2 -22.554458618164062
		 24 -19.594539642333984 24.8 -17.750974655151367 25.6 -17.629184722900391 26.4 -18.239360809326172
		 27.2 -18.839885711669922 28 -19.344497680664062 28.8 -19.632383346557617 29.6 -19.142953872680664
		 30.4 -17.098682403564453 31.2 -13.32331657409668 32 -9.1058111190795898 32.8 -6.579585075378418
		 33.6 -6.51275634765625 34.4 -7.4368882179260254 35.2 -7.5284199714660636 36 -6.3605465888977051
		 36.8 -4.4960427284240723 37.6 -2.4196267127990723 38.4 -0.33298498392105103 39.2 1.5370475053787231
		 40 2.8960204124450684 40.8 3.6499729156494145 41.6 4.0318517684936523 42.4 4.3546161651611328
		 43.2 4.706334114074707 44 4.9807238578796387 44.8 5.1098918914794922 45.6 5.1355280876159668
		 46.4 5.1155276298522949 47.2 5.0687780380249023 48 4.9968605041503906 48.8 4.9088940620422363
		 49.6 4.8216743469238281 50.4 4.7527985572814941 51.2 4.7182273864746094 52 4.7276806831359863
		 52.8 4.7829666137695312;
createNode animCurveTA -n "RightHand_rotateX";
	rename -uid "0C43918E-4A02-7A6C-13B3-ACAE2E17F34E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -7.4116101264953604 0.8 -7.2075858116149911
		 1.6 -7.1609897613525391 2.4 -7.3586554527282715 3.2 -7.8315143585205078 4 -8.5123376846313477
		 4.8 -9.4459257125854492 5.6 -11.062100410461426 6.4 -13.960507392883301 7.2 -18.17768669128418
		 8 -22.935995101928711 8.8 -27.480279922485352 9.6 -31.847652435302738 10.4 -36.360450744628906
		 11.2 -40.766368865966797 12 -44.460269927978516 12.8 -47.340377807617188 13.6 -49.628360748291016
		 14.4 -50.973587036132812 15.2 -50.751434326171875 16 -49.197280883789062 16.8 -48.378684997558594
		 17.6 -50.066646575927734 18.4 -52.042835235595703 19.2 -47.235736846923828 20 -31.400245666503906
		 20.8 -9.6316957473754883 21.6 7.242149829864502 22.4 11.972375869750977 23.2 10.756476402282715
		 24 11.214560508728027 24.8 12.903481483459473 25.6 12.531539916992188 26.4 9.6503629684448242
		 27.2 5.6551723480224609 28 1.5084259510040283 28.8 -2.3748533725738525 29.6 -5.1860146522521973
		 30.4 -7.1512050628662109 31.2 -10.638711929321289 32 -15.632272720336916 32.8 -18.612768173217773
		 33.6 -18.110422134399414 34.4 -15.234415054321287 35.2 -11.413189888000488 36 -7.1382761001586914
		 36.8 -2.4765574932098389 37.6 1.4592750072479248 38.4 3.0518155097961426 39.2 2.5461680889129639
		 40 2.1637241840362549 40.8 3.4914546012878418 41.6 5.8251438140869141 42.4 7.4225254058837882
		 43.2 7.5467500686645517 44 6.7491745948791504 44.8 5.7672119140625 45.6 4.8228235244750977
		 46.4 3.7846331596374512 47.2 2.5016109943389893 48 0.9891449809074403 48.8 -0.5629008412361145
		 49.6 -2.0045688152313232 50.4 -3.3849537372589111 51.2 -4.7985033988952637 52 -6.1915631294250488
		 52.8 -7.4116282463073739;
createNode animCurveTA -n "RightHand_rotateY";
	rename -uid "CC5A75F8-4CF4-1502-7FDE-E59C39EA7A34";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -14.281593322753906 0.8 -13.024921417236328
		 1.6 -11.568825721740723 2.4 -9.7962970733642578 3.2 -7.7267813682556143 4 -5.5762691497802734
		 4.8 -3.6582350730895996 5.6 -2.3166894912719727 6.4 -1.7920426130294798 7.2 -1.8003391027450562
		 8 -1.3725500106811523 8.8 0.34932124614715576 9.6 3.3672912120819092 10.4 7.1676740646362296
		 11.2 11.137931823730469 12 14.463217735290527 12.8 16.786428451538086 13.6 19.323537826538086
		 14.4 23.251152038574219 15.2 26.247879028320312 16 23.475095748901367 16.8 13.466578483581543
		 17.6 0.86793214082717896 18.4 -8.1455554962158203 19.2 -10.449930191040039 20 -4.0579328536987305
		 20.8 2.4260919094085693 21.6 -2.5514724254608154 22.4 -9.7767934799194336 23.2 -12.432015419006348
		 24 -14.659885406494141 24.8 -20.049606323242188 25.6 -26.887256622314453 26.4 -33.141712188720703
		 27.2 -39.088958740234375 28 -45.119132995605469 28.8 -50.68719482421875 29.6 -54.805229187011719
		 30.4 -56.585788726806641 31.2 -55.249427795410156 32 -49.923721313476562 32.8 -41.385452270507812
		 33.6 -32.735393524169922 34.4 -26.800544738769531 35.2 -24.493507385253906 36 -24.868633270263672
		 36.8 -25.918346405029297 37.6 -25.693120956420898 38.4 -23.477502822875977 39.2 -20.193275451660156
		 40 -17.449165344238281 40.8 -16.300592422485352 41.6 -16.870737075805664 42.4 -18.510797500610352
		 43.2 -20.142993927001953 44 -20.850912094116211 44.8 -20.554071426391602 45.6 -19.854579925537109
		 46.4 -19.207817077636719 47.2 -18.606464385986328 48 -17.911653518676758 48.8 -17.11729621887207
		 49.6 -16.304773330688477 50.4 -15.555722236633301 51.2 -14.944802284240723 52 -14.520054817199707
		 52.8 -14.281601905822754;
createNode animCurveTA -n "RightHand_rotateZ";
	rename -uid "052B38F4-4B57-887A-39FA-B4AA0DEC046A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.34561584834905118 0.8 6.427574634552002
		 1.6 6.1890735626220703 2.4 5.9361348152160645 3.2 5.6165575981140137 4 5.1202249526977539
		 4.8 4.2137742042541504 5.6 2.64402174949646 6.4 0.51347166299819946 7.2 -1.5514390468597412
		 8 -2.972348690032959 8.8 -3.7868428230285645 9.6 -4.2776322364807129 10.4 -4.3959846496582031
		 11.2 -3.8299825191497807 12 -2.5847570896148682 12.8 -1.3349709510803223 13.6 -0.83944058418273926
		 14.4 -0.95036089420318604 15.2 -0.48511889576911921 16 1.8411539793014526 16.8 6.63629150390625
		 17.6 12.587446212768555 18.4 13.457117080688477 19.2 3.7761535644531254 20 -7.485999584197998
		 20.8 -5.8137178421020508 21.6 1.5564906597137451 22.4 6.0068936347961426 23.2 9.9713973999023438
		 24 14.384785652160643 24.8 18.363796234130859 25.6 20.219419479370117 26.4 19.454902648925781
		 27.2 16.692770004272461 28 12.930193901062012 28.8 9.0931472778320312 29.6 6.0264887809753418
		 30.4 5.3995933532714844 31.2 9.2897920608520508 32 15.797909736633301 32.8 19.954977035522461
		 33.6 20.627483367919922 34.4 19.866670608520508 35.2 18.969161987304688 36 17.796165466308594
		 36.8 15.999770164489746 37.6 13.87867546081543 38.4 12.058884620666504 39.2 10.606015205383301
		 40 9.2471704483032227 40.8 7.8044810295104989 41.6 6.1852960586547852 42.4 4.7418022155761719
		 43.2 4.127927303314209 44 4.3662028312683105 44.8 4.8185429573059082 45.6 5.067070484161377
		 46.4 5.1881837844848633 47.2 5.3700394630432129 48 5.6469473838806152 48.8 5.9527931213378906
		 49.6 6.2375407218933105 50.4 6.4725375175476074 51.2 6.6248569488525391 52 6.6857523918151855
		 52.8 6.6844272613525391;
createNode animCurveTA -n "RightHandThumb1_rotateX";
	rename -uid "687FB862-4849-A033-AE7A-77B51E98E6E0";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.43697499921541838 0.8 -15.30646324157715
		 1.6 -14.196782112121582 2.4 -12.509357452392578 3.2 -10.375176429748535 4 -7.9252734184265137
		 4.8 -5.2915205955505371 5.6 -2.6072278022766113 6.4 -0.0076549048535525807 7.2 2.3694288730621338
		 8 4.3839521408081055 8.8 5.8938441276550293 9.6 6.7562623023986816 10.4 6.9206733703613281
		 11.2 6.9206752777099609 12 6.9206657409667969 12.8 6.9206676483154297 13.6 6.9206728935241699
		 14.4 6.9206662178039551 15.2 6.9206762313842773 16 6.920654296875 16.8 6.9206700325012207
		 17.6 5.0231847763061523 18.4 -0.46899199485778809 19.2 -7.6105070114135742 20 -14.116238594055176
		 20.8 -17.55461311340332 21.6 -17.836042404174805 22.4 -17.136110305786133 23.2 -11.874866485595703
		 24 -7.0077705383300781 24.8 -6.4849681854248047 25.6 -6.4849486351013184 26.4 -6.4849720001220703
		 27.2 -6.4849605560302734 28 -6.4849581718444824 28.8 -6.4849739074707031 29.6 -6.4849553108215332
		 30.4 -6.5356850624084473 31.2 -7.1526732444763184 32 -8.4321737289428711 32.8 -10.107316970825195
		 33.6 -11.917028427124023 34.4 -13.607004165649414 35.2 -14.927042007446289 36 -15.627720832824707
		 36.8 -15.706869125366211 37.6 -15.706892013549805 38.4 -15.706887245178223 39.2 -15.706869125366211
		 40 -15.70687198638916 40.8 -15.706874847412109 41.6 -15.706871032714846 42.4 -15.706875801086424
		 43.2 -15.706891059875487 44 -15.706866264343262 44.8 -15.706847190856935 45.6 -15.706890106201172
		 46.4 -15.706892967224121 47.2 -15.706869125366211 48 -15.706879615783693 48.8 -15.706884384155273
		 49.6 -15.706874847412109 50.4 -15.706887245178223 51.2 -15.706870079040526 52 -15.706887245178223
		 52.8 -15.706878662109373;
createNode animCurveTA -n "RightHandThumb1_rotateY";
	rename -uid "743E655D-4050-DEA0-05EB-AAB664C1EE1C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 14.863703847135994 0.8 -3.304553747177124
		 1.6 -3.6367475986480717 2.4 -4.1451859474182129 3.2 -4.7932033538818359 4 -5.5425796508789062
		 4.8 -6.3528680801391602 5.6 -7.181586742401123 6.4 -7.9847517013549805 7.2 -8.7180070877075195
		 8 -9.3372154235839844 8.8 -9.7993898391723633 9.6 -10.062421798706055 10.4 -10.112446784973145
		 11.2 -10.112457275390625 12 -10.112438201904297 12.8 -10.112462997436523 13.6 -10.112468719482422
		 14.4 -10.112464904785156 15.2 -10.112456321716309 16 -10.112449645996094 16.8 -10.11244010925293
		 17.6 -10.550774574279785 18.4 -11.841937065124512 19.2 -13.499415397644043 20 -14.903470039367676
		 20.8 -15.577935218811033 21.6 -15.63067054748535 22.4 -15.295266151428223 23.2 -12.639519691467285
		 24 -10.019900321960449 24.8 -9.7315263748168945 25.6 -9.7315139770507812 26.4 -9.7315187454223633
		 27.2 -9.7315120697021484 28 -9.7315139770507812 28.8 -9.7315235137939453 29.6 -9.7315053939819336
		 30.4 -9.6957769393920898 31.2 -9.2604837417602539 32 -8.3542385101318359 32.8 -7.1630277633666992
		 33.6 -5.873842716217041 34.4 -4.6715273857116699 35.2 -3.7357952594757085 36 -3.2409055233001709
		 36.8 -3.1851415634155273 37.6 -3.1851460933685303 38.4 -3.1851470470428467 39.2 -3.1851274967193604
		 40 -3.1851503849029541 40.8 -3.1851379871368408 41.6 -3.1851468086242676 42.4 -3.1851420402526855
		 43.2 -3.1851410865783691 44 -3.185138463973999 44.8 -3.1851339340209961 45.6 -3.1851456165313721
		 46.4 -3.1851487159729004 47.2 -3.1851341724395752 48 -3.185147762298584 48.8 -3.1851382255554199
		 49.6 -3.1851527690887451 50.4 -3.1851427555084229 51.2 -3.1851410865783691 52 -3.1851317882537842
		 52.8 -3.1851410865783691;
createNode animCurveTA -n "RightHandThumb1_rotateZ";
	rename -uid "5C9F3985-493F-EF48-DEE4-759F030CCA66";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 12.66002094843312 0.8 0.43540239334106445
		 1.6 -0.097324810922145844 2.4 -0.91504311561584473 3.2 -1.96265172958374 4 -3.1841661930084229
		 4.8 -4.5203828811645508 5.6 -5.9072332382202148 6.4 -7.274677276611329 7.2 -8.5462751388549805
		 8 -9.6397953033447266 8.8 -10.468962669372559 9.6 -10.946242332458496 10.4 -11.037514686584473
		 11.2 -11.037513732910156 12 -11.037525177001953 12.8 -11.037522315979004 13.6 -11.037513732910156
		 14.4 -11.037504196166992 15.2 -11.037516593933105 16 -11.037522315979004 16.8 -11.037514686584473
		 17.6 -10.756976127624512 18.4 -9.715118408203125 19.2 -7.8604478836059579 20 -5.7014412879943848
		 20.8 -4.3919706344604492 21.6 -4.279658317565918 22.4 -4.4295868873596191 23.2 -5.2776436805725098
		 24 -5.6177811622619629 24.8 -5.626683235168457 25.6 -5.6266942024230957 26.4 -5.6266837120056152
		 27.2 -5.6266865730285645 28 -5.6266989707946777 28.8 -5.6266851425170898 29.6 -5.6266980171203613
		 30.4 -5.588961124420166 31.2 -5.1328415870666504 32 -4.2036786079406738 32.8 -3.0222446918487549
		 33.6 -1.7916773557662966 34.4 -0.68647438287734985 35.2 0.14684230089187622 36 0.57838040590286255
		 36.8 0.62666416168212891 37.6 0.62665998935699463 38.4 0.62666910886764526 39.2 0.62665295600891113
		 40 0.62666183710098267 40.8 0.62666153907775879 41.6 0.62667387723922729 42.4 0.62666529417037964
		 43.2 0.62666451930999756 44 0.62665271759033203 44.8 0.62664890289306641 45.6 0.6266779899597168
		 46.4 0.6266636848449707 47.2 0.62666505575180054 48 0.62666022777557373 48.8 0.62666702270507812
		 49.6 0.62666982412338257 50.4 0.62667137384414673 51.2 0.62665939331054688 52 0.62666052579879761
		 52.8 0.62665772438049316;
createNode animCurveTA -n "RightHandThumb2_rotateX";
	rename -uid "F4A73CCD-4074-C3DE-08F9-5A96112F5347";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.46085167025426976 0.8 8.8980979919433594
		 1.6 9.5286054611206055 2.4 10.535444259643555 3.2 11.80788516998291 4 13.242372512817383
		 4.8 14.77554416656494 5.6 16.347824096679688 6.4 17.863243103027344 7.2 19.2152099609375
		 8 20.329244613647461 8.8 21.157686233520508 9.6 21.646947860717773 10.4 21.768104553222656
		 11.2 21.800582885742188 12 21.818939208984375 12.8 21.825908660888672 13.6 21.825395584106445
		 14.4 21.803543090820312 15.2 21.755149841308594 16 21.699926376342773 16.8 21.660804748535156
		 17.6 20.309017181396484 18.4 16.463008880615234 19.2 11.575276374816895 20 7.2444553375244141
		 20.8 5.007561206817627 21.6 4.8313450813293457 22.4 4.8315029144287109 23.2 4.8421735763549805
		 24 4.8614115715026855 24.8 4.8554306030273438 25.6 4.8480405807495117 26.4 4.8462386131286621
		 27.2 4.8446836471557617 28 4.835054874420166 28.8 4.822624683380127 29.6 4.8208112716674805
		 30.4 4.8374080657958984 31.2 5.045586109161377 32 5.5063748359680176 32.8 6.1601018905639648
		 33.6 6.9018816947937012 34.4 7.6040358543395996 35.2 8.1590967178344727 36 8.4584894180297852
		 36.8 8.4808359146118164 37.6 8.450221061706543 38.4 8.4287748336791992 39.2 8.4373626708984375
		 40 8.4719057083129883 40.8 8.5096893310546875 41.6 8.5287370681762695 42.4 8.5274639129638672
		 43.2 8.5224819183349609 44 8.5255260467529297 44.8 8.5347776412963867 45.6 8.5508871078491211
		 46.4 8.5777368545532227 47.2 8.6090021133422852 48 8.6356267929077148 48.8 8.6564092636108398
		 49.6 8.6734580993652344 50.4 8.6880884170532227 51.2 8.7011842727661133 52 8.7122421264648438
		 52.8 8.7221994400024414;
createNode animCurveTA -n "RightHandThumb2_rotateY";
	rename -uid "3B1A8DBF-415E-A08E-BE75-1090B31E064A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -5.6497986043482396 0.8 2.265453577041626
		 1.6 2.346611499786377 2.4 2.4876289367675781 3.2 2.6649208068847656 4 2.857813835144043
		 4.8 3.0649480819702148 5.6 3.2846939563751221 6.4 3.4909873008728027 7.2 3.6568796634674068
		 8 3.7802467346191406 8.8 3.8736274242401119 9.6 3.9379010200500488 10.4 3.9629015922546382
		 11.2 3.9795951843261719 12 3.9899990558624268 12.8 3.9962320327758789 13.6 3.9985649585723881
		 14.4 3.987006664276123 15.2 3.9603755474090576 16 3.9595351219177251 16.8 3.9621067047119136
		 17.6 3.7929792404174805 18.4 3.4861142635345459 19.2 3.106147289276123 20 2.7670388221740723
		 20.8 2.5884768962860107 21.6 2.5759625434875488 22.4 2.6379358768463135 23.2 3.1120269298553467
		 24 3.5591855049133301 24.8 3.6057062149047847 25.6 3.6040756702423091 26.4 3.603643655776978
		 27.2 3.6032896041870113 28 3.6011357307434082 28.8 3.5983767509460454 29.6 3.5979411602020264
		 30.4 3.5895719528198242 31.2 3.48858642578125 32 3.2825367450714111 32.8 3.0206565856933594
		 33.6 2.7436132431030273 34.4 2.4848885536193848 35.2 2.2833752632141113 36 2.1777205467224121
		 36.8 2.1610939502716064 37.6 2.1485960483551025 38.4 2.1398110389709473 39.2 2.1433026790618896
		 40 2.1573879718780518 40.8 2.172654390335083 41.6 2.1802775859832764 42.4 2.1797292232513428
		 43.2 2.1776981353759766 44 2.1789119243621826 44.8 2.1826052665710449 45.6 2.1890134811401367
		 46.4 2.199662446975708 47.2 2.2119932174682617 48 2.2224283218383789 48.8 2.2305116653442383
		 49.6 2.2371137142181396 50.4 2.2427377700805664 51.2 2.2477662563323975 52 2.2519783973693848
		 52.8 2.2557904720306396;
createNode animCurveTA -n "RightHandThumb2_rotateZ";
	rename -uid "2C5BF4DE-4C29-2C3F-4540-BE8534954778";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -1.1124781058882984 0.8 30.041206359863281
		 1.6 29.696142196655277 2.4 29.287429809570312 3.2 28.772850036621094 4 28.126626968383789
		 4.8 27.420812606811523 5.6 26.737936019897461 6.4 26.071353912353516 7.2 25.388982772827148
		 8 24.740610122680664 8.8 24.245241165161133 9.6 24.006019592285156 10.4 24.029911041259766
		 11.2 24.111444473266602 12 24.157854080200195 12.8 24.176328659057617 13.6 24.175987243652344
		 14.4 24.121057510375977 15.2 23.999095916748047 16 23.873926162719727 16.8 23.786598205566406
		 17.6 24.535818099975586 18.4 26.820537567138672 19.2 29.764675140380859 20 32.427574157714844
		 20.8 33.838871002197266 21.6 33.966587066650391 22.4 34.293857574462891 23.2 36.802753448486328
		 24 39.175983428955078 24.8 39.413673400878906 25.6 39.396568298339844 26.4 39.392238616943359
		 27.2 39.388504028320312 28 39.366249084472656 28.8 39.337471008300781 29.6 39.333160400390625
		 30.4 39.275066375732422 31.2 38.582786560058594 32 37.195014953613281 32.8 35.45843505859375
		 33.6 33.622486114501953 34.4 31.893709182739258 35.2 30.53669548034668 36 29.820327758789062
		 36.8 29.711318969726559 37.6 29.637464523315433 38.4 29.585586547851562 39.2 29.606100082397461
		 40 29.689052581787109 40.8 29.7797737121582 41.6 29.825279235839847 42.4 29.822057723999027
		 43.2 29.80986213684082 44 29.817024230957031 44.8 29.839075088500977 45.6 29.877595901489254
		 46.4 29.94196701049805 47.2 30.016969680786136 48 30.080707550048832 48.8 30.130510330200195
		 49.6 30.171239852905273 50.4 30.206159591674805 51.2 30.23750114440918 52 30.263887405395504
		 52.8 30.287656784057617;
createNode animCurveTA -n "RightHandThumb3_rotateX";
	rename -uid "924795E6-48B3-0D3F-293A-87AF01E3151A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.06445232072678371 0.8 -15.964942932128906
		 1.6 -16.20124626159668 2.4 -16.542930603027344 3.2 -16.90608024597168 4 -17.211172103881836
		 4.8 -17.412092208862305 5.6 -17.499061584472656 6.4 -17.481559753417969 7.2 -17.38001823425293
		 8 -17.227285385131836 8.8 -17.057851791381836 9.6 -16.909605026245117 10.4 -16.835742950439453
		 11.2 -16.809833526611328 12 -16.804964065551758 12.8 -16.800010681152344 13.6 -16.799238204956055
		 14.4 -16.826349258422852 15.2 -16.882186889648438 16 -16.949825286865234 16.8 -17.000673294067383
		 17.6 -17.303005218505859 18.4 -18.109683990478516 19.2 -19.063722610473633 20 -19.845390319824219
		 20.8 -20.219854354858398 21.6 -20.245674133300781 22.4 -20.055564880371094 23.2 -18.365024566650391
		 24 -16.547021865844727 24.8 -16.332021713256836 25.6 -16.332244873046875 26.4 -16.339199066162109
		 27.2 -16.341054916381836 28 -16.342674255371094 28.8 -16.350479125976562 29.6 -16.352989196777344
		 30.4 -16.35504150390625 31.2 -16.390270233154297 32 -16.422374725341797 32.8 -16.383415222167969
		 33.6 -16.262367248535156 34.4 -16.092250823974609 35.2 -15.92841911315918 36 -15.841041564941404
		 36.8 -15.845921516418459 37.6 -15.849172592163086 38.4 -15.838944435119631 39.2 -15.828811645507812
		 40 -15.823453903198242 40.8 -15.821515083312988 41.6 -15.825489044189455 42.4 -15.834173202514648
		 43.2 -15.841830253601074 44 -15.848315238952638 44.8 -15.855841636657717 45.6 -15.862611770629881
		 46.4 -15.871453285217283 47.2 -15.885085105895996 48 -15.893419265747069 48.8 -15.887777328491211
		 49.6 -15.877950668334961 50.4 -15.877174377441406 51.2 -15.883376121520996 52 -15.888524055480957
		 52.8 -15.891114234924315;
createNode animCurveTA -n "RightHandThumb3_rotateY";
	rename -uid "4D69E550-4BA5-1C94-1537-458E6485033F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.90702823882431971 0.8 -22.134479522705078
		 1.6 -21.795980453491211 2.4 -21.21980094909668 3.2 -20.432233810424805 4 -19.459802627563477
		 4.8 -18.335275650024414 5.6 -17.119850158691406 6.4 -15.900876998901367 7.2 -14.771431922912598
		 8 -13.807984352111816 8.8 -13.055769920349121 9.6 -12.581684112548828 10.4 -12.458580017089844
		 11.2 -12.416425704956055 12 -12.40030574798584 12.8 -12.393481254577637 13.6 -12.394989967346191
		 14.4 -12.429944038391113 15.2 -12.490582466125488 16 -12.522251129150391 16.8 -12.543713569641113
		 17.6 -12.7930908203125 18.4 -13.530587196350098 19.2 -14.529602050781252 20 -15.471378326416016
		 20.8 -15.974432945251463 21.6 -16.010421752929688 22.4 -16.260629653930664 23.2 -18.010807037353516
		 24 -19.534832000732422 24.8 -19.693113327026367 25.6 -19.700132369995117 26.4 -19.710676193237305
		 27.2 -19.714506149291992 28 -19.72538948059082 28.8 -19.746677398681641 29.6 -19.751495361328125
		 30.4 -19.772148132324219 31.2 -20.034980773925781 32 -20.529342651367188 32.8 -21.068220138549805
		 33.6 -21.55323600769043 34.4 -21.955892562866211 35.2 -22.246644973754883 36 -22.414451599121094
		 36.8 -22.490316390991211 37.6 -22.548669815063477 38.4 -22.558355331420898 39.2 -22.51898193359375
		 40 -22.449056625366211 40.8 -22.38227653503418 41.6 -22.360984802246094 42.4 -22.384740829467773
		 43.2 -22.411935806274414 44 -22.423149108886719 44.8 -22.426700592041016 45.6 -22.417303085327148
		 46.4 -22.395427703857422 47.2 -22.378276824951172 48 -22.355798721313477 48.8 -22.307966232299805
		 49.6 -22.255882263183594 50.4 -22.230182647705078 51.2 -22.224357604980469 52 -22.219142913818359
		 52.8 -22.209497451782227;
createNode animCurveTA -n "RightHandThumb3_rotateZ";
	rename -uid "114BE117-4A80-9F91-6AB1-0AA5B2487155";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -4.0647072431541549 0.8 -15.449295043945312
		 1.6 -13.666375160217285 2.4 -10.993061065673828 3.2 -7.6646933555603036 4 -3.9074416160583492
		 4.8 0.050831891596317291 5.6 3.9862837791442867 6.4 7.7001261711120605 7.2 11.020893096923828
		 8 13.786961555480957 8.8 15.836501121520996 9.6 17.00865364074707 10.4 17.249975204467773
		 11.2 17.253549575805664 12 17.2506103515625 12.8 17.251399993896484 13.6 17.252281188964844
		 14.4 17.244838714599609 15.2 17.227441787719727 16 17.194620132446289 16.8 17.168951034545898
		 17.6 16.700567245483398 18.4 15.369674682617189 19.2 13.693191528320312 20 12.217083930969238
		 20.8 11.459402084350586 21.6 11.399181365966797 22.4 10.724308967590332 23.2 5.5656976699829102
		 24 0.59016913175582886 24.8 0.048407822847366333 25.6 0.049023326486349106 26.4 0.044966895133256912
		 27.2 0.044054333120584488 28 0.044013570994138718 28.8 0.040391761809587479 29.6 0.039131816476583481
		 30.4 -0.044535990804433823 31.2 -1.0791498422622681 32 -3.2468852996826172 32.8 -6.1225309371948242
		 33.6 -9.280491828918457 34.4 -12.283426284790039 35.2 -14.668845176696779 36 -15.960607528686523
		 36.8 -16.130094528198242 37.6 -16.145097732543945 38.4 -16.140241622924805 39.2 -16.124532699584961
		 40 -16.105257034301758 40.8 -16.088972091674805 41.6 -16.086750030517578 42.4 -16.097747802734375
		 43.2 -16.108749389648438 44 -16.115488052368164 44.8 -16.121162414550781 45.6 -16.123561859130859
		 46.4 -16.124565124511719 47.2 -16.129833221435547 48 -16.130498886108398 48.8 -16.116161346435547
		 49.6 -16.098043441772461 50.4 -16.09181022644043 51.2 -16.094692230224609 52 -16.096969604492188
		 52.8 -16.096574783325195;
createNode animCurveTA -n "RightHandIndex1_rotateX";
	rename -uid "64C2A185-4B46-E4DF-AD27-76870100F548";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.12950286206252518 0.8 -4.4297990798950195
		 1.6 -3.9474208354949947 2.4 -3.080317497253418 3.2 -1.9000682830810549 4 -0.53539824485778809
		 4.8 0.91309136152267456 5.6 2.3556678295135498 6.4 3.6742179393768315 7.2 4.7964849472045898
		 8 5.7391963005065918 8.8 6.5131721496582031 9.6 7.0406699180603027 10.4 7.2267060279846191
		 11.2 7.2739071846008292 12 7.2422628402709961 12.8 7.1801514625549316 13.6 7.144249439239502
		 14.4 7.1238188743591309 15.2 7.0888471603393555 16 7.0456929206848145 16.8 7.0015263557434082
		 17.6 4.4243402481079102 18.4 -2.863703727722168 19.2 -12.156101226806641 20 -20.483516693115234
		 20.8 -24.859827041625977 21.6 -25.239816665649414 22.4 -23.487604141235352 23.2 -10.107722282409668
		 24 2.5829217433929443 24.8 3.926547527313232 25.6 3.888646125793457 26.4 3.8908100128173828
		 27.2 3.916204452514648 28 3.8990128040313725 28.8 3.8153500556945801 29.6 3.729796171188354
		 30.4 3.658617496490479 31.2 3.0946700572967529 32 1.8956058025360105 32.8 0.30842486023902893
		 33.6 -1.4076079130172729 34.4 -3.021136999130249 35.2 -4.3019366264343262 36 -4.9996590614318848
		 36.8 -5.0921130180358887 37.6 -5.0870919227600098 38.4 -5.0654115676879883 39.2 -5.0487856864929199
		 40 -5.0409407615661621 40.8 -5.0388236045837402 41.6 -5.0508842468261719 42.4 -5.0662374496459961
		 43.2 -5.0633358955383301 44 -5.0617523193359375 44.8 -5.0733294486999512 45.6 -5.0442728996276855
		 46.4 -4.9588623046875 47.2 -4.8946924209594727 48 -4.8834657669067383 48.8 -4.8542943000793457
		 49.6 -4.7611503601074219 50.4 -4.6434521675109863 51.2 -4.5585851669311523 52 -4.5289101600646973
		 52.8 -4.5366911888122559;
createNode animCurveTA -n "RightHandIndex1_rotateY";
	rename -uid "B09D95D7-4E3D-3591-CC38-118E68DC3C3B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 4.2714786483174825 0.8 0.65623265504837036
		 1.6 0.61231005191802979 2.4 0.55640876293182373 3.2 0.49929812550544739 4 0.44726672768592834
		 4.8 0.40555477142333984 5.6 0.37731426954269409 6.4 0.36075884103775024 7.2 0.35326585173606873
		 8 0.35516154766082764 8.8 0.36553877592086792 9.6 0.37923941016197205 10.4 0.38952505588531494
		 11.2 0.39597216248512268 12 0.39572128653526306 12.8 0.39110574126243591 13.6 0.38813066482543945
		 14.4 0.38695597648620605 15.2 0.38431382179260254 16 0.38005417585372925 16.8 0.37510716915130615
		 17.6 0.24099473655223849 18.4 -0.16529975831508636 19.2 -0.74299740791320801 20 -1.3074488639831543
		 20.8 -1.6190595626831055 21.6 -1.6508469581604004 22.4 -1.5824196338653564 23.2 -1.2546688318252563
		 24 -1.2380449771881104 24.8 -1.2543966770172119 25.6 -1.2564100027084351 26.4 -1.2557052373886108
		 27.2 -1.2548116445541382 28 -1.2586002349853516 28.8 -1.2669970989227295 29.6 -1.2739557027816772
		 30.4 -1.2671699523925781 31.2 -1.1587283611297607 32 -0.9245503544807433 32.8 -0.59772276878356934
		 33.6 -0.22064043581485748 34.4 0.1511516273021698 35.2 0.4540536105632782 36 0.6196475625038147
		 36.8 0.63889741897583008 37.6 0.63968592882156372 38.4 0.64043903350830078 39.2 0.64052480459213257
		 40 0.64027929306030273 40.8 0.64037948846817017 41.6 0.64027166366577148 42.4 0.63947176933288574
		 43.2 0.63840621709823608 44 0.63710528612136841 44.8 0.63617235422134399 45.6 0.63855969905853271
		 46.4 0.64467668533325195 47.2 0.65014743804931641 48 0.65257370471954346 48.8 0.65498477220535278
		 49.6 0.66000574827194214 50.4 0.66587132215499878 51.2 0.66968697309494019 52 0.67162406444549561
		 52.8 0.67483615875244141;
createNode animCurveTA -n "RightHandIndex1_rotateZ";
	rename -uid "5E1EA293-4B10-463A-C0B4-02A192F42E1D";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 8.7474357038059871 0.8 3.8763105869293213
		 1.6 3.7577188014984131 2.4 3.5853381156921387 3.2 3.3743453025817871 4 3.1305043697357178
		 4.8 2.8620510101318359 5.6 2.5839571952819824 6.4 2.3151082992553711 7.2 2.0737209320068359
		 8 1.8673191070556638 8.8 1.6998920440673828 9.6 1.5957998037338257 10.4 1.5838786363601685
		 11.2 1.6099679470062256 12 1.6297059059143066 12.8 1.6305296421051025 13.6 1.6282356977462769
		 14.4 1.6317232847213745 15.2 1.6316248178482056 16 1.6224870681762695 16.8 1.6082384586334229
		 17.6 1.4431711435317993 18.4 1.037861704826355 19.2 0.61185050010681152 20 0.31506749987602234
		 20.8 0.18699295818805695 21.6 0.1686786562204361 22.4 0.28570017218589783 23.2 1.2403486967086792
		 24 2.0827991962432861 24.8 2.1667637825012207 25.6 2.1724300384521484 26.4 2.1773581504821777
		 27.2 2.1692535877227783 28 2.145672082901001 28.8 2.1230416297912598 29.6 2.1145422458648682
		 30.4 2.122478723526001 31.2 2.2447943687438965 32 2.5032434463500977 32.8 2.8372843265533447
		 33.6 3.1723570823669434 34.4 3.4486384391784668 35.2 3.6438028812408447 36 3.7481129169464111
		 36.8 3.7673754692077637 37.6 3.7726283073425293 38.4 3.7720291614532471 39.2 3.7672150135040283
		 40 3.7623682022094722 40.8 3.7625725269317627 41.6 3.7660226821899414 42.4 3.7639279365539555
		 43.2 3.7532627582550053 44 3.7408947944641113 44.8 3.7365920543670654 45.6 3.7482278347015385
		 46.4 3.774808406829834 47.2 3.803419828414917 48 3.8224487304687496 48.8 3.8351426124572754
		 49.6 3.8506453037261963 50.4 3.8657784461975093 51.2 3.8728439807891846 52 3.8817183971405029
		 52.8 3.9171550273895264;
createNode animCurveTA -n "RightHandIndex2_rotateX";
	rename -uid "D87BC963-4127-BE4A-75B7-A3BAC6E638F8";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 23.318906784057617 0.8 23.627519607543945
		 1.6 24.954597473144531 2.4 27.273515701293945 3.2 30.36272048950195 4 33.869140625
		 4.8 37.600028991699219 5.6 41.477672576904297 6.4 45.243637084960938 7.2 48.532958984375
		 8 51.199451446533203 8.8 53.304046630859375 9.6 54.721973419189453 10.4 55.123805999755859
		 11.2 55.072525024414062 12 54.987045288085938 12.8 55.052520751953125 13.6 55.151371002197266
		 14.4 55.177253723144531 15.2 55.194007873535156 16 55.197349548339844 16.8 55.131156921386719
		 17.6 50.727901458740234 18.4 38.286308288574219 19.2 22.376565933227539 20 8.1222925186157227
		 20.8 0.70089632272720337 21.6 0.11867634952068329 22.4 2.2864792346954346 23.2 19.150257110595703
		 24 35.222984313964844 24.8 37.130786895751953 25.6 37.395061492919922 26.4 37.545330047607422
		 27.2 37.481227874755859 28 37.317054748535156 28.8 37.267494201660156 29.6 37.404617309570312
		 30.4 37.4813232421875 31.2 36.525775909423828 32 34.424022674560547 32.8 31.788553237915036
		 33.6 29.118917465209964 34.4 26.660888671875 35.2 24.604574203491211 36 23.342229843139648
		 36.8 23.060825347900391 37.6 23.004535675048828 38.4 22.962053298950195 39.2 22.946077346801758
		 40 23.104642868041992 40.8 23.359050750732422 41.6 23.393878936767578 42.4 23.143447875976562
		 43.2 22.942771911621094 44 23.032449722290039 44.8 23.228891372680664 45.6 23.249002456665039
		 46.4 23.106601715087891 47.2 23.030475616455078 48 23.113473892211914 48.8 23.241838455200195
		 49.6 23.347995758056641 50.4 23.460752487182617 51.2 23.524723052978516 52 23.456485748291016
		 52.8 23.318902969360352;
createNode animCurveTA -n "RightHandIndex2_rotateY";
	rename -uid "A032F820-4081-BC06-5C19-49B869017978";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.34832286834716797 0.8 -0.35722324252128601
		 1.6 -0.39673459529876709 2.4 -0.47038674354553228 3.2 -0.57757562398910522 4 -0.71136820316314697
		 4.8 -0.86740577220916748 5.6 -1.0437960624694824 6.4 -1.2282357215881348 7.2 -1.3992811441421509
		 8 -1.5443469285964966 8.8 -1.6626720428466797 9.6 -1.7442104816436768 10.4 -1.7675745487213135
		 11.2 -1.7645926475524902 12 -1.7596144676208496 12.8 -1.7634232044219971 13.6 -1.7691961526870728
		 14.4 -1.7706817388534546 15.2 -1.7716766595840454 16 -1.7718738317489624 16.8 -1.7680068016052246
		 17.6 -1.5183167457580566 18.4 -0.89757305383682251 19.2 -0.32181373238563538 20 -0.046594869345426559
		 20.8 6.7668690462596714e-05 21.6 0.00087160541443154216 22.4 -0.0042455811053514481
		 23.2 -0.23869656026363376 24 -0.7663884162902832 24.8 -0.84702718257904053 25.6 -0.8584601879119873
		 26.4 -0.86500906944274902 27.2 -0.86222672462463379 28 -0.85510295629501343 28.8 -0.85293382406234741
		 29.6 -0.85889679193496704 30.4 -0.86224335432052612 31.2 -0.82107353210449219 32 -0.73369669914245605
		 32.8 -0.63044631481170654 33.6 -0.53318274021148682 34.4 -0.45035463571548462 35.2 -0.38611790537834167
		 36 -0.34899032115936279 36.8 -0.34096723794937134 37.6 -0.33937039971351624 38.4 -0.33817699551582336
		 39.2 -0.33771809935569763 40 -0.34220898151397705 40.8 -0.34949415922164917 41.6 -0.3504718542098999
		 42.4 -0.34333476424217224 43.2 -0.33763027191162109 44 -0.34018057584762573 44.8 -0.34576889872550964
		 45.6 -0.34634408354759216 46.4 -0.34226283431053162 47.2 -0.34010055661201477 48 -0.3424699604511261
		 48.8 -0.34613749384880066 49.6 -0.34916964173316956 50.4 -0.35241693258285522 51.2 -0.35425916314125061
		 52 -0.35228803753852844 52.8 -0.3483453094959259;
createNode animCurveTA -n "RightHandIndex2_rotateZ";
	rename -uid "D3F61E04-4B18-23E4-1E78-DB811805386A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.99268698144643608 0.8 1.7244415283203125
		 1.6 1.8090661764144897 2.4 1.9546746015548708 3.2 2.1438281536102295 4 2.3511888980865479
		 4.8 2.562420129776001 5.6 2.770747184753418 6.4 2.961245059967041 7.2 3.1174240112304688
		 8 3.2366750240325928 8.8 3.3259730339050293 9.6 3.3836483955383301 10.4 3.3996222019195557
		 11.2 3.3975868225097656 12 3.39420485496521 12.8 3.396817684173584 13.6 3.4007134437561035
		 14.4 3.4017333984375 15.2 3.4024069309234619 16 3.4025201797485352 16.8 3.3999149799346924
		 17.6 3.2160689830780029 18.4 2.6001427173614502 19.2 1.643845796585083 20 0.68216979503631592
		 20.8 0.16254717111587524 21.6 0.12162333726882933 22.4 0.27399873733520508 23.2 1.432620644569397
		 24 2.4289999008178711 24.8 2.5364165306091309 25.6 2.5510852336883545 26.4 2.5593898296356201
		 27.2 2.5558559894561768 28 2.5467593669891357 28.8 2.544013500213623 29.6 2.5516066551208496
		 30.4 2.5558598041534424 31.2 2.5026421546936035 32 2.3832235336303711 32.8 2.2291204929351807
		 33.6 2.0683724880218506 34.4 1.9165014028549194 35.2 1.7868218421936035 36 1.7061102390289307
		 36.8 1.688010573387146 37.6 1.6843981742858887 38.4 1.6816494464874268 39.2 1.6806304454803467
		 40 1.690831184387207 40.8 1.7072035074234009 41.6 1.7094390392303467 42.4 1.6933403015136719
		 43.2 1.6804094314575195 44 1.6861910820007324 44.8 1.6988422870635986 45.6 1.700133204460144
		 46.4 1.6909632682800293 47.2 1.686063289642334 48 1.6914130449295044 48.8 1.6996655464172363
		 49.6 1.7064887285232544 50.4 1.713740348815918 51.2 1.71784508228302 52 1.7134566307067871
		 52.8 1.7046152353286743;
createNode animCurveTA -n "RightHandIndex3_rotateX";
	rename -uid "BDA7E22B-469B-BED8-15F2-3EB5ADE21106";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 17.885038375854492 0.8 18.328874588012695
		 1.6 19.545673370361328 2.4 21.394697189331055 3.2 23.731634140014648 4 26.405801773071289
		 4.8 29.265233993530277 5.6 32.162952423095703 6.4 34.956462860107422 7.2 37.502826690673828
		 8 39.652702331542969 8.8 41.251636505126953 9.6 42.149024963378906 10.4 42.300224304199219
		 11.2 42.280303955078125 12 42.268878936767578 12.8 42.267238616943359 13.6 42.271610260009766
		 14.4 42.27459716796875 15.2 42.273777008056641 16 42.273834228515625 16.8 42.277278900146484
		 17.6 38.619037628173828 18.4 28.100397109985352 19.2 14.612186431884766 20 2.5264308452606201
		 20.8 -3.7822244167327885 21.6 -4.296328067779541 22.4 -1.9786909818649292 23.2 15.749903678894041
		 24 32.573463439941406 24.8 34.405296325683594 25.6 34.408943176269531 26.4 34.411800384521484
		 27.2 34.413349151611328 28 34.413734436035156 28.8 34.413421630859375 29.6 34.412788391113281
		 30.4 34.322662353515625 31.2 33.231216430664062 32 30.958267211914062 32.8 27.964326858520508
		 33.6 24.710783004760742 34.4 21.659805297851562 35.2 19.272378921508789 36 18.006553649902344
		 36.8 17.867294311523438 37.6 17.868684768676758 38.4 17.869169235229492 39.2 17.870256423950195
		 40 17.87175178527832 40.8 17.873109817504883 41.6 17.874284744262695 42.4 17.87544059753418
		 43.2 17.876888275146484 44 17.878917694091797 44.8 17.88184928894043 45.6 17.885505676269531
		 46.4 17.888179779052734 47.2 17.886554718017578 48 17.879802703857422 48.8 17.873641967773438
		 49.6 17.876029968261719 50.4 17.886089324951172 51.2 17.893861770629883 52 17.892681121826172
		 52.8 17.885042190551758;
createNode animCurveTA -n "RightHandIndex3_rotateY";
	rename -uid "428D9521-4A52-D848-7AB3-C8B3C2827258";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.16673946380615234 0.8 -0.17596745491027832
		 1.6 -0.20236705243587494 2.4 -0.2458419352769852 3.2 -0.30640491843223572 4 -0.38330519199371338
		 4.8 -0.47428646683692927 5.6 -0.57552647590637207 6.4 -0.68148928880691528 7.2 -0.78502118587493896
		 8 -0.87741655111312866 8.8 -0.94903600215911876 9.6 -0.99026823043823242 10.4 -0.99729460477828968
		 11.2 -0.99636524915695202 12 -0.99583226442337036 12.8 -0.99576008319854736 13.6 -0.99595946073532116
		 14.4 -0.99610024690628052 15.2 -0.99605947732925415 16 -0.99606633186340332 16.8 -0.99622249603271484
		 17.6 -0.83243006467819214 18.4 -0.43614763021469116 19.2 -0.10600119084119797 20 0.0064778593368828297
		 20.8 -0.0057758316397666931 21.6 -0.0089256204664707184 22.4 0.002718812320381403
		 23.2 -0.12566980719566345 24 -0.59058845043182373 24.8 -0.6599387526512146 25.6 -0.66009819507598877
		 26.4 -0.66019737720489502 27.2 -0.66025274991989136 28 -0.66026568412780762 28.8 -0.66025453805923462
		 29.6 -0.66023296117782593 30.4 -0.65674149990081787 31.2 -0.61508637666702271 32 -0.53234732151031494
		 32.8 -0.43178084492683411 33.6 -0.33362600207328796 34.4 -0.25239923596382141 35.2 -0.19629213213920593
		 36 -0.16923268139362335 36.8 -0.16636846959590912 37.6 -0.16639630496501923 38.4 -0.16640746593475342
		 39.2 -0.1664263904094696 40 -0.1664775162935257 40.8 -0.1664804220199585 41.6 -0.16650988161563873
		 42.4 -0.16652096807956696 43.2 -0.16656756401062012 44 -0.16659778356552124 44.8 -0.16665898263454437
		 45.6 -0.16673004627227783 46.4 -0.16680191457271576 47.2 -0.16676907241344452 48 -0.16661795973777771
		 48.8 -0.16649250686168671 49.6 -0.16654814779758453 50.4 -0.16674245893955231 51.2 -0.16690292954444885
		 52 -0.16688248515129089 52.8 -0.1667257696390152;
createNode animCurveTA -n "RightHandIndex3_rotateZ";
	rename -uid "7F2A1994-4B72-E3AE-D87C-889E963F28F1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.93049395084381104 0.8 0.96033132076263439
		 1.6 1.0417650938034058 2.4 1.1644145250320435 3.2 1.3173092603683472 4 1.4890812635421753
		 4.8 1.6685808897018433 5.6 1.8456538915634153 6.4 2.0113117694854736 7.2 2.1576697826385498
		 8 2.2775752544403076 8.8 2.3644607067108154 9.6 2.4123306274414062 10.4 2.4203391075134277
		 11.2 2.4192969799041748 12 2.4186897277832031 12.8 2.4185843467712402 13.6 2.4188313484191895
		 14.4 2.4189982414245605 15.2 2.4189374446868896 16 2.418942928314209 16.8 2.4191317558288574
		 17.6 2.2203543186187744 18.4 1.5960127115249634 19.2 0.70837205648422241 20 -0.13288506865501404
		 20.8 -0.57630795240402222 21.6 -0.61234802007675171 22.4 -0.44971287250518804 23.2 0.78598165512084961
		 24 1.8703122138977051 24.8 1.9790291786193848 25.6 1.9792641401290894 26.4 1.979430556297302
		 27.2 1.9795081615447996 28 1.9795324802398682 28.8 1.9795092344284055 29.6 1.9794811010360718
		 30.4 1.9741746187210083 31.2 1.9096028804779053 32 1.7726738452911377 32.8 1.5874770879745483
		 33.6 1.3806089162826538 34.4 1.1818752288818359 35.2 1.0235403776168823 36 0.93867504596710194
		 36.8 0.92929214239120472 37.6 0.929390549659729 38.4 0.92943227291107178 39.2 0.92949211597442627
		 40 0.92960309982299805 40.8 0.92968398332595825 41.6 0.9297618865966798 42.4 0.92983555793762218
		 43.2 0.92993992567062389 44 0.93006175756454468 44.8 0.930267333984375 45.6 0.93052184581756592
		 46.4 0.93071001768112183 47.2 0.93059372901916493 48 0.9301292896270752 48.8 0.92972087860107433
		 49.6 0.92988210916519176 50.4 0.93055093288421642 51.2 0.93107873201370228 52 0.93100523948669422
		 52.8 0.93048983812332153;
createNode animCurveTA -n "RightHandMiddle1_rotateX";
	rename -uid "25EB3CF3-4FD3-BDF7-07F9-49B35B772F0B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0 0.8 6.0042614936828613 1.6 6.5836553573608398
		 2.4 7.4520168304443368 3.2 8.5466623306274414 4 9.8101177215576172 4.8 11.165400505065918
		 5.6 12.522865295410156 6.4 13.802567481994629 7.2 14.938801765441896 8 15.885541915893556
		 8.8 16.624057769775391 9.6 17.118030548095703 10.4 17.299461364746094 11.2 17.355045318603516
		 12 17.353191375732422 12.8 17.34730339050293 13.6 17.363077163696289 14.4 17.369167327880859
		 15.2 17.34809684753418 16 17.3216552734375 16.8 17.301017761230469 17.6 14.882242202758791
		 18.4 7.9799251556396484 19.2 -0.85155326128005981 20 -8.7662954330444336 20.8 -12.911826133728027
		 21.6 -13.258086204528809 22.4 -11.493307113647461 23.2 1.9049088954925537 24 14.596567153930666
		 24.8 15.957309722900391 25.6 15.924371719360352 26.4 15.905426025390625 27.2 15.905470848083494
		 28 15.903640747070312 28.8 15.888408660888672 29.6 15.878654479980469 30.4 15.835128784179689
		 31.2 15.186552047729492 32 13.807101249694824 32.8 11.984469413757324 33.6 10.005606651306152
		 34.4 8.1451272964477539 35.2 6.6775093078613281 36 5.8798785209655762 36.8 5.7636947631835938
		 37.6 5.7459015846252441 38.4 5.7451133728027344 39.2 5.7512311935424805 40 5.7671098709106445
		 40.8 5.7938404083251953 41.6 5.8106074333190918 42.4 5.8072829246520996 43.2 5.7986960411071777
		 44 5.7917647361755371 44.8 5.7832646369934082 45.6 5.779447078704834 46.4 5.7807979583740234
		 47.2 5.7765030860900879 48 5.7637720108032227 48.8 5.7482376098632812 49.6 5.7397050857543945
		 50.4 5.751319408416748 51.2 5.7806296348571777 52 5.8034958839416504 52.8 5.7999882698059082;
createNode animCurveTA -n "RightHandMiddle1_rotateY";
	rename -uid "8903BFBE-4634-16D2-B352-0B81D60939C1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.3525664775410662 0.8 -0.063802830874919891
		 1.6 -0.059174478054046631 2.4 -0.058834504336118698 3.2 -0.06891234964132309 4 -0.094886474311351776
		 4.8 -0.1412237286567688 5.6 -0.21129404008388519 6.4 -0.30340859293937683 7.2 -0.40459761023521423
		 8 -0.49410679936408997 8.8 -0.55726164579391479 9.6 -0.58843106031417847 10.4 -0.58740603923797607
		 11.2 -0.58292937278747559 12 -0.58505553007125854 12.8 -0.59309375286102295 13.6 -0.60086733102798462
		 14.4 -0.60139685869216919 15.2 -0.59651380777359009 16 -0.59509807825088501 16.8 -0.59963387250900269
		 17.6 -0.52942872047424316 18.4 -0.3764684796333313 19.2 -0.30020523071289062 20 -0.3292182981967926
		 20.8 -0.37292900681495667 21.6 -0.37717372179031372 22.4 -0.3580298125743866 23.2 -0.30711701512336731
		 24 -0.48272156715393066 24.8 -0.51975464820861816 25.6 -0.52044636011123657 26.4 -0.5188480019569397
		 27.2 -0.51687222719192505 28 -0.51508474349975586 28.8 -0.51245802640914917 29.6 -0.50835931301116943
		 30.4 -0.49766147136688227 31.2 -0.43012738227844238 32 -0.31341603398323059 32.8 -0.19407756626605988
		 33.6 -0.10434716939926147 34.4 -0.058565493673086173 35.2 -0.050649590790271759 36 -0.05788189172744751
		 36.8 -0.061480335891246796 37.6 -0.062973052263259888 38.4 -0.062735378742218018
		 39.2 -0.061721533536911018 40 -0.06059740483760833 40.8 -0.059133298695087433 41.6 -0.058156933635473251
		 42.4 -0.058218523859977729 43.2 -0.057997763156890876 44 -0.056853163987398148 44.8 -0.056405119597911828
		 45.6 -0.057528764009475715 46.4 -0.059213165193796165 47.2 -0.060937680304050452
		 48 -0.063064232468605042 48.8 -0.065398357808589935 49.6 -0.067125916481018066 50.4 -0.067737206816673279
		 51.2 -0.06756061315536499 52 -0.067129559814929962 52.8 -0.066678509116172791;
createNode animCurveTA -n "RightHandMiddle1_rotateZ";
	rename -uid "3CFC1B46-4AC5-6002-E6BA-7F9762290A3D";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -5.1929841723916716 0.8 -7.9492702484130859
		 1.6 -7.7564678192138663 2.4 -7.4666419029235831 3.2 -7.1055154800415039 4 -6.6943273544311523
		 4.8 -6.2509565353393555 5.6 -5.7861390113830566 6.4 -5.3175950050354004 7.2 -4.8912749290466309
		 8 -4.561553955078125 8.8 -4.351168155670166 9.6 -4.2556843757629395 10.4 -4.2618250846862793
		 11.2 -4.2769637107849121 12 -4.2700686454772949 12.8 -4.2443089485168457 13.6 -4.2197489738464355
		 14.4 -4.2182183265686035 15.2 -4.2334737777709961 16 -4.2374706268310547 16.8 -4.2226238250732422
		 17.6 -4.422515869140625 18.4 -5.0310535430908203 19.2 -5.788477897644043 20 -6.4150028228759766
		 20.8 -6.7163634300231934 21.6 -6.7401227951049805 22.4 -6.6257433891296387 23.2 -5.6399669647216797
		 24 -4.5961461067199707 24.8 -4.4719710350036621 25.6 -4.4692654609680176 26.4 -4.4746427536010742
		 27.2 -4.4816241264343262 28 -4.4878435134887695 28.8 -4.4969606399536133 29.6 -4.5112042427062988
		 30.4 -4.5486717224121094 31.2 -4.7938499450683594 32 -5.2779240608215332 32.8 -5.9110231399536133
		 33.6 -6.6106076240539551 34.4 -7.2778072357177734 35.2 -7.798025131225585 36 -8.0647172927856445
		 36.8 -8.0833683013916016 37.6 -8.0761547088623047 38.4 -8.0791406631469727 39.2 -8.0865859985351562
		 40 -8.090641975402832 40.8 -8.0927057266235352 41.6 -8.0947971343994141 42.4 -8.0956659317016602
		 43.2 -8.1020679473876953 44 -8.1172142028808594 44.8 -8.1257801055908203 45.6 -8.1162109375
		 46.4 -8.0982656478881836 47.2 -8.0825014114379883 48 -8.0668201446533203 48.8 -8.050079345703125
		 49.6 -8.036376953125 50.4 -8.0246133804321289 51.2 -8.0127620697021484 52 -8.0064716339111328
		 52.8 -8.0126457214355469;
createNode animCurveTA -n "RightHandMiddle2_rotateX";
	rename -uid "E2E11AD1-49B0-14BC-BF78-229661518724";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 16.794851303100586 0.8 17.375520706176758
		 1.6 18.972917556762695 2.4 21.398284912109375 3.2 24.461050033569336 4 27.962274551391602
		 4.8 31.700382232666012 5.6 35.491546630859375 6.4 39.167289733886719 7.2 42.537563323974609
		 8 45.381561279296875 8.8 47.488391876220703 9.6 48.676284790039062 10.4 48.894214630126953
		 11.2 48.888916015625 12 48.885967254638672 12.8 48.87493896484375 13.6 48.854606628417969
		 14.4 48.848236083984375 15.2 48.870208740234375 16 48.895801544189453 16.8 48.899238586425781
		 17.6 46.106735229492188 18.4 38.106967926025391 19.2 27.853424072265625 20 18.659297943115234
		 20.8 13.854151725769043 21.6 13.460540771484375 22.4 15.672926902770994 23.2 32.553760528564453
		 24 48.566085815429688 24.8 50.309562683105469 25.6 50.303852081298828 26.4 50.291481018066406
		 27.2 50.280029296875 28 50.278705596923828 28.8 50.292236328125 29.6 50.307525634765625
		 30.4 50.117256164550781 31.2 47.883750915527344 32 43.291351318359375 32.8 37.287540435791016
		 33.6 30.74555778503418 34.4 24.55224609375 35.2 19.678140640258789 36 17.104093551635742
		 36.8 16.829212188720703 37.6 16.818870544433594 38.4 16.78630256652832 39.2 16.771068572998047
		 40 16.788387298583984 40.8 16.814601898193359 41.6 16.823446273803711 42.4 16.814424514770508
		 43.2 16.810260772705078 44 16.825532913208008 44.8 16.839900970458984 45.6 16.82325553894043
		 46.4 16.784893035888672 47.2 16.766717910766602 48 16.785270690917969 48.8 16.815761566162109
		 49.6 16.834756851196289 50.4 16.835269927978516 51.2 16.814132690429688 52 16.786733627319336
		 52.8 16.794841766357422;
createNode animCurveTA -n "RightHandMiddle2_rotateY";
	rename -uid "02A7E2AB-4B5C-8EEF-9AA1-CCBA512A301C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.18458735942840576 0.8 -0.1984788179397583
		 1.6 -0.23906335234642029 2.4 -0.30712521076202393 3.2 -0.40410390496253967 4 -0.52969920635223389
		 4.8 -0.68066948652267456 5.6 -0.85090005397796631 6.4 -1.0317342281341553 7.2 -1.2105457782745361
		 8 -1.3706405162811279 8.8 -1.4944429397583008 9.6 -1.5661438703536987 10.4 -1.5794194936752319
		 11.2 -1.5790930986404419 12 -1.578924298286438 12.8 -1.5782531499862671 13.6 -1.5770121812820435
		 14.4 -1.5766230821609497 15.2 -1.5779553651809692 16 -1.5795058012008667 16.8 -1.5797411203384399
		 17.6 -1.4127886295318604 18.4 -0.97799885272979736 19.2 -0.52556484937667847 20 -0.23081186413764954
		 20.8 -0.12125700712203978 21.6 -0.11366545408964157 22.4 -0.15904119610786438 23.2 -0.71749454736709595
		 24 -1.5594416856765747 24.8 -1.6668311357498169 25.6 -1.6664762496948242 26.4 -1.665705680847168
		 27.2 -1.6649775505065918 28 -1.6649065017700195 28.8 -1.6657407283782959 29.6 -1.666712760925293
		 30.4 -1.6548428535461426 31.2 -1.5181831121444702 32 -1.2521893978118896 32.8 -0.937353014945984
		 33.6 -0.6404728889465332 34.4 -0.40717026591300964 35.2 -0.25801047682762146 36 -0.19193468987941742
		 36.8 -0.18539728224277496 37.6 -0.18516181409358978 38.4 -0.18439158797264099 39.2 -0.18403486907482147
		 40 -0.18444627523422241 40.8 -0.18506431579589844 41.6 -0.18526628613471985 42.4 -0.18505474925041199
		 43.2 -0.18495355546474457 44 -0.18530601263046265 44.8 -0.18566618859767914 45.6 -0.18526840209960938
		 46.4 -0.1843445748090744 47.2 -0.18393634259700775 48 -0.18436820805072784 48.8 -0.1850895881652832
		 49.6 -0.18553425371646881 50.4 -0.18552945554256439 51.2 -0.18503302335739136 52 -0.18439030647277832
		 52.8 -0.18458728492259979;
createNode animCurveTA -n "RightHandMiddle2_rotateZ";
	rename -uid "161EAB89-475E-2061-CF35-AB987DC5A7C8";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.7412898540496826 0.8 1.7861208915710449
		 1.6 1.9087145328521729 2.4 2.092573881149292 3.2 2.320389986038208 4 2.574073314666748
		 4.8 2.8359534740447998 5.6 3.0909624099731445 6.4 3.3269948959350586 7.2 3.5328564643859863
		 8 3.6981699466705322 8.8 3.8154256343841553 9.6 3.8795053958892818 10.4 3.8911015987396236
		 11.2 3.8908190727233887 12 3.8906486034393306 12.8 3.8900895118713383 13.6 3.8889923095703121
		 14.4 3.8886713981628418 15.2 3.8898367881774898 16 3.8911771774291992 16.8 3.8913652896881099
		 17.6 3.7390367984771729 18.4 3.260106086730957 19.2 2.5663163661956787 20 1.8847298622131348
		 20.8 1.512205958366394 21.6 1.4813065528869629 22.4 1.6542600393295288 23.2 2.8943126201629639
		 24 3.8736259937286373 24.8 3.9651720523834233 25.6 3.9648761749267578 26.4 3.9642374515533452
		 27.2 3.9636485576629634 28 3.9635782241821289 28.8 3.9642739295959473 29.6 3.9650697708129883
		 30.4 3.9552309513092041 31.2 3.8369262218475337 32 3.5774378776550293 32.8 3.2077441215515137
		 33.6 2.7700059413909912 34.4 2.3271031379699707 35.2 1.9624743461608887 36 1.7651718854904175
		 36.8 1.7439416646957397 37.6 1.7431473731994629 38.4 1.7406301498413086 39.2 1.7394473552703857
		 40 1.7407960891723633 40.8 1.7428156137466431 41.6 1.7434959411621094 42.4 1.7428086996078491
		 43.2 1.7424848079681396 44 1.7436548471450806 44.8 1.7447724342346191 45.6 1.7434806823730469
		 46.4 1.7405096292495728 47.2 1.7391152381896973 48 1.7405455112457275 48.8 1.7428954839706421
		 49.6 1.7443716526031494 50.4 1.744409441947937 51.2 1.7427660226821899 52 1.7406518459320068
		 52.8 1.7412868738174438;
createNode animCurveTA -n "RightHandMiddle3_rotateX";
	rename -uid "D75D509A-4196-B461-637F-A8BFED709F43";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 12.568951606750488 0.8 12.996603965759277
		 1.6 14.206545829772949 2.4 16.055215835571289 3.2 18.384883880615234 4 21.040376663208008
		 4.8 23.88763427734375 5.6 26.790983200073242 6.4 29.589225769042969 7.2 32.123786926269531
		 8 34.264625549316406 8.8 35.883018493652344 9.6 36.823833465576172 10.4 37.017536163330078
		 11.2 37.022899627685547 12 37.017509460449219 12.8 37.008563995361328 13.6 37.006114959716797
		 14.4 37.011650085449219 15.2 37.012535095214844 16 37.001808166503906 16.8 36.989173889160156
		 17.6 32.807441711425781 18.4 20.807670593261719 19.2 5.4219875335693359 20 -8.360630989074707
		 20.8 -15.551007270812987 21.6 -16.136178970336914 22.4 -13.819186210632324 23.2 3.9288022518157959
		 24 20.779010772705078 24.8 22.614477157592773 25.6 22.617752075195312 26.4 22.621755599975586
		 27.2 22.625295639038086 28 22.625473022460938 28.8 22.623785018920898 29.6 22.625740051269531
		 30.4 22.579050064086914 31.2 21.924446105957031 32 20.547246932983398 32.8 18.730384826660156
		 33.6 16.754745483398438 34.4 14.889588356018065 35.2 13.412503242492676 36 12.623174667358398
		 36.8 12.54006290435791 37.6 12.55029296875 38.4 12.551197052001953 39.2 12.549824714660645
		 40 12.55341911315918 40.8 12.553688049316406 41.6 12.546996116638184 42.4 12.542940139770508
		 43.2 12.547353744506836 44 12.554983139038086 44.8 12.557621002197266 45.6 12.553808212280273
		 46.4 12.550680160522461 47.2 12.552835464477539 48 12.555554389953613 48.8 12.555170059204102
		 49.6 12.554906845092773 50.4 12.555204391479492 51.2 12.553656578063965 52 12.555113792419434
		 52.8 12.568958282470703;
createNode animCurveTA -n "RightHandMiddle3_rotateY";
	rename -uid "E8DA3161-4339-8140-DFD6-09AFD5B80242";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.11414271593093872 0.8 -0.12193223088979721
		 1.6 -0.1453230232000351 2.4 -0.18495342135429382 3.2 -0.24144542217254639 4 -0.3147168755531311
		 4.8 -0.40357294678688049 5.6 -0.50492995977401733 6.4 -0.61266958713531494 7.2 -0.71854114532470703
		 8 -0.81396669149398804 8.8 -0.88965284824371338 9.6 -0.93502432107925426 10.4 -0.94448441267013539
		 11.2 -0.94473236799240112 12 -0.94448459148406971 12.8 -0.94405025243759155 13.6 -0.94392663240432728
		 14.4 -0.94421160221099842 15.2 -0.9442560076713562 16 -0.9437258243560791 16.8 -0.94309258460998535
		 17.6 -0.74842959642410278 18.4 -0.30793392658233643 19.2 -0.021477473899722099 20 -0.045290097594261169
		 20.8 -0.16321739554405212 21.6 -0.17594200372695923 22.4 -0.12829245626926422 23.2 -0.01112674456089735
		 24 -0.30708649754524231 24.8 -0.36253803968429565 25.6 -0.36263474822044373 26.4 -0.36276033520698547
		 27.2 -0.36287310719490051 28 -0.36288443207740784 28.8 -0.3628275990486145 29.6 -0.36288174986839294
		 30.4 -0.36142218112945557 31.2 -0.34117704629898071 32 -0.30039837956428528 32.8 -0.25046461820602417
		 33.6 -0.20114843547344208 34.4 -0.15942326188087463 35.2 -0.12975151836872101 36 -0.11510547250509262
		 36.8 -0.1136133074760437 37.6 -0.11379794031381606 38.4 -0.11382195353507994 39.2 -0.11379969120025635
		 40 -0.11386320739984512 40.8 -0.11386876553297043 41.6 -0.1137559562921524 42.4 -0.11366200447082518
		 43.2 -0.11376168578863144 44 -0.11388796567916872 44.8 -0.11393255740404129 45.6 -0.1138612926006317
		 46.4 -0.11381878703832626 47.2 -0.1138557642698288 48 -0.11389972269535065 48.8 -0.11388729512691499
		 49.6 -0.1138770803809166 50.4 -0.11389929801225661 51.2 -0.11386679112911223 52 -0.11390892416238783
		 52.8 -0.11414656788110734;
createNode animCurveTA -n "RightHandMiddle3_rotateZ";
	rename -uid "7A5FAF5E-44FD-6EF9-D280-81ABE491C213";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.1120460033416748 0.8 1.1457300186157227
		 1.6 1.2406891584396362 2.4 1.3847886323928833 3.2 1.564426064491272 4 1.7662177085876465
		 4.8 1.9785871505737305 5.6 2.1903336048126221 6.4 2.3893394470214844 7.2 2.5648794174194336
		 8 2.7094035148620605 8.8 2.8162472248077393 9.6 2.8773388862609863 10.4 2.8898544311523438
		 11.2 2.8902082443237305 12 2.889859676361084 12.8 2.8892800807952881 13.6 2.8891134262084961
		 14.4 2.8894667625427246 15.2 2.8895218372344971 16 2.8888471126556396 16.8 2.8880140781402588
		 17.6 2.611417293548584 18.4 1.7486803531646729 19.2 0.54224240779876709 20 -0.56872373819351196
		 20.8 -1.1374689340591431 21.6 -1.1830201148986816 22.4 -1.0018882751464844 23.2 0.42201372981071472
		 24 1.746512770652771 24.8 1.8841668367385864 25.6 1.8844168186187746 26.4 1.884706377983093
		 27.2 1.884972095489502 28 1.8849821090698242 28.8 1.8848682641983032 29.6 1.8850030899047852
		 30.4 1.8815232515335081 31.2 1.8326269388198853 32 1.7289949655532837 32.8 1.5908682346343994
		 33.6 1.438963770866394 34.4 1.2940785884857178 35.2 1.1784212589263916 36 1.1163207292556763
		 36.8 1.1097670793533325 37.6 1.1105947494506836 38.4 1.1106575727462769 39.2 1.1105377674102783
		 40 1.1108294725418091 40.8 1.1108489036560059 41.6 1.1103361845016479 42.4 1.1100003719329834
		 43.2 1.1103512048721313 44 1.1109590530395508 44.8 1.1111547946929932 45.6 1.1108582019805908
		 46.4 1.1106202602386475 47.2 1.1107876300811768 48 1.1110000610351562 48.8 1.1109644174575806
		 49.6 1.1109414100646973 50.4 1.1109679937362671 51.2 1.11085045337677 52 1.110970139503479
		 52.8 1.1120516061782837;
createNode animCurveTA -n "RightHandRing1_rotateX";
	rename -uid "3302B380-46E1-9DE2-24F5-C492B58AB492";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -1.2431362248627935e-17 0.8 13.871921539306641
		 1.6 14.423056602478027 2.4 15.286597251892088 3.2 16.396636962890625 4 17.665470123291016
		 4.8 19.000616073608398 5.6 20.327974319458008 6.4 21.59150505065918 7.2 22.732837677001953
		 8 23.694252014160156 8.8 24.441242218017578 9.6 24.927000045776367 10.4 25.084331512451172
		 11.2 25.115690231323242 12 25.109357833862305 12.8 25.103294372558594 13.6 25.099020004272461
		 14.4 25.083885192871094 15.2 25.072336196899414 16 25.077943801879883 16.8 25.08526611328125
		 17.6 23.240686416625977 18.4 17.945510864257812 19.2 11.157825469970703 20 5.0657839775085449
		 20.8 1.8749991655349731 21.6 1.6099828481674194 22.4 3.3602235317230225 23.2 16.703866958618164
		 24 29.352184295654297 24.8 30.725135803222656 25.6 30.720140457153324 26.4 30.718461990356449
		 27.2 30.719244003295898 28 30.71656608581543 28.8 30.709892272949222 29.6 30.707944869995117
		 30.4 30.623121261596683 31.2 29.519157409667969 32 27.201675415039062 32.8 24.142684936523438
		 33.6 20.818626403808594 34.4 17.696084976196289 35.2 15.235937118530275 36 13.90689754486084
		 36.8 13.732546806335449 37.6 13.722070693969727 38.4 13.731197357177734 39.2 13.74125862121582
		 40 13.74088191986084 40.8 13.73365592956543 41.6 13.729036331176758 42.4 13.736931800842285
		 43.2 13.755386352539062 44 13.767522811889648 44.8 13.766101837158203 45.6 13.765942573547363
		 46.4 13.774689674377441 47.2 13.772580146789551 48 13.740351676940918 48.8 13.691727638244629
		 49.6 13.663743019104004 50.4 13.674807548522949 51.2 13.701547622680664 52 13.708314895629883
		 52.8 13.684337615966797;
createNode animCurveTA -n "RightHandRing1_rotateY";
	rename -uid "78ECC056-49EC-ACAF-478B-D1986F9F9380";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.96639459977042 0.8 0.29285889863967896
		 1.6 0.24809637665748599 2.4 0.17511989176273346 3.2 0.065587446093559265 4 -0.086550071835517883
		 4.8 -0.28106498718261719 5.6 -0.51228129863739014 6.4 -0.76758819818496704 7.2 -1.0233200788497925
		 8 -1.2486293315887451 8.8 -1.415829062461853 9.6 -1.5027995109558105 10.4 -1.5025098323822021
		 11.2 -1.4879847764968872 12 -1.4883718490600586 12.8 -1.5002682209014893 13.6 -1.5096110105514526
		 14.4 -1.5098178386688232 15.2 -1.5070643424987793 16 -1.5079245567321777 16.8 -1.511149525642395
		 17.6 -1.3877193927764893 18.4 -1.0618510246276855 19.2 -0.7117382287979126 20 -0.45483326911926264
		 20.8 -0.33886641263961792 21.6 -0.32909888029098511 22.4 -0.38589707016944885 23.2 -0.90263330936431885
		 24 -1.573716402053833 24.8 -1.6621463298797607 25.6 -1.6583554744720459 26.4 -1.6498171091079712
		 27.2 -1.6423747539520264 28 -1.6390006542205811 28.8 -1.6374105215072632 29.6 -1.6352753639221191
		 30.4 -1.6170579195022583 31.2 -1.4032641649246216 32 -0.9906945824623109 32.8 -0.52287387847900391
		 33.6 -0.12247475981712343 34.4 0.14561609923839569 35.2 0.28371959924697876 36 0.33213573694229126
		 36.8 0.33611774444580078 37.6 0.33389467000961304 38.4 0.33244290947914124 39.2 0.33233737945556641
		 40 0.33237862586975098 40.8 0.33355844020843506 41.6 0.33671477437019348 42.4 0.3395855724811554
		 43.2 0.34023541212081909 44 0.34070563316345215 44.8 0.34303891658782959 45.6 0.34524783492088318
		 46.4 0.34404093027114868 47.2 0.33802095055580139 48 0.3284909725189209 48.8 0.32003387808799744
		 49.6 0.31751370429992676 50.4 0.31986355781555176 51.2 0.3203292191028595 52 0.31663340330123901
		 52.8 0.31524714827537537;
createNode animCurveTA -n "RightHandRing1_rotateZ";
	rename -uid "3459CBA5-4522-593B-A436-FEAD4D2543EF";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -6.0683449068976305 0.8 -10.328601837158203
		 1.6 -10.037603378295898 2.4 -9.6121788024902344 3.2 -9.074951171875 4 -8.456141471862793
		 4.8 -7.7924003601074228 5.6 -7.1168069839477539 6.4 -6.4636149406433105 7.2 -5.878990650177002
		 8 -5.4105615615844727 8.8 -5.0911617279052734 9.6 -4.9410600662231445 10.4 -4.9540414810180664
		 11.2 -4.9872469902038574 12 -4.9858870506286621 12.8 -4.9602565765380859 13.6 -4.9401311874389648
		 14.4 -4.9385643005371094 15.2 -4.9434685707092285 16 -4.9420433044433594 16.8 -4.9358010292053223
		 17.6 -5.0589375495910645 18.4 -5.4292283058166504 19.2 -5.9085721969604492 20 -6.3355503082275391
		 20.8 -6.5663132667541504 21.6 -6.6083579063415527 22.4 -6.5384726524353027 23.2 -5.8070855140686035
		 24 -5.0926375389099121 24.8 -5.0120916366577148 25.6 -5.0181760787963867 26.4 -5.0323638916015625
		 27.2 -5.0448708534240723 28 -5.0503978729248047 28.8 -5.0527229309082031 29.6 -5.0562100410461426
		 30.4 -5.0826349258422852 31.2 -5.4018692970275879 32 -6.0953783988952637 32.8 -7.0578384399414062
		 33.6 -8.1459789276123047 34.4 -9.1902484893798828 35.2 -10.025341033935547 36 -10.482284545898438
		 36.8 -10.538628578186035 37.6 -10.531736373901367 38.4 -10.523561477661133 39.2 -10.520837783813477
		 40 -10.521116256713867 40.8 -10.527664184570312 41.6 -10.542016983032227 42.4 -10.552013397216797
		 43.2 -10.550378799438477 44 -10.549615859985352 44.8 -10.559569358825684 45.6 -10.568743705749512
		 46.4 -10.561736106872559 47.2 -10.53720760345459 48 -10.505119323730469 48.8 -10.480996131896973
		 49.6 -10.47689151763916 50.4 -10.48408317565918 51.2 -10.479962348937988 52 -10.463030815124512
		 52.8 -10.462604522705078;
createNode animCurveTA -n "RightHandRing2_rotateX";
	rename -uid "2C03F053-407D-8345-27C4-44BE413F0B92";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.33668887615203857 0.8 0.90997850894927967
		 1.6 2.5099203586578369 2.4 4.960179328918457 3.2 8.0442905426025391 4 11.543754577636719
		 4.8 15.276965141296387 5.6 19.071859359741211 6.4 22.737930297851562 7.2 26.083576202392578
		 8 28.920459747314453 8.8 31.042173385620121 9.6 32.237983703613281 10.4 32.447780609130859
		 11.2 32.43023681640625 12 32.418437957763672 12.8 32.416275024414062 13.6 32.429763793945312
		 14.4 32.450042724609375 15.2 32.454483032226562 16 32.436336517333984 16.8 32.422855377197266
		 17.6 29.650945663452152 18.4 21.66943359375 19.2 11.410551071166992 20 2.2050683498382568
		 20.8 -2.6000053882598877 21.6 -2.9881448745727539 22.4 -0.77740919589996338 23.2 16.106340408325195
		 24 32.124931335449219 24.8 33.8681640625 25.6 33.871559143066406 26.4 33.869049072265625
		 27.2 33.853530883789062 28 33.827922821044922 28.8 33.806583404541016 29.6 33.803409576416016
		 30.4 33.635025024414062 31.2 31.440011978149411 32 26.844379425048828 32.8 20.789789199829102
		 33.6 14.220133781433105 34.4 8.061553955078125 35.2 3.2306263446807861 36 0.6561017632484436
		 36.8 0.36409479379653931 37.6 0.36563071608543396 38.4 0.3638836145401001 39.2 0.35419276356697083
		 40 0.34212601184844971 40.8 0.33830368518829346 41.6 0.34882652759552002 42.4 0.36768758296966553
		 43.2 0.37484526634216309 44 0.35767334699630737 44.8 0.33582091331481934 45.6 0.34069052338600159
		 46.4 0.36638611555099487 47.2 0.3743148148059845 48 0.36048945784568787 48.8 0.38057151436805725
		 49.6 0.46299156546592718 50.4 0.53295552730560303 51.2 0.5065692663192749 52 0.41227886080741882
		 52.8 0.33667457103729248;
createNode animCurveTA -n "RightHandRing2_rotateY";
	rename -uid "4060517B-437B-587A-6B45-32A0C1C4F0FA";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.11586331576108932 0.8 0.11526367068290709
		 1.6 0.11128552258014679 2.4 0.098685100674629211 3.2 0.071547754108905792 4 0.025679714977741241
		 4.8 -0.040735479444265366 5.6 -0.12646991014480591 6.4 -0.22640787065029144 7.2 -0.33193716406822205
		 8 -0.43183800578117371 8.8 -0.5126686692237854 9.6 -0.56049185991287231 10.4 -0.5690232515335083
		 11.2 -0.56830906867980957 12 -0.56782889366149902 12.8 -0.56774413585662842 13.6 -0.56829160451889038
		 14.4 -0.56910961866378784 15.2 -0.56930983066558838 16 -0.56856238842010498 16.8 -0.56801021099090576
		 17.6 -0.45906224846839899 18.4 -0.19557464122772217 19.2 0.027716536074876785 20 0.11232642829418182
		 20.8 0.11209015548229218 21.6 0.11073672771453857 22.4 0.11577307432889937 23.2 -0.057927645742893226
		 24 -0.55590164661407471 24.8 -0.62822359800338745 25.6 -0.62838238477706909 26.4 -0.6282656192779541
		 27.2 -0.62760370969772339 28 -0.62652307748794556 28.8 -0.62561631202697754 29.6 -0.62547087669372559
		 30.4 -0.61835557222366333 31.2 -0.52838927507400513 32 -0.35779005289077759 32.8 -0.17123650014400482
		 33.6 -0.020125215873122215 34.4 0.071348384022712708 35.2 0.10840647667646408 36 0.11558480560779572
		 36.8 0.11583127081394196 37.6 0.11582527309656142 38.4 0.11584114283323288 39.2 0.11584844440221786
		 40 0.11585056781768799 40.8 0.11584903299808504 41.6 0.11586689203977585 42.4 0.11584395170211791
		 43.2 0.11582969129085541 44 0.11585136502981187 44.8 0.11586157977581024 45.6 0.11584632098674774
		 46.4 0.11585123836994171 47.2 0.11583578586578369 48 0.11584082245826721 48.8 0.1158386766910553
		 49.6 0.11577647179365159 50.4 0.1156887859106064 51.2 0.11572792381048203 52 0.11580284684896469
		 52.8 0.11586222797632217;
createNode animCurveTA -n "RightHandRing2_rotateZ";
	rename -uid "8B17A75D-4C8C-8AC4-FAFE-94940DB27944";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.0328459739685059 0.8 1.0763093233108521
		 1.6 1.197541356086731 2.4 1.3828593492507935 3.2 1.615077018737793 4 1.8763861656188965
		 4.8 2.1515059471130371 5.6 2.4261600971221924 6.4 2.6855831146240234 7.2 2.9163429737091064
		 8 3.1069300174713135 8.8 3.2461309432983398 9.6 3.3232264518737793 10.4 3.3366613388061523
		 11.2 3.3355445861816406 12 3.3347902297973633 12.8 3.3346436023712158 13.6 3.3355085849761963
		 14.4 3.3368070125579834 15.2 3.3370931148529053 16 3.3359320163726807 16.8 3.3350751399993896
		 17.6 3.1551861763000488 18.4 2.6106369495391846 19.2 1.8664826154708862 20 1.1744505167007446
		 20.8 0.81025874614715576 21.6 0.78085821866989136 22.4 0.94838786125183094 23.2 2.2120130062103271
		 24 3.3160021305084229 24.8 3.4267258644104004 25.6 3.4269318580627441 26.4 3.4267759323120117
		 27.2 3.4258084297180176 28 3.4242019653320312 28.8 3.4228506088256836 29.6 3.422640323638916
		 30.4 3.4120368957519531 31.2 3.2718775272369385 32 2.9679362773895264 32.8 2.5485119819641113
		 33.6 2.0740618705749512 34.4 1.6163884401321411 35.2 1.2520864009857178 36 1.0570470094680786
		 36.8 1.0349243879318237 37.6 1.0350253582000732 38.4 1.034911036491394 39.2 1.0341613292694092
		 40 1.0332595109939575 40.8 1.0329611301422119 41.6 1.0337592363357544 42.4 1.0351929664611816
		 43.2 1.0357455015182495 44 1.0344232320785522 44.8 1.0327812433242798 45.6 1.0331525802612305
		 46.4 1.0350965261459351 47.2 1.0356986522674561 48 1.0346546173095703 48.8 1.0361630916595459
		 49.6 1.0424195528030396 50.4 1.0477283000946045 51.2 1.0457322597503662 52 1.0385748147964478
		 52.8 1.0328493118286133;
createNode animCurveTA -n "RightHandRing3_rotateX";
	rename -uid "68EC8FFE-43C6-1A82-72F5-17BAD8A3C8BB";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 24.703805923461914 0.8 25.144899368286133
		 1.6 26.352897644042969 2.4 28.194194793701172 3.2 30.525392532348636 4 33.194484710693359
		 4.8 36.050373077392578 5.6 38.949306488037109 6.4 41.750782012939453 7.2 44.306171417236328
		 8 46.456386566162109 8.8 48.047821044921875 9.6 48.943775177001953 10.4 49.107105255126953
		 11.2 49.1036376953125 12 49.103160858154297 12.8 49.106422424316406 13.6 49.111591339111328
		 14.4 49.114795684814453 15.2 49.115478515625 16 49.111900329589844 16.8 49.104816436767578
		 17.6 45.075084686279297 18.4 33.507198333740234 19.2 18.667707443237305 20 5.3670229911804199
		 20.8 -1.568027138710022 21.6 -2.1199853420257568 22.4 0.20689335465431213 23.2 17.950271606445312
		 24 34.7803955078125 24.8 36.604850769042969 25.6 36.604259490966797 26.4 36.606941223144531
		 27.2 36.606761932373047 28 36.602043151855469 28.8 36.600078582763672 29.6 36.603874206542969
		 30.4 36.543754577636719 31.2 35.762592315673828 32 34.137344360351562 32.8 31.998678207397461
		 33.6 29.668340682983402 34.4 27.469202041625977 35.2 25.729890823364258 36 24.787351608276367
		 36.8 24.660736083984375 37.6 24.65239143371582 38.4 24.661638259887695 39.2 24.676658630371094
		 40 24.680521011352539 40.8 24.674077987670898 41.6 24.673189163208008 42.4 24.675882339477539
		 43.2 24.66754150390625 44 24.659183502197266 44.8 24.672958374023438 45.6 24.695085525512695
		 46.4 24.693731307983398 47.2 24.671276092529297 48 24.655656814575195 48.8 24.656669616699219
		 49.6 24.661994934082031 50.4 24.660974502563477 51.2 24.657678604125977 52 24.666690826416016
		 52.8 24.703819274902344;
createNode animCurveTA -n "RightHandRing3_rotateY";
	rename -uid "C76FE71D-455E-5793-8148-9FAB2E2EFB9A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.29972907900810242 0.8 -0.31379038095474243
		 1.6 -0.35348886251449585 2.4 -0.41735848784446716 3.2 -0.50385123491287231 4 -0.61051338911056519
		 4.8 -0.73339492082595825 5.6 -0.86707472801208496 6.4 -1.0045033693313599 7.2 -1.1366604566574097
		 8 -1.2526713609695435 8.8 -1.341275691986084 9.6 -1.3921424150466919 10.4 -1.4015119075775146
		 11.2 -1.401311993598938 12 -1.4012805223464966 12.8 -1.4014570713043213 13.6 -1.4017654657363892
		 14.4 -1.4019497632980347 15.2 -1.4019795656204224 16 -1.4017727375030518 16.8 -1.4013746976852417
		 17.6 -1.177656888961792 18.4 -0.62352842092514038 19.2 -0.13117337226867676 20 0.077138707041740417
		 20.8 0.093927383422851562 21.6 0.092543229460716248 22.4 0.095700360834598541 23.2 -0.11415253579616547
		 24 -0.6776432991027832 24.8 -0.75827163457870483 25.6 -0.75824588537216187 26.4 -0.75836926698684692
		 27.2 -0.7583649754524231 28 -0.75814265012741089 28.8 -0.75804656744003296 29.6 -0.75822311639785767
		 30.4 -0.75550854206085205 31.2 -0.72059780359268188 32 -0.65009313821792603 32.8 -0.56172817945480347
		 33.6 -0.47131347656250006 34.4 -0.39171925187110901 35.2 -0.3327975869178772 36 -0.30237004160881042
		 36.8 -0.29837235808372498 37.6 -0.29809746146202087 38.4 -0.29839435219764709 39.2 -0.29886385798454285
		 40 -0.29899212718009949 40.8 -0.29877638816833496 41.6 -0.29877132177352905 42.4 -0.29885038733482361
		 43.2 -0.29858896136283875 44 -0.29832419753074646 44.8 -0.29875642061233521 45.6 -0.29945138096809387
		 46.4 -0.29941254854202271 47.2 -0.29869598150253296 48 -0.29819765686988831 48.8 -0.29824048280715942
		 49.6 -0.29842284321784973 50.4 -0.29835721850395203 51.2 -0.29827633500099182 52 -0.29855677485466003
		 52.8 -0.29974019527435303;
createNode animCurveTA -n "RightHandRing3_rotateZ";
	rename -uid "0A766C21-43E7-142A-1864-088EFDC2EA69";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.90040117502212524 0.8 0.93075692653656006
		 1.6 1.0133270025253296 2.4 1.1375432014465332 3.2 1.2917526960372925 4 1.4638466835021973
		 4.8 1.6422868967056274 5.6 1.8169553279876711 6.4 1.9791359901428223 7.2 2.1210789680480957
		 8 2.2358534336090088 8.8 2.3179750442504883 9.6 2.363107442855835 10.4 2.3712441921234131
		 11.2 2.3710713386535645 12 2.3710610866546631 12.8 2.3712210655212402 13.6 2.3714838027954102
		 14.4 2.3716385364532471 15.2 2.3716614246368408 16 2.3714890480041504 16.8 2.3711404800415039
		 17.6 2.162630558013916 18.4 1.4836777448654175 19.2 0.47506436705589294 20 -0.50924807786941528
		 20.8 -1.0343579053878784 21.6 -1.0761715173721313 22.4 -0.89983212947845459 23.2 0.4234079122543335
		 24 1.5636881589889526 24.8 1.6762067079544067 25.6 1.6761808395385742 26.4 1.6763530969619751
		 27.2 1.6763262748718262 28 1.6760368347167969 28.8 1.6759152412414551 29.6 1.6761490106582642
		 30.4 1.6724931001663208 31.2 1.6245924234390259 32 1.5234376192092896 32.8 1.3873480558395386
		 33.6 1.2354660034179688 34.4 1.0888808965682983 35.2 0.97085541486740112 36 0.90616595745086681
		 36.8 0.89744168519973766 37.6 0.89686250686645508 38.4 0.89750784635543823 39.2 0.89855009317398071
		 40 0.89880388975143433 40.8 0.89835178852081299 41.6 0.89830309152603138 42.4 0.89849132299423229
		 43.2 0.89789605140686046 44 0.89733147621154785 44.8 0.89828366041183472 45.6 0.89980810880661011
		 46.4 0.89971208572387695 47.2 0.89816009998321533 48 0.89707952737808228 48.8 0.89715564250946045
		 49.6 0.89752167463302623 50.4 0.89746218919754039 51.2 0.89722579717636108 52 0.89784473180770874
		 52.8 0.90040731430053711;
createNode animCurveTA -n "RightHandPinky1_rotateX";
	rename -uid "CC9CCB2A-4627-266A-8518-929CCE4961B9";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.13908435299153163 0.8 11.007266044616699
		 1.6 11.519125938415527 2.4 12.305076599121094 3.2 13.303805351257324 4 14.457140922546388
		 4.8 15.695366859436035 5.6 16.94178581237793 6.4 18.130239486694336 7.2 19.205089569091797
		 8 20.117214202880859 8.8 20.827072143554688 9.6 21.281770706176758 10.4 21.428127288818359
		 11.2 21.463619232177734 12 21.458282470703125 12.8 21.443492889404297 13.6 21.440914154052734
		 14.4 21.445842742919922 15.2 21.448040008544922 16 21.445783615112305 16.8 21.439874649047852
		 17.6 19.382234573364258 18.4 13.512660980224609 19.2 6.0452094078063965 20 -0.59588474035263062
		 20.8 -4.041224479675293 21.6 -4.3101301193237305 22.4 -2.5493202209472656 23.2 10.926666259765625
		 24 23.878650665283203 24.8 25.29039192199707 25.6 25.279668807983398 26.4 25.270483016967773
		 27.2 25.267871856689453 28 25.268089294433594 28.8 25.265056610107422 29.6 25.260259628295898
		 30.4 25.17888069152832 31.2 24.233913421630859 32 22.268115997314453 32.8 19.683582305908203
		 33.6 16.877668380737305 34.4 14.240962028503418 35.2 12.171566963195801 36 11.070138931274414
		 36.8 10.944612503051758 37.6 10.949090003967285 38.4 10.952277183532715 39.2 10.946625709533691
		 40 10.940384864807129 40.8 10.943910598754883 41.6 10.950085639953613 42.4 10.95055103302002
		 43.2 10.951375961303711 44 10.951085090637207 44.8 10.934390068054199 45.6 10.902532577514648
		 46.4 10.871562957763672 47.2 10.844209671020508 48 10.816473960876465 48.8 10.797171592712402
		 49.6 10.798012733459473 50.4 10.814593315124512 51.2 10.83034610748291 52 10.836405754089355
		 52.8 10.840681076049805;
createNode animCurveTA -n "RightHandPinky1_rotateY";
	rename -uid "84872324-4170-5896-5C15-258B58912725";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -5.6434176256933286 0.8 -0.57350039482116699
		 1.6 0.099106751382350922 2.4 1.0979225635528564 3.2 2.3188107013702393 4 3.6606686115264893
		 4.8 5.0308504104614258 5.6 6.3488235473632812 6.4 7.5484766960144043 7.2 8.5802688598632812
		 8 9.4093255996704102 8.8 10.004499435424805 9.6 10.33028507232666 10.4 10.383868217468262
		 11.2 10.37473201751709 12 10.366181373596191 12.8 10.363410949707031 13.6 10.366696357727051
		 14.4 10.375151634216309 15.2 10.38060474395752 16 10.381680488586426 16.8 10.381722450256348
		 17.6 10.391701698303223 18.4 10.417352676391602 19.2 10.486405372619629 20 10.628681182861328
		 20.8 10.745837211608887 21.6 10.756349563598633 22.4 10.658082008361816 23.2 10.20433235168457
		 24 10.007227897644043 24.8 9.9913434982299805 25.6 9.9932537078857422 26.4 9.9939174652099609
		 27.2 9.9930295944213867 28 9.9907522201538086 28.8 9.9887523651123047 29.6 9.9889307022094727
		 30.4 9.9515008926391602 31.2 9.4578952789306641 32 8.3240251541137695 32.8 6.6226305961608887
		 33.6 4.5148649215698242 34.4 2.2994728088378906 35.2 0.40827116370201111 36 -0.64980179071426392
		 36.8 -0.76978927850723267 37.6 -0.76737624406814575 38.4 -0.76679551601409912 39.2 -0.76807296276092529
		 40 -0.76810294389724731 40.8 -0.76470327377319336 41.6 -0.76066052913665771 42.4 -0.7598908543586731
		 43.2 -0.76186412572860718 44 -0.7649347186088562 44.8 -0.77125883102416992 45.6 -0.78284370899200439
		 46.4 -0.79973536729812622 47.2 -0.82171154022216797 48 -0.84385734796524048 48.8 -0.85608041286468506
		 49.6 -0.85388356447219849 50.4 -0.84386956691741943 51.2 -0.83471250534057617 52 -0.82792818546295166
		 52.8 -0.81976997852325439;
createNode animCurveTA -n "RightHandPinky1_rotateZ";
	rename -uid "6856D118-4D56-A597-D8C7-C8969DB76841";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -20.700774873330449 0.8 -24.359563827514648
		 1.6 -23.70142936706543 2.4 -22.677011489868164 3.2 -21.345252990722656 4 -19.769233703613281
		 4.8 -18.023935317993164 5.6 -16.1900634765625 6.4 -14.356518745422362 7.2 -12.638267517089844
		 8 -11.177865028381348 8.8 -10.108524322509766 9.6 -9.5194501876831055 10.4 -9.4139766693115234
		 11.2 -9.394801139831543 12 -9.3714752197265625 12.8 -9.3617124557495117 13.6 -9.3693017959594727
		 14.4 -9.3913116455078125 15.2 -9.4122705459594727 16 -9.4162101745605469 16.8 -9.4118165969848633
		 17.6 -9.7288455963134766 18.4 -10.532272338867188 19.2 -11.334724426269531 20 -11.85549259185791
		 20.8 -12.064091682434082 21.6 -12.081650733947754 22.4 -12.001156806945801 23.2 -11.068232536315918
		 24 -9.6007356643676758 24.8 -9.4039764404296875 25.6 -9.4057693481445312 26.4 -9.4019184112548828
		 27.2 -9.3950176239013672 28 -9.3830251693725586 28.8 -9.3698520660400391 29.6 -9.366948127746582
		 30.4 -9.4691410064697266 31.2 -10.63929557800293 32 -13.012181282043457 32.8 -16.015274047851562
		 33.6 -19.096771240234375 34.4 -21.778635025024414 35.2 -23.717851638793945 36 -24.691743850708008
		 36.8 -24.810047149658203 37.6 -24.821098327636719 38.4 -24.822772979736328 39.2 -24.818443298339844
		 40 -24.821189880371094 40.8 -24.838111877441406 41.6 -24.857402801513672 42.4 -24.861179351806641
		 43.2 -24.850091934204102 44 -24.83354377746582 44.8 -24.806735992431641 45.6 -24.75811767578125
		 46.4 -24.679676055908203 47.2 -24.571323394775391 48 -24.461681365966797 48.8 -24.40263557434082
		 49.6 -24.414386749267578 50.4 -24.462318420410156 51.2 -24.505935668945312 52 -24.540563583374023
		 52.8 -24.583480834960938;
createNode animCurveTA -n "RightHandPinky2_rotateX";
	rename -uid "33A024B2-45F1-F984-A071-F48C68B615A6";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.2100376037082376 0.8 4.7292594909667969
		 1.6 6.2890095710754395 2.4 8.6997575759887695 3.2 11.764829635620117 4 15.283795356750488
		 4.8 19.050857543945312 5.6 22.859186172485352 6.4 26.512636184692383 7.2 29.830661773681637
		 8 32.640029907226562 8.8 34.757926940917969 9.6 35.986228942871094 10.4 36.245250701904297
		 11.2 36.260700225830078 12 36.251300811767578 12.8 36.223464965820312 13.6 36.195842742919922
		 14.4 36.189735412597656 15.2 36.215206146240234 16 36.251319885253906 16.8 36.261154174804688
		 17.6 34.489574432373047 18.4 29.441110610961914 19.2 22.99683952331543 20 17.231973648071289
		 20.8 14.217264175415039 21.6 13.967997550964355 22.4 16.166961669921875 23.2 32.942214965820312
		 24 48.84130859375 24.8 50.56024169921875 25.6 50.548988342285156 26.4 50.5399169921875
		 27.2 50.528079986572266 28 50.513862609863281 28.8 50.51385498046875 29.6 50.532516479492188
		 30.4 50.290653228759766 31.2 47.217357635498047 32 40.835346221923828 32.8 32.462333679199219
		 33.6 23.366230010986328 34.4 14.810053825378418 35.2 8.1031637191772461 36 4.5529537200927734
		 36.8 4.1580986976623535 37.6 4.1420888900756836 38.4 4.1264410018920898 39.2 4.1362972259521484
		 40 4.1626477241516113 40.8 4.1792945861816406 41.6 4.1739640235900879 42.4 4.1566028594970703
		 43.2 4.1442608833312988 44 4.1423521041870117 44.8 4.1446394920349121 45.6 4.1496295928955078
		 46.4 4.1670584678649902 47.2 4.2007460594177246 48 4.2294840812683105 48.8 4.2282919883728027
		 49.6 4.2090005874633789 50.4 4.2050862312316895 51.2 4.220024585723877 52 4.2276883125305176
		 52.8 4.2128520011901855;
createNode animCurveTA -n "RightHandPinky2_rotateY";
	rename -uid "3978291B-49FF-A91C-BF36-B6A93CA59769";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 4.2970751504879772 0.8 0.056560613214969628
		 1.6 0.047944661229848862 2.4 0.026352895423769951 3.2 -0.015417690388858317 4 -0.083047017455101013
		 4.8 -0.17847490310668945 5.6 -0.29873701930046082 6.4 -0.43613415956497192 7.2 -0.57912123203277588
		 8 -0.71337103843688965 8.8 -0.82240480184555054 9.6 -0.88861042261123657 10.4 -0.90286904573440541
		 11.2 -0.90371137857437134 12 -0.90317940711975098 12.8 -0.90166020393371571 13.6 -0.90014344453811634
		 14.4 -0.89980167150497437 15.2 -0.9012075662612915 16 -0.90319293737411499 16.8 -0.90372294187545787
		 17.6 -0.80819731950759888 18.4 -0.56143587827682495 19.2 -0.30353981256484985 20 -0.1294417679309845
		 20.8 -0.060342088341712952 21.6 -0.055306296795606613 22.4 -0.10328767448663712 23.2 -0.72850561141967773
		 24 -1.7056212425231934 24.8 -1.8307241201400757 25.6 -1.8298897743225095 26.4 -1.8292187452316284
		 27.2 -1.8283504247665405 28 -1.8273007869720459 28.8 -1.8272970914840698 29.6 -1.8286830186843874
		 30.4 -1.8108664751052854 31.2 -1.5906468629837036 32 -1.1709411144256592 32.8 -0.70453810691833496
		 33.6 -0.31652575731277466 34.4 -0.072707735002040863 35.2 0.032623231410980225 36 0.057292286306619644
		 36.8 0.058707583695650094 37.6 0.05874168872833252 38.4 0.058792501688003547 39.2 0.058768525719642646
		 40 0.058678913861513138 40.8 0.058614000678062446 41.6 0.058642745018005378 42.4 0.058694638311862946
		 43.2 0.058736126869916916 44 0.058737732470035553 44.8 0.058727059513330467 45.6 0.058720752596855164
		 46.4 0.058666791766881943 47.2 0.058553565293550491 48 0.058471988886594779 48.8 0.058466207236051566
		 49.6 0.058519814163446419 50.4 0.058531768620014191 51.2 0.058492548763751991 52 0.058467198163270957
		 52.8 0.058521270751953132;
createNode animCurveTA -n "RightHandPinky2_rotateZ";
	rename -uid "11E5D68F-48D3-57F2-0806-F0AC8168F5FF";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -2.8009781982357684 0.8 1.1118395328521729
		 1.6 1.2654545307159424 2.4 1.5023046731948853 3.2 1.8017573356628418 4 2.1422643661499023
		 4.8 2.5014784336090088 5.6 2.8575241565704346 6.4 3.1909389495849609 7.2 3.4856536388397217
		 8 3.7284414768218994 8.8 3.9069724082946773 9.6 4.0086488723754883 10.4 4.0299320220947266
		 11.2 4.0311837196350098 12 4.0304145812988281 12.8 4.0281233787536621 13.6 4.0258588790893555
		 14.4 4.0253682136535645 15.2 4.0274515151977539 16 4.0304040908813477 16.8 4.0312104225158691
		 17.6 3.8845880031585693 18.4 3.4514837265014648 19.2 2.8702442646026611 20 2.3287920951843262
		 20.8 2.0395057201385498 21.6 2.0154309272766113 22.4 2.227025032043457 23.2 3.7541568279266357
		 24 4.9782776832580566 24.8 5.0933346748352051 25.6 5.09259033203125 26.4 5.0920014381408691
		 27.2 5.091212272644043 28 5.090278148651123 28.8 5.0902786254882812 29.6 5.0914950370788574
		 30.4 5.0755395889282227 31.2 4.866185188293457 32 4.3956084251403809 32.8 3.7132763862609863
		 33.6 2.9043011665344238 34.4 2.0966722965240479 35.2 1.443759560585022 36 1.0944569110870361
		 36.8 1.0555223226547241 37.6 1.0539664030075073 38.4 1.0524232387542725 39.2 1.053375244140625
		 40 1.0559730529785156 40.8 1.0576266050338745 41.6 1.0570929050445557 42.4 1.0553869009017944
		 43.2 1.0541635751724243 44 1.053992748260498 44.8 1.054207444190979 45.6 1.054705023765564
		 46.4 1.0564175844192505 47.2 1.0597521066665649 48 1.0625723600387573 48.8 1.062451958656311
		 49.6 1.0605491399765015 50.4 1.0601745843887329 51.2 1.0616333484649658 52 1.062395453453064
		 52.8 1.0609139204025269;
createNode animCurveTA -n "RightHandPinky3_rotateX";
	rename -uid "ECDF1F2D-4603-8DFB-49DD-02BDD5287E8E";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 18.166595458984375 0.8 18.603565216064453
		 1.6 19.817644119262695 2.4 21.690559387207031 3.2 24.065769195556641 4 26.748929977416992
		 4.8 29.577178955078129 5.6 32.437145233154297 6.4 35.207584381103516 7.2 37.743587493896484
		 8 39.897075653076172 8.8 41.51361083984375 9.6 42.431156158447266 10.4 42.590606689453125
		 11.2 42.564830780029297 12 42.549976348876953 12.8 42.559734344482422 13.6 42.580577850341797
		 14.4 42.590114593505859 15.2 42.587959289550781 16 42.585922241210938 16.8 42.583766937255859
		 17.6 39.352588653564453 18.4 30.077280044555668 19.2 18.18315315246582 20 7.5296454429626474
		 20.8 1.9823423624038696 21.6 1.5444096326828003 22.4 3.8596138954162598 23.2 21.517950057983398
		 24 38.259933471679688 24.8 40.0726318359375 25.6 40.062007904052734 26.4 40.042621612548828
		 27.2 40.015510559082031 28 39.996295928955078 28.8 39.990745544433594 29.6 39.994049072265625
		 30.4 39.890304565429688 31.2 38.474704742431641 32 35.486625671386719 32.8 31.520252227783207
		 33.6 27.20878791809082 34.4 23.196889877319336 35.2 20.091257095336914 36 18.455619812011719
		 36.8 18.27039909362793 37.6 18.256187438964844 38.4 18.250028610229492 39.2 18.244472503662109
		 40 18.227813720703125 40.8 18.21748161315918 41.6 18.228416442871094 42.4 18.24146842956543
		 43.2 18.237192153930664 44 18.222618103027344 44.8 18.200620651245117 45.6 18.165618896484375
		 46.4 18.137763977050781 47.2 18.141763687133789 48 18.16334342956543 48.8 18.174083709716797
		 49.6 18.171310424804688 50.4 18.167387008666992 51.2 18.166610717773438 52 18.166393280029297
		 52.8 18.16661262512207;
createNode animCurveTA -n "RightHandPinky3_rotateY";
	rename -uid "D90888CC-42B1-A98C-3BF5-AAAB20A7E802";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.27855849266052246 0.8 -0.29276090860366821
		 1.6 -0.33385413885116577 2.4 -0.40191525220870972 3.2 -0.49624407291412354 4 -0.61343353986740112
		 4.8 -0.74891000986099243 5.6 -0.89802342653274536 6.4 -1.05375075340271 7.2 -1.2057421207427979
		 8 -1.341654896736145 8.8 -1.4476650953292847 9.6 -1.5093441009521484 10.4 -1.5201637744903564
		 11.2 -1.5184048414230347 12 -1.5174052715301514 12.8 -1.5180697441101074 13.6 -1.519469141960144
		 14.4 -1.5201269388198853 15.2 -1.5199911594390869 16 -1.5198541879653931 16.8 -1.5197094678878784
		 17.6 -1.306687593460083 18.4 -0.77410966157913208 19.2 -0.27908933162689209 20 -0.030626485124230385
		 20.8 0.022588366642594337 21.6 0.02452578954398632 22.4 0.010494529269635677 23.2 -0.39540180563926697
		 24 -1.2377536296844482 24.8 -1.352992057800293 25.6 -1.3523050546646118 26.4 -1.3510489463806152
		 27.2 -1.3492895364761353 28 -1.348056435585022 28.8 -1.3476905822753906 29.6 -1.3479005098342896
		 30.4 -1.3412035703659058 31.2 -1.2511847019195557 32 -1.0700480937957764 32.8 -0.84888607263565063
		 33.6 -0.63463455438613892 34.4 -0.46071013808250422 35.2 -0.34344583749771118 36 -0.28791463375091553
		 36.8 -0.28191658854484558 37.6 -0.28145277500152588 38.4 -0.28125137090682983 39.2 -0.28107196092605591
		 40 -0.2805246114730835 40.8 -0.28018563985824585 41.6 -0.28055080771446228 42.4 -0.28098335862159729
		 43.2 -0.28083047270774841 44 -0.28036189079284668 44.8 -0.279664546251297 45.6 -0.27852323651313782
		 46.4 -0.27764114737510681 47.2 -0.27776157855987549 48 -0.27846947312355042 48.8 -0.27878996729850769
		 49.6 -0.27871042490005493 50.4 -0.27858930826187134 51.2 -0.27857306599617004 52 -0.27856218814849854
		 52.8 -0.27855733036994934;
createNode animCurveTA -n "RightHandPinky3_rotateZ";
	rename -uid "580D8B13-4610-3A64-5EC1-C8849F319AB3";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.92713152042106317 0.8 1.3645094633102417
		 1.6 1.4772098064422607 2.4 1.649322509765625 3.2 1.8642585277557373 4 2.1021535396575928
		 4.8 2.3467376232147217 5.6 2.5870096683502197 6.4 2.8124291896820068 7.2 3.0120100975036621
		 8 3.1760952472686768 8.8 3.2958641052246094 9.6 3.3625087738037109 10.4 3.3739778995513916
		 11.2 3.372140645980835 12 3.3710494041442871 12.8 3.3717565536499023 13.6 3.3732573986053467
		 14.4 3.3739416599273682 15.2 3.373781681060791 16 3.3736577033996582 16.8 3.3734824657440186
		 17.6 3.1350688934326172 18.4 2.3892779350280762 19.2 1.3252686262130737 20 0.30421099066734314
		 20.8 -0.24083538353443149 21.6 -0.28403258323669434 22.4 -0.05585101991891861 23.2 1.6335543394088745
		 24 3.0517947673797607 24.8 3.1892454624176025 25.6 3.1884489059448242 26.4 3.1870009899139404
		 27.2 3.1849641799926758 28 3.1835243701934814 28.8 3.1830973625183105 29.6 3.1833579540252686
		 30.4 3.1755859851837158 31.2 3.0682859420776367 32 2.8347189426422119 32.8 2.5107777118682861
		 33.6 2.1423673629760742 34.4 1.7860875129699707 35.2 1.5024865865707397 36 1.3507250547409058
		 36.8 1.3334329128265381 37.6 1.3321042060852051 38.4 1.3315362930297852 39.2 1.3310090303421021
		 40 1.3294450044631958 40.8 1.3284740447998047 41.6 1.329501748085022 42.4 1.3307315111160278
		 43.2 1.3303203582763672 44 1.3289598226547241 44.8 1.326920747756958 45.6 1.3236416578292847
		 46.4 1.3210399150848389 47.2 1.3214105367660522 48 1.3234336376190186 48.8 1.3244218826293945
		 49.6 1.324174165725708 50.4 1.3238092660903931 51.2 1.3237354755401611 52 1.3237160444259644
		 52.8 1.3237366676330566;
createNode animCurveTA -n "LeftUpLeg_rotateX";
	rename -uid "C437A88C-4595-E566-F9CD-CBBBCD6D88B7";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.00042584584001709608 0.8 12.183573722839355
		 1.6 11.805890083312988 2.4 11.411441802978516 3.2 11.167458534240723 4 11.012627601623535
		 4.8 10.927369117736816 5.6 11.041835784912109 6.4 11.318321228027344 7.2 11.670965194702148
		 8 12.054438591003418 8.8 12.434659004211426 9.6 12.759767532348633 10.4 13.0108642578125
		 11.2 13.342477798461914 12 13.967479705810547 12.8 14.965274810791016 13.6 16.28703498840332
		 14.4 17.600784301757812 15.2 18.430717468261719 16 18.756298065185547 16.8 19.072000503540039
		 17.6 19.834438323974609 18.4 20.430564880371094 19.2 20.226232528686523 20 19.815591812133789
		 20.8 20.042070388793945 21.6 21.289892196655273 22.4 23.722507476806641 23.2 26.374042510986328
		 24 28.24506950378418 24.8 29.468473434448239 25.6 30.449628829956055 26.4 30.979793548583981
		 27.2 30.776191711425781 28 29.776624679565433 28.8 28.141706466674805 29.6 26.35540771484375
		 30.4 24.74247932434082 31.2 23.231151580810547 32 21.833690643310547 32.8 20.647356033325195
		 33.6 19.556219100952148 34.4 18.4576416015625 35.2 17.430364608764648 36 16.512908935546875
		 36.8 15.631409645080568 37.6 14.765820503234863 38.4 13.886630058288574 39.2 12.89969539642334
		 40 11.807456016540527 40.8 10.766718864440918 41.6 9.9934234619140625 42.4 9.5406322479248047
		 43.2 9.2449121475219727 44 9.0306100845336914 44.8 9.0025901794433594 45.6 9.1926498413085938
		 46.4 9.489715576171875 47.2 9.8250484466552734 48 10.205536842346191 48.8 10.615912437438965
		 49.6 11.005181312561035 50.4 11.335062980651855 51.2 11.660321235656738 52 12.038917541503906
		 52.8 12.406379699707031;
createNode animCurveTA -n "LeftUpLeg_rotateY";
	rename -uid "A995A076-45EB-ABF5-DB8C-E9AF7983103A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -3.589301464096248 0.8 -16.008668899536133
		 1.6 -15.995713233947752 2.4 -16.018991470336914 3.2 -16.075752258300781 4 -16.221923828125
		 4.8 -16.479545593261719 5.6 -16.764307022094727 6.4 -17.032924652099609 7.2 -17.34648323059082
		 8 -17.740432739257812 8.8 -18.170280456542969 9.6 -18.63148307800293 10.4 -19.200201034545898
		 11.2 -19.869819641113281 12 -20.465137481689453 12.8 -20.645092010498047 13.6 -20.017095565795898
		 14.4 -18.549201965332031 15.2 -16.680442810058594 16 -14.920162200927734 16.8 -13.631649017333984
		 17.6 -13.064741134643555 18.4 -13.320120811462402 19.2 -14.005532264709473 20 -14.352392196655273
		 20.8 -14.158738136291504 21.6 -13.92041015625 22.4 -13.707565307617188 23.2 -13.152396202087402
		 24 -12.395126342773438 24.8 -11.763391494750977 25.6 -11.161661148071289 26.4 -10.514086723327637
		 27.2 -10.011429786682129 28 -9.7957925796508789 28.8 -9.8615179061889648 29.6 -10.107378005981445
		 30.4 -10.436739921569824 31.2 -10.853371620178223 32 -11.363615989685059 32.8 -11.853062629699707
		 33.6 -12.189887046813965 34.4 -12.424967765808105 35.2 -12.725994110107422 36 -13.116592407226562
		 36.8 -13.487117767333984 37.6 -13.790738105773926 38.4 -14.040964126586914 39.2 -14.24531364440918
		 40 -14.457930564880371 40.8 -14.752669334411621 41.6 -15.101968765258787 42.4 -15.396709442138672
		 43.2 -15.589789390563965 44 -15.728328704833984 44.8 -15.856657981872559 45.6 -15.967930793762207
		 46.4 -16.043071746826172 47.2 -16.093196868896484 48 -16.146961212158203 48.8 -16.183856964111328
		 49.6 -16.158693313598633 50.4 -16.101896286010742 51.2 -16.08399772644043 52 -16.092803955078125
		 52.8 -16.057662963867188;
createNode animCurveTA -n "LeftUpLeg_rotateZ";
	rename -uid "F34FED95-4CF3-940E-E06B-6B88E0C59B1B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -0.69467258037549762 0.8 7.1697406768798828
		 1.6 7.2068438529968271 2.4 7.2947239875793466 3.2 7.3865818977355957 4 7.4392619132995597
		 4.8 7.4560489654541007 5.6 7.435478687286377 6.4 7.3331623077392578 7.2 7.1598334312438965
		 8 6.9527597427368164 8.8 6.6757311820983887 9.6 6.2858867645263672 10.4 5.8493094444274902
		 11.2 5.495302677154541 12 5.2811756134033203 12.8 5.1097278594970703 13.6 4.8994770050048828
		 14.4 4.7777876853942871 15.2 4.8695845603942871 16 5.2024984359741211 16.8 5.7256770133972168
		 17.6 6.1836671829223633 18.4 6.5956854820251465 19.2 7.0636153221130371 20 7.4193801879882812
		 20.8 7.1670737266540527 21.6 6.7733302116394043 22.4 6.7658977508544922 23.2 6.7013921737670898
		 24 6.1100635528564453 24.8 5.2170815467834473 25.6 4.4002799987792969 26.4 3.7113749980926509
		 27.2 3.1261038780212402 28 2.7567121982574463 28.8 2.6384882926940918 29.6 2.6364130973815918
		 30.4 2.6112329959869385 31.2 2.558401346206665 32 2.5746383666992188 32.8 2.7021498680114746
		 33.6 2.8872497081756592 34.4 3.1208562850952148 35.2 3.5116207599639893 36 4.0923199653625488
		 36.8 4.6944513320922852 37.6 5.1648283004760742 38.4 5.4977946281433105 39.2 5.747347354888916
		 40 5.9627876281738281 40.8 6.1879162788391113 41.6 6.4486861228942871 42.4 6.6964302062988281
		 43.2 6.8450942039489746 44 6.9043436050415039 44.8 6.9597601890563965 45.6 7.045992374420166
		 46.4 7.1341357231140137 47.2 7.2023534774780282 48 7.2627830505371094 48.8 7.3067188262939444
		 49.6 7.2934746742248535 50.4 7.2387657165527335 51.2 7.2127890586853027 52 7.2163715362548837
		 52.8 7.1794047355651847;
createNode animCurveTA -n "LeftLeg_rotateX";
	rename -uid "BCE8E6DD-46D0-6370-790B-7ABA337DB0AE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -12.883396148681641 0.8 -12.360173225402832
		 1.6 -11.793988227844238 2.4 -11.423226356506348 3.2 -11.51175594329834 4 -11.99474048614502
		 4.8 -12.713079452514648 5.6 -13.81889820098877 6.4 -15.160925865173342 7.2 -16.624776840209961
		 8 -18.313913345336914 8.8 -20.304231643676758 9.6 -22.541646957397461 10.4 -25.031791687011719
		 11.2 -27.897809982299805 12 -31.115440368652344 12.8 -34.226325988769531 13.6 -36.578025817871094
		 14.4 -37.759212493896484 15.2 -37.620079040527344 16 -36.238491058349609 16.8 -34.260505676269531
		 17.6 -32.207412719726562 18.4 -30.043922424316406 19.2 -26.979621887207031 20 -22.996383666992188
		 20.8 -18.847143173217773 21.6 -16.517250061035156 22.4 -18.214662551879883 23.2 -22.366600036621094
		 24 -25.621313095092773 24.8 -27.034797668457031 25.6 -27.625146865844727 26.4 -27.902791976928711
		 27.2 -27.663473129272461 28 -26.907932281494141 28.8 -25.998701095581055 29.6 -25.337112426757812
		 30.4 -24.952474594116211 31.2 -24.469436645507812 32 -23.66827392578125 32.8 -22.679750442504883
		 33.6 -21.584247589111328 34.4 -20.316883087158203 35.2 -18.918811798095703 36 -17.522205352783203
		 36.8 -16.124404907226562 37.6 -14.68153667449951 38.4 -13.147418022155762 39.2 -11.457674980163574
		 40 -9.7046403884887695 40.8 -8.2047395706176758 41.6 -7.3000226020812997 42.4 -6.9125542640686035
		 43.2 -6.610084056854248 44 -6.3194026947021484 44.8 -6.3683404922485352 45.6 -6.8705382347106934
		 46.4 -7.606377124786377 47.2 -8.4072961807250977 48 -9.2499284744262695 48.8 -10.075552940368652
		 49.6 -10.78594970703125 50.4 -11.368711471557617 51.2 -11.911852836608887 52 -12.439228057861328
		 52.8 -12.883485794067383;
createNode animCurveTA -n "LeftLeg_rotateY";
	rename -uid "3AD3B08B-41CB-2E67-1E2D-84A9E24633E1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 3.0781025886535645 0.8 1.2718123197555542
		 1.6 -0.94633233547210682 2.4 -3.6249995231628418 3.2 -6.453181266784668 4 -8.6889944076538086
		 4.8 -9.1761293411254883 5.6 -9.1297721862792969 6.4 -9.070744514465332 7.2 -9.0345964431762695
		 8 -9.025299072265625 8.8 -9.0427131652832031 9.6 -9.1344089508056641 10.4 -9.3810653686523438
		 11.2 -9.7753305435180664 12 -10.134448051452637 12.8 -10.139444351196289 13.6 -9.4992856979370117
		 14.4 -8.3017759323120117 15.2 -7.0741147994995117 16 -6.2506890296936035 16.8 -5.513852596282959
		 17.6 -1.207740306854248 18.4 2.0094926357269287 19.2 2.8723914623260498 20 3.7739768028259277
		 20.8 5.176966667175293 21.6 6.4399137496948242 22.4 7.0864672660827637 23.2 7.2823586463928223
		 24 7.2841858863830566 24.8 7.0539760589599609 25.6 6.891392707824707 26.4 6.9592065811157227
		 27.2 7.1083769798278809 28 7.2404007911682129 28.8 7.3284597396850586 29.6 7.3655056953430176
		 30.4 7.3349614143371573 31.2 7.2665023803710938 32 7.2304677963256845 32.8 7.2543625831604004
		 33.6 7.3738698959350595 34.4 7.4680347442626953 35.2 7.1341667175292969 36 6.3831701278686523
		 36.8 5.6703305244445801 37.6 5.0703744888305664 38.4 4.4155287742614746 39.2 3.7472357749938965
		 40 3.1944599151611328 40.8 2.7154781818389893 41.6 2.2478494644165039 42.4 1.8602344989776614
		 43.2 1.6241608858108521 44 1.5251616239547729 44.8 1.5295068025588989 45.6 1.6110787391662598
		 46.4 1.7322419881820679 47.2 1.8863823413848875 48 2.1023235321044922 48.8 2.3453569412231445
		 49.6 2.5312066078186035 50.4 2.6594760417938232 51.2 2.8056907653808594 52 2.9704525470733643
		 52.8 3.078113317489624;
createNode animCurveTA -n "LeftLeg_rotateZ";
	rename -uid "D41379BD-46CA-66B3-3D60-91A35516F6C9";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -3.5428445766821488 0.8 3.4484982490539551
		 1.6 3.8703939914703374 2.4 4.315345287322998 3.2 4.7285261154174805 4 4.9693303108215332
		 4.8 4.879427433013916 5.6 4.777982234954834 6.4 4.7041821479797363 7.2 4.5455765724182129
		 8 4.3078503608703613 8.8 4.0290842056274414 9.6 3.6256189346313472 10.4 2.9789674282073975
		 11.2 2.2348737716674805 12 1.8144696950912476 12.8 2.1015636920928955 13.6 3.23140549659729
		 14.4 4.9250454902648926 15.2 6.595001220703125 16 7.8742928504943839 16.8 8.4713649749755859
		 17.6 6.1625204086303711 18.4 3.8040482997894283 19.2 2.6777658462524414 20 2.2156939506530762
		 20.8 2.0264091491699219 21.6 1.7462440729141235 22.4 1.4118757247924805 23.2 1.1767455339431763
		 24 0.92511427402496349 24.8 0.6608881950378418 25.6 0.52181714773178101 26.4 0.49846243858337408
		 27.2 0.51747000217437744 28 0.63584113121032715 28.8 0.85852056741714478 29.6 1.0328727960586548
		 30.4 1.0540794134140015 31.2 0.91883689165115368 32 0.72624468803405762 32.8 0.65590459108352661
		 33.6 0.74830597639083862 34.4 0.93400681018829357 35.2 1.269741415977478 36 1.7479041814804077
		 36.8 2.214590311050415 37.6 2.5950446128845215 38.4 2.9291677474975586 39.2 3.2520716190338135
		 40 3.5016858577728271 40.8 3.6008355617523193 41.6 3.5839343070983887 42.4 3.5507352352142334
		 43.2 3.5230131149291992 44 3.4692034721374512 44.8 3.3989014625549316 45.6 3.3435618877410889
		 46.4 3.3100142478942871 47.2 3.2740926742553711 48 3.2138311862945557 48.8 3.1568598747253418
		 49.6 3.1412243843078613 50.4 3.1417903900146484 51.2 3.110701322555542 52 3.0636782646179199
		 52.8 3.0526440143585205;
createNode animCurveTA -n "LeftFoot_rotateX";
	rename -uid "7488E78F-44FB-BBDB-63F7-1C8EE1E707BC";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -1.3915368318557739 0.8 -1.684449315071106
		 1.6 -1.9924476146697998 2.4 -2.2136547565460205 3.2 -2.2040443420410156 4 -1.9443002939224243
		 4.8 -1.5466108322143555 5.6 -1.0249003171920776 6.4 -0.35350883007049561 7.2 0.50674545764923096
		 8 1.6269124746322632 8.8 2.9627683162689209 9.6 4.4430241584777832 10.4 6.1637163162231445
		 11.2 8.2851896286010742 12 10.740021705627441 12.8 13.082084655761719 13.6 14.743680000305176
		 14.4 15.48617362976074 15.2 15.356816291809084 16 14.240154266357422 16.8 12.213144302368164
		 17.6 8.865138053894043 18.4 4.284818172454834 19.2 -0.14254140853881836 20 -4.4921927452087402
		 20.8 -8.0927801132202148 21.6 -8.8309288024902344 22.4 -5.3756599426269531 23.2 -0.27559593319892883
		 24 3.2973294258117676 24.8 5.2549686431884766 25.6 6.2088513374328613 26.4 6.5011296272277832
		 27.2 6.4189043045043945 28 6.2500476837158203 28.8 6.1725306510925293 29.6 6.2379074096679688
		 30.4 6.3728628158569336 31.2 6.3806161880493164 32 6.146756649017334 32.8 5.7265720367431641
		 33.6 5.1645040512084961 34.4 4.4334287643432617 35.2 3.584144115447998 36 2.7117235660552979
		 36.8 1.8162963390350344 37.6 0.87584394216537476 38.4 -0.10794271528720856 39.2 -1.1340194940567017
		 40 -2.1465790271759033 40.8 -3.0062558650970459 41.6 -3.5598301887512207 42.4 -3.8470873832702637
		 43.2 -4.0818114280700684 44 -4.2995853424072266 44.8 -4.3348579406738281 45.6 -4.1316943168640137
		 46.4 -3.8036830425262451 47.2 -3.4383201599121094 48 -3.052016019821167 48.8 -2.6740689277648926
		 49.6 -2.3499500751495361 50.4 -2.0801043510437012 51.2 -1.8253082036972048 52 -1.5854296684265137
		 52.8 -1.3914932012557983;
createNode animCurveTA -n "LeftFoot_rotateY";
	rename -uid "F2748F53-4B55-486A-9B7C-068D01A81097";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -5.1001863479614258 0.8 -5.2198505401611328
		 1.6 -5.3374242782592773 2.4 -5.4289774894714355 3.2 -5.6021294593811035 4 -6.2433013916015625
		 4.8 -8.0629129409790039 5.6 -10.235992431640625 6.4 -12.280270576477051 7.2 -14.018980979919434
		 8 -15.510505676269531 8.8 -17.071317672729492 9.6 -18.821989059448242 10.4 -20.431509017944336
		 11.2 -21.545675277709961 12 -22.077207565307617 12.8 -21.984382629394531 13.6 -21.058874130249023
		 14.4 -19.058788299560547 15.2 -15.97081470489502 16 -11.81683349609375 16.8 -6.871638298034668
		 17.6 -4.2787985801696777 18.4 -1.553267240524292 19.2 2.4699921607971191 20 5.3797731399536133
		 20.8 7.4459571838378915 21.6 9.3945083618164062 22.4 10.965665817260742 23.2 11.706920623779297
		 24 11.734903335571289 24.8 11.99150562286377 25.6 12.277890205383301 26.4 12.134218215942383
		 27.2 11.645873069763184 28 10.769845962524414 28.8 9.4265203475952148 29.6 7.8259234428405762
		 30.4 6.2188496589660645 31.2 4.686948299407959 32 3.2613518238067627 32.8 1.8892087936401367
		 33.6 0.3934323787689209 34.4 -1.119570255279541 35.2 -2.1982231140136719 36 -2.8009910583496094
		 36.8 -3.2875435352325439 37.6 -3.7580358982086177 38.4 -4.1573433876037598 39.2 -4.4848175048828125
		 40 -4.7302212715148926 40.8 -4.8810715675354004 41.6 -4.971595287322998 42.4 -5.0322985649108887
		 43.2 -5.0647554397583008 44 -5.0750446319580078 44.8 -5.0805974006652832 45.6 -5.090733528137207
		 46.4 -5.1058135032653809 47.2 -5.1181411743164062 48 -5.1187648773193359 48.8 -5.1142854690551758
		 49.6 -5.1152186393737793 50.4 -5.1160640716552734 51.2 -5.1097412109375 52 -5.1019048690795898
		 52.8 -5.1001925468444824;
createNode animCurveTA -n "LeftFoot_rotateZ";
	rename -uid "92AB8DAF-4122-FA47-3E0A-C6A8D80C8ECB";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -4.8391209162095228 0.8 -3.4425888061523438
		 1.6 -3.5258152484893799 2.4 -3.6536943912506104 3.2 -3.6299178600311279 4 -2.9345293045043945
		 4.8 -0.84853315353393555 5.6 1.4902851581573486 6.4 3.6287388801574703 7.2 5.4779443740844727
		 8 7.0760636329650879 8.8 8.6672468185424805 9.6 10.385021209716797 10.4 11.958391189575195
		 11.2 12.939971923828125 12 13.087550163269043 12.8 12.44588565826416 13.6 11.175859451293945
		 14.4 9.2920236587524414 15.2 6.6955008506774902 16 3.0271344184875488 16.8 -1.8622292280197146
		 17.6 -4.3773455619812012 18.4 -7.310359001159668 19.2 -10.162787437438965 20 -11.931713104248047
		 20.8 -13.150915145874023 21.6 -14.68654727935791 22.4 -15.431632995605471 23.2 -14.274460792541504
		 24 -12.516204833984375 24.8 -11.296648025512695 25.6 -10.628549575805664 26.4 -10.130133628845215
		 27.2 -9.5569047927856445 28 -8.7433643341064453 28.8 -7.6454434394836426 29.6 -6.404515266418457
		 30.4 -5.1253209114074707 31.2 -3.9289166927337646 32 -2.980825662612915 32.8 -2.2825465202331543
		 33.6 -1.6429646015167236 34.4 -1.0892372131347656 35.2 -1.0399930477142334 36 -1.5152431726455688
		 36.8 -2.0437524318695068 37.6 -2.4446415901184082 38.4 -2.7802627086639404 39.2 -3.0654516220092773
		 40 -3.2703609466552734 40.8 -3.383411169052124 41.6 -3.4374375343322754 42.4 -3.4701597690582275
		 43.2 -3.48836350440979 44 -3.4845538139343262 44.8 -3.4661068916320801 45.6 -3.4522309303283691
		 46.4 -3.4509539604187012 47.2 -3.4489815235137939 48 -3.4339771270751953 48.8 -3.4147970676422119
		 49.6 -3.403609037399292 50.4 -3.3944563865661621 51.2 -3.3782229423522949 52 -3.3592867851257324
		 52.8 -3.3457045555114746;
createNode animCurveTA -n "LeftToeBase_rotateX";
	rename -uid "88FFEF0A-47C0-77CA-A0BA-5288C224F196";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.0056873722466722e-16 0.8 -1.7298623323440552
		 1.6 -1.7396016120910645 2.4 -1.7476978302001953 3.2 -1.7644253969192505 4 -1.7885210514068604
		 4.8 -1.7576078176498413 5.6 -1.6556655168533325 6.4 -1.584558367729187 7.2 -1.5873017311096191
		 8 -1.6514593362808228 8.8 -1.7312841415405273 9.6 -1.8166148662567139 10.4 -1.9285188913345335
		 11.2 -2.0628840923309326 12 -2.1861846446990967 12.8 -2.2363967895507812 13.6 -2.1570212841033936
		 14.4 -1.9166451692581177 15.2 -1.4685182571411133 16 -0.61072945594787598 16.8 0.71966326236724854
		 17.6 2.8798050880432129 18.4 5.4575319290161133 19.2 7.5346255302429199 20 8.5031719207763672
		 20.8 8.5276880264282227 21.6 7.3221220970153809 22.4 4.5423483848571777 23.2 1.7580652236938477
		 24 0.054040130227804184 24.8 -1.0981286764144897 25.6 -1.74109947681427 26.4 -1.903769850730896
		 27.2 -1.8936203718185427 28 -1.8895922899246216 28.8 -1.8972550630569458 29.6 -1.9035102128982542
		 30.4 -1.9046251773834231 31.2 -1.9057730436325073 32 -1.9113061428070068 32.8 -1.9131640195846558
		 33.6 -1.911683917045593 34.4 -1.9107518196105957 35.2 -1.9099845886230469 36 -1.9045852422714236
		 36.8 -1.8969904184341433 37.6 -1.8905274868011475 38.4 -1.8845371007919312 39.2 -1.8762469291687012
		 40 -1.868530750274658 40.8 -1.860864520072937 41.6 -1.8512471914291382 42.4 -1.8430962562561037
		 43.2 -1.8355321884155273 44 -1.8259282112121582 44.8 -1.8163290023803711 45.6 -1.8076561689376831
		 46.4 -1.7981662750244141 47.2 -1.7893140316009521 48 -1.7804286479949951 48.8 -1.7716281414031982
		 49.6 -1.7628636360168457 50.4 -1.7538983821868896 51.2 -1.7450113296508789 52 -1.7365994453430176
		 52.8 -1.7278636693954468;
createNode animCurveTA -n "LeftToeBase_rotateY";
	rename -uid "D04E0F9B-45A9-5EC0-9678-6594268AA946";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 8.7722001120606699 0.8 0.20484465360641479
		 1.6 0.20600178837776184 2.4 0.20696763694286346 3.2 0.20895428955554962 4 0.2118166983127594
		 4.8 0.20814108848571777 5.6 0.19603492319583893 6.4 0.18759405612945557 7.2 0.18791553378105164
		 8 0.19554023444652557 8.8 0.20501613616943359 9.6 0.21515642106533051 10.4 0.22845058143138883
		 11.2 0.24442420899868011 12 0.25908756256103516 12.8 0.26505982875823975 13.6 0.25562113523483276
		 14.4 0.22704148292541504 15.2 0.17382296919822693 16 0.072172477841377258 16.8 -0.084829472005367279
		 17.6 -0.3378942608833313 18.4 -0.63641220331192017 19.2 -0.79193824529647827 20 -0.79423403739929199
		 20.8 -0.8884894847869873 21.6 -0.84966540336608887 22.4 -0.53089606761932373 23.2 -0.20678380131721497
		 24 -0.0063769151456654072 24.8 0.12989044189453125 25.6 0.20618343353271484 26.4 0.2255094796419144
		 27.2 0.22430217266082764 28 0.22382421791553497 28.8 0.22473375499248505 29.6 0.22547923028469083
		 30.4 0.22561074793338778 31.2 0.22574828565120694 32 0.22640267014503479 32.8 0.22662481665611267
		 33.6 0.22644956409931183 34.4 0.22634001076221466 35.2 0.2262459397315979 36 0.22560746967792514
		 36.8 0.22470115125179294 37.6 0.22393244504928589 38.4 0.22322513163089752 39.2 0.22223830223083496
		 40 0.22131805121898651 40.8 0.22040809690952301 41.6 0.21927124261856079 42.4 0.21829898655414581
		 43.2 0.21739999949932098 44 0.21625827252864838 44.8 0.2151210606098175 45.6 0.21408815681934357
		 46.4 0.21296420693397522 47.2 0.21190649271011353 48 0.21085020899772644 48.8 0.20980656147003174
		 49.6 0.20876778662204742 50.4 0.20770357549190521 51.2 0.20664352178573608 52 0.20564864575862885
		 52.8 0.20461489260196686;
createNode animCurveTA -n "LeftToeBase_rotateZ";
	rename -uid "942216FE-49CC-C2E3-1310-63936AF0190F";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -5.8762500319725168 0.8 0.041596397757530212
		 1.6 0.041810899972915649 2.4 0.0419936403632164 3.2 0.042357750236988068 4 0.042898744344711304
		 4.8 0.042204268276691437 5.6 0.039939969778060913 6.4 0.038329467177391052 7.2 0.038393706083297729
		 8 0.039850037544965744 8.8 0.041631441563367844 9.6 0.04352179542183876 10.4 0.045963533222675323
		 11.2 0.048886731266975403 12 0.051528859883546829 12.8 0.052595846354961395 13.6 0.05091027170419693
		 14.4 0.045716870576143265 15.2 0.035697970539331436 16 0.015391558408737181 16.8 -0.019123982638120651
		 17.6 -0.082879543304443359 18.4 -0.17137596011161804 19.2 -0.23889428377151492 20 -0.2590961754322052
		 20.8 -0.27632856369018555 21.6 -0.24369072914123535 22.4 -0.13842345774173737 23.2 -0.048583652824163437
		 24 -0.0014018468791618943 24.8 0.027113387361168861 25.6 0.041841842234134674 26.4 0.045427247881889343
		 27.2 0.045206859707832336 28 0.045117609202861786 28.8 0.045286897569894791 29.6 0.04542246088385582
		 30.4 0.0454513318836689 31.2 0.045473601669073105 32 0.04559553787112236 32.8 0.04563971608877182
		 33.6 0.045600734651088715 34.4 0.045584697276353836 35.2 0.04555998370051384 36 0.045452844351530075
		 36.8 0.045284874737262726 37.6 0.045141004025936127 38.4 0.045012570917606354 39.2 0.044826436787843704
		 40 0.044648807495832443 40.8 0.04449104517698288 41.6 0.044278141111135483 42.4 0.044094737619161606
		 43.2 0.043931398540735245 44 0.043721765279769897 44.8 0.043507076799869537 45.6 0.043318923562765121
		 46.4 0.043111372739076614 47.2 0.042907077819108963 48 0.042712416499853134 48.8 0.042520921677350998
		 49.6 0.042324267327785492 50.4 0.042123954743146896 51.2 0.041924234479665756 52 0.041741680353879929
		 52.8 0.041547562927007675;
createNode animCurveTA -n "RightUpLeg_rotateX";
	rename -uid "883D977D-4C7D-C845-317D-AAAF7090FC13";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 8.7741489410400391 0.8 9.8135051727294922
		 1.6 10.91473388671875 2.4 12.119891166687012 3.2 13.480977058410645 4 14.939149856567381
		 4.8 16.368829727172852 5.6 17.693964004516602 6.4 18.894931793212891 7.2 19.932302474975586
		 8 20.801122665405273 8.8 21.702447891235352 9.6 22.856788635253906 10.4 24.20622444152832
		 11.2 25.524629592895508 12 26.562503814697266 12.8 26.903203964233398 13.6 25.951766967773438
		 14.4 23.350645065307617 15.2 19.64166259765625 16 15.106162071228027 16.8 9.7608156204223633
		 17.6 5.2809252738952637 18.4 4.1459364891052246 19.2 5.6952948570251465 20 7.8851275444030762
		 20.8 9.8093109130859375 21.6 11.322031021118164 22.4 11.530251502990723 23.2 11.342267990112305
		 24 11.08197021484375 24.8 10.81589412689209 25.6 10.204499244689941 26.4 9.382878303527832
		 27.2 8.9069862365722656 28 8.5386991500854492 28.8 8.0669183731079102 29.6 7.7240262031555185
		 30.4 7.4713954925537118 31.2 7.0981316566467285 32 6.6152777671813965 32.8 6.1082334518432617
		 33.6 5.6208682060241699 34.4 5.3394527435302734 35.2 5.2760639190673828 36 5.1839771270751953
		 36.8 5.0880336761474609 37.6 5.4165740013122559 38.4 6.2400503158569336 39.2 6.8347282409667969
		 40 7.1014766693115234 40.8 7.2707724571228027 41.6 7.4972286224365234 42.4 7.7025623321533194
		 43.2 7.8668365478515625 44 8.0203695297241211 44.8 8.1350440979003906 45.6 8.1839151382446289
		 46.4 8.2014446258544922 47.2 8.2270135879516602 48 8.2560577392578125 48.8 8.2904911041259766
		 49.6 8.3585987091064453 50.4 8.4427528381347656 51.2 8.5214881896972656 52 8.6304740905761719
		 52.8 8.7742824554443359;
createNode animCurveTA -n "RightUpLeg_rotateY";
	rename -uid "FA462EF1-4D26-A400-8DC8-6D9B75210900";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 7.3474535942077637 0.8 7.2770700454711914
		 1.6 7.2877883911132812 2.4 7.4209542274475098 3.2 7.5745716094970712 4 7.5585212707519531
		 4.8 7.3360176086425781 5.6 7.0673518180847168 6.4 6.8596248626708984 7.2 6.6472058296203613
		 8 6.3714499473571777 8.8 6.0350265502929688 9.6 5.5921139717102051 10.4 5.0591545104980469
		 11.2 4.6326675415039062 12 4.5153312683105469 12.8 4.8516521453857422 13.6 5.6289548873901367
		 14.4 6.5933356285095215 15.2 7.6432523727416992 16 8.7198247909545898 16.8 9.0869083404541016
		 17.6 8.3744373321533203 18.4 7.4330940246582031 19.2 7.0998950004577637 20 7.177165985107421
		 20.8 7.2927846908569336 21.6 7.4703369140625 22.4 7.6194038391113281 23.2 7.7157068252563468
		 24 7.8872566223144531 24.8 8.0094156265258789 25.6 7.7488155364990243 26.4 7.3057913780212402
		 27.2 7.2298731803894043 28 7.5658273696899423 28.8 7.9339356422424316 29.6 8.1613616943359375
		 30.4 8.3564329147338867 31.2 8.5913600921630859 32 8.7770624160766602 32.8 8.8233261108398438
		 33.6 8.7553348541259766 34.4 8.6266412734985352 35.2 8.4480772018432617 36 8.2591571807861328
		 36.8 8.1191377639770508 37.6 7.989018440246582 38.4 7.8156332969665527 39.2 7.6814370155334464
		 40 7.6536107063293457 40.8 7.6655292510986319 41.6 7.6345267295837411 42.4 7.5696978569030762
		 43.2 7.5170621871948251 44 7.4923739433288574 44.8 7.4828929901123047 45.6 7.4619693756103516
		 46.4 7.4205503463745117 47.2 7.3910741806030273 48 7.3905491828918457 48.8 7.3925914764404297
		 49.6 7.3927769660949698 50.4 7.4087429046630859 51.2 7.4112153053283691 52 7.374934196472168
		 52.8 7.3474512100219727;
createNode animCurveTA -n "RightUpLeg_rotateZ";
	rename -uid "EED0A8DE-42E1-4CF8-64A8-AD8CA4C4ADE9";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 6.1053557395935059 0.8 6.1193833351135254
		 1.6 6.0992445945739746 2.4 6.0400738716125488 3.2 5.9594945907592773 4 5.893343448638916
		 4.8 5.896327018737793 5.6 5.9537525177001953 6.4 5.9732747077941895 7.2 5.9072103500366211
		 8 5.7395625114440918 8.8 5.4567313194274902 9.6 5.0591268539428711 10.4 4.5160150527954102
		 11.2 3.8317811489105225 12 3.1512789726257324 12.8 2.605266809463501 13.6 2.2934517860412598
		 14.4 2.250446081161499 15.2 2.5013191699981689 16 2.9674017429351807 16.8 3.9620766639709473
		 17.6 5.5116848945617676 18.4 6.8138670921325684 19.2 7.8282027244567871 20 8.7604713439941406
		 20.8 9.3662567138671875 21.6 9.3735857009887695 22.4 9.736332893371582 23.2 9.5067510604858398
		 24 9.1333436965942383 24.8 9.2678604125976562 25.6 9.89276123046875 26.4 10.230247497558594
		 27.2 9.8313961029052734 28 8.9833974838256836 28.8 8.1379423141479492 29.6 7.418043613433837
		 30.4 6.6773386001586914 31.2 5.866386890411377 32 5.198723316192627 32.8 4.8523507118225098
		 33.6 4.6989235877990723 34.4 4.5289626121520996 35.2 4.4577674865722656 36 4.6653809547424316
		 36.8 4.9464950561523438 37.6 5.1893749237060547 38.4 5.427739143371582 39.2 5.6038084030151367
		 40 5.6943588256835938 40.8 5.7162752151489258 41.6 5.7456603050231934 42.4 5.8170599937438965
		 43.2 5.8691000938415527 44 5.8689179420471191 44.8 5.8658866882324219 45.6 5.9015703201293945
		 46.4 5.9588241577148438 47.2 5.9999847412109375 48 6.0262846946716309 48.8 6.0559735298156738
		 49.6 6.0639433860778809 50.4 6.0345010757446289 51.2 6.0293087959289551 52 6.0783195495605469
		 52.8 6.1053524017333984;
createNode animCurveTA -n "RightLeg_rotateX";
	rename -uid "DFE25FA2-4365-78D5-0671-C99B641A910A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -20.834609985351562 0.8 -21.140174865722656
		 1.6 -21.392848968505859 2.4 -21.626203536987305 3.2 -21.915075302124023 4 -22.227727890014648
		 4.8 -22.465925216674805 5.6 -22.59382438659668 6.4 -22.680196762084961 7.2 -22.751686096191406
		 8 -22.84820556640625 8.8 -23.196569442749023 9.6 -24.067026138305664 10.4 -25.498790740966797
		 11.2 -27.329639434814453 12 -29.263181686401367 12.8 -30.698909759521488 13.6 -30.861627578735348
		 14.4 -29.320035934448246 15.2 -26.740234375 16 -23.14445686340332 16.8 -17.680784225463867
		 17.6 -12.477333068847656 18.4 -12.307746887207031 19.2 -16.218759536743164 20 -20.375804901123047
		 20.8 -23.192630767822266 21.6 -25.129911422729492 22.4 -25.508001327514648 23.2 -25.787448883056641
		 24 -25.731266021728516 24.8 -24.75347900390625 25.6 -22.555683135986328 26.4 -20.360296249389648
		 27.2 -19.487157821655273 28 -19.286127090454102 28.8 -19.253894805908203 29.6 -19.59889030456543
		 30.4 -20.025077819824219 31.2 -20.034980773925781 32 -19.483892440795898 32.8 -18.522102355957031
		 33.6 -17.459493637084961 34.4 -16.714006423950195 35.2 -16.225528717041016 36 -15.628966331481934
		 36.8 -15.093024253845217 37.6 -15.357900619506834 38.4 -16.476541519165039 39.2 -17.236709594726562
		 40 -17.596035003662109 40.8 -17.881200790405273 41.6 -18.235515594482422 42.4 -18.504182815551758
		 43.2 -18.702693939208984 44 -18.906068801879883 44.8 -19.079414367675781 45.6 -19.207880020141602
		 46.4 -19.358877182006836 47.2 -19.564615249633789 48 -19.785152435302734 48.8 -19.993244171142578
		 49.6 -20.210975646972656 50.4 -20.430566787719727 51.2 -20.599033355712891 52 -20.716569900512695
		 52.8 -20.834877014160156;
createNode animCurveTA -n "RightLeg_rotateY";
	rename -uid "AD7A7F49-4CE2-BD0E-AFE3-63AA61CBEFCE";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 7.4790239334106445 0.8 7.0738587379455566
		 1.6 6.6190457344055176 2.4 6.2490854263305664 3.2 5.5090947151184082 4 3.7858424186706543
		 4.8 1.5882667303085327 5.6 -0.4748975932598114 6.4 -2.3407454490661621 7.2 -3.9191393852233887
		 8 -5.2762541770935059 8.8 -6.8405666351318359 9.6 -8.4470138549804688 10.4 -9.1850700378417969
		 11.2 -9.2762603759765625 12 -9.2045011520385742 12.8 -9.1532278060913086 13.6 -9.0208864212036133
		 14.4 -7.6378307342529297 15.2 -2.8006021976470947 16 4.0292797088623047 16.8 8.9013528823852539
		 17.6 9.6454839706420898 18.4 9.698887825012207 19.2 9.6369485855102539 20 9.7153434753417969
		 20.8 9.8107614517211914 21.6 9.8612546920776367 22.4 9.7110710144042969 23.2 9.4875831604003906
		 24 9.3869867324829102 24.8 9.2999439239501953 25.6 9.063807487487793 26.4 8.8516807556152344
		 27.2 8.772221565246582 28 8.8019685745239258 28.8 8.854853630065918 29.6 8.8419218063354492
		 30.4 8.7968931198120117 31.2 8.7967424392700195 32 8.8513422012329102 32.8 8.8947820663452148
		 33.6 8.9039907455444336 34.4 8.8655223846435547 35.2 8.7145605087280273 36 8.6831264495849609
		 36.8 8.6956167221069336 37.6 8.6678457260131836 38.4 8.6003503799438477 39.2 8.5483551025390625
		 40 8.5479764938354492 40.8 8.5494260787963867 41.6 8.3235769271850586 42.4 7.8321194648742685
		 43.2 7.4289913177490225 44 7.2190990447998056 44.8 7.0701427459716797 45.6 6.9688267707824707
		 46.4 6.9361343383789062 47.2 6.9377202987670898 48 6.9660072326660156 48.8 7.0402112007141113
		 49.6 7.1293234825134277 50.4 7.1901645660400382 51.2 7.2606787681579599 52 7.3770933151245117
		 52.8 7.4790077209472647;
createNode animCurveTA -n "RightLeg_rotateZ";
	rename -uid "C3DBF4AD-4E6E-6F1B-32AA-1DA05D67F87A";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 5.4357040949435653 0.8 -3.7617404460906987
		 1.6 -3.5095479488372803 2.4 -3.1279513835906982 3.2 -2.5343647003173828 4 -1.6594105958938599
		 4.8 -0.7244945764541626 5.6 0.1700989305973053 6.4 1.045991063117981 7.2 1.7783244848251343
		 8 2.3792695999145508 8.8 3.0546660423278809 9.6 3.6707179546356201 10.4 3.808330774307251
		 11.2 3.6919765472412114 12 3.706648588180542 12.8 3.9440536499023442 13.6 4.167137622833252
		 14.4 3.4971475601196289 15.2 1.2238658666610718 16 -1.1858910322189331 16.8 -2.2502856254577637
		 17.6 -2.7665784358978271 18.4 -4.0606245994567871 19.2 -4.8806095123291016 20 -4.8759093284606934
		 20.8 -4.5571002960205078 21.6 -4.1207919120788574 22.4 -3.3405334949493408 23.2 -2.9163520336151123
		 24 -2.971466064453125 24.8 -3.2028417587280273 25.6 -3.5612773895263672 26.4 -4.1461553573608398
		 27.2 -4.6003432273864746 28 -4.6286354064941406 28.8 -4.5807104110717773 29.6 -4.7468791007995605
		 30.4 -4.9819812774658203 31.2 -5.0976943969726562 32 -5.0616302490234375 32.8 -4.9264392852783203
		 33.6 -4.7908968925476074 34.4 -4.706657886505127 35.2 -4.567133903503418 36 -4.3171072006225586
		 36.8 -4.0107488632202148 37.6 -3.8746612071990971 38.4 -3.9720525741577153 39.2 -4.027256965637207
		 40 -3.9703583717346187 40.8 -3.8918309211730961 41.6 -3.8028867244720459 42.4 -3.6551778316497803
		 43.2 -3.5471823215484619 44 -3.5140082836151123 44.8 -3.4856221675872803 45.6 -3.4640769958496094
		 46.4 -3.4900522232055664 47.2 -3.5351040363311768 48 -3.5646777153015137 48.8 -3.6031973361968999
		 49.6 -3.6642830371856689 50.4 -3.7202045917510986 51.2 -3.770166397094727 52 -3.8331422805786137
		 52.8 -3.8893780708312993;
createNode animCurveTA -n "RightFoot_rotateX";
	rename -uid "45CB2751-4297-5109-E157-9A9243861147";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 10.423089981079102 0.8 10.274057388305664
		 1.6 10.061548233032227 2.4 9.7980031967163086 3.2 9.5026483535766602 4 9.1564884185791016
		 4.8 8.7280035018920898 5.6 8.252171516418457 6.4 7.7965536117553702 7.2 7.3799538612365723
		 8 7.0036811828613281 8.8 6.7186760902404785 9.6 6.6334991455078125 10.4 6.832707405090332
		 11.2 7.2966012954711914 12 7.9633378982543945 12.8 8.6798200607299805 13.6 9.2139377593994141
		 14.4 9.4109573364257812 15.2 9.2529888153076172 16 8.379277229309082 16.8 6.3548636436462402
		 17.6 2.6911938190460205 18.4 -1.7722519636154175 19.2 -6.1326918601989746 20 -11.101743698120117
		 20.8 -15.330155372619629 21.6 -17.872417449951172 22.4 -14.47641086578369 23.2 -9.8534126281738281
		 24 -4.5897512435913086 24.8 -0.10518056899309158 25.6 2.5365850925445557 26.4 3.5166435241699219
		 27.2 3.734177827835083 28 3.6790504455566411 28.8 3.6362721920013428 29.6 4.0284643173217773
		 30.4 4.9601888656616211 31.2 6.1588358879089355 32 7.2936944961547852 32.8 8.2714977264404297
		 33.6 9.1072092056274414 34.4 9.5061931610107422 35.2 9.3708219528198242 36 9.1284446716308594
		 36.8 8.8740053176879883 37.6 8.9322137832641602 38.4 9.3458442687988281 39.2 9.5872564315795898
		 40 9.6699724197387695 40.8 9.7048978805541992 41.6 9.7487411499023438 42.4 9.7596540451049805
		 43.2 9.7579851150512695 44 9.7768173217773438 44.8 9.7963933944702148 45.6 9.8095779418945312
		 46.4 9.8466424942016602 47.2 9.9182863235473633 48 10.003835678100586 48.8 10.08713436126709
		 49.6 10.175004005432129 50.4 10.268059730529785 51.2 10.341678619384766 52 10.385955810546875
		 52.8 10.423261642456055;
createNode animCurveTA -n "RightFoot_rotateY";
	rename -uid "F4541817-4E2B-B51D-D547-059AC03BA905";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 0.10409258306026459 0.8 -0.15406407415866852
		 1.6 -0.7308276891708374 2.4 -1.7689921855926514 3.2 -2.8260164260864258 4 -3.2981626987457275
		 4.8 -3.4092416763305664 5.6 -3.524174690246582 6.4 -3.5884737968444829 7.2 -3.5158109664916992
		 8 -3.3162276744842529 8.8 -2.9968173503875732 9.6 -2.7872591018676758 10.4 -3.0645468235015869
		 11.2 -3.5797543525695801 12 -3.7775857448577881 12.8 -3.1999690532684326 13.6 -1.3625131845474243
		 14.4 1.015155553817749 15.2 1.7581926584243774 16 1.1764017343521118 16.8 2.3069934844970703
		 17.6 6.2160944938659668 18.4 10.366700172424316 19.2 11.958498001098633 20 11.623706817626953
		 20.8 11.55142879486084 21.6 13.765859603881836 22.4 13.393862724304199 23.2 13.857094764709473
		 24 13.920383453369141 24.8 14.063529968261719 25.6 14.543933868408203 26.4 15.213852882385256
		 27.2 15.517074584960938 28 14.932957649230957 28.8 13.614554405212402 29.6 11.99947452545166
		 30.4 10.361139297485352 31.2 8.7406091690063477 32 7.224532127380372 32.8 5.9065942764282227
		 33.6 4.8304443359375 34.4 4.3570079803466797 35.2 4.4257607460021973 36 4.2636537551879883
		 36.8 3.9991128444671631 37.6 3.5645186901092529 38.4 2.8310232162475586 39.2 2.1321976184844971
		 40 1.444692850112915 40.8 0.74301695823669434 41.6 0.19348868727684021 42.4 -0.045253373682498932
		 43.2 -0.12476304918527605 44 -0.18231798708438873 44.8 -0.22259970009326935 45.6 -0.23976835608482361
		 46.4 -0.23226155340671539 47.2 -0.20932061970233917 48 -0.18248659372329712 48.8 -0.14607052505016327
		 49.6 -0.094103321433067322 50.4 -0.037242010235786438 51.2 0.013175466097891331 52 0.058766514062881463
		 52.8 0.10412158817052841;
createNode animCurveTA -n "RightFoot_rotateZ";
	rename -uid "641DC151-4BD1-D621-14FC-EDB5E9F873E1";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.9337662999645429 0.8 -0.83620375394821167
		 1.6 -0.74775439500808716 2.4 -0.33253583312034607 3.2 -0.021163981407880783 4 -0.38191363215446472
		 4.8 -1.0428711175918579 5.6 -1.5802658796310425 6.4 -2.0200920104980469 7.2 -2.3281242847442627
		 8 -2.4827632904052734 8.8 -2.6169533729553223 9.6 -2.4574761390686035 10.4 -1.4218168258666992
		 11.2 0.13555251061916351 12 1.4263399839401245 12.8 1.9402276277542114 13.6 1.3330535888671875
		 14.4 0.61867439746856689 15.2 0.78578436374664307 16 0.77737081050872803 16.8 -2.3831818103790283
		 17.6 -9.0628480911254883 18.4 -14.543349266052244 19.2 -19.134571075439453 20 -22.718652725219727
		 20.8 -23.770221710205078 21.6 -20.75550651550293 22.4 -16.510622024536133 23.2 -11.344058036804199
		 24 -9.6942100524902344 24.8 -12.780850410461426 25.6 -17.571809768676758 26.4 -20.146570205688477
		 27.2 -19.695270538330078 28 -17.897304534912109 28.8 -16.135061264038086 29.6 -14.675132751464842
		 30.4 -13.169635772705078 31.2 -11.533698081970215 32 -10.131657600402832 32.8 -9.1942138671875
		 33.6 -8.3143329620361328 34.4 -6.7446165084838867 35.2 -4.8610262870788574 36 -3.5322470664978027
		 36.8 -2.5312788486480713 37.6 -1.8614424467086794 38.4 -1.6201289892196655 39.2 -1.4362673759460449
		 40 -1.2252482175827026 40.8 -0.91442859172821045 41.6 -0.70097887516021729 42.4 -0.76687532663345337
		 43.2 -0.89681166410446178 44 -0.94722384214401245 44.8 -0.97501790523529053 45.6 -0.9967879056930542
		 46.4 -0.99341696500778198 47.2 -0.97657471895217896 48 -0.95967090129852295 48.8 -0.93488484621047963
		 49.6 -0.8962218165397644 50.4 -0.85353058576583862 51.2 -0.81530278921127319 52 -0.77880048751831055
		 52.8 -0.74138611555099487;
createNode animCurveTA -n "RightToeBase_rotateX";
	rename -uid "0F6007E7-43D2-5C67-16FD-AC9073B6B23B";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 1.0128988623538782 0.8 3.7426212657010183e-05
		 1.6 2.6177431209362112e-05 2.4 0.00011173778329975903 3.2 0.0008000257657840848 4 0.0036449835170060392
		 4.8 0.010331230238080025 5.6 0.020423684269189835 6.4 0.037210632115602493 7.2 0.063568301498889923
		 8 0.10026972740888596 8.8 0.14961287379264832 9.6 0.21404097974300385 10.4 0.29101589322090149
		 11.2 0.37781143188476562 12 0.47441166639328003 12.8 0.57230526208877563 13.6 0.65041720867156982
		 14.4 0.75542396306991577 15.2 1.1264219284057617 16 1.7274203300476074 16.8 2.5182836055755615
		 17.6 4.644014835357666 18.4 8.1906013488769531 19.2 13.681537628173828 20 20.152467727661133
		 20.8 25.094802856445312 21.6 28.436147689819336 22.4 27.069149017333984 23.2 24.578056335449219
		 24 20.293636322021484 24.8 15.15654182434082 25.6 10.577615737915039 26.4 7.5057010650634775
		 27.2 6.6014227867126465 28 7.0171360969543457 28.8 7.4408502578735343 29.6 7.3463644981384286
		 30.4 6.6779403686523438 31.2 5.5777692794799805 32 4.2515120506286621 32.8 2.786273717880249
		 33.6 1.3749369382858276 34.4 0.59547442197799683 35.2 0.59513610601425171 36 0.68085706233978271
		 36.8 0.69464385509490967 37.6 0.66863244771957397 38.4 0.59700214862823486 39.2 0.5176963210105896
		 40 0.46735396981239324 40.8 0.43699479103088379 41.6 0.4023059606552124 42.4 0.36043974757194519
		 43.2 0.32002964615821838 44 0.28232282400131226 44.8 0.24644774198532102 45.6 0.21276447176933289
		 46.4 0.181467205286026 47.2 0.1524466872215271 48 0.12562443315982819 48.8 0.10112909227609634
		 49.6 0.078869804739952087 50.4 0.058748826384544373 51.2 0.040666636079549789 52 0.024644471704959869
		 52.8 0.010492986068129539;
createNode animCurveTA -n "RightToeBase_rotateY";
	rename -uid "C189A975-4849-BC76-B00D-1B835AC17BF3";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 -5.2774651212603674 0.8 7.1186018431035336e-06
		 1.6 2.7027037958760047e-06 2.4 1.6984004105324857e-05 3.2 9.7397787612862885e-05
		 4 0.00043222049134783447 4.8 0.0012229537824168801 5.6 0.0024225355591624975 6.4 0.0044177481904625893
		 7.2 0.0075423629023134708 8 0.011894399300217628 8.8 0.017746061086654663 9.6 0.025386542081832886
		 10.4 0.034510001540184021 11.2 0.044798512011766434 12 0.056243043392896652 12.8 0.067832402884960175
		 13.6 0.077082470059394836 14.4 0.0894976407289505 15.2 0.13334549963474274 16 0.20420679450035095
		 16.8 0.29713425040245056 17.6 0.54498201608657837 18.4 0.95145565271377563 19.2 1.5601285696029663
		 20 2.2384536266326904 20.8 2.7230415344238281 21.6 3.0321710109710693 22.4 2.9075984954833984
		 23.2 2.6738612651824951 24 2.2527234554290771 24.8 1.7187378406524658 25.6 1.2193876504898071
		 26.4 0.87369823455810547 27.2 0.7704770565032959 28 0.81801426410675049 28.8 0.86632227897644043
		 29.6 0.85555577278137207 30.4 0.77924448251724243 31.2 0.65289759635925293 32 0.49944096803665156
		 32.8 0.32853510975837708 33.6 0.1626732349395752 34.4 0.070580273866653442 35.2 0.070535741746425629
		 36 0.080679282546043396 36.8 0.08230910450220108 37.6 0.079232655465602875 38.4 0.0707569420337677
		 39.2 0.061367388814687729 40 0.055405858904123306 40.8 0.051808424293994904 41.6 0.047700341790914536
		 42.4 0.042740277945995331 43.2 0.037956465035676956 44 0.033482786267995834 44.8 0.029230469837784764
		 45.6 0.025238094851374626 46.4 0.021524855867028236 47.2 0.018089327961206436 48 0.014905006624758244
		 48.8 0.011997831054031849 49.6 0.0093575706705451012 50.4 0.0069695697166025639 51.2 0.0048250867985188961
		 52 0.0029276623390614986 52.8 0.0012436220422387123;
createNode animCurveTA -n "RightToeBase_rotateZ";
	rename -uid "929D1E7F-41AA-9CDB-C208-FA9557C41F7C";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr -s 67 ".ktv[0:66]"  0 4.630589408535033 0.8 1.2690229596046265e-06
		 1.6 6.3823877098911908e-06 2.4 7.0971300374367266e-06 3.2 3.5390494304010645e-05
		 4 0.00011066061415476725 4.8 0.00030325329862535 5.6 0.00059350917581468821 6.4 0.0010962740052491426
		 7.2 0.0018494981341063976 8 0.0029214131645858288 8.8 0.0043692039325833321 9.6 0.0062686088494956493
		 10.4 0.0085149221122264862 11.2 0.01109776459634304 12 0.013992682099342344 12.8 0.016931533813476562
		 13.6 0.019296489655971527 14.4 0.022504204884171486 15.2 0.033972006291151047 16 0.053193762898445129
		 16.8 0.079561538994312286 17.6 0.15685637295246124 18.4 0.30603894591331482 19.2 0.58567053079605103
		 20 0.98787975311279286 20.8 1.3449381589889526 21.6 1.6092826128005981 22.4 1.4989653825759888
		 23.2 1.3056625127792358 24 0.99749118089675914 24.8 0.67060166597366333 25.6 0.42045056819915771
		 26.4 0.2752780020236969 27.2 0.2360815554857254 28 0.25389641523361206 28.8 0.27241504192352295
		 29.6 0.26825910806655884 30.4 0.23933336138725284 31.2 0.19370624423027039 32 0.14190183579921722
		 32.8 0.088810428977012634 33.6 0.041849445551633835 34.4 0.017637016251683235 35.2 0.017632512375712395
		 36 0.020230798050761223 36.8 0.020646877586841583 37.6 0.019857380539178848 38.4 0.017685089260339737
		 39.2 0.015288033522665501 40 0.013779642060399055 40.8 0.012881173752248287 41.6 0.011848816648125648
		 42.4 0.010594218969345093 43.2 0.0093774190172553062 44 0.0082777431234717369 44.8 0.0072162067517638206
		 45.6 0.0062265931628644466 46.4 0.0052969255484640598 47.2 0.0044383103959262371
		 48 0.0036764189135283232 48.8 0.0029518180526793003 49.6 0.0022999215871095657 50.4 0.0017053841147571802
		 51.2 0.0011948124738410115 52 0.00072220020228996873 52.8 0.00029886161792092025;
createNode pairBlend -n "pairBlend1";
	rename -uid "8D02755C-44E4-BA9C-C4AD-7BA8E457FB54";
createNode animCurveTA -n "FKNeck_M_rotateX";
	rename -uid "0D27BC26-41DA-514A-C66A-EF859B681007";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.2383757769732557 1 1.2800250477833812
		 2 1.3324650179972894 3 1.4329696641909715 4 1.6230339018913944 5 1.9138293134474027
		 6 2.2901548856927816 7 2.7239689231204136 8 3.1629680975082426 9 3.5542509134455114
		 10 3.8990428680734661 11 4.2312805020762747 12 4.5326680852230412 13 4.7423992129075296
		 14 4.800493910863743 15 4.5433860232103909 16 3.6559819147308099 17 2.0464560345839611
		 18 0.24527768968236643 19 -1.0109161951431607 20 -1.6773552753354239 21 -2.1802403074995786
		 22 -2.6131670353034591 23 -2.8960867779132418 24 -3.1396636917819514 25 -3.3528148896976928
		 26 -3.4078697306187404 27 -3.3216164168338556 28 -3.2047285144181172 29 -3.0540310886673239
		 30 -2.7947762812502011 31 -2.4389066911436972 32 -2.0867313247151031 33 -1.7902789131384493
		 34 -1.5204632219513181 35 -1.2388692043019611 36 -0.95507716245944396 37 -0.70569528155765171
		 38 -0.50418318146271524 39 -0.33765375626051558 40 -0.2012842802996701 41 -0.093531266457005546
		 42 0.0046944581170736783 43 0.11014448566506704 44 0.21844797615505829 45 0.32380474311778185
		 46 0.43107795646225411 47 0.54708963865619364 48 0.67327086708563344 49 0.80503962934158779
		 50 0.93344636176737628 51 1.0511200136433663 52 1.158071084474698;
createNode animCurveTA -n "FKNeck_M_rotateY";
	rename -uid "7FA2BDC2-40B5-083C-0597-53889ED8C79E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 2.8569018490354927 1 2.857112659619137
		 2 2.8534881665063407 3 2.8202208213528714 4 2.7247642393869915 5 2.5585933835002854
		 6 2.3498252645255651 7 2.1329298555735288 8 1.9366364487770031 9 1.8086075676040303
		 10 1.7686473036258568 11 1.751419057322986 12 1.7149730026927161 13 1.8206451635086076
		 14 2.4559944137329328 15 3.8725823734119991 16 5.634902269699916 17 6.8131932287796744
		 18 6.8129777311927286 19 5.9507198347269172 20 5.0547810397100097 21 4.5021907411263831
		 22 4.1899793123834996 23 4.1938637012415354 24 4.5995413271570351 25 5.0496490081089993
		 26 5.1543502985644212 27 4.9846775925378664 28 4.8548674244025056 29 4.8544906193121324
		 30 4.8513764396925403 31 4.7835218544987219 32 4.7055422138826861 33 4.6251317718347593
		 34 4.5199275607961873 35 4.3822598125733876 36 4.1960093489605299 37 3.988891116414937
		 38 3.8379526017463848 39 3.7652882552439881 40 3.7175719508542913 41 3.6525642139083914
		 42 3.56668823318364 43 3.4687608301749666 44 3.3591399144582472 45 3.2432507672061042
		 46 3.1473468539360163 47 3.0819766553405978 48 3.0232967745018815 49 2.9620684238433581
		 50 2.9157885094733618 51 2.8909033246161218 52 2.8731953916311586;
createNode animCurveTA -n "FKNeck_M_rotateZ";
	rename -uid "71B78316-4A5E-2537-C7ED-F7BD3A47B601";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.048403690715837083 1 13.443792603762008
		 2 12.463409207505874 3 12.343035063872122 4 12.220472904636102 5 12.149483608281734
		 6 12.156665741717326 7 12.23060213652265 8 12.367548766660127 9 12.589284225018943
		 10 12.880280882483554 11 13.153108089165602 12 13.397186353342454 13 13.717519741719268
		 14 14.066830927281922 15 14.169900451358854 16 13.779028698023259 17 12.79703967905529
		 18 11.466785730434362 19 10.456213125393301 20 10.016482350930943 21 9.6297980671845025
		 22 8.9355128424324324 23 8.1199363771135413 24 7.4319482460239241 25 7.0427836345659154
		 26 7.1050299182002998 27 7.5579348741731636 28 8.1693874596923752 29 8.8086989053908979
		 30 9.4575065323388969 31 10.075775457969101 32 10.575431135970923 33 10.902609601347383
		 34 11.081707480836705 35 11.172703283527788 36 11.221834737828232 37 11.253411697003896
		 38 11.280037550031899 39 11.319589194280152 40 11.377114779622014 41 11.428879835825478
		 42 11.464544284389577 43 11.50656313595897 44 11.570407610314156 45 11.648753715023146
		 46 11.73012800363146 47 11.816386015659756 48 11.925255439762743 49 12.068001475106193
		 50 12.232485413983934 51 12.392202955787415 52 12.529577237270772;
createNode animCurveTA -n "FKHead_M_rotateX";
	rename -uid "F0FA0E01-4EF7-41C2-28A9-C6AA8F3EE9B2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.4229278218608596 1 1.4738530169428838
		 2 1.537375442326768 3 1.6493476850890336 4 1.8473472730637659 5 2.1390823451752374
		 6 2.5091346485781663 7 2.931238363592521 8 3.355731793984484 9 3.7341456322033402
		 10 4.0702938445201324 11 4.3962315550234914 12 4.6928200427974076 13 4.9104737598948152
		 14 5.0178716105235655 15 4.8780754922712708 16 4.1642477129537978 17 2.7195114875581878
		 18 0.97337718246721683 19 -0.37652218202927029 20 -1.1892299549524736 21 -1.7902366781495755
		 22 -2.2673865910787008 23 -2.5615961722472069 24 -2.7876596654706143 25 -2.9748480523647167
		 26 -3.0189398759981829 27 -2.9328767354795899 28 -2.812296386495365 29 -2.6542783596752026
		 30 -2.3925256006951203 31 -2.0383275662582303 32 -1.6886807327370543 33 -1.4001309132294759
		 34 -1.1445916075393763 35 -0.87921142469536351 36 -0.61332579362521222 37 -0.38199201274996314
		 38 -0.19197498623432688 39 -0.028246375293832518 40 0.10815618650240823 41 0.21336289912294076
		 42 0.30581382629413906 43 0.40314458623076033 44 0.50039485150157281 45 0.59234385640275455
		 46 0.68703059846296577 47 0.79226921470845413 48 0.90710632636602873 49 1.0264790921307176
		 50 1.1433777148583311 51 1.2512290581772239 52 1.3492957220181963;
createNode animCurveTA -n "FKHead_M_rotateY";
	rename -uid "6AB045B9-4143-875B-D7DD-AEAADE4EBCED";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 2.798806176344931 1 2.7899826523821214
		 2 2.7746209747014463 3 2.7246327056956101 4 2.6060346417160898 5 2.4114461694746021
		 6 2.1716731795354334 7 1.9233622325300563 8 1.6967655646370579 9 1.5398198373377316
		 10 1.4706491197939595 11 1.4232718254296461 12 1.3598006679502821 13 1.4454692597768288
		 14 2.0694016933749886 15 3.4955266819293604 16 5.3147825745024813 17 6.6036347522942362
		 18 6.7254711647679484 19 5.9462155871098945 20 5.0968684969271099 21 4.5842838364367147
		 22 4.3040848369613087 23 4.3143265646203526 24 4.7077998799878173 25 5.1460781266237889
		 26 5.2473074767497803 27 5.0799564725770594 28 4.9533511154816106 29 4.9538014377055015
		 30 4.9462466219028016 31 4.8679606015395711 32 4.7765285353071514 33 4.6824320925667466
		 34 4.5636398491140939 35 4.412035157951494 36 4.2125429969117247 37 3.9947289249445279
		 38 3.8353885108666521 39 3.7550018763081465 40 3.7003510229003291 41 3.6296500695871479
		 42 3.5386655617057965 43 3.436134452672174 44 3.3231684057129964 45 3.2049969864966612
		 46 3.1067392370572988 47 3.0384542187618511 48 2.9766985344247647 49 2.9125799570462361
		 50 2.8637016805777362 51 2.8365507809940032 52 2.8167652665397402;
createNode animCurveTA -n "FKHead_M_rotateZ";
	rename -uid "B4FCC594-4317-DBFA-025F-F3AFD80214FE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.051115172713663906 1 -21.211251989407366
		 2 -19.922248369413371 3 -20.04882148297591 4 -20.174679986282193 5 -20.24447868999825
		 6 -20.231345598457697 7 -20.147378093628515 8 -19.99838101649749 9 -19.765984965264458
		 10 -19.467479977039506 11 -19.18776425523923 12 -18.932288233615999 13 -18.591740740773876
		 14 -18.216734344869831 15 -18.103674308078883 16 -18.531731435634082 17 -19.604732822388243
		 18 -21.033697590151103 19 -22.089639130350207 20 -22.51869086336222 21 -22.878217298268993
		 22 -23.555121095721709 23 -24.369829695138122 24 -25.072357546796773 25 -25.479358696146011
		 26 -25.425254506626782 27 -24.973145496919251 28 -24.363671330044912 29 -23.726754374272396
		 30 -23.076009453052254 31 -22.452385717368582 32 -21.947147892866955 33 -21.613376098097167
		 34 -21.425267730823418 35 -21.323552872928925 36 -21.262956079880318 37 -21.220589586776427
		 38 -21.185715357400628 39 -21.140922317987783 40 -21.079735018666923 41 -21.024736859258656
		 42 -20.985402088760459 43 -20.938385136883909 44 -20.8681186137553 45 -20.782592275300875
		 46 -20.693945708380131 47 -20.60033601655989 48 -20.483624319744312 49 -20.332636353972859
		 50 -20.16009676440687 51 -19.99294605246255 52 -19.848839278817458;
createNode animCurveTA -n "FKMiddleFinger3_R_rotateX";
	rename -uid "3F0F2362-40DF-0DFD-EFE3-FB885F1421E0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.30166948017731376 1 -0.31650847941194515
		 2 -0.35781682726021397 3 -0.41963673449244382 4 -0.49611478274454773 5 -0.58237696787494242
		 6 -0.67322706061259074 7 -0.7611888917690105 8 -0.83792710391921987 9 -0.89419745120256067
		 10 -0.91827404338692631 11 -0.91974605573691093 12 -0.91948272193640723 13 -0.91917336830323138
		 14 -0.91921721598301542 15 -0.91936621437866006 16 -0.91901544465172769 17 -0.89964022842771441
		 18 -0.65667253007954396 19 -0.23232352399485309 20 0.17001484850066625 21 0.36738570151729733
		 22 0.3778073702936004 23 -0.018472207709457282 24 -0.48992389348324161 25 -0.53667843318103792
		 26 -0.53383457858114525 27 -0.53395363350204106 28 -0.5339794274825872 29 -0.53396833169212943
		 30 -0.53438394909132247 31 -0.52257111869319806 32 -0.48444593040784956 33 -0.43074057526391757
		 34 -0.37444515761285802 35 -0.32767827663164062 36 -0.30287376661034904 37 -0.30092549129634388
		 38 -0.30127498727358692 39 -0.30124151287680995 40 -0.30132193433177928 41 -0.30130310722437609
		 42 -0.30111448008405128 43 -0.30115448643409581 44 -0.30135516339558632 45 -0.30139614688889538
		 46 -0.30128565895961207 47 -0.30129823217617957 48 -0.30136858030062985 49 -0.30134914818564101
		 50 -0.30135509452787368 51 -0.30133198170686781 52 -0.30137687458368112;
createNode animCurveTA -n "FKMiddleFinger3_R_rotateY";
	rename -uid "0308534F-49B0-D5F0-95CF-DF8D0D6E8A59";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 12.615873212008946 1 13.278131957071066
		 2 15.11579131070061 3 17.832034031842415 4 21.115134443811112 5 24.699187247939427
		 6 28.313370993987071 7 31.636639003194233 8 34.387849460078712 9 36.314184882957811
		 10 37.113143787293744 11 37.160913609096824 12 37.151657245298814 13 37.141414261674541
		 14 37.142785440885845 15 37.147368829915308 16 37.135893013342276 17 36.551892967472497
		 18 27.605172602135152 19 9.2712858119533177 20 -8.3772782623419211 21 -16.270727579629291
		 22 -16.163677088500979 23 -0.8006488024945313 24 20.852876285720431 25 22.824743417218158
		 26 22.699939454682323 27 22.70487698243533 28 22.705694736800506 29 22.705379166183501
		 30 22.723714499179668 31 22.231738887315359 32 20.620321938897646 33 18.310379551471339
		 34 15.848266184960858 35 13.774917063277332 36 12.670268187372061 37 12.583094301142024
		 38 12.598337832773321 39 12.596733195745227 40 12.60029216342846 41 12.599312788007708
		 42 12.591118602317096 43 12.592674591411635 44 12.601861664558662 45 12.603989576828189
		 46 12.598739563200116 47 12.599002544596514 48 12.602434393214423 49 12.601960635116571
		 50 12.602014074413647 51 12.600750076303276 52 12.601992710895653;
createNode animCurveTA -n "FKMiddleFinger3_R_rotateZ";
	rename -uid "F04839F1-4034-3867-BDC2-AFAE0261EB43";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.06895119522524723 1 -0.068916998435930688
		 2 -0.069767634135735931 3 -0.073580220027895701 4 -0.082437992971074903 5 -0.097866268453205341
		 6 -0.12012739646060748 7 -0.14726417306362538 8 -0.17521237730463046 9 -0.198074202461934
		 10 -0.20839465076253053 11 -0.20903460859731865 12 -0.20891823241380378 13 -0.20877731599902655
		 14 -0.20878729129322568 15 -0.2088483254515773 16 -0.2087123509161741 17 -0.20115225469525042
		 18 -0.11192033430248784 19 -0.068905770480585077 20 359.84133852676172 21 359.75894992587905
		 22 359.7553975135562 23 359.89276129807024 24 -0.081552947014282437 25 -0.089066304333634355
		 26 -0.088497108523837006 27 -0.088514853537364643 28 -0.088516486902760372 29 -0.088525364160990092
		 30 -0.08859527900312425 31 -0.086601313746434441 32 -0.080778445059545734 33 -0.074548103063449625
		 34 -0.070471239768167285 35 -0.068996217881536148 36 -0.068943254649378657 37 -0.068960064511326816
		 38 -0.068972151898048992 39 -0.068955754893006205 40 -0.068962028982027579 41 -0.068963722007854028
		 42 -0.06896961437052361 43 -0.068961846178537178 44 -0.068968176055254626 45 -0.068955081592927764
		 46 -0.068965165424414415 47 -0.068967376524013968 48 -0.068963957230227482 49 -0.068957679870133265
		 50 -0.06895744272471635 51 -0.068963057472892178 52 -0.068968893914662432;
createNode animCurveTA -n "FKMiddleFinger2_R_rotateX";
	rename -uid "87EF4539-46D3-A975-CF47-7A9981F60122";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.40069694268250217 1 -0.41981707326474382
		 2 -0.47214041587762989 3 -0.55149545410092793 4 -0.65253381103792552 5 -0.77010363154525185
		 6 -0.89940481763938485 7 -1.0334017313574775 8 178.84218459357251 9 178.74824508567136
		 10 178.70855412982647 11 178.70706817927666 12 178.70743557528112 13 178.70807060498834
		 14 178.7089459359828 15 178.70834060709262 16 178.70706056655666 17 178.7230457063213
		 18 -1.0612358022136001 19 -0.71434320289380782 20 -0.44082261462912381 21 -0.32733370549353008
		 22 -0.31818620344847404 23 -0.66851149280725453 24 178.72042347702563 25 178.64241103627887
		 26 178.64805104109266 27 178.64875493644604 28 178.64888985062174 29 178.6479479372145
		 30 178.64587647835654 31 178.71745162859699 32 178.91531059489404 33 -0.85242826301278385
		 34 -0.64320347747724427 35 -0.48618215244297314 36 -0.40731608530112151 37 -0.40098722242339774
		 38 -0.40087690587202751 39 -0.40021832387120349 40 -0.40057121058170975 41 -0.40121176286183236
		 42 -0.4012350139792909 43 -0.40102241412632905 44 -0.40134725377253794 45 -0.4016469193745747
		 46 -0.40089498425274017 47 -0.40013405915085354 48 -0.40049804409009748 49 -0.40128022447538997
		 50 -0.4016061702999224 51 -0.40123035114121153 52 -0.40051543713525095;
createNode animCurveTA -n "FKMiddleFinger2_R_rotateY";
	rename -uid "3CF4EDC9-4C8A-644E-132E-A98EBD5F17B1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 16.880444909599589 1 17.772507053207843
		 2 20.190641044674486 3 23.758516759560273 4 28.086739344189908 5 32.789308631760946
		 6 37.516524301081553 7 41.918024600235427 8 134.42410761329782 9 131.92219149713921
		 10 130.93078402891757 11 130.89514908251513 12 130.90453075821617 13 130.92038194000463
		 14 130.94188136993679 15 130.92679588955772 16 130.8946537200749 17 131.27232339886561
		 18 42.755440994155862 19 30.528592198849246 20 18.75108210456478 21 13.459046856738832
		 22 13.56236627157417 23 28.175604726580371 24 131.22580460520987 25 129.35245432011448
		 26 129.48629974973056 27 129.50223633881458 28 129.50570423018459 29 129.48356076756633
		 30 129.43113458432177 31 131.13559781328487 32 136.52323393761489 33 35.835786996292207
		 34 27.667579912127412 35 20.802716160349746 36 17.19070560548089 37 16.894185756275728
		 38 16.888512537456641 39 16.857700710175411 40 16.873960151832154 41 16.90412416957323
		 42 16.905423994973312 43 16.895464552167919 44 16.91122691893754 45 16.924166289033238
		 46 16.889793457036717 47 16.853711963765182 48 16.87083249684218 49 16.907433211326985
		 50 16.923255466762029 51 16.906041211779026 52 16.872299664313054;
createNode animCurveTA -n "FKMiddleFinger2_R_rotateZ";
	rename -uid "3BC86475-4C11-2655-3F32-FDB2B7DED148";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.37701995014525236 1 -0.37878061375524441
		 2 -0.38524371984165839 3 -0.39937229206332953 4 -0.42455694207474814 5 -0.46351494492675538
		 6 -0.51729012302535504 7 -0.58366240377904943 8 179.3461765335351 9 179.28849854411652
		 10 179.26313323437734 11 179.26222117788623 12 179.26247539443187 13 179.26286229008994
		 14 179.26343671881082 15 179.26303450839396 16 179.26222556620101 17 179.27200947241772
		 18 -0.59719516431093023 19 -0.44216364333326819 20 -0.3810977504771762 21 -0.373387625212035
		 22 -0.37730522055282545 23 -0.42682588615195516 24 179.27084657932059 25 179.21939438851842
		 26 179.2233063433203 27 179.22377612506079 28 179.22386837788378 29 179.22323785080988
		 30 179.22165654326528 31 179.26837135524684 32 179.38827508168757 33 -0.49633333729954965
		 34 -0.42167904972645437 35 -0.38716374423978689 36 -0.37758708078500219 37 -0.3770420856996744
		 38 -0.37703695859583858 39 -0.37697678602486617 40 -0.37701601583087246 41 -0.37706112038978945
		 42 -0.3770659608891353 43 -0.37705263626612423 44 -0.37706746178889727 45 -0.37710048205471491
		 46 -0.37702772052127664 47 -0.37697172283277552 48 -0.37699988152813685 49 -0.37705948869336298
		 50 -0.37709347826586032 51 -0.37705129287744316 52 -0.3769938799311936;
createNode animCurveTA -n "FKMiddleFinger1_R_rotateX";
	rename -uid "9C660268-41B9-71DF-0EB3-4493D5D51845";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -6.9177064321831495e-14 1 176.92304683999973
		 2 177.08259493052972 3 177.00807376672554 4 176.89757382258296 5 -3.2529478823878919
		 6 -3.4469273596831811 7 -3.6646985512652992 8 -3.8519231991593998 9 -3.9676235825893733
		 10 -3.9998201903977018 11 -3.9883780010256573 12 -3.9906018272057562 13 -4.007081349640937
		 14 -4.0177588072958281 15 -4.0109002695863376 16 -4.0071126251855986 17 -4.0010371804247598
		 18 -3.8072783201339186 19 -3.5330834812746859 20 -3.3963661314258045 21 176.63635725359123
		 22 176.64238307869547 23 -3.4750217464106883 24 -3.8409907733704878 25 -3.8981808421581019
		 26 -3.8945168833729777 27 -3.8904915089884495 28 -3.8867208759376659 29 -3.8811971722994816
		 30 -3.8734186568232269 31 -3.7841928899207744 32 -3.5505098949760856 33 -3.2747023157430886
		 34 176.95781491864059 35 177.10169830242862 36 177.15533243882604 37 177.1539208103016
		 38 177.1518144078594 39 177.15424810350643 40 177.15671560071593 41 177.15904521859761
		 42 177.16007009862301 43 177.16087694165313 44 177.16514567911355 45 177.16672582662255
		 46 177.1619651206899 47 177.15613689507256 48 177.15011224574195 49 177.14367668821762
		 50 177.13924493705667 51 177.1366516534481 52 177.13573090132888;
createNode animCurveTA -n "FKMiddleFinger1_R_rotateY";
	rename -uid "427A0BF8-4C72-9A43-D13B-27BE25CF3DB2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 2.3456590775793406e-14 1 -186.39275980095729
		 2 -186.8725927054376 3 -188.15685741280114 4 -189.72749992833039 5 11.441176571584522
		 6 13.128877450633434 7 14.63986991219277 8 15.865820955655298 9 16.758888459007309
		 10 17.224650938474444 11 17.336022408965817 12 17.341195090270457 13 17.338825750419666
		 14 17.357859687427364 15 17.343453253396419 16 17.310535476154023 17 16.958665264989378
		 18 11.809285466560803 19 1.2913366726341224 20 -8.8332890021030046 21 -166.60888430325238
		 22 -166.6891680862326 23 -1.7214842349980171 24 14.576112125251141 25 16.029709914197806
		 26 15.895587763280504 27 15.887664531057457 28 15.885941847751678 29 15.868358076543787
		 30 15.878361996264703 31 15.390476937871998 32 13.767369931135669 33 11.434435937740201
		 34 -188.95242511360351 35 -186.87265850158533 36 -185.75143016846656 37 -185.62287280464258
		 38 -185.61519625948884 39 -185.6197351635617 40 -185.63776868802435 41 -185.66974886474932
		 42 -185.6810060089509 43 -185.67115573078959 44 -185.66143059154678 45 -185.6512489128275
		 46 -185.65017825964188 47 -185.64911182069727 48 -185.63530901598222 49 -185.6174370218163
		 50 -185.61603239341159 51 -185.64676060804896 52 -185.67722440012491;
createNode animCurveTA -n "FKMiddleFinger1_R_rotateZ";
	rename -uid "9BCF9105-4D19-AF61-AE35-ED8CB4FE9B8F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -5.7249984266343308e-14 1 -176.27999302666132
		 2 -176.76966007852954 3 -177.14969284390773 4 -177.61046397418733 5 1.8738168201240752
		 6 1.3165420432217556 7 0.76973038295290497 8 0.34219779070528561 9 0.096602920000524228
		 10 0.034235864195256142 11 0.060514545832596252 12 0.05579442039084221 13 0.020609213214333868
		 14 -0.0018413848114461236 15 0.012588472084085752 16 0.020081405738641322 17 0.02585321214818647
		 18 0.40012616300942322 19 1.079637759353121 20 361.61704420026422 21 181.82444328375291
		 22 181.82503427921111 23 361.3059487597248 24 0.3541322251980224 25 0.239836092204466
		 26 0.24674514400011591 27 0.25569749329961622 28 0.26412763952866886 29 0.27633480177807018
		 30 0.29345185387266109 31 0.49138974840042499 32 1.0504213628349917 33 1.8178714986472782
		 34 -177.37118733700197 35 -176.70247207664241 36 -176.36494825529613 37 -176.35081571773506
		 38 -176.35744888947127 39 -176.3492141318099 40 -176.34286903004434 41 -176.33922210171812
		 42 -176.33715378542487 43 -176.33273913280937 44 -176.31565052364468 45 -176.30837801500525
		 46 -176.32556218386696 47 -176.34673442815992 48 -176.3666541662441 49 -176.38756087049705
		 50 -176.4035408742923 51 -176.41751183898353 52 -176.42534453515722;
createNode animCurveTA -n "FKThumbFinger3_R_rotateX";
	rename -uid "8C22C48E-4B4D-A922-78CD-F88B28EC5123";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -6.0430538947806788e-13 1 -21.316942976415682
		 2 -19.96558935028391 3 -19.609376477681479 4 -19.158236898044642 5 -18.614356250846651
		 6 -18.001608226529736 7 -197.39356003528346 8 -196.86215305096567 9 -16.430661064958532
		 10 -16.188147641987193 11 -16.117744024983892 12 -16.091258999261804 13 -16.082231102742032
		 14 -16.100512645271625 15 -16.178963199596854 16 -16.237108060742123 17 -16.298257487745897
		 18 -16.763282664124979 19 -197.69392973148527 20 -198.57429000646059 21 -198.95582245352847
		 22 -198.96547956108031 23 -19.311980070469879 24 -20.041460027904673 25 -20.124682076667415
		 26 -20.129902072050491 27 -20.136700900746597 28 -20.148609456911551 29 -20.170828561079347
		 30 -20.171114947406682 31 -20.242461038154811 32 -20.407583294901769 33 -20.495673224641056
		 34 -20.485421550537602 35 -20.448460581713629 36 -20.443255650995415 37 -20.505979745970137
		 38 -20.558722573780695 39 -20.53809651797199 40 -20.461542145568462 41 -20.388924622538024
		 42 -20.383068581662673 43 -20.413676337928024 44 -20.426560189314699 45 -20.425094035549822
		 46 -20.403426761544644 47 -20.374076319474199 48 -20.343405624581511 49 -20.288040165467869
		 50 -20.239433689275391 51 -20.223073493508068 52 -20.214369639223374;
createNode animCurveTA -n "FKThumbFinger3_R_rotateY";
	rename -uid "267A8567-4B09-CB5B-BC63-04BCE63DB847";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.3358329662146902e-13 1 -16.628837757083875
		 2 -12.493716840782913 3 -8.6914147953408207 4 -4.0724090973013309 5 0.95709434429218487
		 6 5.9611426030820338 7 -190.52634429491246 8 -194.28155777575904 9 16.882169626347565
		 10 17.971357635767987 11 18.054906084998549 12 18.053690882716488 13 18.058143491667824
		 14 18.049990702996261 15 18.003686106279829 16 17.931406722305052 17 17.800832754885295
		 18 16.531900735512593 19 -193.95715704422872 20 -191.51259151775969 21 -190.46098964081511
		 22 -190.42801173828079 23 6.3214449963046357 24 0.59236472541912522 25 0.082704615799434569
		 26 0.11140431017357866 27 0.10530467738211394 28 0.1024602591032573 29 0.093159309757440828
		 30 0.11319598256106746 31 -0.6994548477332917 32 -3.3012753263660048 33 -6.9817918335163123
		 34 -10.883956630486614 35 -14.156133981404452 36 -15.918280625364137 37 -16.11724272006828
		 38 -16.123772635559192 39 -16.098665731444513 40 -16.059598366523876 41 -16.029453352621431
		 42 -16.03624987469512 43 -16.060578607403247 44 -16.075500936460596 45 -16.085942394941025
		 46 -16.088465487014286 47 -16.095579347586696 48 -16.097653893050929 49 -16.066478783808641
		 50 -16.036886942518898 51 -16.036806380295392 52 -16.041628453673223;
createNode animCurveTA -n "FKThumbFinger3_R_rotateZ";
	rename -uid "2666086E-43E5-117B-7DC3-BF9EBC5F9AE0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 2.4808326515415359e-13 1 -16.852902758034315
		 2 -16.233342313893758 3 -16.779470213014296 4 -17.341120078710265 5 -17.839672426106638
		 6 -18.247913238464211 7 161.44902681463529 8 161.2572384500844 9 -18.817396440978808
		 10 -18.787212881633931 11 -18.743582009303491 12 -18.734119073995515 13 -18.728268417727474
		 14 -18.738204908043514 15 -18.792739711221106 16 -18.870247590958602 17 -18.954897902412249
		 18 -19.440667701379652 19 159.67631869743917 20 158.94841687199636 21 158.66241129636902
		 22 158.6641352895827 23 -19.548817322141311 24 -16.953711351824399 25 -16.705639528829852
		 26 -16.7250343485284 27 -16.729441793879335 28 -16.731018810609942 29 -16.738612355932759
		 30 -16.74023338296643 31 -16.720322240703645 32 -16.620676715810379 33 -16.398532958038189
		 34 -16.095442764689999 35 -15.808239150446287 36 -15.657034485573622 37 -15.658732872217545
		 38 -15.655767420699554 39 -15.643148393839985 40 -15.637538656362322 41 -15.637540053985116
		 42 -15.64480391758892 43 -15.654007151039435 44 -15.661546226036219 45 -15.670234024943655
		 46 -15.679159705659782 47 -15.694121390923991 48 -15.705492381741157 49 -15.69901601573628
		 50 -15.691624898529302 51 -15.696796348001834 52 -15.703340564265487;
createNode animCurveTA -n "FKThumbFinger2_R_rotateX";
	rename -uid "34E6C1A0-4F86-50D2-5A99-6FBD2608D709";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -5.9794428011514094e-13 1 12.105455947811853
		 2 11.522237857183306 3 12.509107062478758 4 13.598634589975248 5 14.693130569361051
		 6 15.730789412760766 7 16.557253750912999 8 17.101840353077108 9 17.440193377488693
		 10 17.619478639448033 11 17.698447089036847 12 17.744234289084339 13 17.761767281479589
		 14 17.747223926039243 15 17.656016174815193 16 17.566714276087911 17 17.450864502107709
		 18 16.446945442469996 19 13.852503546780895 20 10.43885910976315 21 8.6163953053025502
		 22 8.6254781526945958 23 9.1067495026856058 24 9.7959989000933838 25 9.8473414830002035
		 26 9.8352765002211626 27 9.8338881383099643 28 9.821291514426111 29 9.8049530722541895
		 30 9.8026806088145673 31 9.8422240458641141 32 9.9787482570030637 33 10.173000772311623
		 34 10.324504394519604 35 10.38482876383997 36 10.398116204736906 37 10.375609490234279
		 38 10.328211410148853 39 10.322631342906352 40 10.372382839838791 41 10.428677408839622
		 42 10.445582114611506 43 10.437433678517868 44 10.440291089096883 45 10.456196817491868
		 46 10.488311180533753 47 10.536701741770507 48 10.580264227227934 49 10.612561906505931
		 50 10.638053638754615 51 10.659788954792079 52 10.677794588118109;
createNode animCurveTA -n "FKThumbFinger2_R_rotateY";
	rename -uid "B19E751D-44D0-9533-F0AA-C5BFB47F90D2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 4.7708320221956907e-14 1 32.964593913168422
		 2 30.29973607262162 3 29.467291539596921 4 28.356847105480387 5 27.087711527611493
		 6 25.808226932968171 7 24.541480237525494 8 23.381838677677592 9 22.561442391928402
		 10 22.284896935973066 11 22.352877082484358 12 22.40523271941726 13 22.421064368428567
		 14 22.402735474425068 15 22.305119716323894 16 22.175116776922764 17 22.242998100482623
		 18 24.585846536017772 19 29.289127343500816 20 33.56870951245628 21 35.370746462071672
		 22 35.395272001476364 23 37.546996381242906 24 40.587687980565498 25 40.839750813767075
		 26 40.807109846110592 27 40.804404393208394 28 40.781190228739128 29 40.752548230502782
		 30 40.764316764570928 31 40.218622883540931 32 38.532146303017747 33 36.246815454749367
		 34 33.870471963755058 35 31.884561878078895 36 30.84169058659905 37 30.710660693887768
		 38 30.632658405803358 39 30.622618337604109 40 30.710469973872883 41 30.809694373576544
		 42 30.839322737037641 43 30.824848981171517 44 30.829743419171642 45 30.857613190083029
		 46 30.914029721909497 47 30.999020521260157 48 31.075290996064084 49 31.131822638389391
		 50 31.176292065666356 51 31.214239410258195 52 31.245648870228489;
createNode animCurveTA -n "FKThumbFinger2_R_rotateZ";
	rename -uid "43750A5E-43BB-55CA-44B9-8182178AC422";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 7.9513867036587907e-13 1 12.512119744958913
		 2 12.587018389351069 3 14.189047047029895 4 16.057501565338381 5 18.040531031343569
		 6 20.013694005907485 7 21.762685929270617 8 23.124443516349448 9 24.044642094552042
		 10 24.452624894392564 11 24.529541894228128 12 24.56452461000486 13 24.575811896506082
		 14 24.562188761986555 15 24.491172540997592 16 24.391884202089617 17 24.158648251487293
		 18 21.446107285786908 19 15.655049483536512 20 9.6841552062931733 21 6.8856166932220333
		 22 6.8935130876763875 23 7.0469662055506275 24 7.2730346683426186 25 7.2796639742901101
		 26 7.2684634429571773 27 7.266767103180249 28 7.2511713387418197 29 7.2306112696570919
		 30 7.2248080416169334 31 7.3909564222926276 32 7.9587524526959985 33 8.8235063876432349
		 34 9.7427136222997497 35 10.481412893213951 36 10.868305686451645 37 10.876612234360332
		 38 10.822799229462568 39 10.81674255369418 40 10.871017010728712 41 10.932504692688607
		 42 10.951030574456393 43 10.942180738447428 44 10.945321778180759 45 10.962732876486458
		 46 10.997896659828404 47 11.050889592167131 48 11.098627802892729 49 11.134070670840948
		 50 11.162075796241265 51 11.18597140066619 52 11.205795449914078;
createNode animCurveTA -n "FKThumbFinger1_R_rotateX";
	rename -uid "68AFEF4E-477F-8A5B-03B6-27BDE87B13D8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -6.1702760820392236e-13 1 -16.572852177466984
		 2 -16.540985649288334 3 -17.795311133062544 4 -19.442110363937537 5 -21.38510100903482
		 6 -23.480305228747927 7 -25.531668873949201 8 -27.308992124007812 9 -28.572710823457108
		 10 -29.088975952215154 11 -29.112072847670277 12 -29.109287058928764 13 -29.109313732885585
		 14 -29.109312111222817 15 -29.109306400745378 16 -29.109294216599466 17 -29.086014618113875
		 18 -28.685457736833648 19 -27.74679846232679 20 -26.788742584859538 21 -26.376754199827065
		 22 -26.374857570982737 23 -25.580210913106551 24 -24.199587187756148 25 -24.057256988948868
		 26 -24.06665584397409 27 -24.066652031086811 28 -24.066654337057763 29 -24.067872552108511
		 30 -24.080186812618745 31 -23.604702924124343 32 -22.108394385542269 33 -20.055609848282593
		 34 -17.987683719106794 35 -16.356655826896223 36 -15.528913995311306 37 -15.458357110170175
		 38 -15.462988545714103 39 -15.462973566539635 40 -15.462995170195265 41 -15.462983795178046
		 42 -15.462991398511956 43 -15.462982458229122 44 -15.462983042568057 45 -15.462983813410748
		 46 -15.462989760994807 47 -15.462981356250372 48 -15.462990386924082 49 -15.462984166302423
		 50 -15.462993030227148 51 -15.462986517634176 52 -15.46297270336121;
createNode animCurveTA -n "FKThumbFinger1_R_rotateY";
	rename -uid "307699FD-446E-4350-BB81-EB9CA7947512";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 5.7249984266341162e-14 1 -16.99216992852806
		 2 -16.049012504890154 3 -16.642942402881161 4 -17.285807024483177 5 -17.876233331601867
		 6 -18.33948539993407 7 -18.640834359361335 8 -18.791808024120161 9 -18.841262009554523
		 10 -18.848324788688945 11 -18.848539548058636 12 -18.848544049553112 13 -18.848534199152926
		 14 -18.848521685697659 15 -18.848525465471361 16 -18.848545134041281 17 -18.931096946286448
		 18 -20.100199808205264 19 -22.053439355378615 20 -23.371292574807196 21 -23.78807325162299
		 22 -23.789185956341854 23 -22.141039941546477 24 -19.693876462858093 25 -19.460378407407813
		 26 -19.475596574152785 27 -19.475593442512608 28 -19.475605016470656 29 -19.476043264905108
		 30 -19.480364453506393 31 -19.30373932082399 32 -18.718429239440177 33 -17.83270406493525
		 34 -16.834451810642289 35 -15.963876024513329 36 -15.49069903553676 37 -15.449366406875708
		 38 -15.452090974170952 39 -15.452090907503973 40 -15.452089696897895 41 -15.452085393168268
		 42 -15.452080376782536 43 -15.452088843605045 44 -15.452094244262259 45 -15.452088637756685
		 46 -15.452085095237873 47 -15.452084015987193 48 -15.452092562231471 49 -15.452084256659834
		 50 -15.45208250595276 51 -15.452087979687684 52 -15.452090583258489;
createNode animCurveTA -n "FKThumbFinger1_R_rotateZ";
	rename -uid "9D6EE6AD-4F3B-D0BD-D68C-FFB498A604D7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -3.9438878050147632e-13 1 -11.882705267936169
		 2 -9.1952008985571982 3 -6.4114882854227835 4 -3.0149130852939137 5 0.70536770603934584
		 6 4.4513608806577629 7 7.9104982175477074 8 10.772169851230236 9 12.741571124138918
		 10 13.53210413153451 11 13.56733319210406 12 13.563111982828124 13 13.563111943067394
		 14 13.563107855931843 15 13.563116160518407 16 13.563099750097837 17 13.310291677592231
		 18 9.2634661164962271 19 0.71705613310588745 20 -7.7646689589568965 21 -11.608665654475352
		 22 -11.570030189003852 23 -7.2354524811743115 24 -1.2779336626031257 25 -0.74757699260807142
		 26 -0.78244901256705268 27 -0.78245396470798689 28 -0.78244520030524634 29 -0.78104008226597721
		 30 -0.76671677660006432 31 -1.3246292667219939 32 -3.1098398335525479 33 -5.6433288183136314
		 34 -8.311464803150578 35 -10.514197780978559 36 -11.670875556720384 37 -11.770855762865995
		 38 -11.764306419860626 39 -11.764286335487242 40 -11.764285279067723 41 -11.764288870721293
		 42 -11.764287618260175 43 -11.76430459592417 44 -11.764278768608579 45 -11.764267590366783
		 46 -11.764311292516114 47 -11.764288341858327 48 -11.764292844304194 49 -11.764297822486322
		 50 -11.764296854879964 51 -11.764286645826791 52 -11.764301890200469;
createNode animCurveTA -n "FKIndexFinger3_R_rotateX";
	rename -uid "55C6297B-42EC-791B-7EED-508CCFD2274B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.22497995566911208 1 -0.23536133998364372
		 2 -0.26258958767128543 3 -0.30097065367156894 4 -0.3446896673811754 5 -0.38856697422701159
		 6 -0.42870399926597041 7 -0.4622264278505025 8 179.51279515205448 9 179.49718298988336
		 10 179.49141401344411 11 179.49133286208104 12 179.49148808822426 13 179.49149796888275
		 14 179.49145028724689 15 179.49145241958126 16 179.49144923077361 17 179.49629104462335
		 18 -0.43347806171983516 19 -0.2288738332233636 20 0.051316469412902903 21 0.20886997343451819
		 22 0.21709996672019341 23 -0.12456604310252942 24 -0.41780969784249078 25 -0.43853156492468143
		 26 -0.43738296992299169 27 -0.43739152992176755 28 -0.43739475401104022 29 -0.43741239408084448
		 30 -0.43759225515547107 31 -0.42884481963697285 32 -0.39976348914668192 33 -0.35438988449046793
		 34 -0.30137829862589521 35 -0.25354903369351889 36 -0.22683846171396652 37 -0.22455033104709712
		 38 -0.22472660002836561 39 -0.22473571560161906 40 -0.22478736816306172 41 -0.22478396186095456
		 42 -0.22480368563413719 43 -0.22483878372747423 44 -0.22486308212908843 45 -0.22492515196877569
		 46 -0.22500251309145311 47 -0.22501627868235058 48 -0.22488135122286235 49 -0.22478871789087643
		 50 -0.22489819332358568 51 -0.22507437527546531 52 -0.22508261439544483;
createNode animCurveTA -n "FKIndexFinger3_R_rotateY";
	rename -uid "D7B6ACD0-4D79-623D-817E-87A194F5F5A4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 17.894087143374925 1 18.574462288248302
		 2 20.414877757782879 3 23.133269027390767 4 26.434805861533633 5 30.027531245597817
		 6 33.629375473390702 7 36.956876701406145 8 140.28235263538323 9 138.38663383729616
		 10 137.64525081238506 11 137.63848952901327 12 137.65836808304488 13 137.65931005500971
		 14 137.65380467446622 15 137.65322264376536 16 137.65339850819771 17 138.14772288746596
		 18 34.022683077802412 19 17.964243094541473 20 2.5042906648132082 21 -4.4194993201152837
		 22 -4.3119426857902807 23 11.014667443079476 24 32.6184351346106 25 34.585106131655849
		 26 34.460491671652228 27 34.463068790260913 28 34.463730471650948 29 34.465383679262764
		 30 34.48596016416456 31 33.658413856885844 32 30.998929332297358 33 27.19533980328638
		 34 23.152217144377424 35 19.788095836468806 36 18.015871578454359 37 17.866761611800293
		 38 17.877959459284547 39 17.87895681201811 40 17.880771492302717 41 17.88243926957847
		 42 17.883870921778268 43 17.885507946188891 44 17.887951137874698 45 17.891778261255258
		 46 17.896226456189002 47 17.896476270663801 48 17.888838819649838 49 17.88248081515918
		 50 17.889761478990831 51 17.901666322563017 52 17.901746520047681;
createNode animCurveTA -n "FKIndexFinger3_R_rotateZ";
	rename -uid "AB13D9F9-49EC-75E7-B693-FF80655D91CF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.71736177643277854 1 0.73215319020272218
		 2 0.77176928337140782 3 0.82948260373307514 4 0.89861681802209703 5 0.97302435074561022
		 6 1.0472402720577663 7 1.1160044423369582 8 181.17354395334286 9 181.21351095035092
		 10 181.22930972532637 11 181.22945120534425 12 181.22902981852238 13 181.22902868965619
		 14 181.22912204892711 15 181.22914932803994 16 181.22914482721058 17 181.21838513507839
		 18 1.0576773298818585 19 0.72104936974694112 20 0.35679709506913931 21 360.16994289381097
		 22 360.16793226828952 23 0.56345672340107267 24 1.0263969609032193 25 1.0668812221233213
		 26 1.0643398856394133 27 1.0644126244754284 28 1.0644282382944203 29 1.0644654181941469
		 30 1.064867144344632 31 1.0477755255915124 32 0.99301453402145268 33 0.91445669390666973
		 34 0.82994646952894524 35 0.75836168067668208 36 0.7200080479301838 37 0.71677407580874752
		 38 0.71700718891293891 39 0.7170369657573985 40 0.71706821989548675 41 0.71711621842419182
		 42 0.71715039926006396 43 0.71718101845813398 44 0.71724913538019619 45 0.71732164758847594
		 46 0.71740668487607728 47 0.71741379454951826 48 0.71726014675651051 49 0.71711433644248845
		 50 0.71727778324474267 51 0.71753781240171444 52 0.71753171195769339;
createNode animCurveTA -n "FKIndexFinger2_R_rotateX";
	rename -uid "F49D271B-4B9F-6DDE-E108-1B9406A742AA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.18219349407796648 1 -1.1509102440613821
		 2 -1.17101863552623 3 -1.3172380189784529 4 -1.5142751043364682 5 178.24309118726214
		 6 177.9516742121468 7 177.63993451088908 8 177.35171765169594 9 177.10778644444147
		 10 176.97165491671285 11 176.9624202972449 12 176.97463678819847 13 176.96480402138985
		 14 176.95458180163467 15 176.95219149285253 16 176.95148463366758 17 177.02606168239851
		 18 177.82812340109211 19 -1.1867470147817414 20 -0.56520438790688488 21 -0.33072935689630856
		 22 -0.32498446132471365 23 -0.77791667585875202 24 -1.5808322576301606 25 178.3110965605506
		 26 178.30159088156535 27 178.30057529106756 28 178.31084919544188 29 178.31231081536421
		 30 178.30048213967649 31 -1.6653095368507895 32 -1.5412408275341671 33 -1.3864855124593156
		 34 -1.2458904553677723 35 -1.1337659983649913 36 -1.0683281712813046 37 -1.0566797197592162
		 38 -1.0548309787114867 39 -1.0532062087342091 40 -1.0594410712405902 41 -1.0701353665340354
		 42 -1.0661428209400179 43 -1.0544857373455672 44 -1.0567719937519491 45 -1.0649052188564005
		 46 -1.0624142374969738 47 -1.0569060765380218 48 -1.0597854992225575 49 -1.0656363602512076
		 50 -1.0707810372925488 51 -1.0749992451551391 52 -1.0726345548080289;
createNode animCurveTA -n "FKIndexFinger2_R_rotateY";
	rename -uid "47B56865-4475-380A-2AA7-EE8155400917";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 23.271872566106548 1 23.985263210625838
		 2 26.120089427502506 3 29.667289473146514 4 34.003479021696016 5 141.29286994942399
		 6 136.44588511217694 7 132.06789294623638 8 128.6268315667692 9 126.09081507623874
		 10 124.80446990367508 11 124.72067683722973 12 124.83218936278901 13 124.74248568440176
		 14 124.64948354183751 15 124.62791398006976 16 124.62153082644039 17 125.29629512624932
		 18 134.61304496385227 19 26.435576643975438 20 8.2001165939110336 21 0.071362999677755418
		 22 0.17405920156455537 23 14.736777718589131 24 35.360506348629173 25 142.54245289304635
		 26 142.36641184842063 27 142.34777305129916 28 142.54048573135833 29 142.56753940741197
		 30 142.34581946850003 31 37.010855890605882 32 34.55966411321463 33 31.246494790270113
		 34 27.971939859204031 35 25.167429125139865 36 23.452419839139115 37 23.140098375616372
		 38 23.090161811004091 39 23.046467974101741 40 23.214304546958704 41 23.500179544646333
		 42 23.393441922095633 43 23.080725141163263 44 23.14195141197521 45 23.360112260103971
		 46 23.293655007576341 47 23.146276630232109 48 23.223155860976121 49 23.379813725539595
		 50 23.517345623555801 51 23.629754625106386 52 23.566930525544556;
createNode animCurveTA -n "FKIndexFinger2_R_rotateZ";
	rename -uid "DEB9227D-4F77-83FC-1EF2-488FB1747C97";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.4828536576837592 1 -1.6548101958653121
		 2 -1.5046726198798113 3 -1.6075008580493702 4 -1.7534945718610351 5 178.0570471498942
		 6 177.81825099592794 7 177.55233721181239 8 177.29910868435434 9 177.08050855840429
		 10 176.95713046009325 11 176.94881301706448 12 176.95992354505108 13 176.95096626923538
		 14 176.94167543995019 15 176.93949018193462 16 176.93886531143588 17 177.00509096757651
		 18 177.71789895870793 19 -1.509775427975784 20 358.85122709488451 21 358.94590642404364
		 22 358.94062868028539 23 -1.2518394350328992 24 -1.8045097603026714 25 178.11087707719778
		 26 178.10351878336911 27 178.10271793651097 28 178.11085250203826 29 178.11199697281782
		 30 178.10262024370323 31 -1.8704953006399603 32 -1.7740558349230682 33 -1.6578353917894861
		 34 -1.5566230644795767 35 -1.4792355657331657 36 -1.4357539814989559 37 -1.4281279457277338
		 38 -1.4269194925649809 39 -1.4258641275000474 40 -1.4299282538778926 41 -1.4369460797242042
		 42 -1.4343179735781029 43 -1.4266881973249035 44 -1.4281788943314853 45 -1.4335118018651605
		 46 -1.4318753775584514 47 -1.4282797242813716 48 -1.4301594926312491 49 -1.4339824401558035
		 50 -1.437367334432414 51 -1.4401482978530442 52 -1.4385846722827258;
createNode animCurveTA -n "FKIndexFinger1_R_rotateX";
	rename -uid "C08EE66B-47B4-0952-CA5B-07B4F81D8F9C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -7.3947896344026762e-14 1 -2.4904721670444432
		 2 -2.3379209127795111 3 -2.3360928321159338 4 -2.3120726744705222 5 -2.2611977329925685
		 6 -2.1878613995718492 7 -2.1076464844719509 8 -2.0286025454972876 9 -1.9552350580660256
		 10 -1.9126534118504457 11 -1.9069079800753801 12 -1.9131359246483484 13 -1.9194425539774491
		 14 -1.9224096388431064 15 -1.9257874046818331 16 -1.9288616692059155 17 -1.9459851334150584
		 18 -2.201616184341789 19 -2.7909433261808068 20 -3.4877733588857835 21 -3.8621215511274105
		 22 -3.8492679686036002 23 -3.6109530313770963 24 -3.6582572281222077 25 -3.6867236703860931
		 26 -3.6885108188384312 27 -3.6860479399442339 28 -3.6832103192013088 29 -3.6877976931860967
		 30 -3.6944260351614262 31 -3.6423823889072651 32 -3.4645696867074873 33 -3.1809815728482973
		 34 -2.8353644387528871 35 -2.5128199822952397 36 -2.3323296470686956 37 -2.3182477747562071
		 38 -2.319169119598993 39 -2.31746747269771 40 -2.3161097075562829 41 -2.3162492384252609
		 42 -2.3174461395618939 43 -2.316281677707166 44 -2.3139743238909118 45 -2.3139554816006922
		 46 -2.3142637614253583 47 -2.3153241991375837 48 -2.3180823890249953 49 -2.3184802221939207
		 50 -2.3157411964269472 51 -2.3122237674321751 52 -2.3119078660287795;
createNode animCurveTA -n "FKIndexFinger1_R_rotateY";
	rename -uid "83F960A7-434F-6CF7-5BD9-6BA054EBC46E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 4.7708320221952748e-14 1 -4.7881128263264321
		 2 -3.6721317422449213 3 -2.3324120874356589 4 -0.65565047839257751 5 1.1525320568900734
		 6 2.9054096555009119 7 4.3984303693444566 8 5.5997407526061584 9 6.5270095684549103
		 10 7.0185096470356809 11 7.1260164733278977 12 7.0978757203558898 13 7.0246429098110017
		 14 6.9896703879259849 15 6.9542715527032302 16 6.9013191817369739 17 6.5008876380347154
		 18 1.0516318050553941 19 -10.009844745075281 20 -20.644152872428961 21 -25.446319570045102
		 22 -25.384499465737065 23 -13.821439383316466 24 2.4585430163579463 25 3.890561653644669
		 26 3.7631067905684441 27 3.7895716687559551 28 3.7758515573647671 29 3.6702491017845142
		 30 3.6005231327772558 31 3.1691204951453962 32 1.7753502569864577 33 -0.23148310476471357
		 34 -2.3573387143642539 35 -4.1451631692579634 36 -5.1135262442654987 37 -5.211817479588702
		 38 -5.190670516351104 39 -5.1659412507451679 40 -5.1547272686810457 41 -5.1545435967493507
		 42 -5.1732499232886697 43 -5.1782251383397995 44 -5.1757040473957412 45 -5.1842155293577763
		 46 -5.1175736299308223 47 -5.0200661639056721 48 -4.99682649874521 49 -4.9493303451157828
		 50 -4.8149180195916612 51 -4.6882270897741511 52 -4.6419192140011063;
createNode animCurveTA -n "FKIndexFinger1_R_rotateZ";
	rename -uid "4C8E87A4-407C-B96E-E9D2-7DB227D699DA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -1.2722218725854099e-14 1 5.9619301170926304
		 2 5.7630799631288685 3 6.0436629846511281 4 6.3793474827223156 5 6.7514830682445721
		 6 7.1293238987469731 7 7.4738616192756284 8 7.7612193911313092 9 7.9799645397536629
		 10 8.0752186673577633 11 8.0552986255639691 12 8.02779576830339 13 8.0263623288585713
		 14 8.0260462295783537 15 8.0229641376847933 16 8.0322032228535889 17 8.0647792861720458
		 18 8.3214079757501977 19 8.8958655524408083 20 9.5823884957508909 21 9.9641376817301648
		 22 9.9608435540696654 23 8.959329219298052 24 7.809653507029374 25 7.7150164268620358
		 26 7.7138660795446192 27 7.7164478754893651 28 7.7438451789213216 29 7.7722119826289555
		 30 7.7833347230598529 31 7.6804502358138294 32 7.3347995676253008 33 6.8292010565602181
		 34 6.3064811818342639 35 5.8877037876581229 36 5.6598753473580059 37 5.6306564355783824
		 38 5.6281468063484317 39 5.632633023075555 40 5.6387389319769481 41 5.6377906600830894
		 42 5.6352289473511377 43 5.6446478465952596 44 5.6597549696228819 45 5.662536516232433
		 46 5.6408161507805303 47 5.6055038880270764 48 5.580525112397817 49 5.5646918592815178
		 50 5.5458756343569338 51 5.5344082534768511 52 5.5243037239283783;
createNode animCurveTA -n "FKPinkyFinger3_R_rotateX";
	rename -uid "221599F0-44D2-2F75-C9EA-289FC2EC1EDF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -360.33676218437563 1 -360.507877896764
		 2 -360.62842864113372 3 -360.8377310994515 4 -361.11835375257209 5 -361.4591260082907
		 6 -361.84957918817184 7 -182.26439781984337 8 -182.65599891522464 9 -182.95590344262862
		 10 -183.08220323337829 11 -183.08307501676592 12 -183.07887891240659 13 -183.08131892138394
		 14 -183.08508250283646 15 -183.08543444691148 16 -183.08496752719122 17 -183.00998130795242
		 18 -362.02140944536103 19 -360.66414872475565 20 -359.87367420341775 21 -359.63301798100969
		 22 -359.62229473505556 23 -360.38489353338855 24 -182.41786251013937 25 -182.70146829038649
		 26 -182.67958060676051 27 -182.67481319029133 28 -182.67095001842287 29 -182.67050708341742
		 30 -182.67608140662071 31 -182.51882776990945 32 -362.04940501199764 33 -361.4766123828669
		 34 -360.97699899429477 35 -360.63315350224548 36 -360.47391704322098 37 -360.46057828563426
		 38 -360.46043793387372 39 -360.46004371041562 40 -360.45878543524958 41 -360.4581753629929
		 42 -360.45933620314406 43 -360.45955834059345 44 -360.45844680422073 45 -360.45647799023948
		 46 -360.45360744087941 47 -360.45291607496034 48 -360.45455154514951 49 -360.4552497862835
		 50 -360.45492612443121 51 -360.45476864608486 52 -360.4547466167291;
createNode animCurveTA -n "FKPinkyFinger3_R_rotateY";
	rename -uid "836A9FC8-47E1-8A11-3A49-F39E453F7DD8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 18.16568859251236 1 18.834437995837295
		 2 20.677925486352628 3 23.43267794585876 4 26.739383629486369 5 30.277087148139913
		 6 33.820299091511551 7 142.88942913225236 8 140.14403183810549 9 138.23930805656778
		 10 137.48296513323339 11 137.4779805807155 12 137.50273134797607 13 137.48834715181277
		 14 137.46610266321252 15 137.4641323717681 16 137.46696072945642 17 137.9060885857146
		 18 35.230476272918942 19 21.126902847277766 20 7.5296840033816101 21 1.4477788858576799
		 22 1.5698171266290981 23 16.806699826299845 24 141.77515065609111 25 139.84392000858935
		 26 139.98837937405651 27 140.01968542167123 28 140.0452023206355 29 140.04802883530215
		 30 140.01077631058556 31 141.06768119977065 32 35.460088812062104 33 30.444377121364724
		 34 25.119876969519538 35 20.739416216975965 36 18.453387478315609 37 18.252507179513852
		 38 18.250441944761199 39 18.244506058328845 40 18.225701576111987 41 18.216563002377171
		 42 18.233776715885256 43 18.237273226380619 44 18.220508640441661 45 18.190523061583129
		 46 18.147182233895968 47 18.136714846256261 48 18.161264512486333 49 18.172283052218468
		 50 18.167142006365118 51 18.164611115497149 52 18.164312818950563;
createNode animCurveTA -n "FKPinkyFinger3_R_rotateZ";
	rename -uid "EDC10E5F-47E5-F728-9458-B3B3FC017789";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 359.96382007383193 1 359.44387463211649
		 2 359.26709076522963 3 358.94529712109471 4 358.53428381496991 5 358.05895784322797
		 6 357.53832632430482 7 177.00632364291243 8 176.519268129355 9 176.15429016894041
		 10 176.00250199708452 11 176.0015015065047 12 176.00655523494373 13 176.00362439709031
		 14 175.99910368562126 15 175.99870173538471 16 175.99924710807309 17 176.0876979066098
		 18 357.3189718546783 19 359.21806364816416 20 360.61657802199386 21 361.17086742992234
		 22 361.15288318390094 23 359.69282660380338 24 176.8138065112515 25 176.46325888682853
		 26 176.49033376607636 27 176.49617531866065 28 176.5009232548658 29 176.50146482434292
		 30 176.49446853453443 31 176.68783270884808 32 357.27959515668323 33 358.03551135902779
		 34 358.73931676604252 35 359.26019499417816 36 359.51509856090519 37 359.5370278571545
		 38 359.53725021214717 39 359.53789974355368 40 359.53995934373796 41 359.54096011764557
		 42 359.53907213304939 43 359.53869675308903 44 359.54052454526095 45 359.54377275151944
		 46 359.54849658366379 47 359.54963694114269 48 359.54695984846677 49 359.54577676053373
		 50 359.5463232366435 51 359.54659927257381 52 359.54663111695754;
createNode animCurveTA -n "FKPinkyFinger2_R_rotateX";
	rename -uid "A11E353B-401D-56D8-6015-488D660A027F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 3.5311250384401269e-30 1 -5.8314635732177873
		 2 -5.6030669172924226 3 -5.8628966464447663 4 -6.2328242626131933 5 -6.710061861076194
		 6 -7.2763446049848914 7 -7.8901317538808602 8 -8.4809700460606816 9 171.05543902475054
		 10 170.84924506073168 11 170.83445471404491 12 170.83710652787801 13 170.84422717365132
		 14 170.84959531632137 15 170.84598136495271 16 170.83709323895627 17 170.88399339261596
		 18 -8.4145780657034841 19 -7.2610432609736035 20 -6.4197854820833724 21 -6.1076904555182532
		 22 -6.1034698837696633 23 -7.8179884211617097 24 167.4686469736186 25 166.79460388769598
		 26 166.84594899740591 27 166.85098237905271 28 166.85761092111048 29 166.85401626966419
		 30 166.82326312567284 31 167.66257796584716 32 169.81634016847073 33 -8.0767583602102118
		 34 -6.5966066358946396 35 -5.7548333263726539 36 -5.4204992598467339 37 -5.3950873068670324
		 38 -5.3954258999030902 39 -5.3953777619442009 40 -5.3971890470178447 41 -5.3982170174052433
		 42 -5.397374469405686 43 -5.396236164609105 44 -5.396001051168267 45 -5.3961796945063361
		 46 -5.3968304919343062 47 -5.3989539634001735 48 -5.4011437532262248 49 -5.400851404892439
		 50 -5.3997065366827544 51 -5.4003756333855142 52 -5.4010473130080987;
createNode animCurveTA -n "FKPinkyFinger2_R_rotateY";
	rename -uid "2D56D93D-4014-3729-8056-C1982A112FCA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -6.3611093629270335e-15 1 5.2592079459584031
		 2 7.3217784627450033 3 10.843653706953011 4 15.137326405512226 5 19.810034938424224
		 6 24.469533667753186 7 28.741746655676678 8 32.284082911813421 9 145.24680474407506
		 10 144.2237526956699 11 144.15230163297832 12 144.16506100273457 13 144.19969121239782
		 14 144.22578679012491 15 144.20822685087953 16 144.16504175846941 17 144.39193086584578
		 18 31.907413547753116 19 24.347342043230899 20 17.066713571639291 21 13.769443881432041
		 22 13.868663094806122 23 28.172987042927904 24 131.87346987806836 25 130.09630839977737
		 26 130.22621191802097 27 130.23897600088654 28 130.25578796789708 29 130.24666048965008
		 30 130.16795097203402 31 132.41286204763452 32 139.67103496132736 33 29.906757837018716
		 34 18.756306202827155 35 9.418986263478244 36 4.4962751705763138 37 4.0739290575031548
		 38 4.0790874958637851 39 4.0785201725599878 40 4.1088665079023867 41 4.1258805454461918
		 42 4.1119173077589526 43 4.0928331289808879 44 4.088719688932505 45 4.0917510646952842
		 46 4.1028135974472884 47 4.1382894448488408 48 4.1752078485345905 49 4.1701430636780605
		 50 4.1508095309891457 51 4.1621807391107417 52 4.1734253403911517;
createNode animCurveTA -n "FKPinkyFinger2_R_rotateZ";
	rename -uid "211092E2-4612-76B4-5087-D990551BF60A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 359.99999999999994 1 357.3070960013614
		 2 357.15128727556743 3 356.59817297064296 4 355.89015895576642 5 355.06588774814765
		 6 354.17224639393169 7 353.27255286328437 8 352.45337443236394 9 171.83489368452663
		 10 171.56557942723521 11 171.54649507841094 12 171.5499208840892 13 171.5591938339268
		 14 171.5661621728033 15 171.56146682564673 16 171.54992591804546 17 171.61035755431107
		 18 352.54459559583779 19 354.19727003250756 20 355.55740917718333 21 356.12006512996788
		 22 356.09636379977826 23 353.39802161280221 24 167.4582618442636 25 166.68371776876356
		 26 166.742565137317 27 166.74832162607456 28 166.75589486223865 29 166.75178666955711
		 30 166.71600751921386 31 167.68085719764198 32 170.25774139714758 33 353.01130548517142
		 34 355.2575753176402 35 356.82503372235323 36 357.58059920597219 37 357.6438246722463
		 38 357.64304086398079 39 357.64314133473357 40 357.63861104329845 41 357.63605919074121
		 42 357.63814863598691 43 357.64100460563276 44 357.64160395512749 45 357.64116138043198
		 46 357.63950353465077 47 357.63419249552902 48 357.62867869492487 49 357.6294430881228
		 50 357.63233080123547 51 357.63063421720074 52 357.62894814424271;
createNode animCurveTA -n "FKPinkyFinger1_R_rotateX";
	rename -uid "67942775-478C-7BF9-8455-8386E033D8C2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -180.00000000000009 1 -173.67647975625283
		 2 -173.28975578313199 3 -172.17145862972586 4 -170.89966887924811 5 -169.62007022012807
		 6 -168.45283926982665 7 -347.48327644945579 8 -346.74431993078815 9 -346.25344383682494
		 10 -346.05900952812584 11 -346.06026694439811 12 -346.07961592385664 13 -346.0858089173235
		 14 -346.07407704888931 15 -346.05751872198221 16 -346.05361056891792 17 -346.06491876425792
		 18 -346.19872810899398 19 -346.2933654802024 20 -346.10080624514632 21 -345.90111914947624
		 22 -345.92020895910343 23 -346.41538656137874 24 -346.1995732687713 25 -346.13072781137896
		 26 -346.1346392376488 27 -346.13743419121045 28 -346.14377882777831 29 -346.14954800574714
		 30 -346.14118153166118 31 -346.37769544403977 32 -347.28393963307025 33 -168.88442832465429
		 34 -170.96850008113174 35 -173.0077399424836 36 -174.19042072653383 37 -174.29118683182571
		 38 -174.27968294310969 39 -174.28146525019793 40 -174.28142355057781 41 -174.27218515690913
		 42 -174.26446371047859 43 -174.26742682712327 44 -174.27546509595757 45 -174.29239338148031
		 46 -174.3258574878756 47 -174.37837693455904 48 -174.43626431934646 49 -174.46275915552317
		 50 -174.44731583487618 51 -174.42173428684472 52 -174.40305759134839;
createNode animCurveTA -n "FKPinkyFinger1_R_rotateY";
	rename -uid "DF7BBD27-4357-794F-393C-AA86675A5FAA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -180.00000000000006 1 -191.46403715218784
		 2 -191.57389071041848 3 -192.81938832030309 4 -194.33245018563505 5 -195.96485304936817
		 6 -197.5614197086654 7 18.99454314663474 8 20.166023137056879 9 21.005870733682606
		 10 21.41349937632495 11 21.491531275017024 12 21.49046637583313 13 21.474562451309492
		 14 21.47528894359024 15 21.479218315884498 16 21.476976191243814 17 21.195268690858263
		 18 16.897226906678632 19 8.1595130272605871 20 -0.16529781932080176 21 -3.867441426600073
		 22 -3.7801326106512612 23 7.593637790565432 24 23.871501848026444 25 25.355702760710546
		 26 25.244403059971557 27 25.238292188319129 28 25.238607855124989 29 25.236731987288955
		 30 25.2489472953384 31 24.543306700328074 32 22.261600333299867 33 -198.94376376231472
		 34 -195.34335077278388 35 -192.29185596388166 36 -190.6658384048566 37 -190.52344593907077
		 38 -190.53795938654062 39 -190.53519674973475 40 -190.52716489876113 41 -190.53063082478226
		 42 -190.53460188651354 43 -190.53572277956786 44 -190.5369795259239 45 -190.51598354831432
		 46 -190.48053837152173 47 -190.45341491465948 48 -190.42846120335528 49 -190.4118737883594
		 50 -190.41911762826251 51 -190.4367300436964 52 -190.44291684109589;
createNode animCurveTA -n "FKPinkyFinger1_R_rotateZ";
	rename -uid "8625F7C4-4AB7-D215-0401-859C7E52BDDF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -180 1 -176.71940547401206 2 -178.02735728826536
		 3 -179.4971402951833 4 -181.30108655727076 5 -183.29424134629411 6 -185.34143854011
		 7 -7.2848242775439056 8 -8.8992121354730234 9 -9.9616538415663118 10 -10.347590292813916
		 11 -10.365908291217611 12 -10.396312305389031 13 -10.410240173824167 14 -10.390333845709954
		 15 -10.3573264033 16 -10.348989554668586 17 -10.366675466081601 18 -10.603862071993589
		 19 -11.309019528207029 20 -12.313415612142254 21 347.11638822432712 22 347.15706342044729
		 23 -11.200961674661926 24 -9.698038118625611 25 -9.6004375861018811 26 -9.6095610008544003
		 27 -9.6188402529630803 28 -9.6347535479343449 29 -9.6539969703737185 30 -9.6714553218168842
		 31 -8.9464530435839169 32 -6.6985016943303508 33 -183.59419625137465 34 -180.42208663110509
		 35 -177.88407578807241 36 -176.56965794494545 37 -176.44280135975171 38 -176.43994519549474
		 39 -176.44387104680393 40 -176.44226975147862 41 -176.41987197554496 42 -176.40137563687961
		 43 -176.40899913553503 44 -176.42922360175154 45 -176.46755435708133 46 -176.54455250635382
		 47 -176.67086225358881 48 -176.81125175426433 49 -176.87473616355808 50 -176.83734274423557
		 51 -176.77635373536052 52 -176.73072474527609;
createNode animCurveTA -n "FKRingFinger3_R_rotateX";
	rename -uid "E516F441-4B5B-865C-B062-25A46219A56E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.30117108869202336 1 -0.32346490169940312
		 2 -0.38742911998247465 3 -0.49283662122694338 4 -0.64021355963187676 5 -0.82840873008084237
		 6 -1.0521627379813028 7 -1.2968425873859601 8 178.46783823319905 9 178.28678216927671
		 10 178.21000801452155 11 178.20716104492874 12 178.20769924798807 13 178.20724194584619
		 14 178.20660701388661 15 178.20638916591193 16 178.20679178274659 17 178.26620696183574
		 18 -1.0265751136440726 19 -0.23332225375556945 20 180.0856711236446 21 180.13164188006223
		 22 180.14337643704695 23 -0.033070078664454571 24 -0.71971771136485718 25 -0.82585498993399098
		 26 -0.81878809356034166 27 -0.81888564246295914 28 -0.81858254461920787 29 -0.8185783317796721
		 30 -0.81973206534809673 31 -0.7867583898772692 32 -0.68677863659991356 33 -0.55824520057111837
		 34 -0.43763779978019529 35 -0.34808744443617079 36 -0.30388616760977388 37 -0.29942429556752365
		 38 -0.29959934189944304 39 -0.30018211309560422 40 -0.30041401001189694 41 -0.30017302212709518
		 42 -0.3002451501501911 43 -0.30007554045022627 44 -0.29972821675840405 45 -0.30034922301845429
		 46 -0.3009566519034651 47 -0.30029401798988925 48 -0.29959684503008815 49 -0.2996848713216389
		 50 -0.29981228056973003 51 -0.29967370069293653 52 -0.29996666978587039;
createNode animCurveTA -n "FKRingFinger3_R_rotateY";
	rename -uid "D24F928F-400D-50C9-E84F-6AAD50A58016";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 24.718014968845203 1 25.393248671353049
		 2 27.220914149563765 3 29.928528989382645 4 33.219951093898914 5 36.804268120052107
		 6 40.40545118218845 7 43.738643784106536 8 133.50459706006703 9 131.62220631762364
		 10 130.87819883923424 11 130.85164313902163 12 130.85668692732423 13 130.85221995424621
		 14 130.84637117051588 15 130.8441781254873 16 130.84794518725715 17 131.40308237246677
		 18 40.000196975402062 19 22.357057523145677 20 -185.35594899080689 21 -177.75692602419562
		 22 -177.87944996164453 23 13.216347725031138 24 34.807867190444718 25 36.7628066278129
		 26 36.635277962587196 27 36.636898108974883 28 36.631741996413417 29 36.631819384792081
		 30 36.652598407536004 31 36.063147783564332 32 34.164009614541939 33 31.449671594537957
		 34 28.551177668340362 35 26.114001572451176 36 24.801673113856889 37 24.664058487326528
		 38 24.669698866160061 39 24.687721502395078 40 24.694698900170486 41 24.68754944297207
		 42 24.689172158911276 43 24.684049957802667 44 24.673332701851368 45 24.692628376211239
		 46 24.711395105998317 47 24.69107671156031 48 24.66980104697322 49 24.671993803963932
		 50 24.676176579149203 51 24.671837674399196 52 24.680850017878207;
createNode animCurveTA -n "FKRingFinger3_R_rotateZ";
	rename -uid "0B42E770-48B5-1398-DE53-449E8893AC78";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.53406190341209081 1 -0.57987738344726503
		 2 -0.70674679392830064 3 -0.90314763617370253 4 -1.1577705834692953 5 358.54093434683205
		 6 358.20701103500841 7 357.86316056467132 8 177.54755342824726 9 177.31251568189916
		 10 177.21466215877223 11 177.21110773242717 12 177.21177278110633 13 177.21118679109296
		 14 177.21038802449621 15 177.21011732374569 16 177.21062120252054 17 177.28434583011241
		 18 358.2488530392589 19 -0.37637810151486484 20 180.62083358210057 21 181.0317117666049
		 22 181.02301996412163 23 0.17616609748912415 24 -1.2878488043021872 25 358.5445773259147
		 26 358.55576252015965 27 358.55562667701201 28 358.55609055032784 29 358.55609037484044
		 30 358.55425661701702 31 358.60554093543226 32 -1.234500160350962 33 -1.0184527477967684
		 34 -0.80188647739137719 35 -0.62940048414069982 36 -0.53971412606739366 37 -0.53043462000929442
		 38 -0.53081166951985537 39 -0.53203679847347674 40 -0.53249722886607886 41 -0.53200569281472843
		 42 -0.53213667280688348 43 -0.53177235729484185 44 -0.53105833919818202 45 -0.53235973525122537
		 46 -0.53362250323338878 47 -0.53224659960639598 48 -0.53080493381398275 49 -0.53096557303384972
		 50 -0.53124913529591455 51 -0.53095557644739011 52 -0.53155863353943666;
createNode animCurveTA -n "FKRingFinger2_R_rotateX";
	rename -uid "B5CCF6D9-4BC9-3A9E-907B-1FAEF8A43F72";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.081592348482964636 1 -0.097809522152624007
		 2 -0.14555735285496876 3 -0.2254869078656403 4 -0.33761474310772133 5 -0.48100151360814636
		 6 -0.65149369618103847 7 -0.8368458807513014 8 -1.0149526735502883 9 -1.1527687127603286
		 10 -1.210901181501185 11 -1.2121951505813575 12 -1.2109363099831418 13 -1.2109353294627843
		 14 -1.2122456243662219 15 -1.2131490571013706 16 -1.212009204459275 17 -1.1881035885311431
		 18 -0.87667264684507074 19 -0.4105182218292483 20 -0.11660771593828388 21 -0.023794662824120742
		 22 -0.01386534821227234 23 -0.35176004774659947 24 -1.1934975079801553 25 -1.307815032188862
		 26 -1.3003445737041603 27 -1.2995092252663973 28 -1.2975899503237465 29 -1.296348104546361
		 30 -1.299169066076024 31 -1.1975512855280888 32 -0.91013562097399558 33 -0.58493459167884743
		 34 -0.32400290654555508 35 -0.15889051346701652 36 -0.087373740281709772 37 -0.081733252248366597
		 38 -0.082120019726913879 39 -0.081957815885082455 40 -0.08169933483501092 41 -0.081653608561653421
		 42 -0.081974366671555471 43 -0.082290000192215967 44 -0.081965059770702078 45 -0.081562038434538964
		 46 -0.081895458564638729 47 -0.082267521935374177 48 -0.082027554740976782 49 -0.082671102441092187
		 50 -0.084633042811361414 51 -0.084913618314906653 52 -0.08295993686691279;
createNode animCurveTA -n "FKRingFinger2_R_rotateY";
	rename -uid "8FF7EDA4-4160-05DE-C669-148A0C7EBCCA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.3650486617000594 1 1.2475138745596726
		 2 3.675500456384321 3 7.2675505339222131 4 11.588156743510226 5 16.275235645687907
		 6 20.990242317343444 7 25.353514128402864 8 28.988188213997343 9 31.500144208388367
		 10 32.490691306022185 11 32.511545487958152 12 32.490411699092988 13 32.490361085621785
		 14 32.512468148920128 15 32.527349064132068 16 32.508331098966636 17 32.117472708575576
		 18 26.19226240139669 19 14.002295690865301 20 2.2361862310369469 21 -3.0452993458494664
		 22 -2.9387427723796624 23 11.646804596861779 24 32.196561348468393 25 34.065254756130606
		 26 33.945121696218422 27 33.9320458042571 28 33.901509831712815 29 33.881949714424152
		 30 33.929827923005732 31 32.276788216152802 32 26.909466937760207 33 19.228844640321537
		 34 11.075860490339892 35 4.2826708481374727 36 0.68493589277148403 37 0.37228638684838666
		 38 0.39386119945030101 39 0.38535843108959883 40 0.37049384690196235 41 0.36809437138075524
		 42 0.38685950563712046 43 0.40345777676888367 44 0.38606403862961369 45 0.36302811583258482
		 46 0.38173170593888422 47 0.40269435257693215 48 0.38888471511956346 49 0.42553480241237157
		 50 0.53338365707956537 51 0.54883134482661189 52 0.4407510064973606;
createNode animCurveTA -n "FKRingFinger2_R_rotateZ";
	rename -uid "F4463C7A-4907-CE6C-6885-7BA9759E97A6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 358.97361443867987 1 358.93263413832818
		 2 358.81841091072334 3 358.64480088281471 4 358.42677777369005 5 358.17562134241962
		 6 -2.0968653894996936 7 -2.3715740343005325 8 357.37892715688457 9 357.19327308048929
		 10 357.11671658310752 11 357.11508973361043 12 357.11674357976176 13 357.11675537073921
		 14 357.11502353883878 15 357.1138488688112 16 357.11534143890083 17 357.14575188848005
		 18 -2.4263663249109673 19 358.30047063570385 20 358.88638885527422 21 359.12956183650596
		 22 359.12090290248625 23 358.42264109662074 24 357.13965425052896 25 356.99065662745653
		 26 357.0005021042345 27 357.0015630697726 28 357.00404079457508 29 357.00564778724782
		 30 357.00171097966199 31 357.13333425572836 32 357.52415135232178 33 -1.9924322776864078
		 34 358.45326800140475 35 358.78959520146947 36 358.95880101387138 37 358.97328318349156
		 38 358.97228800067734 39 358.97268342644918 40 358.97336267560433 41 358.97348266224412
		 42 358.97260844840031 43 358.9718308659306 44 358.97265435623791 45 358.9737064054342
		 46 358.97284136094265 47 358.97187146572497 48 358.97250773400179 49 358.97082117088144
		 50 358.96581651133988 51 358.96509417238548 52 358.97011155699471;
createNode animCurveTA -n "FKRingFinger1_R_rotateX";
	rename -uid "01FB5B8F-4273-1CF4-477E-5CBA06694732";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 179.99999999999991 1 178.71110296804611
		 2 178.67893260157246 3 178.48913454486291 4 178.21388478520933 5 177.85596333130994
		 6 177.43254334852702 7 176.98647559661887 8 176.59163462045129 9 176.32043376456679
		 10 176.23100815469533 11 176.25466039049135 12 176.25809120179397 13 176.23849368563833
		 14 176.2285438369409 15 176.23260793606406 16 176.23208682170053 17 176.2528801300468
		 18 176.61689608700974 19 177.20633897389834 20 177.62264492393814 21 177.776083445252
		 22 177.78201011384201 23 177.27062032753125 24 176.08823601765715 25 175.93324803906907
		 26 175.95366559853193 27 175.96780490324309 28 175.9745615201013 29 175.9769965412072
		 30 175.97355576743018 31 176.21191027374644 32 176.90643512475032 33 177.71979647175792
		 34 178.35848575268946 35 178.72559119812408 36 178.86711579114433 37 178.87707184916951
		 38 178.87254548376907 39 178.87116816629012 40 178.87122265342816 41 178.87414175526916
		 42 178.88021142974253 43 178.88245874846578 44 178.88292883491746 45 178.88735710181837
		 46 178.88943486658832 47 178.88152479486027 48 178.86549168787451 49 178.85257899298412
		 50 178.85240215087438 51 178.8547487612644 52 178.84867659658659;
createNode animCurveTA -n "FKRingFinger1_R_rotateY";
	rename -uid "72C47E00-42F5-8BCE-80F2-CDABA826C945";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 179.99999999999994 1 165.03744918681798
		 2 165.15783667711486 3 163.87725104269447 4 162.31720657970916 5 160.65344630070479
		 6 159.02415116296078 7 157.54195532796993 8 156.320322339874 9 155.43304102668336
		 10 154.99014197704975 11 154.91002312398106 12 154.91402040875826 13 154.92160099496419
		 14 154.93234569141259 15 154.95020760531133 16 154.94621100881346 17 155.18845091216218
		 18 159.1130066599853 19 167.16253546868296 20 174.93074700451677 21 178.43834703976961
		 22 178.35935359566065 23 166.85609362299812 24 150.67478132175813 25 149.21050452204014
		 26 149.3116715977574 27 149.31095795272373 28 149.31342649270809 29 149.31890635466735
		 30 149.29561856995412 31 150.11901860435211 32 152.80464488256203 33 156.66511788036516
		 34 160.77823222382369 35 164.22186047596628 36 166.06991289542776 37 166.25880755508936
		 38 166.25141178374739 39 166.23731212101637 40 166.23588570631307 41 166.24473653766813
		 42 166.24520943503501 43 166.22578259458686 44 166.2092318603485 45 166.21098341195338
		 46 166.20630800912511 47 166.20127875566848 48 166.23642561951544 49 166.29442360613763
		 50 166.31093041888377 51 166.2808879424031 52 166.26848730589018;
createNode animCurveTA -n "FKRingFinger1_R_rotateZ";
	rename -uid "74AD430C-4F9C-6D1F-2939-29B78BB62475";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -180.00000000000006 1 -175.29439640604227
		 2 -176.04248783481822 3 -176.70010732695914 4 -177.5244692337198 5 181.5448692566396
		 6 180.57059148211493 7 179.64103685014891 8 178.87923997872639 9 178.38787924232329
		 10 178.23936799858689 11 178.28904645420116 12 178.29534357685736 13 178.25753715308741
		 14 178.23797772513512 15 178.24479599530812 16 178.24397204600655 17 178.26997610969892
		 18 178.79067093496354 19 179.70685600078431 20 -179.56341002361211 21 -179.25786491887976
		 22 -179.23023479595665 23 179.92303659943607 24 178.17185976121436 25 177.96140399149081
		 26 177.99194550576337 27 178.0153595895309 28 178.0264716702315 29 178.03031731974599
		 30 178.02458475511861 31 178.39696668484385 32 179.56480883983164 33 181.15027066743698
		 34 -177.27255324897936 35 -176.0254419431252 36 -175.37236280938842 37 -175.3124915832247
		 38 -175.32713435922849 39 -175.33349485514046 40 -175.33354465183484 41 -175.32345147895862
		 42 -175.30533393805288 43 -175.30193433100092 44 -175.30317905373946 45 -175.2898385932495
		 46 -175.28445695392449 47 -175.30869269406182 48 -175.35040392105199 49 -175.37937021969097
		 50 -175.37726456717166 51 -175.37513742435436 52 -175.39512892555521;
createNode animCurveTA -n "FKWrist_R_rotateX";
	rename -uid "CB0C426A-4300-8CFE-5524-3D9A34DC4465";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 346.77025196794995 1 346.29848553455793
		 2 348.40998642476143 3 350.89249153307003 4 353.65077125891531 5 356.26784041084602
		 6 358.36464042452468 7 359.96267135224753 8 182.05281298387317 9 185.67934012514951
		 10 190.69141485047174 11 195.61926930955491 12 198.48673842462713 13 199.65540143546008
		 14 202.60687781711297 15 206.11444131510305 16 201.1014287863228 17 182.46991638122478
		 18 342.41899453899487 19 347.26567285715453 20 184.37260963308685 21 183.25249679601151
		 22 352.900539277353 23 347.43154601452886 24 345.0086120584445 25 338.67481781187587
		 26 329.8371519368792 27 321.24457765903674 28 313.55517166339337 29 307.70573373904728
		 30 304.53931789494231 31 304.31807234324816 32 308.27288511116899 33 316.64353039207816
		 34 325.76348684988324 35 331.02947603288737 36 332.1190240468087 37 332.09712882866285
		 38 333.88110843924841 39 337.79005034377127 40 341.44414047494848 41 342.79250601119304
		 42 341.55045943127107 43 339.36963675554244 44 338.35114239293159 45 338.8237440559472
		 46 339.73423330004982 47 340.52542988569235 48 341.37878686371556 49 342.34211986240513
		 50 343.2778065222555 51 344.05087086292059 52 344.56901503696355;
createNode animCurveTA -n "FKWrist_R_rotateY";
	rename -uid "126AC03D-412C-DEB2-4660-60BD1C9C3CB8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -8.7294756926532084 1 -6.7655436247890979
		 2 -6.9984211713268794 3 -7.5345199019836855 4 -8.4378132299803035 5 -9.7875477722111626
		 6 -12.425041066083644 7 -17.144043060414134 8 202.90564939132591 9 208.13957071889408
		 10 213.0162016997451 11 218.11856269666401 12 222.90780619425328 13 226.73487400021264
		 14 229.18524166003078 15 229.64167567934214 16 228.92491323748069 17 229.03927912045
		 18 -49.605459677146804 19 -49.034843446459 20 211.3928337243523 21 184.42033305365177
		 22 10.675515945659473 23 11.934157494584749 24 13.591410596547462 25 17.927961272199529
		 26 18.215384050035365 27 13.12343993458369 28 5.2146644357470269 29 -3.2587898601011758
		 30 -8.9288679992047104 31 -10.160862845967001 32 -9.7566621465174936 33 -10.176857294237548
		 34 -9.5860739735242735 35 -6.4879669019072752 36 -1.9288969143457537 37 2.8486205505616602
		 38 5.4970309854861608 39 4.6402058790556726 40 3.3426877813826104 41 4.6160739941786444
		 42 6.7414264155479637 43 7.1147971469812692 44 6.254687015860692 45 5.2493379360325267
		 46 4.1596286066940262 47 2.7665036094787077 48 1.0406482594862489 49 -0.74629226595892739
		 50 -2.4026959981145501 51 -4.0855974128428629 52 -5.8082442842465358;
createNode animCurveTA -n "FKWrist_R_rotateZ";
	rename -uid "6F5F3BFA-4D1D-3342-91FD-27912632D1B8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -358.048092558272 1 -5.2712261324478993
		 2 -4.8031960554521023 3 -4.8334930378379957 4 -4.6639165305249541 5 -363.78692068448493
		 6 -361.70460796035621 7 -358.93125652090635 8 -176.82446406527833 9 -175.8501983188217
		 10 -175.70210828830514 11 -176.69673490636248 12 -179.09172838154478 13 -181.48484091974899
		 14 -182.73080945565795 15 -184.1510231251049 16 172.92080215616593 17 166.55487368754683
		 18 -19.231765035008706 19 -6.2898253275654126 20 -170.60863848719043 21 -176.41869683263363
		 22 -363.23027078211112 23 -7.2847829554821155 24 -12.137586836631696 25 -15.245206486136667
		 26 -14.027443655710256 27 -9.6401890935713848 28 -4.4795730169108481 29 -360.26929595094504
		 30 -358.02660275195473 31 -359.57903519650955 32 -5.4274801124276468 33 -11.612302001971685
		 34 -14.33789523681078 35 -14.435959646210037 36 -13.060893200369589 37 -10.725262511036581
		 38 -8.7051167922022614 39 -7.6345479090512285 40 -6.6724357909901038 41 -5.1088633452693859
		 42 -362.97438173399905 43 -361.52134238219958 44 -361.54068436486193 45 -362.11419785268453
		 46 -362.47468806663676 47 -362.77624152008951 48 -363.23173894917778 49 -363.75812506406317
		 50 -364.24571168217784 51 -4.6126676564992355 52 -4.8047347100327187;
createNode animCurveTA -n "FKElbow_R_rotateX";
	rename -uid "BE6D73CA-49FF-918F-5B31-12A9FFE39C5C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 359.99999999999994 1 359.82051825518334
		 2 359.85118337279471 3 359.86144761530142 4 359.88757351692061 5 359.75284576068481
		 6 359.03822373569466 7 357.71975362143917 8 355.79701201735855 9 352.852396542946
		 10 348.3726005481019 11 341.83481721598844 12 333.67965249080316 13 326.90994309492311
		 14 324.03062245177045 15 322.26765008788618 16 318.63926864346712 17 320.31948577064611
		 18 338.307411118228 19 355.8322707006555 20 359.19307229171324 21 358.75680697794303
		 22 357.58914411891845 23 357.53460704315864 24 358.18975289983416 25 358.51589718805627
		 26 358.46888524028304 27 358.3398993362963 28 358.23228910527615 29 358.18848713260888
		 30 358.39906246987948 31 358.96744542613749 32 359.50287239773246 33 359.68976237558491
		 34 359.65520263806701 35 359.61272577341219 36 359.69083344854533 37 359.8026321996723
		 38 359.8725231955338 39 359.88696521427659 40 359.86654051512926 41 359.847220758856
		 42 359.83577578157394 43 359.82270674877248 44 359.81067394909218 45 359.80552137494476
		 46 359.80533015262881 47 359.80703654602439 48 359.81010838083961 49 359.81393023226491
		 50 359.81741329314582 51 359.81944576568861 52 359.81928845080319;
createNode animCurveTA -n "FKElbow_R_rotateY";
	rename -uid "78F97C33-43BB-4D47-9589-B78E07E6E1B3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 5.8840261607075055e-14 1 4.6072624873169419
		 2 4.6334094847035807 3 4.8818785709505272 4 6.0602440181954451 5 9.2311027244187276
		 6 13.640427373302222 7 17.847234283662647 8 21.784163293758915 9 25.866494944950922
		 10 29.961821610077013 11 33.538777832497701 12 35.606551052779821 13 35.818950420420386
		 14 35.517524243723855 15 35.213407510918323 16 34.279544455486565 17 34.746957378393653
		 18 34.590589768978731 19 21.812538784546167 20 12.940949029993824 21 14.759457373376403
		 22 18.166671809584098 23 18.301342023888772 24 16.577381382155924 25 15.571757608262097
		 26 15.725434798161778 27 16.129793468949813 28 16.452970107061095 29 16.580763684722989
		 30 15.944917465857053 31 13.930544951848342 32 11.245387628479996 33 9.827269724695963
		 34 10.136872997820552 35 10.473464324845809 36 9.8235180219831228 37 8.5923719138893269
		 38 7.2235805537731004 39 5.9350253141639309 40 5.0061224071617092 41 4.5504252097574147
		 42 4.3311688390302194 43 4.1089576845761364 44 3.9235045453413888 45 3.8488714002923805
		 46 3.8460497400671638 47 3.8705129825242581 48 3.9151520428454396 49 3.9722935825792143
		 50 4.0255587267192006 51 4.0572161937381743 52 4.0547418716192594;
createNode animCurveTA -n "FKElbow_R_rotateZ";
	rename -uid "C04BD8F5-4D42-2954-07DB-4FBECB74B71E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -2.5444437451708115e-14 1 -360.40786316631375
		 2 -359.82502154969387 3 -359.40508493086827 4 -357.40944821911216 5 -352.00573768306089
		 6 -344.29156803402816 7 -336.48333716405807 8 -328.48001959915791 9 -318.98794425558935
		 10 -307.2226607310904 11 -292.54725267468859 12 -275.97788533978888 13 97.300906013668552
		 14 102.98315617749168 15 106.49659714457042 16 113.86504510662024 17 110.4203212490836
		 18 -284.99328257407365 19 -328.27120278946035 20 -345.5426222727815 21 -342.25919804660111
		 22 -335.86546942010057 23 -335.60137978574915 24 -338.90379712671552 25 -340.77998246925608
		 26 -340.49483436596358 27 -339.74284148884561 28 -339.13780764333478 29 -338.89766662940224
		 30 -340.0883292447395 31 -343.77185656702983 32 -348.52676327295137 33 -350.98582704743336
		 34 -350.45004953063125 35 -349.86860139957577 36 -350.99113274053428 37 -353.10360701168759
		 38 -355.43586792708072 39 -357.62128926028333 40 -359.19408300474078 41 -359.96550465535205
		 42 -360.33658551150074 43 -0.71273750270243907 44 -1.026886759793602 45 -1.1533139733414548
		 46 -1.1580504711508208 47 -1.1165975761428157 48 -1.0410680969502635 49 -0.94419779325108111
		 50 -0.85401148434978835 51 -0.8004488595399295 52 -0.80457519534214872;
createNode animCurveTA -n "FKShoulder_R_rotateX";
	rename -uid "873BF0E8-435B-B997-EC14-439640BEFD2E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 359.99999999999972 1 335.83092944141578
		 2 339.65386887964627 3 162.21255964449489 4 164.97110832701458 5 164.02051764929706
		 6 158.56423276135081 7 155.80499232572467 8 340.91969714818418 9 348.62251798223269
		 10 353.75817374858855 11 356.00600335051939 12 357.42452545391336 13 360.42804147764537
		 14 366.76217846416978 15 376.3869303133755 16 30.547890263667274 17 44.784333140773221
		 18 221.88628878772863 19 370.02916399882218 20 342.74706722612808 21 332.43181157703543
		 22 326.62058935254487 23 316.78133739169897 24 307.06246537855975 25 301.98942247212716
		 26 301.04345536144177 27 301.38747618122994 28 301.65849676985721 29 302.67157041060545
		 30 308.23297222011462 31 319.40848151868624 32 325.45755414820195 33 322.38678936280564
		 34 318.90464499236367 35 318.68164324801023 36 319.8796279953188 37 322.19255718560589
		 38 147.28392185815309 39 154.55304914195474 40 159.74077314188048 41 160.44622205507915
		 42 158.38445614217792 43 156.46864213458483 44 155.96259568704164 45 156.25198618088282
		 46 156.45244778771843 47 336.45937091209044 48 336.51686596463571 49 336.69786769731752
		 50 336.9948780460179 51 337.28077884890962 52 337.37715959991573;
createNode animCurveTA -n "FKShoulder_R_rotateY";
	rename -uid "0FE32356-4BEB-72B1-C209-48B270722DA7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 3.9756933518293974e-14 1 54.306035716730356
		 2 50.809515703619219 3 -230.71370378388067 4 -230.35671111884156 5 -228.78448505322626
		 6 -225.64638780559409 7 -221.36334317993658 8 36.456584742159926 9 30.535085818099809
		 10 24.610045577658706 11 19.362869284797966 12 13.881999850296131 13 8.5994382718502873
		 14 8.0706128007942457 15 16.416134576749887 16 28.198750999281312 17 38.992985027257973
		 18 129.41995359704026 19 47.057749482543962 20 29.598187913971302 21 28.289561750262358
		 22 40.44727343399267 23 44.245225551202942 24 45.698442221039741 25 49.068649340267761
		 26 52.409508861686668 27 52.163296582453171 28 48.64983333503752 29 46.223866299912899
		 30 48.841765399042032 31 52.952257544500782 32 53.177537145908111 33 50.309389387254001
		 34 47.561659310230418 35 46.784131561156535 36 47.259258266956202 37 48.49544629724511
		 38 -229.95725871135659 39 -230.38918239607594 40 -229.61691119082886 41 -228.90654284788533
		 42 -228.7387851692713 43 -228.72187962723291 44 -228.68275145792751 45 -228.73716364711919
		 46 -228.9257649250325 47 49.184260728422302 48 49.505873339237098 49 49.904227872269296
		 50 50.33705085040549 51 50.748769857289233 52 51.105699327459789;
createNode animCurveTA -n "FKShoulder_R_rotateZ";
	rename -uid "76FEB328-4715-C2BA-4D08-EE8296CE0014";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -360 1 -361.8096338032629 2 -362.60457581070204
		 3 -183.74661960037935 4 -185.85142853845284 5 -186.7053061830608 6 -185.36310929215176
		 7 -186.80896830622956 8 -14.238909979747312 9 -22.810903435699846 10 -27.724472141179337
		 11 -27.916005615155409 12 -24.394215006158348 13 -18.766751309542521 14 -13.349840553914236
		 15 -11.694887183184305 16 -15.195005811878792 17 -18.561714190026088 18 -191.37240533030879
		 19 -354.24520002242866 20 -340.57478139148299 21 -324.83082878069871 22 -315.14744685180148
		 23 -307.52010270988336 24 -300.1638942881014 25 -298.49046139274941 26 -302.07429395021836
		 27 -307.76308612837516 28 -314.5746384218192 29 -323.14989338388449 30 -334.81647584153478
		 31 -348.81606026712336 32 -356.36290647491921 33 -355.97952684614029 34 -356.15644673167412
		 35 -358.32780676795608 36 -360.13426125192842 37 -361.91616707915591 38 -185.59491801763326
		 39 -190.94651677927268 40 -194.36471544467057 41 -193.76417478497817 42 -190.54942367124733
		 43 -187.2815950554901 44 -185.35739237557087 45 -184.43825044534123 46 -183.70413275742874
		 47 -362.9784995745585 48 -362.45640598615358 49 -362.18229818939528 50 -362.13451642633731
		 51 -362.21683091260104 52 -362.26028918878148;
createNode animCurveTA -n "FKScapula_R_rotateX";
	rename -uid "111687FE-46BA-1E4A-FAB6-F58C7CF4BE4D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -3.5284278497485885e-13 1 10.590727643023538
		 2 9.8141741429916163 3 9.7331797322729638 4 9.6451564133982863 5 9.5145738654931193
		 6 9.3630175500000394 7 9.1819740950929312 8 9.1135503483503975 9 10.55162455864577
		 10 13.701376429141087 11 18.122507535917034 12 23.277147977258963 13 28.583699856199662
		 14 33.386695817836838 15 37.242260909974 16 41.443466896508475 17 49.912414288604225
		 18 59.412959185033237 19 61.538076253960817 20 46.220742986794313 21 20.472762298585312
		 22 4.4941037486978557 23 2.7723307960010821 24 2.5588211450775482 25 2.436147317034993
		 26 2.5799990691550154 27 2.8324598669484047 28 3.0768472345740503 29 3.297214130346998
		 30 3.5643548944721313 31 3.9495812196117464 32 4.4021338251904671 33 4.8184949432675577
		 34 5.1670269673463203 35 5.5053125471745146 36 5.9052434995460636 37 6.3811158617755028
		 38 6.8981747539737128 39 7.4061522116457139 40 7.8302111678529425 41 8.1230423537722753
		 42 8.3493029198038737 43 8.6031606863563876 44 8.8731746614638212 45 9.0999307764679553
		 46 9.2696013981615764 47 9.4030243688290724 48 9.5209553419748545 49 9.637244419293225
		 50 9.7514523532277089 51 9.8449061222025964 52 9.8976772522419001;
createNode animCurveTA -n "FKScapula_R_rotateY";
	rename -uid "49CC21AD-4B8F-9AB2-54D6-4C90AC19D1EF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 9.8398410457777648e-14 1 -335.35781059222802
		 2 -337.47409065693432 3 -338.27256577409082 4 -339.39361562734877 5 -340.78232925212876
		 6 -342.32921158713168 7 -343.88395945795696 8 -345.48554735720467 9 -347.71816052483592
		 10 -350.97109772877752 11 -355.37936424771874 12 -1.2422114377120561 13 -9.0403664563818698
		 14 -18.671007807286568 15 -28.264061285875542 16 -35.511935284923908 17 -44.13156094614866
		 18 -50.923883964892603 19 -46.141959012193936 20 -27.657358728255158 21 -11.515938735062754
		 22 -0.56915960111130337 23 -356.58757259599071 24 -356.22895539441754 25 -355.77711881769528
		 26 -355.07280347244563 27 -354.69087909607509 28 -354.01379796734142 29 -352.8636452109086
		 30 -351.86715836216445 31 -351.13798110384187 32 -350.22795296226099 33 -349.09209614474713
		 34 -347.92584813062882 35 -346.70122196765294 36 -345.42754188765991 37 -344.27622735326872
		 38 -343.33763170023281 39 -342.56199314804002 40 -341.88509489438985 41 -341.32052213306332
		 42 -340.86567891001562 43 -340.42038650068889 44 -339.94295197100411 45 -339.47481113661536
		 46 -338.98008776272422 47 -338.41778680482474 48 -337.87739783727409 49 -337.45718190850926
		 50 -337.1624083097584 51 -336.96462053815276 52 -336.8508568594728;
createNode animCurveTA -n "FKScapula_R_rotateZ";
	rename -uid "73214CAE-4E6E-35F8-B87F-2DA297A1CD58";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -3.1805546814635471e-14 1 359.53751265833347
		 2 359.46605315233012 3 359.64043860228981 4 359.80302515259558 5 -0.0025612180249307255
		 6 0.1709175355471336 7 0.31916605027379452 8 0.51154752404008097 9 0.60329518263159165
		 10 0.16691984534579585 11 358.92817116499606 12 356.68948640364101 13 352.85738163364965
		 14 346.70975479035116 15 339.46023899341014 16 334.56671507696063 17 330.95163088701923
		 18 328.87896503191416 19 339.92118597752079 20 1.2205716738305776 21 11.387634956077013
		 22 14.85444262946641 23 16.39896080314065 24 17.586984101737627 25 18.149541065721252
		 26 17.708803212122774 27 16.750487563592134 28 15.851957807306279 29 15.114415334106363
		 30 14.252608417561769 31 13.044008293469837 32 11.704014119428047 33 10.558846356119407
		 34 9.6645241674174862 35 8.8398385757877467 36 7.8951239309405823 37 6.7977064557624667
		 38 5.6331331809682661 39 4.5175930237371533 40 3.606707090484778 41 2.9758650439583838
		 42 2.4741290067460215 43 1.9233036682781053 44 1.356535191698935 45 0.88297167031580515
		 46 0.52933933376339548 47 0.2597101776243198 48 0.025932663608374467 49 359.79424205789161
		 50 359.56801405633183 51 359.38482344242902 52 359.28106234875492;
createNode animCurveTA -n "FKMiddleFinger3_L_rotateX";
	rename -uid "95E40409-4951-96E6-1E0A-529BD784C4CB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.044326706595059592 1 -2.4453005670359587
		 2 -2.3801926749975686 3 -2.5276647643798675 4 -2.7265912639533085 5 -2.9609319060852615
		 6 -3.198878946961814 7 -3.3901852462918876 8 -3.4721529522933761 9 -3.4724698721210241
		 10 -3.4711376699450511 11 -3.4715661114218372 12 -3.4722617568239569 13 -3.4718770733489897
		 14 -3.4710878134493468 15 -3.4713474547388197 16 -3.4721287330721107 17 -3.5745619601261582
		 18 -4.2185178396461724 19 -5.339291591469185 20 -6.1807875474364584 21 -6.2383867742985517
		 22 -6.2361321965867029 23 -6.240412061458346 24 -6.2441528621097664 25 -6.2434547837994394
		 26 -6.24069603008145 27 -6.2412492218115228 28 -6.2436369237890004 29 -6.2443094791705427
		 30 -6.2434269727051435 31 -6.2413934153349562 32 -6.2390850952313386 33 -6.107427969826821
		 34 -5.6467017071403269 35 -4.9988874092186251 36 -4.3196853339952499 37 -3.7071562860443823
		 38 -3.2041225530844937 39 -2.8198470325674148 40 -2.5467003772102794 41 -2.370636804500275
		 42 -2.2784781262488787 43 -2.2573286604831275 44 -2.2572275066757106 45 -2.2568390553317701
		 46 -2.256821324911586 47 -2.257219207515623 48 -2.2573918758934317 49 -2.2571937852267223
		 50 -2.2568885986479952 51 -2.2568046826355204 52 -2.2569073246372571;
createNode animCurveTA -n "FKMiddleFinger3_L_rotateY";
	rename -uid "BCD175B1-4425-4186-7605-2681D5BEFE30";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 11.179598409635965 1 12.016517879007809
		 2 14.15022235419088 3 17.176592962583051 4 20.658805087219864 5 24.151973799990607
		 6 27.216018181884834 7 29.411413668775328 8 30.292538390631485 9 30.295619857233095
		 10 30.281691196457906 11 30.28629403864911 12 30.293549356799382 13 30.28953994401342
		 14 30.281233605835055 15 30.283921189253729 16 30.292125698964217 17 31.340924592342471
		 18 37.020820976837463 19 44.370677484120783 20 48.55501680333888 21 48.810226702709173
		 22 48.80030651752692 23 48.819090970385183 24 48.835590807685236 25 48.832490553633392
		 26 48.820379388108435 27 48.82278680729074 28 48.83334512199302 29 48.836263946169787
		 30 48.832425997555546 31 48.823446027088309 32 48.813262413844996 33 48.224897855297762
		 34 46.01131331644536 35 42.410394029642298 36 37.816201964442435 37 32.640168258880387
		 38 27.277437255499056 39 22.111929496253882 40 17.53556528037236 41 13.943060690583012
		 42 11.752137305081311 43 11.20598946165733 44 11.202422198209693 45 11.191916334667429
		 46 11.191883253439265 47 11.201652141052652 48 11.206422183634741 49 11.201428670369284
		 50 11.19332783994537 51 11.191457167483424 52 11.193986904338441;
createNode animCurveTA -n "FKMiddleFinger3_L_rotateZ";
	rename -uid "CFF57F69-4984-EEBC-1DD7-EA93ABC4D89A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.47697411731100525 1 -0.72734623269695353
		 2 -0.96751212129957398 3 -1.3362364227712482 4 -1.7792666482397801 5 -2.248534056584564
		 6 -2.6850671732432945 7 -3.0147702028810892 8 -3.1515632005754157 9 -3.152072708240508
		 10 -3.1498738497777068 11 -3.1506057617149374 12 -3.1517266963869073 13 -3.1511075803628321
		 14 -3.1497915284069333 15 -3.1502349238571878 16 -3.151508466269199 17 -3.3179322338312427
		 18 -4.2983474034684397 19 -5.8348695671912125 20 -6.9057568714697952 21 -6.9770250889593051
		 22 -6.9742398544586299 23 -6.9795217851538984 24 -6.9841433512897639 25 -6.9832795651884583
		 26 -6.9798783079102975 27 -6.9805584829650087 28 -6.9835030060766101 29 -6.9843412482882776
		 30 -6.9832621658112917 31 -6.9807397390188228 32 -6.9778780724987071 33 -6.8146695666803394
		 34 -6.234406723085649 35 -5.3884422861782015 36 -4.4483739191771594 37 -3.5299107683716477
		 38 -2.6941069469191992 39 -1.9711298851475088 40 -1.3808847844345349 41 -0.94281234282236381
		 42 -0.68430343680739758 43 -0.62071277058985197 44 -0.62030613079012664 45 -0.61908329744395163
		 46 -0.61908295468839758 47 -0.62021671489298635 48 -0.62075959451100315 49 -0.6201780556738048
		 50 -0.61924510416869305 51 -0.61902855427289261 52 -0.61933432945002598;
createNode animCurveTA -n "FKMiddleFinger2_L_rotateX";
	rename -uid "8CAF1701-46A4-2728-C588-F1BB2DF98B92";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 7.9513867036587903e-15 1 -17.1143073412095
		 2 -16.053421688055867 3 -16.18308834330043 4 -16.349078294411139 5 -16.533563395280773
		 6 -16.711326274661005 7 -16.849267630720622 8 -16.908554152716995 9 -16.909973254104148
		 10 -16.908073740765719 11 -16.906228871847478 12 -16.904876453529898 13 -16.903966968376164
		 14 -16.904453266146589 15 -16.905347904224161 16 -16.905294648563423 17 -17.233513167114651
		 18 -19.739073777528215 19 -25.57806602030222 20 -31.061777760258714 21 -31.469115445776449
		 22 -31.442488954534841 23 -31.439731610283442 24 -31.43880546548441 25 -31.441593895281436
		 26 -31.44494239451809 27 -31.447498108480389 28 -31.44531827280554 29 -31.437340965078754
		 30 -31.431873096488257 31 -31.433134864544982 32 -31.435235352486867 33 -30.865057488009647
		 34 -28.877749841121251 35 -26.14310410273907 36 -23.35984257385908 37 -20.938853517282304
		 38 -19.040606337970164 39 -17.674927386558547 40 -16.77670526703271 41 -16.249258911680119
		 42 -15.996895365569911 43 -15.941278807478291 44 -15.941513993655812 45 -15.941699053444449
		 46 -15.941414753115385 47 -15.941101634694098 48 -15.941064067891109 49 -15.941105078523668
		 50 -15.941353683666458 51 -15.941944838756543 52 -15.942133719013093;
createNode animCurveTA -n "FKMiddleFinger2_L_rotateY";
	rename -uid "5F7E0785-453C-7F40-C8AE-82AAD7374F80";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -2.3854160110976324e-15 1 9.0092685017367256
		 2 9.4048985238874572 3 10.733854863613596 4 12.259174662547874 5 13.781489808059774
		 6 15.115934465432479 7 16.079349934185085 8 16.476797053833629 9 16.486129877978108
		 10 16.473516383428059 11 16.461303248314731 12 16.452395527942503 13 16.446312984255314
		 14 16.449595274627615 15 16.455496524571874 16 16.455227102661475 17 18.488608604576172
		 18 29.361701110225081 19 42.944599977240188 20 50.220725724654443 21 50.646862437472905
		 22 50.619330724748558 23 50.61647432485514 24 50.615514883024986 25 50.618406372361839
		 26 50.62186920226479 27 50.624505691792805 28 50.622254723396672 29 50.614030834149951
		 30 50.608375119163632 31 50.609662891567901 32 50.611842558062094 33 50.010425540581629
		 34 47.704738812598549 35 43.87074154792375 36 38.852947514781214 37 33.053093983915915
		 38 26.918836617056694 39 20.927936507760695 40 15.579784664697128 41 11.365920190759887
		 42 8.7804706771561474 43 8.1251703123885548 44 8.127573803673501 45 8.1297916189007751
		 46 8.1261640804401214 47 8.1225653715026702 48 8.1219568380748388 49 8.1224329889567333
		 50 8.1255371990089387 51 8.1326217106838534 52 8.1348254877022725;
createNode animCurveTA -n "FKMiddleFinger2_L_rotateZ";
	rename -uid "06FE42AD-441B-5503-BCC8-5C8CBFFF7039";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -6.4455928466534054e-14 1 -7.1809627452353846
		 2 -6.908878804834508 3 -7.4627232654805775 4 -8.106079948571022 5 -8.7575140770064817
		 6 -9.3371644093085617 7 -9.7611835464474126 8 -9.9375167311691239 9 -9.9416645840549158
		 10 -9.9360770985251854 11 -9.930622305442137 12 -9.9266832516326016 13 -9.923938715865857
		 14 -9.9254202807087726 15 -9.9280507476796487 16 -9.9279200032289463 17 -10.844437228104994
		 18 -16.29509343109509 19 -25.515210195159135 20 -32.780971398256831 21 -33.293490814723022
		 22 -33.260027361360393 23 -33.256565120329057 24 -33.255394249679952 25 -33.258905876162231
		 26 -33.263097752891845 27 -33.266322570301057 28 -33.263569996958466 29 -33.253570853525282
		 30 -33.246694934010605 31 -33.248287168735629 32 -33.250932873895636 33 -32.53236293430647
		 34 -29.980911600721274 35 -26.315685457669829 36 -22.31060430508569 37 -18.449376804373884
		 38 -14.970002539970613 39 -11.978341662638817 40 -9.540704865555691 41 -7.7283670688479109
		 42 -6.6506590199517621 43 -6.3807765516153205 44 -6.3817445757141114 45 -6.3826538946764382
		 46 -6.3811749462882394 47 -6.379697760111517 48 -6.3794511590775675 49 -6.3796477129679516
		 50 -6.3809111290472966 51 -6.3838220746688172 52 -6.3847262104079068;
createNode animCurveTA -n "FKMiddleFinger1_L_rotateX";
	rename -uid "4B08EDCE-4741-D33C-E87B-9CB1DA3C8DE9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.47379560356730882 1 -0.62489560411900957
		 2 -0.56521366715702304 3 -0.5003502681794475 4 -0.43826792616999505 5 -0.38835320611490892
		 6 -0.35145741961988958 7 -0.32875105216790546 8 -0.32034406137203397 9 -0.3184583830069454
		 10 -0.3158826826802052 11 -0.31452820515558771 12 -0.31474266317329297 13 -0.31514734520289966
		 14 -0.31548553827248765 15 -0.31581657512691574 16 -0.3160152395939676 17 -0.42655386254720207
		 18 -2.0135996364287796 19 -7.1427198548749091 20 -12.65441886812013 21 -13.100394578672798
		 22 -13.0920538113931 23 -13.092735687026371 24 -13.082332790385454 25 -13.102291864417943
		 26 -13.127408092793642 27 -13.093547424532932 28 -13.027060347087549 29 -12.989916930204238
		 30 -12.977002330764503 31 -12.964273404197618 32 -12.956470430140939 33 -12.52684365713076
		 34 -11.025945897676756 35 -8.9386292446929474 36 -6.7785973810086224 37 -4.8346279621995034
		 38 -3.2515486862300809 39 -2.0968007920292684 40 -1.3419270529895517 41 -0.89780311946370817
		 42 -0.68179700868670168 43 -0.63297296361435673 44 -0.63434368760604465 45 -0.63385866658041401
		 46 -0.63024142565861396 47 -0.62852887836539062 48 -0.62975217666561567 49 -0.63098729954875898
		 50 -0.6304684774311885 51 -0.62860546223392277 52 -0.63027932142109444;
createNode animCurveTA -n "FKMiddleFinger1_L_rotateY";
	rename -uid "235C3233-4A13-7DF3-094C-78B0DC6F2118";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 4.993125118312788 1 3.5378910088529687
		 2 2.841027049704949 3 1.739443376188091 4 0.49683532011766873 5 -0.70681543496521593
		 6 -1.7733792105617459 7 -2.5675417228509163 8 -2.9314950231595609 9 -3.07864075737147
		 10 -3.269761969644152 11 -3.3684236034635915 12 -3.3677607060906927 13 -3.3473660810183175
		 14 -3.328866357014165 15 -3.3055604345589229 16 -3.2868114254553524 17 -0.47453335333121349
		 18 14.695510399125057 19 33.99231645384463 20 44.537444435589947 21 45.21581623743343
		 22 45.250672553770244 23 45.286944922998039 24 45.280605123478864 25 45.305474131016908
		 26 45.350234613105208 27 45.341641928836843 28 45.291891470695703 29 45.252503795037057
		 30 45.228458787582142 31 45.219105410767632 32 45.233895695881607 33 44.641251462646444
		 34 42.314528703930002 35 38.488195161077329 36 33.558080436871819 37 27.897594182465312
		 38 21.91844400585768 39 16.109533390801836 40 10.987942710291721 41 7.0144435585888676
		 42 4.594333421529325 43 3.979428018740272 44 3.953790389891584 45 3.8947564467999891
		 46 3.8494531022646052 47 3.8609872983465832 48 3.8985670419265364 49 3.9144578971631976
		 50 3.8960226724530949 51 3.8648396285754525 52 3.8681327561209615;
createNode animCurveTA -n "FKMiddleFinger1_L_rotateZ";
	rename -uid "81B58E69-4A5D-D69F-5D31-C99B468D929B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -1.2694390173008605 1 -5.6221922803770159
		 2 -5.0114169816602212 3 -4.5638163685370365 4 -4.0711951749429778 5 -3.6008786324300894
		 6 -3.1633834352254011 7 -2.8077388478110361 8 -2.6642724602669543 9 -2.7344617906666056
		 10 -2.879459346023109 11 -2.996044249572333 12 -3.0252700692060563 13 -3.0117817476105331
		 14 -2.9958613373078538 15 -2.9683303640013152 16 -2.9387726425849361 17 -4.087617611199903
		 18 -10.495525605349979 19 -20.518242814589247 20 -28.45488463166172 21 -29.0474466190716
		 22 -29.036405776504267 23 -29.037307732809552 24 -29.023524454471207 25 -29.049952983709705
		 26 -29.08320877986845 27 -29.038410874241055 28 -28.950340661231532 29 -28.90107702160465
		 30 -28.88394531549206 31 -28.867064573414059 32 -28.856733339181908 33 -28.283827147516536
		 34 -26.241005524752332 35 -23.265370272119299 36 -19.947297248595852 37 -16.623947204768946
		 38 -13.493444852670816 39 -10.738145406887309 40 -8.480098742091096 41 -6.7662129808574507
		 42 -5.6968040439742325 43 -5.4130649876588892 44 -5.4257672829787218 45 -5.4294733269090063
		 46 -5.4075472447046078 47 -5.3929822083343 48 -5.3977195691572861 49 -5.4051449043513884
		 50 -5.4034425923195428 51 -5.3931127334413551 52 -5.4055169151572962;
createNode animCurveTA -n "FKThumbFinger3_L_rotateX";
	rename -uid "0A875E99-45C9-5F94-BAE6-C6B69C5E4C43";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.8746507218085024e-09 1 -13.866962874583985
		 2 -13.21472160356066 3 -13.379528030235022 4 -13.583165473258857 5 -13.7968057162392
		 6 -13.998645074033409 7 -14.169130772246668 8 -14.257140341170272 9 -14.24744763346539
		 10 -14.188529589737593 11 -14.132885119954098 12 -14.120650731977793 13 -14.130173837312302
		 14 -14.130593744316043 15 -14.122671611435219 16 -14.117278424608932 17 -14.025940273538678
		 18 -13.604056201596235 19 -13.165236922559124 20 -12.971543990652396 21 -12.979736870600641
		 22 -12.997033994890131 23 -13.010543839980128 24 -13.019187090100733 25 -13.025207796923596
		 26 -13.038828323488831 27 -13.053113340500889 28 -13.053186265221061 29 -13.04872200855079
		 30 -13.058673711765785 31 -13.07804807824537 32 -13.092350090628459 33 -13.102039943927622
		 34 -13.11020176540468 35 -13.108853218320469 36 -13.0950133051882 37 -13.08251628725659
		 38 -13.082765559962613 39 -13.086130971403923 40 -13.087150304291379 41 -13.096036004858489
		 42 -13.110698926398445 43 -13.122927721710978 44 -13.124653392791771 45 -13.107154058990519
		 46 -13.08657580075289 47 -13.082565298592174 48 -13.083278383090574 49 -13.081135045732141
		 50 -13.079495653254579 51 -13.075402841991165 52 -13.07363921226745;
createNode animCurveTA -n "FKThumbFinger3_L_rotateY";
	rename -uid "1E5E1412-4690-C5FE-12BA-E6BB814B6E53";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -2.9036384159839087e-08 1 -21.015113746250307
		 2 -20.458019426668844 3 -21.778934907272159 4 -23.289303325197643 5 -24.764789591121804
		 6 -26.048512253675749 7 -26.997483481854609 8 -27.367956140057537 9 -27.27329715419971
		 10 -27.114167265416686 11 -27.014932745419792 12 -27.016908115421653 13 -27.060796540875607
		 14 -27.071372387274575 15 -27.052608524762114 16 -27.041508959705908 17 -26.55956975403144
		 18 -24.011606313193248 19 -20.752327352104011 20 -18.948073106585461 21 -18.918324272313463
		 22 -18.985290173059568 23 -19.02820267387774 24 -19.05833170925408 25 -19.089698351719907
		 26 -19.15137932669645 27 -19.204985430711687 28 -19.207251209206682 29 -19.208564833819256
		 30 -19.264563605977688 31 -19.340387411204681 32 -19.386404133098186 33 -19.416796898351929
		 34 -19.452125254724514 35 -19.45610188882268 36 -19.40058052800654 37 -19.338830431352005
		 38 -19.329816513264678 39 -19.33858054228801 40 -19.337321433792017 41 -19.367309939623734
		 42 -19.422929887548701 43 -19.466994093731696 44 -19.468625224421171 45 -19.398148642713029
		 46 -19.312944570414569 47 -19.286238575997807 48 -19.279944743095548 49 -19.265229129509468
		 50 -19.248673334407915 51 -19.220110768332944 52 -19.199607860712359;
createNode animCurveTA -n "FKThumbFinger3_L_rotateZ";
	rename -uid "8F21B4F9-48CA-FC7C-4D32-8387BF280A12";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 5.1276279185362243e-08 1 -6.2167971982938033
		 2 -5.3750143222068596 3 -4.81164581739624 4 -4.1452504449932315 5 -3.4376999595943829
		 6 -2.8022182282591239 7 -2.3630925497240027 8 -2.1812493096717875 9 -2.1220628724485215
		 10 -2.0315456643334544 11 -1.9676901772942694 12 -1.9549779666350799 13 -1.9693576419058245
		 14 -1.9717697995331729 15 -1.9598738268159297 16 -1.9511641000530258 17 -2.1574225531552158
		 18 -3.3017786042280095 19 -4.7585285915636248 20 -5.6045779311516011 21 -5.7096772959684392
		 22 -5.7499506115541186 23 -5.7840328943525323 24 -5.806597742701145 25 -5.8245248010139381
		 26 -5.8623720569885327 27 -5.8996817656199925 28 -5.9003939733604103 29 -5.8926690453172759
		 30 -5.9221179305156655 31 -5.9725454101287596 32 -6.0073902138251363 33 -6.0305023941652927
		 34 -6.051826933002916 35 -6.0498673013472146 36 -6.0137137412414665 37 -5.9787975972054364
		 38 -5.9771657396193527 39 -5.984655907181069 40 -5.9860122763772132 41 -6.0073023640429373
		 42 -6.0438592093349115 43 -6.073674400716361 44 -6.0765410762539585 45 -6.0315250277216856
		 46 -5.978581417048817 47 -5.9662710615044343 48 -5.9661058773772071 49 -5.9593248527529861
		 50 -5.9531241438746756 51 -5.9404487507163317 52 -5.9333709921789977;
createNode animCurveTA -n "FKThumbFinger2_L_rotateX";
	rename -uid "CD9FD56A-42BA-BFDA-9F5C-31A9A6709362";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.8746698051366754e-09 1 -12.956130393917658
		 2 -11.708234683981905 3 -11.707147943744305 4 -11.723081187474994 5 -11.757754704686928
		 6 -11.803459595441534 7 -11.839908403847557 8 -11.841737781611737 9 -11.827123857652968
		 10 -11.833921011613802 11 -11.851374528578285 12 -11.859924350750548 13 -11.862322343115427
		 14 -11.86402003023073 15 -11.865256377593321 16 -11.866333504059563 17 -11.846265926266003
		 18 -11.756989680974465 19 -11.710924743904336 20 -11.721993208470302 21 -11.723498031357568
		 22 -11.723357462199468 23 -11.72325140248482 24 -11.723233508901981 25 -11.723315330435955
		 26 -11.723350388954827 27 -11.723319908764632 28 -11.723344213354231 29 -11.723571495250622
		 30 -11.723705459936104 31 -11.723685540943594 32 -11.723586533299654 33 -11.723503457794953
		 34 -11.723549731949635 35 -11.723673105471279 36 -11.723747256771107 37 -11.723695009347589
		 38 -11.723591966570529 39 -11.723580838274529 40 -11.723548274467108 41 -11.723473012015708
		 42 -11.723454876407526 43 -11.72338698134711 44 -11.723349104527685 45 -11.72340676000317
		 46 -11.723433385538536 47 -11.7233207264348 48 -11.723212498483056 49 -11.723143404684546
		 50 -11.723028769490609 51 -11.722869770641715 52 -11.722670794901436;
createNode animCurveTA -n "FKThumbFinger2_L_rotateY";
	rename -uid "800B99BF-4E56-AECF-55E5-3E84DD1DCEFD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -2.9036371437620362e-08 1 24.050124627668303
		 2 21.690396607249575 3 20.383950740787117 4 18.835698549148258 5 17.265377735032811
		 6 15.915922623400657 7 15.006944202477349 8 14.730657133648796 9 14.811449402904037
		 10 14.792543660844418 11 14.691225437911264 12 14.582748452822148 13 14.512584593085171
		 14 14.484671615971459 15 14.473675381597145 16 14.456335113111102 17 14.892796065320024
		 18 17.385743224395089 19 20.63238050858423 20 22.487978819559469 21 22.614402334911595
		 22 22.642904612828534 23 22.686692375007517 24 22.708365710483509 25 22.695924866576249
		 26 22.688855501700253 27 22.711421342914981 28 22.706758271294238 29 22.652149150208473
		 30 22.615859555744798 31 22.634699644687625 32 22.674085324316295 33 22.701473909504074
		 34 22.697864548164063 35 22.670385959125905 36 22.661508926974509 37 22.685137019819155
		 38 22.711440979790542 39 22.725120565401788 40 22.739463474657494 41 22.757327053154683
		 42 22.771065666658984 43 22.787977082591681 44 22.800998428089411 45 22.793594670890357
		 46 22.793488639206455 47 22.821111761035755 48 22.84558019738947 49 22.861002987191373
		 50 22.887650150508296 51 22.920035027163436 52 22.956342556587693;
createNode animCurveTA -n "FKThumbFinger2_L_rotateZ";
	rename -uid "6129708B-4EF9-1A20-0245-C9AFB7E87CCC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 5.1275967491003441e-08 1 -14.462968502535336
		 2 -12.946128411859988 3 -12.404282851367689 4 -11.80679104397996 5 -11.218356883650475
		 6 -10.691986803547588 7 -10.293972039772687 8 -10.1020989627612 9 -10.068348370644427
		 10 -10.073931954387348 11 -10.107130385307986 12 -10.145810684892252 13 -10.171751446039499
		 14 -10.181813182743909 15 -10.185573457827141 16 -10.191809052248768 17 -10.390557730683367
		 18 -11.42398731854699 19 -12.77593886074304 20 -13.560418435926866 21 -13.604431505519083
		 22 -13.588896119333349 23 -13.573829292429314 24 -13.566348789576599 25 -13.570622980859676
		 26 -13.573033770388571 27 -13.565263120878278 28 -13.566825501280684 29 -13.585542317478421
		 30 -13.597955805658568 31 -13.591476869002783 32 -13.577958444706299 33 -13.568540955654047
		 34 -13.569740770415359 35 -13.579124178975107 36 -13.582129655217589 37 -13.5740357702471
		 38 -13.5649631368745 39 -13.560271340676316 40 -13.555328120742383 41 -13.549171179247791
		 42 -13.544446346714089 43 -13.538619132092579 44 -13.53412600927682 45 -13.536636270136549
		 46 -13.536658507458611 47 -13.527152531542754 48 -13.518752648747686 49 -13.513420343084285
		 50 -13.504275130231473 51 -13.493113166206918 52 -13.480619020551403;
createNode animCurveTA -n "FKThumbFinger1_L_rotateX";
	rename -uid "9A3565C5-47D6-26A7-4DAA-83ABDD16D0CE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.1194534575854937e-09 1 -26.150253126138963
		 2 -24.954321425015593 3 -25.668340337196057 4 -26.631427486944173 5 -27.748429463816617
		 6 -28.851128109348913 7 -29.709549993371606 8 -30.073157952386524 9 -30.082394891580869
		 10 -30.081773229690238 11 -30.081782717425892 12 -30.081792575058774 13 -30.081780377976433
		 14 -30.081799283912424 15 -30.081780094835377 16 -30.081803191037185 17 -29.042033952768154
		 18 -23.233985162116866 19 -15.209232416700036 20 -10.335239620992562 21 -10.028467918632566
		 22 -10.048630869875794 23 -10.048651966937497 24 -10.048631760685538 25 -10.048641527508762
		 26 -10.048621981568058 27 -10.048637230102425 28 -10.048639784271153 29 -10.048655810571377
		 30 -10.048645471229372 31 -10.048643051011089 32 -10.048643762694986 33 -10.346740250220044
		 34 -11.447407370835455 35 -13.157485739006212 36 -15.214751850293862 37 -17.387013313437297
		 38 -19.477362132006014 39 -21.324005628683679 40 -22.804848659367131 41 -23.832977947754582
		 42 -24.321533234618062 43 -24.378629683948859 44 -24.374626316493259 45 -24.374622669685575
		 46 -24.374614011281533 47 -24.374612525934221 48 -24.374623021824146 49 -24.374625089093279
		 50 -24.374619882697626 51 -24.374625559860071 52 -24.374619690005854;
createNode animCurveTA -n "FKThumbFinger1_L_rotateY";
	rename -uid "A594A326-4179-3F91-ECAE-1490D5878FF9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -2.7584441864092951e-08 1 -9.2096065933344597
		 2 -8.7364659400106852 3 -9.3304227021427355 4 -9.9570132838979646 5 -10.51510602181126
		 6 -10.937784904799047 7 -11.197159582877509 8 -11.291071189742159 9 -11.293342580453823
		 10 -11.293193888423943 11 -11.293204413240696 12 -11.293194656939171 13 -11.293198577137527
		 14 -11.293203945547242 15 -11.293196239629731 16 -11.293212363781189 17 -10.130023483630728
		 18 -3.8767441868646886 19 4.0721769836150177 20 8.4998627015811401 21 8.7697632340029479
		 22 8.7520803012540114 23 8.7520823127831928 24 8.7520862637880334 25 8.7520751433979154
		 26 8.7520624748809492 27 8.7520685624905052 28 8.7520869955069376 29 8.7520957060198583
		 30 8.7520835404179014 31 8.7520881965007522 32 8.7520841642491956 33 8.4648136165728989
		 34 7.3842127239868995 35 5.6447186879585596 36 3.4499404490209811 37 0.99636740581234362
		 38 -1.5138424998433397 39 -3.8715097731364359 40 -5.8748026283704968 41 -7.3331163503380372
		 42 -8.0468010369497378 43 -8.1304429551805928 44 -8.1244564285395988 45 -8.1244639784906472
		 46 -8.1244604881882481 47 -8.1244699969760763 48 -8.1244746608118632 49 -8.1244623214553027
		 50 -8.1244708329592328 51 -8.1244611540086886 52 -8.1244597999884647;
createNode animCurveTA -n "FKThumbFinger1_L_rotateZ";
	rename -uid "E6154075-4BC7-E19C-6293-56A822BE4633";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 5.2093198294392322e-08 1 -9.3070029385035102
		 2 -6.6092845511420251 3 -3.4731224674140782 4 0.12904763510847905 5 3.7489452933913667
		 6 6.9352458725252042 7 9.2228638831881558 8 10.150513437743793 9 10.173827572964887
		 10 10.172286606523096 11 10.172307656344367 12 10.172298794233425 13 10.172291220979183
		 14 10.172311747385868 15 10.172274258012784 16 10.172314428322398 17 10.174592819374872
		 18 10.309746590311649 19 10.851057928425998 20 11.379634472485579 21 11.417911444209496
		 22 11.415378936968295 23 11.415368045372507 24 11.415366314323782 25 11.415376103284441
		 26 11.415381502660511 27 11.415354988095743 28 11.415389490456414 29 11.415362296752177
		 30 11.415369571344117 31 11.415381394761596 32 11.41536879946586 33 11.051700172505047
		 34 9.6922346068171183 35 7.5231428405679495 36 4.8064546719980159 37 1.7830989563055519
		 38 -1.3146266693853259 39 -4.2480767972862159 40 -6.7704975795587981 41 -8.6319991468121771
		 42 -9.5540174180510036 43 -9.6638021714185705 44 -9.6561201492167097 45 -9.656121937472145
		 46 -9.6561101344712661 47 -9.6561072752427055 48 -9.6561208523883639 49 -9.6561158071046975
		 50 -9.6561043304481657 51 -9.6561170036955932 52 -9.6561222873362489;
createNode animCurveTA -n "FKIndexFinger3_L_rotateX";
	rename -uid "5A3CB18D-4F53-ACF0-39E7-A08A85D6AD75";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.18893691049794048 1 -0.85844909416304926
		 2 -0.83365230725676343 3 -0.86169165882176835 4 -0.89594131619326456 5 -0.93250857903369677
		 6 -0.96744454005404057 7 -0.99481794099965781 8 -1.0057557767814438 9 -1.0052894090639681
		 10 -1.0071101473569888 11 -1.0110841667658674 12 -1.0132698077886844 13 -1.0118579297791446
		 14 -1.0094406375423799 15 -1.0089757918868156 16 -1.0094666761138873 17 -1.0573573889023642
		 18 -1.3734538087579098 19 -1.9625964738805357 20 -2.4315242285408805 21 -2.4569057911106436
		 22 -2.4384792418016179 23 -2.4357095752204074 24 -2.4473268981919585 25 -2.4542900877040927
		 26 -2.4478315112812368 27 -2.439542882454135 28 -2.4417850497766764 29 -2.4507657741499087
		 30 -2.4560129073259285 31 -2.460687835460722 32 -2.4689040327878566 33 -2.3895681779901223
		 34 -2.1138511278701628 35 -1.7652821175705042 36 -1.4387465386520806 37 -1.1717531836367376
		 38 -0.98091660884783216 39 -0.86561530397464914 40 -0.81432510792801538 41 -0.8087856675103593
		 42 -0.80913198449188817 43 -0.80896307758115094 44 -0.80820404184473982 45 -0.809139113137889
		 46 -0.81123376901448208 47 -0.81186511495130531 48 -0.81040294431874638 49 -0.80850577462850515
		 50 -0.8078312572884162 51 -0.80807157933630169 52 -0.80816055423978228;
createNode animCurveTA -n "FKIndexFinger3_L_rotateY";
	rename -uid "D96BD57A-408F-F844-9CF7-D48165B85F9C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -2.9680856746093975 1 -2.6087044119464045
		 2 -1.6473218950460802 3 -0.28438525888939648 4 1.2717361753495506 5 2.8247083302827023
		 6 4.2180902511036189 7 5.2579155171528233 8 5.6618585373402368 9 5.6450925481829621
		 10 5.7118068226376648 11 5.8565964803916168 12 5.9364257171014971 13 5.8847002126340682
		 14 5.7970225144002798 15 5.7799049349190481 16 5.7972274150059429 17 7.4450047748866535
		 18 16.426671765697318 19 28.153580300861616 20 34.890530886194817 21 35.206941886694331
		 22 34.977592264863354 23 34.942993243025136 24 35.088130376803605 25 35.174549367638441
		 26 35.094313901406451 27 34.990890571704824 28 35.018945925197471 29 35.130821497321669
		 30 35.19592405158636 31 35.253819647073925 32 35.355222553382632 33 34.357249023996943
		 34 30.560115798371918 35 24.834355134910101 36 18.120869904015386 37 11.122631246124767
		 38 4.7250169195773779 39 -0.11915689244381612 40 -2.6401845871060554 41 -2.9333621778366989
		 42 -2.9151906851426488 43 -2.9247593220710653 44 -2.9651629499547649 45 -2.9147071501978314
		 46 -2.8033299671001584 47 -2.7700550497060865 48 -2.8481002127078749 49 -2.949011551289964
		 50 -2.9842901565906446 51 -2.9723399126936214 52 -2.9671882610605693;
createNode animCurveTA -n "FKIndexFinger3_L_rotateZ";
	rename -uid "AEB81D84-4882-4336-FFE2-9C837E1AE57A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.56949511436581468 1 -0.32027724192977775
		 2 -0.390797789443462 3 -0.46657186029448655 4 -0.55393637977811305 5 -0.64212539820222359
		 6 -0.72223552953512926 7 -0.78267306422285032 8 -0.80633334418681679 9 -0.80534729355454537
		 10 -0.80924958277391168 11 -0.81775008734977628 12 -0.82244944608468951 13 -0.81940078733268851
		 14 -0.81426905365295732 15 -0.81325532497818576 16 -0.81427026113007084 17 -0.91166684706979151
		 18 -1.4783796902084632 19 -2.3620857527647274 20 -2.9900540635903901 21 -3.0223622367713623
		 22 -2.9989030095700437 23 -2.9953820729848806 24 -3.0101734232469846 25 -3.0190361262022818
		 26 -3.0108226495970634 27 -3.0002581819532135 28 -3.0031021352681955 29 -3.0145620995764886
		 30 -3.0212155045213795 31 -3.0271607349865604 32 -3.0375903213779418 33 -2.9361555757621542
		 34 -2.5751740617960199 35 -2.0922013024435722 36 -1.5961180687284704 37 -1.1364692539002537
		 38 -0.75164547792237424 39 -0.47567930651829871 40 -0.33596350873838682 41 -0.31983444363357016
		 42 -0.32083512985271168 43 -0.32031480377643462 44 -0.31808450863008592 45 -0.32086608879408707
		 46 -0.32699426386432029 47 -0.32883158703018167 48 -0.32453176355899449 49 -0.31898011192324166
		 50 -0.31704180434427709 51 -0.31768521759375107 52 -0.3179765431723538;
createNode animCurveTA -n "FKIndexFinger2_L_rotateX";
	rename -uid "BFD094B9-48BA-8941-BF29-59A6310F0303";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -3.9756933518293967e-15 1 -20.135305786205222
		 2 -18.807575475325045 3 -18.909081651374692 4 -19.029320871691482 5 -19.153311464995209
		 6 -19.268846583217659 7 -19.359519055177138 8 -19.397556504519091 9 -19.396964317712669
		 10 -19.397202687517861 11 -19.399557820745361 12 -19.402832691199315 13 -19.405148384425605
		 14 -19.405822631637488 15 -19.405516732594691 16 -19.402253592142358 17 -19.777754147419351
		 18 -22.788121371987881 19 -30.285350253157663 20 -37.721492233535386 21 -38.25918569510754
		 22 -38.238945876944491 23 -38.306229748544723 24 -38.356587231832115 25 -38.303580492085736
		 26 -38.212060225810447 27 -38.181330133740595 28 -38.202795251109094 29 -38.245810198440594
		 30 -38.264053412588375 31 -38.225308311198638 32 -38.182902281739949 33 -36.996611596369014
		 34 -33.186925087995668 35 -28.596890160037439 36 -24.650993309807454 37 -21.82473082045961
		 38 -20.05956642558931 39 -19.114730494349114 40 -18.746035787698027 41 -18.716016789060774
		 42 -18.719943457648579 43 -18.724595041139196 44 -18.724741557788146 45 -18.720374581017982
		 46 -18.717811154480252 47 -18.718152800023265 48 -18.719241790240261 49 -18.718602638819519
		 50 -18.716800890190559 51 -18.71641179301454 52 -18.716805978693781;
createNode animCurveTA -n "FKIndexFinger2_L_rotateY";
	rename -uid "DDE75579-47AF-24A7-71E1-4481239BB81A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -3.1805546814635156e-15 1 14.551310956349349
		 2 14.243268021217052 3 15.061481590413457 4 15.973461047403765 5 16.858634330870739
		 6 17.639578874773363 7 18.226360688274269 8 18.466365843272108 9 18.462591963064348
		 10 18.464128022993833 11 18.478902136563864 12 18.499297837716519 13 18.513727814739269
		 14 18.517987247609049 15 18.516060593470193 16 18.49571405514077 17 20.67429784673325
		 18 32.419664305022067 19 46.903003338692628 20 54.392334050624122 21 54.800499519054163
		 22 54.785366442076239 23 54.835558303344669 24 54.872954880592751 25 54.833586205229054
		 26 54.765256029271747 27 54.742233380089189 28 54.758311867504673 29 54.790498335524639
		 30 54.804117714876725 31 54.775162556405604 32 54.743419617690371 33 53.819630583841075
		 34 50.312797970804148 35 44.537498756988832 36 37.242634839825577 37 29.420036818349907
		 38 22.16660244846949 39 16.583942321377535 40 13.722530152763072 41 13.461005286622401
		 42 13.495422780436343 43 13.536213374621664 44 13.537539889802453 45 13.499292343521272
		 46 13.476695607018414 47 13.479751024731716 48 13.489346222073616 49 13.483611287596794
		 50 13.467840336251548 51 13.464333718386996 52 13.467857464695014;
createNode animCurveTA -n "FKIndexFinger2_L_rotateZ";
	rename -uid "173C0E0C-4C77-AF55-FE3D-53B1577A6056";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 2.6140183788278279e-14 1 -5.8758887750210569
		 2 -5.4075545697706362 3 -5.779469615994846 4 -6.1979021967154795 5 -6.60818169692591
		 6 -6.9737936838146677 7 -7.2508909124400338 8 -7.3648468204134412 9 -7.3630466600208271
		 10 -7.3637774519881551 11 -7.3707905055752949 12 -7.3805212821858479 13 -7.3873714658341632
		 14 -7.3894101447403218 15 -7.3885026306800698 16 -7.3788179604280399 17 -8.4312185126493926
		 18 -14.859221525095546 19 -26.274767528951259 20 -35.773689785002318 21 -36.427713089314999
		 22 -36.403119355824522 23 -36.484748454960219 24 -36.545815572743194 25 -36.481546385013509
		 26 -36.370497472476814 27 -36.333187952629658 28 -36.359247857968739 29 -36.411454577616986
		 30 -36.43359211246139 31 -36.386585521077663 32 -36.335089703994768 33 -34.886566448509626
		 34 -30.108015889151744 35 -23.966254939029046 36 -18.061513974795556 37 -13.065990627960486
		 38 -9.1716852460472236 39 -6.480286555053258 40 -5.1724815197551273 41 -5.0548662153624306
		 42 -5.0703210525094242 43 -5.0886543415708152 44 -5.0892715438788105 45 -5.0720625984509988
		 46 -5.061920633129728 47 -5.0632832135640999 48 -5.0675931612356502 49 -5.0650249409237782
		 50 -5.0579372225464372 51 -5.0563639072239708 52 -5.057937539534807;
createNode animCurveTA -n "FKIndexFinger1_L_rotateX";
	rename -uid "8CAC3EEC-482C-CC04-3297-CF874F98EC55";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.62380369577254002 1 0.7019114051452906
		 2 0.80512114230272558 3 0.77111034902204556 4 0.46952101755176073 5 -0.11164796868954702
		 6 -0.85815951596598361 7 -1.536957405097455 8 -1.8913394863611546 9 -2.0222333019321441
		 10 -2.1837886712171533 11 -2.2812472322990125 12 -2.2780401855350605 13 -2.2326829017262071
		 14 -2.1974188466491569 15 -2.1725790739061845 16 -2.1526274568114241 17 -1.1545287703748095
		 18 1.4241204886629368 19 -1.7591566411143267 20 -8.11087211579712 21 -8.6355796562103606
		 22 -8.5712869525908921 23 -8.5619139893394696 24 -8.5579326620109626 25 -8.5354660763201355
		 26 -8.507059614502646 27 -8.4924204605755058 28 -8.4751465803825834 29 -8.45552583347588
		 30 -8.4542484461666749 31 -8.4674015544089372 32 -8.472846383392131 33 -7.8887057427810179
		 34 -6.0219922867045454 35 -3.7813263037893026 36 -1.8644911947882481 37 -0.53702909686569111
		 38 0.18862100150238359 39 0.47699540028313425 40 0.57042892173113358 41 0.61635056038587277
		 42 0.62665258073271135 43 0.61163094077318447 44 0.609781021014417 45 0.61719730194132472
		 46 0.61867958125183686 47 0.62145590596218525 48 0.62919102505434965 49 0.63502833225923161
		 50 0.63682848819654347 51 0.63693458915174928 52 0.63660903434314775;
createNode animCurveTA -n "FKIndexFinger1_L_rotateY";
	rename -uid "158C398D-4BA7-9079-8C1B-AE933138C455";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.45072643945037033 1 -0.27545723239665948
		 2 -2.2752600957769342 3 -5.1072180357595789 4 -8.3146434021540365 5 -11.455720571546994
		 6 -14.15486139020126 7 -16.078685915684456 8 -16.888657433178494 9 -16.965659728341937
		 10 -16.988622087782975 11 -16.963901445431667 12 -16.939492985545691 13 -16.929270878080352
		 14 -16.906454449794559 15 -16.858291261166514 16 -16.817250915630083 17 -13.5370388903464
		 18 4.7187240611856369 19 28.589935133475038 20 41.577659177018923 21 42.368283556797977
		 22 42.338910221606994 23 42.357493941932155 24 42.377381455474918 25 42.395178371586944
		 26 42.408449417455273 27 42.404194537920738 28 42.371286480914854 29 42.326190161578808
		 30 42.294641367957013 31 42.292491337647562 32 42.309049511343005 33 41.278200360675925
		 34 37.425436257777051 35 31.365442210002019 36 23.96826690651687 37 16.168882384009368
		 38 9.0323937307018287 39 3.5927085839472666 40 0.78913720629951667 41 0.50422695710460363
		 42 0.51100231332285062 43 0.52280596888130304 44 0.52925394617251353 45 0.53005966625039347
		 46 0.52773779634055851 47 0.50853038856837296 48 0.48904601900383388 49 0.4938060409634511
		 50 0.49779228205492398 51 0.47964081825557742 52 0.46483277979510335;
createNode animCurveTA -n "FKIndexFinger1_L_rotateZ";
	rename -uid "9B7EE8F8-4CD6-2FF9-95D9-67919C71401B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.23513140962565091 1 0.51677216279511407
		 2 2.3412962304478429 3 4.9474721356993667 4 7.9616170216647957 5 11.025774920547297
		 6 13.780194525282978 7 15.813076288903479 8 16.652830695272009 9 16.6473428392943
		 10 16.577129736875083 11 16.510238693968798 12 16.495983887559177 13 16.512782394265876
		 14 16.515892610766628 15 16.496661761595892 16 16.479697576243115 17 14.269693505736786
		 18 3.4839940218617906 19 -10.829193043655671 20 -21.724606373483386 21 -22.472956748765615
		 22 -22.380128482369596 23 -22.366240907600808 24 -22.359992897934958 25 -22.326263105950257
		 26 -22.283849278465944 27 -22.262116006905096 28 -22.236831287465293 29 -22.208203449059575
		 30 -22.206625085853641 31 -22.22609738338064 32 -22.233866137642735 33 -21.369531828065334
		 34 -18.477562722172351 35 -14.603556501733307 36 -10.601831315903839 37 -6.9077379688533789
		 38 -3.812670324299499 39 -1.5492087806663921 40 -0.36761366819838426 41 -0.20395473239023684
		 42 -0.1957768667603341 43 -0.21920834576104881 44 -0.22513062756759572 45 -0.2170317088184455
		 46 -0.21431706017666435 47 -0.20475036544444561 48 -0.18822778657039155 49 -0.17954277405494548
		 50 -0.17532143079654744 51 -0.16806584267869518 52 -0.16485544293189613;
createNode animCurveTA -n "FKPinkyFinger3_L_rotateX";
	rename -uid "5A253376-48E5-6A37-5E85-E1A2CAC65291";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 9.5416640443905519e-15 1 2.9426034598801425
		 2 2.2102267693981732 3 1.1994522283874227 4 -0.43192713680624933 5 -2.7744103310787334
		 6 -5.7045516399434639 7 -8.563907282211801 8 -9.9802691401405088 9 -10.032180384577106
		 10 -10.035883406931797 11 -10.037273190531428 12 -10.041074694280862 13 -10.046130211390738
		 14 -10.059419692434307 15 -10.088593122244436 16 -10.114391012587614 17 -9.8857072984447818
		 18 -8.6842035517668705 19 -7.2908882785399429 20 -6.5638127087448579 21 -6.5126480109118106
		 22 -6.5109445887381732 23 -6.5106021242814576 24 -6.5083628165783622 25 -6.5043827974258184
		 26 -6.5011270129872578 27 -6.4970834862265541 28 -6.4911400948368998 29 -6.4855057598145009
		 30 -6.483577249781959 31 -6.4840599970189503 32 -6.4816121679854701 33 -6.3733454093676833
		 34 -5.9833889468074597 35 -5.3671839766060847 36 -4.5942032547038512 37 -3.7232691405983518
		 38 -2.8167559380545129 39 -1.9276856706971921 40 -1.0911001453407541 41 -0.33063860317113758
		 42 0.34300215656407318 43 0.92949235145684739 44 1.4284052558095099 45 1.8418959574945555
		 46 2.1780160798361088 47 2.4445909394326835 48 2.6463104873516987 49 2.7877762307835274
		 50 2.8747965131559141 51 2.9103131664272537 52 2.9136474696657757;
createNode animCurveTA -n "FKPinkyFinger3_L_rotateY";
	rename -uid "E43BC1D3-4397-7A5E-72D8-CC94B3B89655";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.7890620083232292e-15 1 19.02077143407169
		 2 22.590959202309858 3 29.232036529414341 4 36.799451393621098 5 44.293628514069347
		 6 50.762841111646772 7 55.317972541075193 8 57.149482884301953 9 57.212281861649494
		 10 57.216724913949243 11 57.218447037025136 12 57.22301517633727 13 57.229085556853121
		 14 57.245145277443562 15 57.280204325366938 16 57.311174166756352 17 57.03431319120071
		 18 55.483058600776872 19 53.4517822422142 20 52.275092476365806 21 52.188893691895537
		 22 52.186014371272236 23 52.185407065595726 24 52.181664497228958 25 52.174908620881205
		 26 52.169398743559171 27 52.162570405697089 28 52.15252305321421 29 52.142961283683285
		 30 52.139687426358222 31 52.140527105337839 32 52.136363397420524 33 51.951829629877508
		 34 51.269056692748144 35 50.129029058410509 36 48.580690677082586 37 46.654127667288463
		 38 44.404527737927033 39 41.901233034502084 40 39.209296825497646 41 36.402269896362917
		 42 33.546502654057548 43 30.691769743002723 44 27.908550668697114 45 25.274754864911802
		 46 22.843880893255594 47 20.672103310405497 48 18.842309340037463 49 17.437204272584228
		 50 16.511347579927669 51 16.118031663407969 52 16.080732687022351;
createNode animCurveTA -n "FKPinkyFinger3_L_rotateZ";
	rename -uid "AF42B31F-494D-9AD7-85D7-009C55BD4062";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -7.504121201577986e-15 1 -5.3861807573555014
		 2 -6.4812575991491697 3 -8.5874384038746996 4 -11.386957674143181 5 -14.825017353208416
		 6 -18.668052426774445 7 -22.16192781242982 8 -23.834309736321075 9 -23.895003001227156
		 10 -23.899328228687203 11 -23.900953694667418 12 -23.905384262510978 13 -23.911304987371139
		 14 -23.92682955567712 15 -23.960907615137629 16 -23.991018021317341 17 -23.723606141270778
		 18 -22.305543988571806 19 -20.629478189036305 20 -19.73878241287548 21 -19.675595778985343
		 22 -19.673491643085892 23 -19.673058978258791 24 -19.670315059721592 25 -19.66538050364041
		 26 -19.661360880768818 27 -19.656360924062952 28 -19.649017485712111 29 -19.642060831074424
		 30 -19.639674224188482 31 -19.640270272033597 32 -19.63723755306458 33 -19.503240854844158
		 34 -19.018032230358514 35 -18.242526047599824 36 -17.252337374172264 37 -16.109600135769011
		 38 -14.883145626287583 39 -13.633884919157026 40 -12.404069600381911 41 -11.226074742215626
		 42 -10.118703226091235 43 -9.0883896631127179 44 -8.145797535986155 45 -7.301339589000805
		 46 -6.5568312122321455 47 -5.9161115427776556 48 -5.3919230321878713 49 -4.9980196815502049
		 50 -4.742178401533411 51 -4.6343410343305003 52 -4.6241314979229982;
createNode animCurveTA -n "FKPinkyFinger2_L_rotateX";
	rename -uid "2BE17000-4E88-9294-384A-53AA67339A6A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 9.5416640443905487e-15 1 -9.0944818673193595
		 2 -8.8100673308619495 3 -9.4867099165819333 4 -10.529724124193651 5 -11.913124214981444
		 6 -13.500352166075904 7 -14.926323245272714 8 -15.58485311068473 9 -15.592107238308662
		 10 -15.58580032495929 11 -15.620139675035059 12 -15.660258368128202 13 -15.634321486386497
		 14 -15.552745927103715 15 -15.480098424124387 16 -15.437919151485287 17 -15.837141158484444
		 18 -18.400279463974716 19 -22.770290500934252 20 -25.928954422497032 21 -26.108789471247821
		 22 -26.091370297113393 23 -26.086161454646568 24 -26.124918955812419 25 -26.219116844278879
		 26 -26.27383952239374 27 -26.264846009991864 28 -26.205275007563866 29 -26.128747923208138
		 30 -26.135929134302366 31 -26.185799652245855 32 -26.160837303196615 33 -25.879732927863415
		 34 -24.998940508334918 35 -23.606530968900699 36 -21.900712274374161 37 -20.089782747974901
		 38 -18.279208946467996 39 -16.519947156905246 40 -14.882169306866759 41 -13.443091124657107
		 42 -12.239614300591212 43 -11.250701540987736 44 -10.443667358077771 45 -9.799988811290822
		 46 -9.3019903395075669 47 -8.9287611138043808 48 -8.6601165723092848 49 -8.4786225966188038
		 50 -8.3703620062559185 51 -8.3282553600075886 52 -8.325678301859174;
createNode animCurveTA -n "FKPinkyFinger2_L_rotateY";
	rename -uid "4B7288AE-48CA-AE25-E1A4-DD80A299334D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.1131941385122306e-14 1 17.356492724012398
		 2 19.65334556991834 3 24.401655125723369 4 29.822510671289979 5 35.182839690403384
		 6 39.886843957596078 7 43.282952694697514 8 44.657587288144661 9 44.672187871572795
		 10 44.659519439350021 11 44.728273570844827 12 44.808235933823987 13 44.756614963717212
		 14 44.593020388457361 15 44.446061972253531 16 44.360199114297572 17 45.155788313818086
		 18 49.528058519476502 19 54.960384398864385 20 57.873483504687584 21 58.020457177857487
		 22 58.006288042729899 23 58.00204414460427 24 58.03356189123155 25 58.109728457905
		 26 58.15375258130863 27 58.146531558327503 28 58.098580300436922 29 58.036661944394616
		 30 58.042464688080464 31 58.082836442369491 32 58.06264430978058 33 57.83293675457189
		 34 57.083651175630635 35 55.799044119453811 36 54.031962622263016 37 51.873385375404851
		 38 49.348698878216027 39 46.438863834102854 40 43.187377241467942 41 39.736425376723609
		 42 36.251524890208401 43 32.805747076988581 44 29.43203364793143 45 26.210888558120676
		 46 23.237832712926355 47 20.597125400378747 48 18.370121171573384 49 16.638582307773348
		 50 15.483651162270485 51 15.003327282905964 52 14.973232880126854;
createNode animCurveTA -n "FKPinkyFinger2_L_rotateZ";
	rename -uid "14AFB466-4376-6FF6-F842-B99970438129";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -9.93923337957348e-16 1 -4.202457327185364
		 2 -5.072489706405344 3 -7.0291081326500873 4 -9.4601586844022698 5 -12.154599253428087
		 6 -14.853038983620667 7 -17.064767512529059 8 -18.03892816214718 9 -18.049532881419822
		 10 -18.040339225663395 11 -18.090393262490686 12 -18.14879832468003 13 -18.111067081519955
		 14 -17.992046001432314 15 -17.885750833008743 16 -17.823919586713984 17 -18.404579613797587
		 18 -21.960913842327965 19 -27.573204356724673 20 -31.414845068498014 21 -31.629523923386099
		 22 -31.608725237579879 23 -31.602527297625389 24 -31.648737268607896 25 -31.761024090728394
		 26 -31.826211396600922 27 -31.815498691294369 28 -31.74453106745489 29 -31.653317661247193
		 30 -31.661873723355139 31 -31.72132496986298 32 -31.691572577077281 33 -31.356003670022982
		 34 -30.298594098948943 35 -28.60623637818944 36 -26.492159664749838 37 -24.187158178614535
		 38 -21.802043797921701 39 -19.380820199622061 40 -16.999058585602498 41 -14.760977344040374
		 42 -12.736377352099948 43 -10.917322005162584 44 -9.2763878764074921 45 -7.8135605223460445
		 46 -6.5365955983330073 47 -5.4508890325422357 48 -4.5650051496616291 49 -3.8922354013440934
		 50 -3.4503114414287679 51 -3.2679929514026043 52 -3.2565889789318394;
createNode animCurveTA -n "FKPinkyFinger1_L_rotateX";
	rename -uid "938802F7-4BB5-5C0A-4785-E895A593DCC9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -1.7754752945721668 1 -4.6900098365405878
		 2 -4.7055991514037805 3 -5.0901010432867988 4 -5.7003278336808698 5 -6.4928347142379144
		 6 -7.3315701883016198 7 -8.0078766036393603 8 -8.288833381788427 9 -8.2573627596749031
		 10 -8.1944161193671476 11 -8.1494422038541607 12 -8.1279617209457005 13 -8.1097483285227074
		 14 -8.0947197923883607 15 -8.0791875420060144 16 -8.0610911749474656 17 -8.2773570468978299
		 18 -9.2725552628060353 19 -10.241522587844296 20 -10.744773828007849 21 -10.789645713273735
		 22 -10.802146631374892 23 -10.821478786529221 24 -10.840758389613098 25 -10.858350307563564
		 26 -10.87625710969006 27 -10.887213476887927 28 -10.884187619473829 29 -10.878130947557088
		 30 -10.875030696389738 31 -10.875224445356231 32 -10.89045527971771 33 -10.827158153403889
		 34 -10.518683342621459 35 -10.016061245949352 36 -9.3801319799874303 37 -8.6547320058629555
		 38 -7.9108395455733982 39 -7.2014163619320328 40 -6.541641442979361 41 -5.962630998819856
		 42 -5.4876135662535264 43 -5.1024910808221504 44 -4.8031200808005012 45 -4.598623097753106
		 46 -4.4753506434081576 47 -4.4114922828630885 48 -4.3976438621687617 49 -4.4188024100262151
		 50 -4.4465991021672444 51 -4.4595743454474812 52 -4.4579858960335921;
createNode animCurveTA -n "FKPinkyFinger1_L_rotateY";
	rename -uid "F3BF8BDE-43F2-126C-B781-6BAB21B10F29";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -7.2133977752514777 1 -8.5901261824584783
		 2 -7.5029532342648588 3 -6.1572490714625614 4 -4.6061076153108962 5 -3.0638985059104673
		 6 -1.7611073987002164 7 -0.87953252531732184 8 -0.57752665712047346 9 -0.7175207707409702
		 10 -0.92721352004642366 11 -1.0399504979722343 12 -1.0391736063813135 13 -1.0292520716774405
		 14 -1.0511209926234333 15 -1.0996616548277629 16 -1.1476702515493304 17 0.74435679835581137
		 18 11.048554778312441 19 24.378186449840378 20 31.984496143723387 21 32.491360702256117
		 22 32.496589136167508 23 32.534443359982937 24 32.570215272802614 25 32.607069606964998
		 26 32.645329725613365 27 32.660129618162891 28 32.644348982137195 29 32.629577898752252
		 30 32.627283149494929 31 32.630460069143311 32 32.651597263539479 33 32.486695937238323
		 34 31.733938264222925 35 30.419626747074712 36 28.607393180453549 37 26.344876921605106
		 38 23.726497964917129 39 20.861015841936368 40 17.804777849242377 41 14.613418070137568
		 42 11.344909408494713 43 8.0508529375694096 44 4.8257999549210613 45 1.7762986671536056
		 46 -1.0343453919839698 47 -3.5411718989865286 48 -5.6402700098864766 49 -7.246922014729714
		 50 -8.3113303170917021 51 -8.7646615371128558 52 -8.8153245958395008;
createNode animCurveTA -n "FKPinkyFinger1_L_rotateZ";
	rename -uid "7A2A1034-49A1-00B3-1B12-5C8860BE774F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.8173556094196381 1 -8.7858838565494217
		 2 -9.9556416948318613 3 -12.503787879117398 4 -15.413671396387414 5 -18.328367749843768
		 6 -20.894106945311524 7 -22.744007531035454 8 -23.519968487956024 9 -23.588410689624915
		 10 -23.612002305515926 11 -23.553993686631856 12 -23.413527561826115 13 -23.274654475374035
		 14 -23.221149874654166 15 -23.219112510358553 16 -23.198983256318407 17 -23.343750525545314
		 18 -24.455028948579709 19 -26.489962193584361 20 -27.965490110725522 21 -28.059087571970359
		 22 -28.056697042629708 23 -28.078573041674169 24 -28.102273001444438 25 -28.118365754231601
		 26 -28.13394349116394 27 -28.154141193725142 28 -28.163021842713771 29 -28.160037765379577
		 30 -28.152059653366116 31 -28.148756302306676 32 -28.176013465470415 33 -28.063801832011553
		 34 -27.526527230782282 35 -26.658401540017952 36 -25.535933883848671 37 -24.191347144496159
		 38 -22.721513932830121 39 -21.171860812485715 40 -19.53555398513555 41 -17.908588245668465
		 42 -16.37351784172489 43 -14.879069999354966 44 -13.416924934172144 45 -12.05959904617864
		 46 -10.825151097699043 47 -9.7155698587739732 48 -8.7924087608471879 49 -8.1073519176837685
		 50 -7.6606318843543857 51 -7.4716630742489958 52 -7.4480103095488035;
createNode animCurveTA -n "FKRingFinger3_L_rotateX";
	rename -uid "936ED690-411D-0342-0EA9-43BA06D74CB8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.2722218725854067e-14 1 -0.53371547867379776
		 2 -0.54790257762337014 3 -0.62085064683095881 4 -0.70857408740565198 5 -0.80100406310138561
		 6 -0.88785986121310945 7 -0.95339574065169341 8 -0.9785656107910472 9 -0.9761604294661872
		 10 -0.97497959390910582 11 -0.9761437816595081 12 -0.97653308478081347 13 -0.97478902994516381
		 14 -0.97333998121843734 15 -0.97344732408463364 16 -0.97332914156948758 17 -1.0270604702238826
		 18 -1.3495911849998381 19 -1.8446201799508382 20 -2.1717640446999775 21 -2.1929427039043272
		 22 -2.1925965493154682 23 -2.1959883345196443 24 -2.1981967722970572 25 -2.1971125507509344
		 26 -2.1955214683799955 27 -2.1956157158502521 28 -2.1952969452783293 29 -2.1944125159838785
		 30 -2.1958469041624711 31 -2.1985592847375552 32 -2.1999701047661682 33 -2.1825283008838126
		 34 -2.1118475798775189 35 -1.9939013115366335 36 -1.8448062566389158 37 -1.6781478766217595
		 38 -1.5026592738075661 39 -1.3274980337899271 40 -1.1602655526478385 41 -1.0045233717304889
		 42 -0.86350355478928142 43 -0.74223684597308348 44 -0.64353415843233874 45 -0.56779462920438328
		 46 -0.51576906631449382 47 -0.4881658378189272 48 -0.48291742308514757 49 -0.48225544560702505
		 50 -0.48266895579384173 51 -0.4835918053263154 52 -0.48322343668698448;
createNode animCurveTA -n "FKRingFinger3_L_rotateY";
	rename -uid "C8F3114C-4591-AE67-4E74-21A3A9C75074";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 5.2415137289345631e-32 1 14.961479104042198
		 2 14.757698573087941 3 15.842175361766115 4 17.076043765058905 5 18.303930381227381
		 6 19.397972023578312 7 20.189155311557215 8 20.485931040205053 9 20.457734675692873
		 10 20.44407042681042 11 20.457560165802455 12 20.462328097380396 13 20.441877266074865
		 14 20.424679136292141 15 20.425877272938489 16 20.424652293248162 17 21.044191469527242
		 18 24.450534306670797 19 28.876159865686688 20 31.404270924433696 21 31.558511026088269
		 22 31.555947817112454 23 31.58044018805824 24 31.596472339941744 25 31.588662793512029
		 26 31.577081475145583 27 31.57787421588505 28 31.575415238361977 29 31.568991593634902
		 30 31.579460020443261 31 31.599064316491507 32 31.609328944234075 33 31.482730766537646
		 34 30.962672718924726 35 30.068014338559387 36 28.885137644801532 37 27.487841319594942
		 38 25.920393163568466 39 24.24286284287933 40 22.518955488315054 41 20.787785260712088
		 42 19.096538574171845 43 17.531034250374184 44 16.168027462934518 45 15.059381125109221
		 46 14.261384609312575 47 13.824988177084661 48 13.740984760060089 49 13.730187993702938
		 50 13.736867212046516 51 13.751957451964126 52 13.745564374613572;
createNode animCurveTA -n "FKRingFinger3_L_rotateZ";
	rename -uid "4E7BC547-43AD-D17C-CE98-01A29815B073";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -4.7211358552974075e-16 1 -2.744871813734802
		 2 -2.6815539019761903 3 -2.8556373273596356 4 -3.0566908681010156 5 -3.2601989537338376
		 6 -3.4445562184548653 7 -3.5798251507681611 8 -3.6309889331567202 9 -3.6261181011395553
		 10 -3.6237522201722325 11 -3.6260948333282501 12 -3.6269030878198456 13 -3.6233537332976886
		 14 -3.6203982332340585 15 -3.6206166795591184 16 -3.6203978591792145 17 -3.7279275857218956
		 18 -4.3396290060438476 19 -5.1959648987193141 20 -5.7232994629061817 21 -5.7564726284897878
		 22 -5.755926666118766 23 -5.7611971007120708 24 -5.764658478919559 25 -5.7629784545396499
		 26 -5.7604843006329212 27 -5.7606414533798107 28 -5.7601257061002071 29 -5.7587338644763024
		 30 -5.7609951096827103 31 -5.7652214118094793 32 -5.7674394746704714 33 -5.7401531628689915
		 34 -5.6289225007770636 35 -5.4407549977771321 36 -5.1978234036612374 37 -4.9189054250754989
		 38 -4.6155910915645109 39 -4.3012561510545506 40 -3.9882859397594297 41 -3.6832813503565198
		 42 -3.3934597512470304 43 -3.1316870513167463 44 -2.9084200555814692 45 -2.7297429396892325
		 46 -2.6026491096668982 47 -2.5336546905846671 48 -2.5204116658908879 49 -2.5187089965964513
		 50 -2.5197711699821359 51 -2.5221408179844156 52 -2.5211449561693131;
createNode animCurveTA -n "FKRingFinger2_L_rotateX";
	rename -uid "ED9521C5-4198-D1EF-7A20-9BA4ACEB6D3B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.0336802714756427e-14 1 -16.391157028571477
		 2 -15.558032088720797 3 -16.049984301136913 4 -16.771141488012496 5 -17.682664596042414
		 6 -18.660736995133206 7 -19.480474373143686 8 -19.84297987465904 9 -19.850068926001931
		 10 -19.851767301622459 11 -19.853430237297509 12 -19.846929629218764 13 -19.842162812843732
		 14 -19.845031948636276 15 -19.847584666880753 16 -19.846850049134822 17 -20.700848152580967
		 18 -27.346570644212285 19 -44.914299390095898 20 116.99507378469656 21 115.66368560914128
		 22 115.75337748881444 23 115.75488244651221 24 115.75641257850569 25 115.75794477166677
		 26 115.75947274049692 27 115.76102835040193 28 115.76257180152685 29 115.76405029149612
		 30 115.76548693387771 31 115.76736775508192 32 115.76909428911289 33 116.90164077955448
		 34 -58.887318934428691 35 -52.445844449458122 36 -45.12439398156549 37 -38.09382047082223
		 38 -32.033318404181834 39 -27.158455513787157 40 -23.417663797764085 41 -20.640614719498515
		 42 -18.635748126379045 43 -17.236976592187588 44 -16.301474741275516 45 -15.709341260340345
		 46 -15.36872118279646 47 -15.213548467990993 48 -15.189532140148289 49 -15.189656161630284
		 50 -15.190089167862983 51 -15.190752735123361 52 -15.190786737638723;
createNode animCurveTA -n "FKRingFinger2_L_rotateY";
	rename -uid "BB757B1C-4258-5517-9A27-32ACCB90DA78";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -1.272221872585407e-14 1 12.064094722848285
		 2 13.999724473166566 3 17.69250427790266 4 21.913343446347604 5 26.121226712414959
		 6 29.787331020607233 7 32.401949568723616 8 33.455487185085566 9 33.475501621884831
		 10 33.480347229223057 11 33.485054759939501 12 33.466662970876449 13 33.453152933973627
		 14 33.461346506886585 15 33.468562889951485 16 33.46647022027409 17 35.730199683645914
		 18 47.577286665050607 19 60.769511965086252 20 114.27252422014062 21 114.07057575869527
		 22 114.0836502857823 23 114.08386543046537 24 114.08409906788862 25 114.0843193447223
		 26 114.08453246541308 27 114.08476620346646 28 114.08499094184023 29 114.08520916592303
		 30 114.08542158334075 31 114.08569620081069 32 114.08593856815743 33 114.25777982181636
		 34 64.987614343172922 35 63.424836823028862 36 60.862989704450158 37 57.247007847115285
		 38 52.67630681477614 39 47.357510641544678 40 41.565248939611607 41 35.588542748508324
		 42 29.701445075936281 43 24.181613330563504 44 19.287102954710214 45 15.239503863418246
		 46 12.276530461864889 47 10.659636919534853 48 10.388218850712095 49 10.389492336471438
		 50 10.394572015489002 51 10.402168407193843 52 10.402593964672093;
createNode animCurveTA -n "FKRingFinger2_L_rotateZ";
	rename -uid "0FDB3B8D-4A0C-2699-B1D8-3C8F677D9D26";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 3.1296161103932027e-14 1 -7.1481537409520719
		 2 -7.608781176835266 3 -9.2681386742462628 4 -11.263788810991016 5 -13.392134798383136
		 6 -15.393515032063467 7 -16.925589801890901 8 -17.571801648420283 9 -17.584233902357408
		 10 -17.587252232147332 11 -17.590176607082398 12 -17.578733087051599 13 -17.570355476975735
		 14 -17.575426989097679 15 -17.579916619156286 16 -17.578598796916349 17 -19.03247564275938
		 18 -28.742953141660337 19 -49.975928814201609 20 109.91917702489397 21 108.46647569444029
		 22 108.56428814044327 23 108.56592935069118 24 108.56758966214994 25 108.5692621887541
		 26 108.57092807187587 27 108.57262552205565 28 108.57430261545744 29 108.57591800352101
		 30 108.57748042822683 31 108.57954144617602 32 108.58140707753816 33 109.81719437699539
		 34 -65.572618348101855 35 -58.458001716096874 36 -50.232054890142273 37 -42.103956507378982
		 38 -34.784283763092624 39 -28.515530995421283 40 -23.278136126360586 41 -18.93800328189992
		 42 -15.344881830878128 43 -12.391254785124373 44 -10.008038093398023 45 -8.1583024100131851
		 46 -6.8561735582956 47 -6.1602895172152294 48 -6.0443629268003169 49 -6.0449053226340315
		 50 -6.0470677173081997 51 -6.0503090352580671 52 -6.0504955965766278;
createNode animCurveTA -n "FKRingFinger1_L_rotateX";
	rename -uid "A2D6D39E-42CB-0D9B-DD14-E89B31DEF2FF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.79127876802680919 1 -2.0330935188087698
		 2 -2.0676512681487353 3 -2.2236354738974304 4 -2.4003672795733695 5 -2.5744663786191335
		 6 -2.7281568770835967 7 -2.8357628314431715 8 -2.8710034230323211 9 -2.860083082789453
		 10 -2.8544001314744367 11 -2.859286731381482 12 -2.8664444867583705 13 -2.8683905274112886
		 14 -2.8678795122730616 15 -2.8687561176322025 16 -2.8679472790257758 17 -3.2788403267134107
		 18 -5.8499476158817743 19 -10.488107583738495 20 -14.324634419402679 21 -14.610532931954074
		 22 -14.606132053411457 23 -14.609505138599044 24 -14.609277755115997 25 -14.61856767983442
		 26 -14.625853635955981 27 -14.618831984307983 28 -14.604723829126902 29 -14.593498460922159
		 30 -14.587029061213029 31 -14.582606538154939 32 -14.580562173586756 33 -14.396235008193702
		 34 -13.699193277328524 35 -12.587318555859289 36 -11.209203430956357 37 -9.7210302286601333
		 38 -8.2674898051600945 39 -6.9233034763025776 40 -5.7077784526814428 41 -4.650422983351973
		 42 -3.7849930824848217 43 -3.1157349141733626 44 -2.6193212772808128 45 -2.2696960070812766
		 46 -2.0473295113872014 47 -1.9372629966002914 48 -1.9192256199871676 49 -1.9199596212520311
		 50 -1.9198508555388016 51 -1.9186246954924511 52 -1.9188661097843094;
createNode animCurveTA -n "FKRingFinger1_L_rotateY";
	rename -uid "278E0AA8-4893-688E-670C-5DAFC8EB006F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.36138455502183536 1 -1.4209095521999375
		 2 -1.4635411884797533 3 -1.6889469979737268 4 -1.9701426385627774 5 -2.2529543310397862
		 6 -2.4909010700532628 7 -2.6537166968112991 8 -2.7443839661408433 9 -2.887740362213663
		 10 -3.1221181347653766 11 -3.264108003759568 12 -3.2670424685027473 13 -3.2301227348970927
		 14 -3.2006148324191073 15 -3.1786166400513447 16 -3.1734593278867371 17 -0.72352942181924895
		 18 12.500131293854517 19 29.343171171479124 20 38.689165668138834 21 39.272664319158672
		 22 39.266574835257728 23 39.298559242931049 24 39.325351136653943 25 39.348574227812698
		 26 39.36631282769968 27 39.371559633665818 28 39.356238020943231 29 39.331802188208471
		 30 39.323393262356475 31 39.337595108217791 32 39.353858701618698 33 39.074669828571608
		 34 37.97699954559608 35 36.11326929314604 36 33.567881838574465 37 30.456475505723269
		 38 26.936329703225667 39 23.129201006641726 40 19.150348219767359 41 15.17081414774391
		 42 11.327173740222845 43 7.7268422243417154 44 4.5295226494689569 45 1.8973600209340291
		 46 -0.020892151645393514 47 -1.0671803207193975 48 -1.2405172327236391 49 -1.2256727759409662
		 50 -1.208365399675674 51 -1.2161119515710652 52 -1.2368371155961575;
createNode animCurveTA -n "FKRingFinger1_L_rotateZ";
	rename -uid "52FD8FE2-49CC-7D9C-99A9-4CB27D7A52E8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.061854101808285961 1 -6.6806771094308077
		 2 -6.8236370953477934 3 -7.6579935489450461 4 -8.6148721206969192 5 -9.5668907402207619
		 6 -10.408644589739584 7 -10.998610587818138 8 -11.209674315211478 9 -11.22522922766194
		 10 -11.312578893938214 11 -11.408671933595144 12 -11.44555213138848 13 -11.436112972066731
		 14 -11.418300291092001 15 -11.411395705652252 16 -11.404818057857728 17 -12.148728913828046
		 18 -16.573172081782001 19 -23.728771623242391 20 -29.124319208226307 21 -29.515074204835898
		 22 -29.509334317794718 23 -29.515257211609594 24 -29.516404013129453 25 -29.529348818576992
		 26 -29.539492084048213 27 -29.530915965412746 28 -29.512292261880187 29 -29.496826474422608
		 30 -29.488229679770296 31 -29.483399596927402 32 -29.481677800750703 33 -29.233888752839743
		 34 -28.288698888632087 35 -26.75339467161778 36 -24.793552882594607 37 -22.58800860392741
		 38 -20.31532779947349 39 -18.069795445216862 40 -15.868907285028985 41 -13.757013358455396
		 42 -11.815638988659414 43 -10.104946301589436 44 -8.6451412043158768 45 -7.4569499311854299
		 46 -6.5906211206700025 47 -6.1151255446509865 48 -6.033050923373489 49 -6.0359633790884191
		 50 -6.0342424095356586 51 -6.0283905038364551 52 -6.0309648558538118;
createNode animCurveTA -n "FKWrist_L_rotateX";
	rename -uid "D1D5B340-4C23-F9F1-CE7A-4A92387A6595";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.83422158392046064 1 0.74509083191131298
		 2 0.3897652778148174 3 -0.14552431702215113 4 -0.96474439060648731 5 -1.4712466778918882
		 6 -0.87525805972275905 7 0.76663971118510732 8 3.1912219068195844 9 6.043110876335124
		 10 7.6263394156651279 11 6.2957811096200347 12 2.7534680820393747 13 -0.42961830762256425
		 14 -0.0087019873270659139 15 4.7937404600864442 16 10.122180813422757 17 12.522721685950881
		 18 13.731227385455572 19 17.164543912225287 20 22.638430293784356 21 27.725223109306931
		 22 29.505150071565442 23 24.837449094194159 24 12.798148519526597 25 -2.4217072937850919
		 26 -13.104634666935107 27 -16.009019095029917 28 -15.101418515268476 29 -13.27517477326043
		 30 -9.7006265554109952 31 -5.8040620849634807 32 -6.0497759671666689 33 -10.757757135168852
		 34 -14.798305235617118 35 -14.074568139733506 36 -9.6231523828788479 37 -4.1202258201690505
		 38 1.0396285238269807 39 5.2053216278871473 40 8.0420247092233108 41 9.7387015964210715
		 42 10.510732421613419 43 10.195960974707889 44 8.806879801658777 45 6.984029811051121
		 46 5.6120157536445108 47 4.9509643048678962 48 4.4918427318759164 49 3.9089302535961208
		 50 3.2623729841669307 51 2.5299607981561976 52 1.7009074806063411;
createNode animCurveTA -n "FKWrist_L_rotateY";
	rename -uid "4AF661A2-4AF4-B3D1-355D-8FA920A0680D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.18990967452850124 1 2.882591591677846
		 2 3.0661671360025 3 3.5605224513979916 4 3.3564239625886909 5 2.4396878872553232
		 6 1.6865282010846523 7 1.466152386227525 8 1.2828722603044718 9 0.72928910443537109
		 10 0.29422474696518264 11 0.74821455970847994 12 1.6860638338655429 13 2.0049612123623639
		 14 1.509307483464587 15 1.4946113654183244 16 2.7580794691820638 17 4.3048554930550784
		 18 4.3209597295398643 19 2.4683787099192336 20 0.57129171219712382 21 -0.063794561197419081
		 22 0.69940712270268457 23 2.2123598376795082 24 3.0834264104342601 25 3.2575360660091079
		 26 4.1951910837294903 27 5.1860386801675027 28 5.5872711100493158 29 6.2729255626024303
		 30 7.4003247312044644 31 8.0153118096803784 32 8.2256324373111163 33 9.1354370092004711
		 34 10.531203542751836 35 10.044640650558504 36 6.9927324342247292 37 3.0951316721541726
		 38 -0.046582088891907701 39 -1.6263276840354146 40 -1.8646023085866126 41 -1.6185935755772292
		 42 -1.2997199505043109 43 -0.96958679108817425 44 -0.69189689037315061 45 -0.21041205760552498
		 46 0.59748471565764893 47 1.2806745029631128 48 1.6025250224477707 49 1.8186596898734921
		 50 2.0973138161709186 51 2.3802093210715412 52 2.6242628519174778;
createNode animCurveTA -n "FKWrist_L_rotateZ";
	rename -uid "FBABEC9B-4A20-FB18-DAA1-7B9A31C53417";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.094901038617317482 1 10.55641456422525
		 2 11.211496153959398 3 12.559713857285479 4 13.701899442997844 5 14.644664501826684
		 6 15.48728649936656 7 16.010021442374093 8 15.924858165187953 9 15.628840278393673
		 10 15.582807092538381 11 15.101626350919711 12 13.62843530596049 13 12.084892085288288
		 14 11.377670254386938 15 10.921319276517506 16 10.041255353103399 17 9.9166249018199792
		 18 11.475569003498526 19 12.712986991831828 20 11.817791006555172 21 9.8066112754304378
		 22 8.1134304694482218 23 6.554149263995944 24 4.5822517888375396 25 1.5254247595419852
		 26 -1.8196616846233467 27 -3.1236166443256663 28 -2.5074842739000158 29 -2.2348977744141778
		 30 -2.9817761468170838 31 -3.2077724763717663 32 -2.5204058152026496 33 -2.2239986169219392
		 34 -2.2117242525184597 35 -1.2615623063885706 36 0.92213757016479425 37 3.2430683964135816
		 38 4.8541284398592728 39 6.252571151387742 40 7.6918756275121893 41 8.7458005634888423
		 42 9.4023723787233084 43 9.9039159820358815 44 10.056763716584317 45 9.7763009236865077
		 46 9.5153506812399993 47 9.5917920188718675 48 9.8120199365246989 49 9.9631653836478851
		 50 9.9723848593051265 51 9.7174775425115278 52 9.2565560561874918;
createNode animCurveTA -n "FKElbow_L_rotateX";
	rename -uid "0BA68695-45B7-16CD-F27B-F69D29317BB9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.6112241430955543 1 -0.26356710079337925
		 2 -0.026625742655202355 3 0.0312352037075002 4 0.034392459579517511 5 -0.015663811206740916
		 6 -0.073363014340861413 7 -0.049052147270069318 8 0.014388924062116962 9 0.04675606385252179
		 10 0.046000562601521314 11 0.0093267092657508804 12 -0.071674877120226757 13 -0.22943559110886372
		 14 -0.81697720561870923 15 -2.8848111142133162 16 -6.3385365464544998 17 -7.5480654106941083
		 18 -6.3198806144604633 19 -6.513166771948506 20 -8.7136507292668011 21 -9.9777317790746824
		 22 -8.160029630169209 23 -4.5767554527139822 24 -1.6497443320607006 25 -0.43686994210162411
		 26 -0.18992529284921011 27 -0.19033016986063783 28 -0.23338726575413518 29 -0.41893841566330359
		 30 -0.81081501406780887 31 -1.0836854549556703 32 -0.97787070697549372 33 -0.74281340474573787
		 34 -0.58825032439083591 35 -0.50391391947486353 36 -0.48580590271103991 37 -0.60243293213820015
		 38 -0.86395405119126678 39 -1.1388696850281206 40 -1.3337950279790463 41 -1.4709945873416399
		 42 -1.5285885485202033 43 -1.4881862181576988 44 -1.4157445059001241 45 -1.3456006947125172
		 46 -1.252336235587761 47 -1.1364290916028208 48 -1.0169329640537277 49 -0.87384788612978626
		 50 -0.68235942996593968 51 -0.47212512773822907 52 -0.29124677151220801;
createNode animCurveTA -n "FKElbow_L_rotateY";
	rename -uid "6E79BBFF-4EDE-965A-AA0F-C5B2842205CD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 7.7535538889768079 1 12.931408525853159
		 2 11.419136259253635 3 10.400069158981774 4 10.331253014246515 5 11.248988765011042
		 6 12.058819764202301 7 11.738384931772224 8 10.732632287181252 9 10.045288089531882
		 10 10.063494570964091 11 10.825082214825914 12 12.039181384764374 13 13.707230996641648
		 14 17.618950499100393 15 25.003453109153082 16 31.925410942008089 17 33.702554857653837
		 18 31.896363148293847 19 32.196422614270723 20 35.217165308729918 21 36.681630117189073
		 22 34.517529340691901 23 28.829681506707058 24 21.198097945602427 25 15.325100701938531
		 26 13.332131681105032 27 13.345521685796777 28 13.746765337078308 29 15.222588103308524
		 30 17.587132679867668 31 18.910813038561415 32 18.419371635292411 33 17.220813405073436
		 34 16.329605950807345 35 15.797529704245346 36 15.677819954836309 37 16.416806072138005
		 38 17.859614478268867 39 19.158580075772043 40 19.984657651442735 41 20.528515422525334
		 42 20.74876669183913 43 20.594789017729479 44 20.312885721186955 45 20.0325196002184
		 46 19.647586854712362 47 19.147680496611624 48 18.604031925297974 49 17.908830419674377
		 50 16.88409779301146 51 15.586499616572292 52 14.244160947810084;
createNode animCurveTA -n "FKElbow_L_rotateZ";
	rename -uid "2FCBB5D9-46AF-03B7-3348-228C2D2AC800";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -5.3562229224646511 1 2.2925273507955599
		 2 0.54463163996652519 3 -0.51492166572589326 4 -0.58635547477929584 5 0.36724988405654335
		 6 1.2123586748061617 7 0.87747578644762814 8 -0.1699028459022445 9 -0.88263436895873637
		 10 -0.8637997402216312 11 -0.073904477372549279 12 1.1919955654169658 13 2.9468930434392551
		 14 7.1664053818454097 15 15.786596604820573 16 25.206268957707238 17 27.964568329663081
		 18 25.16339366824651 19 25.613519996998825 20 30.467321351752851 21 33.042037232391287
		 22 29.292380341033741 23 20.772268328150286 24 11.211473190309022 25 4.6683584289428808
		 26 2.5496283004540761 27 2.5651908944874342 28 2.9896908818303887 29 4.564362919198123
		 30 7.1348552055282557 31 8.6045064847625135 32 8.0557451061488621 33 6.731282460490732
		 34 5.7586660900484841 35 5.1826142547410123 36 5.0533738187852331 37 5.8537062799623838
		 38 7.435018786535351 39 8.8829609509605998 40 9.8173958575892151 41 10.438925710265545
		 42 10.692144413836608 43 10.515065448895493 44 10.191921567965272 45 9.8719218049150612
		 46 9.4347387616141063 47 8.8705910490906579 48 8.2615967951494529 49 7.4891661082641168
		 50 6.3627283395290872 51 4.9549671409572431 52 3.5178242180628785;
createNode animCurveTA -n "FKShoulder_L_rotateX";
	rename -uid "FBC9FFC5-4653-5C5A-AEFE-B0AF7CE025A1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 13.362391427182031 1 -25.708666177232601
		 2 -25.709759896614006 3 -29.613735361040028 4 -33.206121796842218 5 -36.1899710144464
		 6 -37.866703561375751 7 -36.40644747601889 8 -30.407570909257419 9 -22.52259075960977
		 10 -17.587676324167511 11 -16.985702652995826 12 -18.429778390030521 13 -19.557242013316333
		 14 -19.647923871305753 15 -20.462228851209005 16 -25.7311787529373 17 -36.280343486612679
		 18 -50.360913482425794 19 -61.039986339409829 20 -58.672649601186478 21 -45.765075928647533
		 22 -34.565415354023848 23 -35.121314562209669 24 -41.919333513889171 25 -46.40592884554728
		 26 -45.313088061250589 27 -40.85513618073157 28 -35.401759706534627 29 -28.036734133519428
		 30 -20.380049658820106 31 -17.101999928436879 32 -19.051435023761076 33 -23.4323913243026
		 34 -27.031641927598102 35 -28.611738741173664 36 -28.848076751966286 37 -28.735167627477104
		 38 -28.494620302934678 39 -27.562328064320837 40 -25.793785857692832 41 -23.803771264074999
		 42 -22.177862611647686 43 -21.148162250192975 44 -20.643229583029427 45 -20.444794314643975
		 46 -20.531879463164525 47 -20.932608290640861 48 -21.311885979818996 49 -21.320973704079911
		 50 -20.927594160513301 51 -20.182069750800373 52 -19.178920903750686;
createNode animCurveTA -n "FKShoulder_L_rotateY";
	rename -uid "DD791C5C-415D-380F-93FC-95B1357F38A7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 44.681502435526333 1 63.559806206844158
		 2 65.418044287209938 3 67.820166547083858 4 69.557667767786867 5 70.287081261232231
		 6 70.313696261548969 7 69.911828080861923 8 68.748523410708273 9 66.307328492294019
		 10 62.761491322622113 11 58.98335124043215 12 56.299174731343456 13 55.261156992328964
		 14 54.873572883194733 15 54.307070509183774 16 54.252097371038182 17 56.127331894201035
		 18 60.602386232642488 19 65.574545918546349 20 70.319509551636685 21 73.579239452124639
		 22 73.537014491767138 23 70.653866979522164 24 67.241312130022152 25 64.970758767998433
		 26 64.027607320015932 27 63.812502826223103 28 64.014848794849058 29 63.9136624500794
		 30 62.703889269021154 31 61.37773703412055 32 61.093664226708803 33 61.234979839908732
		 34 61.014827217235322 35 60.452282065686923 36 59.711582246597189 37 58.725968283285425
		 38 57.628515242272158 39 56.814664443108384 40 56.457223696933916 41 56.541902960259591
		 42 57.052006401519833 43 57.778003619506151 44 58.466254544890312 45 59.137347552412898
		 46 59.888761711314928 47 60.594479733677957 48 61.077568655960327 49 61.36914051001488
		 50 61.579187460196508 51 61.696613563587761 52 61.668753668492201;
createNode animCurveTA -n "FKShoulder_L_rotateZ";
	rename -uid "A06AA753-42AB-57E4-865C-088E93F980CD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -43.277227837766517 1 5.6415003197507723
		 2 4.640831668550133 3 8.2689376806866459 4 11.40716668126559 5 13.608800623797256
		 6 14.428773568880723 7 12.550028981662571 8 6.5559466708652421 9 -1.6339496315941193
		 10 -8.1573903730287007 11 -12.423832534186497 12 -16.640723427005486 13 -22.154661995004666
		 14 -28.620678111445024 15 -31.912922719595194 16 -23.178164802568386 17 0.92062929788532399
		 18 31.604347991109648 19 53.382527611236448 20 56.75273884909879 21 47.090555915014058
		 22 37.754416603975059 23 39.404151784995733 24 47.205761726591916 25 51.432783470798469
		 26 47.160094813664536 27 37.295808146050348 28 25.832566706147833 29 12.251247641665703
		 30 -1.8483224000685035 31 -10.939313658843744 32 -12.957833470394181 33 -10.334306803353481
		 34 -6.6968405463507725 35 -3.9237652578183408 36 -1.994754816009555 37 -0.39051975300912684
		 38 1.0437315321062295 39 1.8463883239621504 40 1.7477573933489396 41 1.2301898004296445
		 42 0.89535364260568573 43 0.91303250395737623 44 1.1242656372607025 45 1.3551691438431985
		 46 1.6596994178099151 47 2.076620648734667 48 2.2824509398665134 49 2.0043736409177573
		 50 1.3270815260521194 51 0.36423666846769881 52 -0.8229295842064992;
createNode animCurveTA -n "FKScapula_L_rotateX";
	rename -uid "8C1654B5-48E9-3467-CE29-28AD748436B9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -3.3246735654673326e-13 1 11.777888734742488
		 2 10.517752754268452 3 10.062337657800088 4 9.584643871755139 5 9.1227967740185179
		 6 8.7218747213638803 7 8.4244829683629856 8 8.2475716848557266 9 8.14131943903317
		 10 8.0092223766710582 11 7.8348122440762022 12 7.6501454850062887 13 7.4769615680761703
		 14 7.3100474219485125 15 7.1951196093079801 16 7.2695306488880567 17 7.5737171381375656
		 18 7.9001547822653801 19 8.0353715977318245 20 8.0216834569767599 21 8.0189646296507391
		 22 8.1288115495097593 23 8.31359985436616 24 8.4970038602122617 25 8.6837729073606447
		 26 8.8856471485247095 27 9.076884669265235 28 9.2533102388381092 29 9.4140815477328612
		 30 9.5378891004438522 31 9.6260312494060081 32 9.6892847186739424 33 9.7210047355924338
		 34 9.7511101618607032 35 9.8430971670038367 36 9.9873787599819295 37 10.130339128592855
		 38 10.269640532309621 39 10.406788492363997 40 10.511097692346686 41 10.586208823298563
		 42 10.656617870283542 43 10.712461499667221 44 10.746949880232595 45 10.785459117391035
		 46 10.845711759384296 47 10.917888603807343 48 10.98651005110222 49 11.045663645748464
		 50 11.094110236605335 51 11.129567261924812 52 11.151867149932698;
createNode animCurveTA -n "FKScapula_L_rotateY";
	rename -uid "592CA2C8-47DB-F99F-BE0F-5585A3723291";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 2.6239576122074188e-14 1 12.40174839659119
		 2 10.836670658389171 3 9.6312524761991494 4 8.104394211035034 5 6.2940873776275046
		 6 4.2379150268720256 7 2.1527278619107051 8 0.25842598248871873 9 -1.5358348803974247
		 10 -3.3524268706903078 11 -4.9770648962789998 12 -6.2973306056595266 13 -7.4525767162131888
		 14 -8.8164232126885143 15 -10.31280562055275 16 -10.64781750809548 17 -8.8661600297090306
		 18 -5.981823581313364 19 -3.5618678027799819 20 -1.8215193425752307 21 -0.58967193272690199
		 22 -0.12111832624077565 23 -0.18516879604406289 24 -0.016487734952292173 25 0.55291877975363013
		 26 1.226325076062176 27 1.9090887193008204 28 2.4598632289014497 29 2.6375655790072514
		 30 2.5114875606911071 31 2.4169061615414615 32 2.600908840731297 33 3.0906753904544346
		 34 3.7509222181518891 35 4.4392886014366368 36 5.1195233254990571 37 5.7300261922641242
		 38 6.1898987625773101 39 6.6011259573608143 40 7.1140145655440099 41 7.6852409276145996
		 42 8.2416511503636318 43 8.8252830293267763 44 9.4630973058979073 45 10.082276082455289
		 46 10.596713946694049 47 10.9999922913955 48 11.336937623931583 49 11.612083901163087
		 50 11.80891165085516 51 11.934756413755336 52 11.994654442530436;
createNode animCurveTA -n "FKScapula_L_rotateZ";
	rename -uid "AF286534-492B-94EA-8EEC-F4BA50596BAB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -6.0533037292033755e-14 1 -6.810680082263783
		 2 -6.1297843886598322 3 -5.8350397518527748 4 -5.6243774132155915 5 -5.5431650744044711
		 6 -5.6952484003907005 7 -6.1743667280606704 8 -7.0278959474748524 9 -8.1670789803947343
		 10 -9.2160917410744911 11 -9.8138768999951456 12 -10.036447721221496 13 -10.136820611328588
		 14 -10.41667009337753 15 -11.178252337151134 16 -12.149520578238592 17 -12.531748106367026
		 18 -11.929820696772266 19 -10.72413968739734 20 -9.4493928903726641 21 -8.6247455718914665
		 22 -8.6908416018128687 23 -9.3132434359416845 24 -9.7602951029884242 25 -9.966898745469388
		 26 -10.138481130520386 27 -10.225150547568708 28 -10.291800967104933 29 -10.459015203250971
		 30 -10.619841141959522 31 -10.624726886267135 32 -10.404306928869458 33 -9.9442020850270492
		 34 -9.4262133818902836 35 -9.1120535981088757 36 -8.9694553254665337 37 -8.8534598854791327
		 38 -8.7856094239330673 39 -8.7329248364399881 40 -8.5646341963943353 41 -8.315056074477198
		 42 -8.0765074370421068 43 -7.8135166236301874 44 -7.5055109664160726 45 -7.2366367701683449
		 46 -7.0694720520390453 47 -6.9794169558996852 48 -6.9181177098546849 49 -6.8722653096154547
		 50 -6.8449665263796886 51 -6.8307372891069109 52 -6.8294047751884968;
createNode animCurveTA -n "FKChest_M_rotateX";
	rename -uid "EEE065CD-4746-0267-FA3C-378864399FCA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.66563884000610396 1 0.50430364877424161
		 2 0.3684592723405733 3 0.22768564341335565 4 0.026561485061571868 5 -0.27255459373003382
		 6 -0.66951803358114448 7 -1.1077420177586059 8 -1.4720458010994284 9 -1.6794270780609422
		 10 -1.7675138926857448 11 -1.8502789333840859 12 -2.0422473561445709 13 -2.4723821359574378
		 14 -183.13187585724231 15 176.451090827125 16 -2.9889124073805888 17 -181.231430690758
		 18 0.97071044075499635 19 2.4485145493443077 20 2.914854426185904 21 2.9640169339224456
		 22 3.1136086533679732 23 3.5906208782186804 24 4.3418589067405087 25 4.9500476754363296
		 26 5.0779227003044554 27 4.8864954840182309 28 4.7171697892299544 29 4.6213812115068498
		 30 4.4183540364878979 31 4.0314528299825056 32 3.5849349305158542 33 3.1904035055173119
		 34 2.8392087891658258 35 2.4727315986086098 36 2.0852684121179434 37 1.724828291734857
		 38 1.4176743083586802 39 1.1450342172404175 40 0.91360810589301034 41 0.77076441248447014
		 42 0.71139658105309234 43 0.66932291803353117 44 0.62208231819924598 45 0.59629252489067286
		 46 0.60139061432822782 47 0.62059574195082101 48 0.63488977928157864 49 0.63785217341781841
		 50 0.6381282553498947 51 0.64574885301886453 52 0.65771969331390612;
createNode animCurveTA -n "FKChest_M_rotateY";
	rename -uid "4C757E7C-493E-3991-B487-B8B3BBBE2B84";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.005927911123049 1 1.2294419616044912
		 2 1.4908053984737517 3 1.7911154216611849 4 2.1163003833897052 5 2.4562731502451682
		 6 2.79480623541787 7 3.0939859003455608 8 3.3118406312098787 9 3.4062351878008346
		 10 3.3586337325189155 11 3.2557343207735361 12 3.2837299685432288 13 3.5378688674543657
		 14 -183.78181753968059 15 -183.51464454107762 16 2.6141650323994177 17 -181.54613880446149
		 18 0.6724510514586266 19 -0.1450411919143729 20 -1.0270140353525898 21 -1.6805926384873568
		 22 -1.8495914785637624 23 -1.8433406686158424 24 -2.0806451954858263 25 -2.429889953252153
		 26 -2.529429274131437 27 -2.3236263372431263 28 -2.0166763403999837 29 -1.7496342231949789
		 30 -1.5217783157873632 31 -1.2922418733616416 32 -1.0612501685467195 33 -0.86005217939105738
		 34 -0.69970188690517254 35 -0.52947198499695192 36 -0.3027486315606438 37 -0.06025502418689823
		 38 0.14247768408819564 39 0.32058714434008873 40 0.49729950780892967 41 0.65405700819874391
		 42 0.78173274801933501 43 0.88364689653390527 44 0.95253104784605269 45 0.99570426698274062
		 46 1.0283359006216384 47 1.0480405926978622 48 1.0526065613917557 49 1.0488946732082274
		 50 1.0382129794362629 51 1.0227219670464474 52 1.0108475613053542;
createNode animCurveTA -n "FKChest_M_rotateZ";
	rename -uid "ACA9EB39-4C5A-28A4-396C-84ACA685A88F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.93161811819872686 1 0.85569170270243755
		 2 0.80365367733929494 3 0.79558027142207621 4 0.82888465343068152 5 0.85894176816627477
		 6 0.8401389855233764 7 0.78459445036365016 8 0.74589625511491275 9 0.76063711238927811
		 10 0.84971159809272634 11 1.0113059882656239 12 1.1659203650155425 13 1.2044878820619713
		 14 181.09119763630954 15 -179.12843853018336 16 0.66067563687573838 17 180.60715824236738
		 18 0.74518787089035787 19 0.95547164421466002 20 1.1512093535253765 21 1.3669792292895344
		 22 1.6560418282479217 23 2.0025354244273221 24 2.3118556337820104 25 2.4682077316046271
		 26 2.4404923402781127 27 2.3076730621268333 28 2.1685778558789655 29 2.0646913545774264
		 30 1.9675721803808917 31 1.8248128538458626 32 1.6207523967055288 33 1.4004770941093259
		 34 1.2352489561517737 35 1.1388753243507013 36 1.0747068453302855 37 1.0318499843400155
		 38 1.0069401730448577 39 0.97765866744860697 40 0.94576462196064059 41 0.93885911437180181
		 42 0.95666572859140131 43 0.96590677795824831 44 0.95375800605041428 45 0.94036487846767236
		 46 0.94439740569421082 47 0.96448213147076878 48 0.98696422900198921 49 0.99990757430913657
		 50 0.99865967170195113 51 0.98327287263434793 52 0.95652812031966961;
createNode animCurveTA -n "FKSpine1_M_rotateX";
	rename -uid "77DAADE5-41C0-83BE-0093-67A8E81EEFCC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 2.2148253409388063 1 1.504557833335967
		 2 0.88693552419585031 3 0.25407672619051008 4 -0.60777296582679596 5 -1.865671905262118
		 6 -3.5349932442060785 7 -5.3740015282019069 8 -6.8906063203974526 9 -7.7250989569467681
		 10 -8.0091897618722552 11 -8.234404817490903 12 -8.9615580914512503 13 -10.755561077788855
		 14 -13.445970084636548 15 -14.897422471061477 16 167.75272141203294 17 -5.0625777626466553
		 18 3.4871476963997905 19 9.1333096826154545 20 11.067171474032246 21 11.476154579933219
		 22 12.172195062643128 23 14.081753648291741 24 17.058205692546231 25 19.451444504747101
		 26 19.918434293670501 27 19.088079990771163 28 18.357416112722408 29 17.977025683697079
		 30 17.207804266456794 31 15.68915067753008 32 13.915726106958729 33 12.372921876554841
		 34 11.027855293196263 35 9.6140840479567338 36 8.096464473934164 37 6.6769781790276479
		 38 5.4581129253581437 39 4.3479776951753184 40 3.3790371443884419 41 2.7646385309524071
		 42 2.4908874353038479 43 2.2892183612346826 44 2.0761351455659174 45 1.9588877269001941
		 46 1.9660264842905764 47 2.0304918143397557 48 2.0828690075017433 49 2.0958914880954569
		 50 2.0991070679760901 51 2.131666232081102 52 2.1819190544494824;
createNode animCurveTA -n "FKSpine1_M_rotateY";
	rename -uid "4F18480E-4547-97AC-ABAD-F09964B7DEF4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 3.9052896038800018 1 4.7838029312013672
		 2 5.8256202082158826 3 7.0245504361411824 4 8.2933096750541004 5 9.5715822916339377
		 6 10.808820985957201 7 11.885903326040106 8 12.66564576906681 9 12.997896478776223
		 10 12.805978308089978 11 12.394022012956286 12 12.392114284261796 13 13.064132867464266
		 14 13.67880740515325 15 12.830084442519139 16 -189.95416290476666 17 5.8063184232543295
		 18 1.4582576689955957 19 -2.3934802781296747 20 -5.4855482213064173 21 -7.406704465118886
		 22 -7.6203868192148771 23 -7.2133321343298533 24 -7.9187725407948042 25 -9.2931799427710686
		 26 -9.8130196616118912 27 -9.1780469767704922 28 -8.0607010074528453 29 -6.9292873688429033
		 30 -5.906946598276301 31 -5.0189979906936637 32 -4.2249041771645981 33 -3.4678478211258703
		 34 -2.760747530490133 35 -1.988467884365841 36 -0.97637109546766776 37 0.11452535205880661
		 38 0.97827135928443498 39 1.6095972661154236 40 2.1696845689410615 41 2.6933304023278906
		 42 3.1509775921817482 43 3.4980427294411962 44 3.7113606552048761 45 3.8541805100358819
		 46 3.9702198499070693 47 4.0326599828515146 48 4.0476201953589621 49 4.0397171663500293
		 50 3.9987599012660251 51 3.941709915048329 52 3.9113594153100215;
createNode animCurveTA -n "FKSpine1_M_rotateZ";
	rename -uid "583533B0-43B0-6AB3-9CC0-1DABB549BCB3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 4.5440090119223919 1 4.2699363623610056
		 2 4.0709656609990059 3 3.9876238846980625 4 4.0082887881417442 5 3.9976819187376518
		 6 3.8000644688866703 7 3.4504438753612208 8 3.1555821012786485 9 3.0910971235058176
		 10 3.3746046511794412 11 3.9829622704742196 12 4.4650082365529613 13 4.1728701171198468
		 14 3.0059951757252517 15 1.5231887530917079 16 -179.85108314091423 17 -0.71329541002199826
		 18 -0.18108716693310561 19 1.7840509729995353 20 3.8872817903475743 21 5.301892790067007
		 22 6.3406317247234218 23 7.492033517440861 24 8.5926705166576003 25 9.178124368245582
		 26 9.2072854713140728 27 8.994943315236112 28 8.7525317758837549 29 8.5181582903788957
		 30 8.2302312937805997 31 7.7617973545611507 32 7.0644188102505598 33 6.3140807474582621
		 34 5.7672910364202155 35 5.4505883109959248 36 5.2186527835427432 37 5.0194247708628428
		 38 4.8546724735096598 39 4.6986772324892518 40 4.5807567358230727 41 4.5709772334902787
		 42 4.6399666195630189 43 4.6614031037419661 44 4.5942054775534729 45 4.5237478220583967
		 46 4.5349774090276416 47 4.6278202556525017 48 4.7356089436095443 49 4.7991100544311101
		 50 4.8024640576950803 51 4.7499065999986092 52 4.6472351852588174;
createNode animCurveTA -n "FKToes_R_rotateX";
	rename -uid "C76264DA-482A-69AD-0D95-41BB17A0A885";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.2722218725854361e-14 1 6.1159706890538574
		 2 5.7135984094268917 3 5.7136472117379666 4 5.7139938576825609 5 5.7149589798855143
		 6 5.7166464512469588 7 5.7197451960806251 8 5.7246002325357921 9 5.7316367738043716
		 10 5.7411658732499147 11 5.7525988969308344 12 5.7656982454128807 13 5.7786853225317492
		 14 5.788801855796601 15 5.8247170760247338 16 5.9035120237882106 17 6.0351683227670927
		 18 6.3980929033063365 19 7.0575321652627059 20 7.9204704248818709 21 8.5520329391784244
		 22 8.753950143171636 23 8.4695232503115889 24 7.9355568625183874 25 7.24812894512909
		 26 6.6852076085046459 27 6.450369682464423 28 6.4870609985814696 29 6.5367363922429886
		 30 6.4934539184795126 31 6.3613991651779038 32 6.1817646017118184 33 5.97920332073602
		 34 5.8121721362919256 35 5.7763075253512648 36 5.7883837022223243 37 5.7896085252385987
		 38 5.783470392384479 39 5.77242809210908 40 5.7649215927794932 41 5.7606823827886497
		 42 5.7555125879300837 43 5.749826109486099 44 5.7445937320702845 45 5.7397061471974045
		 46 5.735203656969551 47 5.7311095457783248 48 5.7273859993144622 49 5.7240618434625068
		 50 5.7211188908518871 51 5.7185320569250768 52 5.7163024988318814;
createNode animCurveTA -n "FKToes_R_rotateY";
	rename -uid "5A36F4D5-48DA-9495-46DA-AE898CCA9CA7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -1.2722218725853774e-14 1 -4.304023746971585
		 2 -4.0199207666760692 3 -4.0199195746789478 4 -4.0199645872645045 5 -4.0200743049250693
		 6 -4.0202536095106751 7 -4.0205987829882242 8 -4.0211322322895855 9 -4.021889230937898
		 10 -4.0229184806455827 11 -4.0241331034765571 12 -4.0254768065772479 13 -4.0267995972010171
		 14 -4.0278072768283621 15 -4.0312559639280785 16 -4.0380374955994709 17 -4.0471568350836868
		 18 -4.0587780777675029 19 -4.0243602407761996 20 -3.872869460637657 21 -3.6807239372963667
		 22 -3.6036472561021862 23 -3.7104887620725022 24 -3.8691074126918705 25 -4.001317612335253
		 26 -4.0519626233356032 27 -4.0581613071791942 28 -4.0576005482501536 29 -4.0567747591006915
		 30 -4.05752946264084 31 -4.0579737097078254 32 -4.0541369433789685 33 -4.0436046710091746
		 34 -4.0300945274182691 35 -4.0265648570998902 36 -4.0277532930861053 37 -4.0278775893974821
		 38 -4.0272679172910406 39 -4.0261652340210015 40 -4.0253989862938564 41 -4.024951533036786
		 42 -4.0244161044103137 43 -4.0238403304380306 44 -4.0232747464897525 45 -4.0227564324355765
		 46 -4.0222765956220066 47 -4.0218475824427067 48 -4.0214211191450087 49 -4.0210688441590321
		 50 -4.0207535135787138 51 -4.0204598059023455 52 -4.0202171960490434;
createNode animCurveTA -n "FKToes_R_rotateZ";
	rename -uid "AF340CAB-43D2-F703-46D3-F3AAF45DB160";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 2.6398603856147191e-12 1 -1.2624031293771512
		 2 -1.2087770062293488 3 -1.2083356806546941 4 -1.2051245016263059 5 -1.1962317776873266
		 6 -1.1807491337522609 7 -1.1522661951094821 8 -1.1076220766703953 9 -1.0429441645625674
		 10 -0.95539125533062763 11 -0.85038416760052515 12 -0.7300826652661494 13 -0.61082853915546731
		 14 -0.51797235489418303 15 -0.18836105947383239 16 0.534270534145598 17 1.7401603186957852
		 18 5.0535983053577294 19 11.090472939215529 20 19.103712255372418 21 25.134833898354763
		 22 27.106536184892278 23 24.331621735039302 24 19.245718451512193 25 12.846656571469682
		 26 7.68080038636983 27 5.5346092056119707 28 5.8707366408500929 29 6.3245672915024542
		 30 5.9291046446906348 31 4.7225830327239482 32 3.0809614326469763 33 1.2278846596142006
		 34 -0.30364371852490613 35 -0.63270998534254297 36 -0.5217642912280116 37 -0.5105119604299837
		 38 -0.56687867855356033 39 -0.66827253546407372 40 -0.73720458574493164 41 -0.77611288015844382
		 42 -0.82360484160746683 43 -0.87589828144475468 44 -0.92391513883514798 45 -0.96882522147108818
		 46 -1.0101901176055954 47 -1.0478599516452296 48 -1.0820361670261796 49 -1.1125791889574634
		 50 -1.1396317417981814 51 -1.1633989952708177 52 -1.1839338254333918;
createNode animCurveTA -n "FKAnkle_R_rotateX";
	rename -uid "31E4AB88-4CF2-B398-2B1F-2E9E1600EF38";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0.2300097022278447 1 2.3319860544973556
		 2 1.3471867859906734 3 0.063111330948396882 4 -0.12368706536473215 5 0.41138324204814525
		 6 0.80975647474008716 7 1.1659740683662592 8 1.4728095532326706 9 1.8199572674780302
		 10 1.3874124045238818 11 -0.36706539608373195 12 -1.8644136920657157 13 -1.6117170814507238
		 14 0.87433898832202839 15 2.173940089456206 16 1.7860733286873287 17 6.5421752035507597
		 18 16.083367522352425 19 22.8729994600981 20 26.639203584799912 21 27.760064392822279
		 22 25.115806758542661 23 19.765521333096157 24 17.62689526014637 25 21.135412493466859
		 26 25.800378070308692 27 26.824958737825312 28 24.846664222735832 29 22.125208439079106
		 30 19.471992472599098 31 16.694936569306069 32 14.149657783082363 33 12.28194718415633
		 34 10.535887663415238 35 8.6628034048149605 36 7.1621409264148861 37 5.980061288475949
		 38 5.058360359858125 39 4.3136469009843008 40 3.5666195719574887 41 2.72443228305147
		 42 2.2732447684189077 43 2.2978663388183547 44 2.3146269954098502 45 2.3124221286823405
		 46 2.3196598317558865 47 2.3229344927609055 48 2.329569112666809 49 2.3363136564467628
		 50 2.3420657084935792 51 2.3472292406955928 52 2.3491561864014483;
createNode animCurveTA -n "FKAnkle_R_rotateY";
	rename -uid "B02A1BF8-4F76-AC04-18F1-15AC8D3DC5B9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.003890989855118101 1 -2.5126831069731397
		 2 -2.7819923256380976 3 -3.3217232959877574 4 -4.0406629688601932 5 -4.7335342063397263
		 6 -5.2743776542460781 7 -5.5749284877497427 8 -5.5573644728560891 9 -5.3677146236623559
		 10 -4.9148812489689453 11 -4.0558951293147496 12 -3.0402590166041326 13 -2.0468688164873399
		 14 -0.89438233355396557 15 0.18522858849800472 16 -0.10391618457767164 17 -1.8691502458470894
		 18 -2.3457839326352601 19 -1.6933910417344327 20 -1.6894600926014536 21 0.75326792072306104
		 22 4.3682313484584911 23 5.2439680260207266 24 4.7478798630188077 25 0.49993590352885897
		 26 -3.5429963400462938 27 -3.9157700652893137 28 -2.8361021783862213 29 -2.5070153497418342
		 30 -2.9334839037201337 31 -3.3815174142357574 32 -3.7914849643451758 33 -4.3308231207508925
		 34 -4.1945461859608146 35 -2.5518652204496952 36 -1.2773164246501441 37 -0.58346559616047566
		 38 -0.61794657541088915 39 -1.0967630097933887 40 -1.4903003946141382 41 -1.7829387036966629
		 42 -2.0472205331512603 43 -2.2696092016726235 44 -2.3787709755928512 45 -2.4372299059297511
		 46 -2.4568963530182244 47 -2.4325809717533793 48 -2.3989620969798877 49 -2.34620988437349
		 50 -2.2664124471511271 51 -2.1884587255202206 52 -2.1177717151446465;
createNode animCurveTA -n "FKAnkle_R_rotateZ";
	rename -uid "FB0A451B-4E35-B0DC-9FBA-13B33AE2AE2E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 10.421084361233838 1 10.126516652576973
		 2 9.8462501204956485 3 9.5200285108280678 4 9.07952067998602 5 8.4754919236383763
		 6 7.8323058008952575 7 7.2522816812731348 8 6.7581740187285853 9 6.4244647742841492
		 10 6.4974061268806116 11 7.0945876081428478 12 8.0101408643700545 13 8.8765108826745465
		 14 9.3327262723064184 15 9.3429239584913066 16 8.3641757769623784 17 5.5172307911582505
		 18 0.94423606277353223 19 -3.6258248589008746 20 -9.378719540205303 21 -13.777258511956491
		 22 -13.529968354208387 23 -8.714535113363862 24 -2.6713067235770858 25 2.4810205480241465
		 26 4.7567274293800175 27 5.3873857598150456 28 5.2971905542112072 29 4.9280455941848631
		 30 5.2024792898255825 31 6.21565512818648 32 7.3676544504354347 33 8.3788231758197451
		 34 9.1927816559508653 35 9.3777448893719857 36 9.1448925027697996 37 8.885491244066527
		 38 9.1280495492723599 39 9.5042170831029651 40 9.6073505530875796 41 9.6427135164340694
		 42 9.6776940013301118 43 9.6680388693864749 44 9.6825120971639951 45 9.7027095481529049
		 46 9.7265993941455058 47 9.8018759621168456 48 9.9086669354069272 49 10.015874213858838
		 50 10.13321389170107 51 10.240019678049862 52 10.303252267192077;
createNode animCurveTL -n "IKLeg_R_translateX";
	rename -uid "BF0D5F19-4EAE-C190-8B25-B59AEB71DF4A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 8.2662230904182863 1 1.1699300126801138
		 2 2.0195316256320091 3 2.4506645660177213 4 2.8897650971237869 5 3.3159944487265385
		 6 3.7226519079327041 7 4.0895212926641733 8 4.4231196816503839 9 4.7606132696915653
		 10 5.1516949125869971 11 5.585618080177551 12 5.9532872234955008 13 6.104553152738621
		 14 5.8442183340234148 15 5.4372592456315587 16 5.1565771597345949 17 4.6190377979489678
		 18 3.8528136771469423 19 3.2349740511431531 20 2.5885972654536626 21 1.3628693847970279
		 22 -0.16626522316176917 23 -1.1166201502428574 24 -1.2162342905584218 25 -0.19352452617333249
		 26 0.7482068334925227 27 0.88337173155655613 28 0.73786203812259288 29 0.82037271395675049
		 30 1.09165565502175 31 1.3466466559730996 32 1.5484585250723644 33 1.7166244869868645
		 34 1.7295146317095398 35 1.4442330083108406 36 1.183473243127052 37 1.0090529003928719
		 38 0.99111136708488523 39 1.0762025539760103 40 1.1415919596098796 41 1.2010295137734097
		 42 1.2570749359950337 43 1.288596053506442 44 1.3062319810873966 45 1.3188477753544134
		 46 1.3269550305413649 47 1.3326032523152485 48 1.3364358422526852 49 1.3376336323460425
		 50 1.3385120305938383 51 1.3392668617635035 52 1.3395923519242938;
createNode animCurveTL -n "IKLeg_R_translateY";
	rename -uid "5A985367-412F-0661-EB61-B7827CA472F0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 2.9487331711975973 1 2.6667612823876876
		 2 2.7552094928130266 3 2.8680430503028944 4 2.9916759656226812 5 3.1108765927315609
		 6 3.218540080650147 7 3.313346201864821 8 3.389825000842027 9 3.4692407687319431
		 10 3.579474477737616 11 3.6984643734269902 12 3.7868336130578708 13 3.8005792645641954
		 14 3.6755147667026176 15 3.4834316888848988 16 3.298766892902675 17 3.0407601352951499
		 18 3.3236546503988542 19 4.642464406587326 20 6.4645729573181647 21 7.9192035314718119
		 22 8.4978205710263879 23 8.0431133901982079 24 7.1798979506544534 25 6.2322720806135514
		 26 5.3221731145969375 27 4.8651912209407442 28 4.8038740737659342 29 4.7785756383921925
		 30 4.6758153521864863 31 4.4101510939477979 32 4.0110552379423758 33 3.5557749453283449
		 34 3.1108723777416252 35 2.7884860820278128 36 2.5400579475697143 37 2.3440077034564943
		 38 2.3292534966825098 39 2.407924857240916 40 2.4314385235193168 41 2.4376772015539299
		 42 2.4521201819607068 43 2.4626258740397748 44 2.4754593985214566 45 2.4841531018469656
		 46 2.4852891654860407 47 2.4874105738348717 48 2.4915371608257555 49 2.4977109413382479
		 50 2.5096974993333454 51 2.5223228051070006 52 2.5371975073123956;
createNode animCurveTL -n "IKLeg_R_translateZ";
	rename -uid "C2619F73-4A6B-8D09-05B6-4E955BED42DD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -3.0083172800059472 1 -5.0876480385070062
		 2 -4.8184493618824549 3 -4.6782179195243403 4 -4.5067797864148131 5 -4.2953722503991214
		 6 -4.0466730712531218 7 -3.7859530001566197 8 -3.5254984072442435 9 -3.2736737636385884
		 10 -3.0580831897771343 11 -2.9127451578691161 12 -2.8563301476304668 13 -2.8875499601172399
		 14 -3.0216937968154953 15 -3.0701953049376867 16 -2.7410855425355392 17 -2.142779453522941
		 18 -1.4704236048015495 19 -0.68421417924977046 20 0.40885265964316542 21 1.1157071404755809
		 22 0.89332702012220766 23 -0.26702276255787361 24 -1.5978291774509046 25 -2.591023123416905
		 26 -3.0536038541492383 27 -3.2391165107928463 28 -3.2728923695496608 29 -3.2456910420082643
		 30 -3.3207648766892799 31 -3.5260985558509139 32 -3.7583479973015654 33 -3.9623709654046975
		 34 -4.1682780304972793 35 -4.353032808059937 36 -4.4599875932832935 37 -4.5310442789435852
		 38 -4.6393148902215691 39 -4.7318135995193886 40 -4.7686865491008428 41 -4.7920987709166232
		 42 -4.8175223189676162 43 -4.8337277778304264 44 -4.850788085696137 45 -4.8652156381841527
		 46 -4.8756382724659106 47 -4.8912465681264541 48 -4.9103243646134915 49 -4.9295900837049436
		 50 -4.951146112343781 51 -4.9698862907741548 52 -4.9843415307387238;
createNode animCurveTA -n "IKLeg_R_rotateX";
	rename -uid "8D951BFD-4B37-3CE5-AFDC-04B3B9B60C0E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.55315597186879117 1 3.5042299995308701
		 2 3.4190725882099042 3 3.6587039367934371 4 3.9155945894871094 5 4.1851480692998786
		 6 4.4605613777132049 7 4.7347266235700864 8 5.0001490873421606 9 5.2461023608509283
		 10 5.4715568687544494 11 5.6551737658758539 12 5.773560740919371 13 5.8443036426319965
		 14 5.8171886144519558 15 6.3311339798250819 16 8.1402378785808391 17 10.568410130766042
		 18 13.870555920195599 19 20.168133352563405 20 28.533571644673962 21 33.340916621316204
		 22 32.558549389515434 23 27.407956685675664 24 21.598244131297776 25 16.302640197955309
		 26 12.7185789862221 27 11.084715279981323 28 10.946557620182157 29 11.258409566456377
		 30 11.204300959929979 31 10.371363258296149 32 9.0359464623244747 33 7.5212605160595425
		 34 5.9671655003679005 35 4.7355662098764659 36 3.8831807840228096 37 3.2594598625396149
		 38 3.0108722361598126 39 3.0137947803169083 40 3.0087678475993056 41 3.0121591910451446
		 42 3.0179027408729149 43 3.0179011247482399 44 3.0195085486909559 45 3.0200206740787308
		 46 3.0195187940760473 47 3.0186681604035157 48 3.0178249411154918 49 3.0170056772833411
		 50 3.0165904328610194 51 3.0163176302264807 52 3.0158912926823489;
createNode animCurveTA -n "IKLeg_R_rotateY";
	rename -uid "5F4D818C-4E93-5C0D-C0D8-1989FEF3CDE2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -22.324703405687401 1 -26.771473511873655
		 2 -28.056017833328379 3 -29.633383597013637 4 -31.268424312069445 5 -32.921862091727576
		 6 -34.551971157121478 7 -36.115504659133464 8 -37.570256859884481 9 -38.874720604048711
		 10 -40.028670348418835 11 -40.92972414543339 12 -41.497693399011794 13 -41.838973301648558
		 14 -41.907713859891814 15 -42.052845307847321 16 -42.500041607357879 17 -42.446475137333088
		 18 -41.745486223103192 19 -40.615741566926289 20 -37.394801297434491 21 -31.911371541601035
		 22 -25.452543556295176 23 -19.532597929516378 24 -18.110207311473076 25 -20.287197191762488
		 26 -22.656843124421439 27 -23.203529848426111 28 -22.87155142385334 29 -22.987057630593192
		 30 -23.443708822801977 31 -23.878580598219262 32 -24.304914829057331 33 -24.742233831612399
		 34 -25.047460604825499 35 -25.149062788830875 36 -25.225743171598666 37 -25.299776793565101
		 38 -25.298989472905394 39 -25.293901249341747 40 -25.295436381739076 41 -25.265804377322535
		 42 -25.251431631214057 43 -25.253379634771203 44 -25.252870553947176 45 -25.252791135688259
		 46 -25.253134491386341 47 -25.25329167248162 48 -25.253469597128454 49 -25.253700920007685
		 50 -25.253757185208269 51 -25.253887031471052 52 -25.254022863363033;
createNode animCurveTA -n "IKLeg_R_rotateZ";
	rename -uid "B8289167-4F24-7512-723E-50B434A17AA2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 4.8957420924292796 1 -8.3196424220062148
		 2 -7.5317043667139378 3 -7.6478179524942806 4 -7.777542453043667 5 -7.9210706855159465
		 6 -8.073526613883665 7 -8.2321544898278898 8 -8.391519686316526 9 -8.5426771150371419
		 10 -8.6871202674633246 11 -8.8064973965883055 12 -8.8841196031490739 13 -8.9298781263947689
		 14 -8.8885290251863935 15 -9.6246804168806008 16 -12.236546429862054 17 -15.619008033867441
		 18 -17.694210505073897 19 -20.295347763634659 20 -23.988944087901061 21 -23.245306820142595
		 22 -17.897685698700617 23 -12.85828351523757 24 -10.918785138649792 25 -13.724176183095432
		 26 -16.686836750925245 27 -16.79792100985166 28 -15.89258576738917 29 -15.661249463028975
		 30 -15.962540030791814 31 -15.912269100361005 32 -15.525100560821949 33 -15.098131503013791
		 34 -14.015640742882109 35 -11.587847358276923 36 -9.4751606653264489 37 -7.9398255570268912
		 38 -7.3342595154829624 39 -7.3488714155360988 40 -7.3502499945460054 41 -7.346103794939717
		 42 -7.3482488156284136 43 -7.3481700668155714 44 -7.3480876602453939 45 -7.3480016667873356
		 46 -7.3481074783845672 47 -7.3480797491780017 48 -7.3481137308155899 49 -7.3482220021777716
		 50 -7.3483564291221981 51 -7.3484259831512313 52 -7.3485345572849461;
createNode animCurveTA -n "FKKnee_R_rotateX";
	rename -uid "45AFF21E-4D0C-DF33-8EEB-789368F0A711";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -186.58497761053911 1 -186.44542813025075
		 2 -185.86670095034117 3 -185.13667595878388 4 -183.0821253991316 5 -180.29250704606997
		 6 -177.74718612869694 7 -175.59873140822117 8 -173.83707972247478 9 -171.7942196086565
		 10 -170.03563937112656 11 -169.51788886801467 12 -169.41178240171271 13 -169.32220084178994
		 14 -169.90140176029635 15 -174.57336289317865 16 -183.24258155320459 17 -189.06528094712445
		 18 -189.65459420654767 19 -189.48673832835672 20 -189.26920173033659 21 -189.14279330375413
		 22 -188.96197536288005 23 -188.63554954273076 24 -188.48695234671627 25 -188.46868357865111
		 26 -188.38913292454524 27 -188.36482851153582 28 -188.41130344674659 29 -188.46349654678957
		 30 -188.40753768114726 31 -188.37699773488885 32 -188.47114127734713 33 -188.58298563246137
		 34 -188.63710762678818 35 -188.52000798371267 36 -188.47977951296804 37 -188.49940241475707
		 38 -188.39905103515761 39 -188.26236021359526 40 -188.22208162045587 41 -188.16363982451779
		 42 -187.70796328623038 43 -187.11079956882824 44 -186.79924472507923 45 -186.60652757398009
		 46 -186.50297827645736 47 -186.48031573473978 48 -186.49712337840251 49 -186.57969730016043
		 50 -186.66508161734131 51 -186.73208780283471 52 -186.86340389987512;
createNode animCurveTA -n "FKKnee_R_rotateY";
	rename -uid "E3A39085-4F82-0239-74FD-C39735766149";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 177.5861387993082 1 167.95101864182996
		 2 168.90225596484291 3 169.46046051435411 4 170.37818852670537 5 171.39980537573757
		 6 172.40488524582125 7 173.30679041110238 8 174.00393184305477 9 174.7219357092126
		 10 175.07234012706778 11 174.75247528238955 12 174.48407593423906 13 174.63672381362537
		 14 174.68847117714176 15 172.99062090382336 16 170.74948253501694 17 170.53469881170935
		 18 170.1208494124144 19 168.40003539720564 20 167.64930484006092 21 167.66400022502521
		 22 168.19371747145405 23 168.87931579229453 24 168.88479188878645 25 168.74140343405188
		 26 168.50733423080763 27 168.05006351378375 28 167.98482303266059 29 168.00622998631445
		 30 167.68871746193764 31 167.44969158024043 32 167.54185331498962 33 167.85418001993037
		 34 168.13613213152112 35 168.3492150502376 36 168.71998759926078 37 169.13480907703081
		 38 169.08211294968532 39 168.82754076263097 40 168.81664914691618 41 168.86751465516514
		 42 168.94171901895191 43 169.04757944685485 44 169.06040601738988 45 169.06429072736128
		 46 169.04737474666041 47 168.96942182640103 48 168.89927323820575 49 168.82107730331788
		 50 168.71822918066647 51 168.6309768185003 52 168.54344248011296;
createNode animCurveTA -n "FKKnee_R_rotateZ";
	rename -uid "F05C16CB-4FA5-3C50-5DAC-E98653D0E975";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -201.13382213118973 1 159.74912237393315
		 2 159.35616108861123 3 158.98978711577405 4 158.60610407073153 5 158.37319716537399
		 6 158.27925841187238 7 158.21823243011659 8 158.13567938864469 9 157.67491720835787
		 10 156.4111837119851 11 154.3782751360321 12 152.03335112061947 13 150.42767864160086
		 14 150.97307603804748 15 153.57937750523249 16 157.61671038086232 17 -195.63258132878784
		 18 -191.05365054192208 19 -194.2284363543593 20 -199.52123699815812 21 -203.01150754016328
		 22 -204.76112769216374 23 -205.15744832449514 24 -205.13550756912446 25 -203.63568230101208
		 26 -200.60800982288046 27 -198.75322812126359 28 -198.39720561774968 29 -198.42904093017992
		 30 -198.92063758491418 31 -199.14389337536664 32 -198.5469628209753 33 -197.33169710383666
		 34 -196.13225454367134 35 -195.43300081566858 36 -194.73869640810585 37 -194.23186950900472
		 38 -195.04563819797625 39 -196.23551241461786 40 -196.75853457401487 41 -197.14278855935868
		 42 -197.55183816343779 43 -197.81515411697015 44 -198.05764573890897 45 161.73945504316976
		 46 161.57915184857586 47 161.35273976529137 48 161.08018353752931 49 160.81767739999307
		 50 -199.45736645650592 51 -199.69346664620051 52 -199.84840028408499;
createNode animCurveTA -n "FKHip_R_rotateX";
	rename -uid "A4696F44-4330-7DAE-E66F-CD840D2E198F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 7.8286344740808067 1 7.6911403604009969
		 2 7.6838936554370951 3 7.7787935731521598 4 7.6693494241168674 5 7.2759353895804662
		 6 6.872731199938797 7 6.5194768051528049 8 6.0804284124498116 9 5.504555059616429
		 10 4.6969346358914503 11 3.836843102080711 12 3.3970665874878896 13 3.7673747588401794
		 14 4.9601388804491204 15 6.577320450740781 16 8.3633118823601453 17 9.194220050321638
		 18 -188.55731620842298 19 -188.00688151616583 20 -188.11455998657607 21 8.2586109994035528
		 22 8.4329147632177026 23 8.5784283300113682 24 8.7196984181130421 25 8.8686995064895537
		 26 8.5771181801901815 27 8.2905236387031298 28 8.5036693896534388 29 8.7971777083078653
		 30 8.9284391586691605 31 9.0672051900751995 32 -189.20128976427495 33 -189.20676103926252
		 34 -189.08318053329256 35 -188.86574194348555 36 -188.66868607185745 37 -188.55215813610101
		 38 -188.38791204339961 39 -188.19472787881537 40 -188.144843325208 41 -188.14713190618104
		 42 -188.08599143388619 43 -188.01351276670252 44 7.9708616248095536 45 7.9519139317000134
		 46 7.9221843772212583 47 7.8852218112611245 48 7.8834244071026198 49 7.8882024962681312
		 50 7.890305609930726 51 7.8948549571046138 52 7.8584433621007008;
createNode animCurveTA -n "FKHip_R_rotateY";
	rename -uid "9F151DF8-4E2E-DCD8-22A6-43A675FDFB5B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 6.0710810537922537 1 6.2613708042671457
		 2 6.3880561526765032 3 6.4725554723485672 4 6.6117122076271704 5 6.881494537349635
		 6 7.1782253065631156 7 7.3389465936498448 8 7.3274565067133723 9 7.162581435706052
		 10 6.8749179190224536 11 6.3678899913543274 12 5.7077213408134071 13 5.0346502800148967
		 14 4.4162647955837162 15 3.9524423489604388 16 3.6474881091153595 17 4.0794770313824866
		 18 185.50331443656287 19 187.06772349748337 20 188.54730067040157 21 9.4483966302058242
		 22 9.7422016930291822 23 9.7231917536342003 24 9.213361322619587 25 9.4046690695466086
		 26 10.061554390862172 27 9.8668206646290866 28 8.7898076202734554 29 7.6537531762229545
		 30 6.703595263410584 31 5.6550847722469273 32 184.7138157738691 33 184.24203576713256
		 34 184.00450210367632 35 183.86181470256611 36 184.08503503137098 37 184.43425345916992
		 38 184.84200905624212 39 185.23346441922064 40 185.41408601753454 41 185.46865659054887
		 42 185.56909147943446 43 185.68633894438224 44 5.7247678594992566 45 5.7463439862642591
		 46 5.8132902182654078 47 5.8823469496302021 48 5.9217529569995273 49 5.9607116944279523
		 50 5.9618524973551237 51 5.9498526057456544 52 6.0225406014771607;
createNode animCurveTA -n "FKHip_R_rotateZ";
	rename -uid "258E1B6C-41AB-0CF8-7768-86BA88D9AD0B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 8.3775381902716077 1 9.6908506455478616
		 2 11.129526873566968 3 12.792474324299178 4 14.62487285738665 5 16.388369967737727
		 6 17.971743526539413 7 19.340595910854439 8 20.453888417133207 9 21.63153894085028
		 10 23.198545516828503 11 24.928018564626914 12 26.350090637937072 13 26.700596809034682
		 14 24.857213560196509 15 20.758478029447151 16 15.200727323734954 17 8.3832188786192798
		 18 -176.09018349042276 19 -175.40208104164611 20 -172.81865684210248 21 9.5040548961175073
		 22 10.794341869903805 23 10.669183039653481 24 10.401384562508516 25 9.9843507100701228
		 26 8.9716071066388388 27 8.1905504474613817 28 7.8340741955123239 29 7.3892968804873407
		 30 7.1245751919185434 31 6.8461893816862531 32 -173.63770521589313 33 -174.23179489738064
		 34 -174.74592555782181 35 -174.90153001085514 36 -175.04137573599152 37 -175.14433699416773
		 38 -174.4969868628024 39 -173.62293676568629 40 -173.24923633625616 41 -173.02767898588775
		 42 -172.7543589788819 43 -172.54114842679647 44 7.6508518955139158 45 7.7833434712521559
		 46 7.8169028809612637 47 7.8341521705366191 48 7.8660720567687514 49 7.9114075632621077
		 50 8.0089899236318196 51 8.1129181367290713 52 8.2370021773804964;
createNode animCurveTA -n "FKToes_L_rotateX";
	rename -uid "1B1CF01F-40A6-8782-3A37-D6B2856398C5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 180.00000000000003 1 189.82023105665033
		 2 189.17126329977879 3 189.16953587857341 4 189.16646938656282 5 189.17198505923631
		 6 189.18496720038968 7 189.18845701562196 8 189.18096040418331 9 189.17037534332039
		 10 189.1578993502898 11 189.14095348720585 12 189.12435110664589 13 189.11976448335542
		 14 189.13774032553999 15 189.18490686516361 16 189.2906051103779 17 189.4786031495814
		 18 189.78921974412171 19 190.02085692043013 20 190.02952382056395 21 190.12974713570108
		 22 189.97663331690742 23 189.60100031979783 24 189.36024078757001 25 189.21746543425101
		 26 189.15856989510368 27 189.15469744122387 28 189.15577482331591 29 189.15477575052233
		 30 189.15420838111476 31 189.15412419411376 32 189.1534785183004 33 189.15329622955085
		 34 189.15348966945942 35 189.15356271432583 36 189.15418696279752 37 189.15517556507766
		 38 189.15598183700499 39 189.15696627742474 40 189.15800672321808 41 189.15906051721646
		 42 189.16027610113554 43 189.16128296520503 44 189.16251398582406 45 189.16376074937881
		 46 189.16494559378748 47 189.16615493784033 48 189.16732978486843 49 189.1684902043728
		 50 189.16965616114013 51 189.17084328131173 52 189.17196093103865;
createNode animCurveTA -n "FKToes_L_rotateY";
	rename -uid "91DC9465-4E69-A0C8-D4A7-CEA385488289";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 180.00000000000003 1 185.31363538382038
		 2 184.96547846408575 3 184.96606974271202 4 184.96713444903841 5 184.96522089235503
		 6 184.96071743884752 7 184.95949619452173 8 184.96212108649866 9 184.96578942247288
		 10 184.97007674993156 11 184.97586515644397 12 184.98148818651643 13 184.98303406512215
		 14 184.97697213584865 15 184.96077600832692 16 184.92287534079031 17 184.8500265170085
		 18 184.71525030240886 19 184.58613461200227 20 184.55023651948957 21 184.52503853030015
		 22 184.62374587391488 23 184.79870282542404 24 184.89676258482993 25 184.94935939390191
		 26 184.96987688221586 27 184.97117537754548 28 184.97080473170362 29 184.97114847010317
		 30 184.97134380617021 31 184.97137242656618 32 184.97159455621508 33 184.97165903211382
		 34 184.97158924248347 35 184.97155967471181 36 184.97135559659242 37 184.97101545771187
		 38 184.97073849913031 39 184.97039909089145 40 184.97003294936331 41 184.96968213156944
		 42 184.96925934959322 43 184.96891444796188 44 184.96849417873412 45 184.96806175897964
		 46 184.96765857484056 47 184.96723577725393 48 184.9668314844983 49 184.96643383783444
		 50 184.96602770251027 51 184.96561543394861 52 184.9652325529471;
createNode animCurveTA -n "FKToes_L_rotateZ";
	rename -uid "64298433-420A-A9A5-84EE-02B73C394265";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -180.00000000000065 1 -181.75111895057731
		 2 -181.70713037820363 3 -181.7236090614044 4 -181.75290618579825 5 -181.70024078541763
		 6 -181.57615063145954 7 -181.54280844402587 8 -181.61443130887767 9 -181.71561092517206
		 10 -181.83472396489475 11 -181.99642222878126 12 -182.15468748613182 13 -182.19839016391737
		 14 -182.02707242030701 15 -181.57681098369926 16 -180.56307189686052 17 -178.74283876311006
		 18 -175.73190024370297 19 -172.78050273972786 20 -171.38195441031934 21 -171.52668404519855
		 22 -173.85829134194756 23 -177.5446756819108 24 -179.89161366486778 25 -181.265351840524
		 26 -181.82841100825817 27 -181.86531227822414 28 -181.855021528012 29 -181.86456512934075
		 30 -181.86996915954757 31 -181.87076745203993 32 -181.87695970796136 33 -181.87868723019375
		 34 -181.87682578504064 35 -181.87614355336916 36 -181.87016960352972 37 -181.86077181056015
		 38 -181.85305552486702 39 -181.84364588714314 40 -181.8337419922442 41 -181.82367136461346
		 42 -181.81203304760484 43 -181.80244423415846 44 -181.79069939345504 45 -181.77876428175205
		 46 -181.7674562752309 47 -181.75593028441261 48 -181.7447298139796 49 -181.73362713575975
		 50 -181.72246285518833 51 -181.71115622963973 52 -181.70044881455624;
createNode animCurveTA -n "FKAnkle_L_rotateX";
	rename -uid "224A90FB-45E8-44CE-FC23-AC9DE8E4E67B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 363.16830112050644 1 364.4068644448875
		 2 364.29504964676141 3 364.31293111927965 4 365.3543115732225 5 188.89216813294854
		 6 192.80854529504398 7 196.16591574007634 8 198.96111004945777 9 201.83002332352098
		 10 204.95452271101692 11 207.43208225768674 12 208.54933481439102 13 208.11396607406766
		 14 205.81772545660681 15 201.3441039592345 16 374.37801678352582 17 365.94056539981506
		 18 361.3023757153565 19 355.4263443181926 20 350.99389298557361 21 347.99025292831897
		 22 345.30875442622357 23 345.15960668688712 24 346.79945060243091 25 347.71455824917825
		 26 348.15758733700994 27 348.94668866128086 28 350.34655274501716 29 352.50848426615875
		 30 355.01341308668401 31 357.45775144587122 32 359.54510808680539 33 361.30271994990534
		 34 363.10353044730994 35 364.32615831070177 36 364.4177762876908 37 364.27029181477388
		 38 364.22769226924476 39 364.17875198318586 40 364.1417302191781 41 364.13096210565527
		 42 364.13908039162482 43 364.1439990087577 44 364.15032340718682 45 364.17263401015833
		 46 364.19664993440455 47 364.21613190259302 48 364.23967329562635 49 364.2634255799602
		 50 364.28166588802196 51 364.29860072312948 52 364.31718277676902;
createNode animCurveTA -n "FKAnkle_L_rotateY";
	rename -uid "3F41A4D2-435F-E9AD-9E9E-0F866D4D96D7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 4.081178572370022 1 3.3337609284000682
		 2 3.6184241283903873 3 3.7988933233881474 4 3.8869693167652146 5 -175.96630036030345
		 6 -175.81954179457185 7 -175.91193289183803 8 -176.3207171075147 9 -176.94824820564318
		 10 -177.8538496427476 11 -179.13469639352888 12 -180.45842546579331 13 -181.30583110710126
		 14 -181.44369799463269 15 -180.94680980821465 16 0.27634381011493231 17 1.8513450051030604
		 18 2.6257784697163919 19 1.8220277635261788 20 -0.26983554051660485 21 -2.1730038109440097
		 22 -2.9795292889619853 23 -3.027945641012761 24 -3.5199422059642616 25 -4.3271619611549896
		 26 -4.8199842992295272 27 -4.978634512846603 28 -4.9973482171608996 29 -4.8013248099604908
		 30 -4.496946489605766 31 -4.2216101919000693 32 -3.8200294219052138 33 -3.1712575909716016
		 34 -2.2892674983563537 35 -1.2636732818490544 36 -0.19338161072576593 37 0.8001222685551399
		 38 1.6483636383986751 39 2.3609344725740447 40 2.9062576462996623 41 3.2307924345465389
		 42 3.3967667933984957 43 3.4878955413681885 44 3.528160357580874 45 3.5219881236321373
		 46 3.4951527571808265 47 3.4640199083252297 48 3.4076378092396253 49 3.3429544616231834
		 50 3.2985064359647183 51 3.2515214221247901 52 3.1984005353089011;
createNode animCurveTA -n "FKAnkle_L_rotateZ";
	rename -uid "553EE004-49A4-55BC-E207-3F8EEF3F45D7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -1.2401656823069502 1 -1.5800602705131412
		 2 -1.9320567246603442 3 -2.029359161294948 4 -1.6800615620392338 5 -179.12478137558139
		 6 -180.30201652095928 7 -181.75974635184949 8 -183.5263088607212 9 -185.64047999735646
		 10 -188.03591722721009 11 -190.70073097777006 12 -193.5505700172034 13 -195.97140836217739
		 14 -197.09055917955499 15 -196.69763176484511 16 14.814497430002142 17 11.638089678993619
		 18 6.6923654183801933 19 1.1062248429507495 20 -3.9208252493131992 21 -7.5024282983786037
		 22 -5.8657266992337647 23 0.18565511692068254 24 4.705472384537198 25 6.8684930380403451
		 26 7.6508363292656263 27 7.5557833868122533 28 7.1244399421508806 29 6.731757951779981
		 30 6.5557631263438845 31 6.4116600738825387 32 6.019903073693027 33 5.4155406283722076
		 34 4.636021294308815 35 3.6861678854076305 36 2.6779531708087578 37 1.616874218109293
		 38 0.4720390903697767 39 -0.75566048338459924 40 -1.9967418671284276 41 -3.0058310545655957
		 42 -3.5477364618580549 43 -3.8449325024229366 44 -4.116364363070196 45 -4.1197330191847028
		 46 -3.7943787501845532 47 -3.3497652218300065 48 -2.8720617782338369 49 -2.41071758791889
		 50 -2.035305956524204 51 -1.7142109669451642 52 -1.4142366391139876;
createNode animCurveTL -n "IKLeg_L_translateX";
	rename -uid "19BC8556-4F1C-E91E-6F48-F09EA3C62AE9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -1.9028773498722789 1 16.735672387121355
		 2 15.421041637102114 3 15.499157317753994 4 15.604535801965849 5 15.81461074438435
		 6 16.045627565847401 7 16.254819879101102 8 16.452616092726934 9 16.676100787599047
		 10 16.928229618878301 11 17.171165914727464 12 17.370702993274481 13 17.470690805350351
		 14 17.348937662878107 15 16.96073033918363 16 16.49543395121303 17 16.180896968337542
		 18 16.234827769155032 19 16.078441986263673 20 15.553151635693684 21 14.957773004891852
		 22 14.457272960777487 23 13.911015624127476 24 13.471904241805337 25 13.13266517764054
		 26 12.943303925291563 27 12.951992794185898 28 13.095022474633492 29 13.335518957844563
		 30 13.60503953342533 31 13.849100693871545 32 14.077438821429773 33 14.2832109157753
		 34 14.477336112064187 35 14.644168489800553 36 14.766325559224835 37 14.869981396611788
		 38 14.965496260599146 39 15.059681624859628 40 15.153558964125008 41 15.23794112140877
		 42 15.303331147639085 43 15.343448489080753 44 15.370135747448042 45 15.384886198434561
		 46 15.384863507288568 47 15.377103608704619 48 15.364962652800109 49 15.349425402481135
		 50 15.335082055485699 51 15.323176737823108 52 15.310258956224363;
createNode animCurveTL -n "IKLeg_L_translateY";
	rename -uid "23323A79-4838-5548-5E8F-91A133221E5E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 1.1719941762274271 1 3.6312669308832835
		 2 3.117894889096462 3 3.1072913061367906 4 3.1185364759431486 5 3.1788451496981533
		 6 3.2873360435079686 7 3.3997623095911216 8 3.5024172862856293 9 3.6101080967171679
		 10 3.7185487918302247 11 3.8235096192457991 12 3.9585382418291317 13 4.1283308340282332
		 14 4.2847324695596924 15 4.3711338091051619 16 4.4304850495411525 17 4.6201412678210261
		 18 4.9253611280311169 19 5.0917321398577879 20 5.1136154023064915 21 5.1519568960004065
		 22 5.0786902081664778 23 4.8670394788756983 24 4.738792836375854 25 4.6588279978457834
		 26 4.658970791921984 27 4.6601301086970413 28 4.5765195981586881 29 4.4177634602583851
		 30 4.2455648313811238 31 4.0884283461107955 32 3.9461873093705577 33 3.8306263627403272
		 34 3.7204717024681617 35 3.6090831441115547 36 3.5108292670086723 37 3.4175917122042136
		 38 3.3218005922379188 39 3.2186865954220583 40 3.1037670005596976 41 2.9960360279513107
		 42 2.9269612225785533 43 2.8902553365456676 44 2.8651672383825701 45 2.865008192121552
		 46 2.8917605437498057 47 2.9269345445600887 48 2.9665321959810971 49 3.0092756346636751
		 50 3.0472408164133054 51 3.0809186280856888 52 3.1210290682320494;
createNode animCurveTL -n "IKLeg_L_translateZ";
	rename -uid "F42388B0-4930-01EC-1269-8380296DF7D2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -8.1802655007663869 1 11.813724622616276
		 2 10.65825236539661 3 10.712414793950959 4 10.726666111189958 5 10.754019715366624
		 6 10.740710212269097 7 10.694347784419858 8 10.610906748543741 9 10.508964935383577
		 10 10.401865521054557 11 10.241892841159791 12 10.002013418175459 13 9.7297478911158635
		 14 9.4685917242033746 15 9.2783150523203268 16 9.3180409484191831 17 9.5006486760891171
		 18 10.069981424095626 19 10.764478375376701 20 11.470079115502719 21 12.015088914496021
		 22 11.717956023425527 23 10.697114587515218 24 9.9375170355232925 25 9.5913747322479139
		 26 9.4741339730418126 27 9.4610567008681841 28 9.4964352970185395 29 9.5291294513584113
		 30 9.5339138454825196 31 9.5475680113274279 32 9.607965994756654 33 9.6979838897043695
		 34 9.805543292068478 35 9.9343819602456449 36 10.072281794745738 37 10.214690641673277
		 38 10.364052050241588 39 10.534069001688472 40 10.722144582147376 41 10.881775731631596
		 42 10.966794836135062 43 11.009348064296152 44 11.045977057070385 45 11.039366205394177
		 46 10.980151704994389 47 10.901926631766461 48 10.816774144484349 49 10.732245827028741
		 50 10.662242273619825 51 10.603599905437321 52 10.545400567232571;
createNode animCurveTA -n "IKLeg_L_rotateX";
	rename -uid "188D452D-40C6-C7DE-E626-DAAB67E59A82";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 14.552577789962283 1 -0.46771858203010508
		 2 0.45089624778164428 3 0.45182457450492253 4 0.44109078254233569 5 0.50279379897464593
		 6 0.62594807082642601 7 0.65888119353402563 8 0.58374722051861183 9 0.47653219740811364
		 10 0.34762322208791641 11 0.16904725694788367 12 -0.0073229322403416128 13 -0.060666678603332573
		 14 0.12791593768795301 15 0.59740312033792153 16 1.5199602402602463 17 3.0408939739044847
		 18 5.6341963199824381 19 7.8240205079781635 20 9.2711005517732055 21 9.9104060819625506
		 22 7.8074784887087958 23 4.2647356089792838 24 2.0814350651604898 25 0.85998343519951714
		 26 0.37342216293891201 27 0.3388952722102308 28 0.34570460354775101 29 0.33710517031745146
		 30 0.32710591309153619 31 0.32661132488135824 32 0.31767774920268083 33 0.31309283295051743
		 34 0.31273640828673949 35 0.30940219622198706 36 0.3130032061575555 37 0.31959835986155499
		 38 0.32497110801885815 39 0.3317180118171027 40 0.33821456230586328 41 0.34545901792490563
		 42 0.35382605955730739 43 0.36074063078578367 44 0.36875694866156183 45 0.37595617421686972
		 46 0.38331554676724783 47 0.39097012830185079 48 0.39806766989976328 49 0.40553195783964502
		 50 0.41299814057178291 51 0.42036384132321464 52 0.4275660579916421;
createNode animCurveTA -n "IKLeg_L_rotateY";
	rename -uid "FB5FEDEA-45DA-48F6-761B-2C86B0B6BA8F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -6.4044699800614966 1 7.9791973864412968
		 2 6.9707029092863921 3 7.0286253976193365 4 7.0945026779072018 5 7.1145146162081403
		 6 7.1007701767771012 7 7.0980160855701246 8 7.0951302916066741 9 7.084710285617291
		 10 7.0680736590001789 11 7.0326898677953746 12 6.9828288384220567 13 6.9564130794848484
		 14 7.0127370546025452 15 7.0382458039373041 16 6.619504488415906 17 5.460072157795703
		 18 3.7916940516968234 19 2.6159335711087284 20 3.0341072979382915 21 4.045526263580717
		 22 4.6750589977639283 23 5.4677154106487116 24 6.1982978139876197 25 6.819179658773832
		 26 7.1263226660791004 27 7.1398589923375013 28 7.1276678253520016 29 7.1308581088859979
		 30 7.1182368948171426 31 7.1200508627134056 32 7.1094411034424319 33 7.0984954085538678
		 34 7.0914405062714305 35 7.0788472049310025 36 7.0693457960975525 37 7.0606872120424624
		 38 7.051869197821083 39 7.0422530077811274 40 7.030277893358897 41 7.0195890742587688
		 42 7.0076742179803757 43 6.9984532240758455 44 6.9850907605658428 45 6.9683861350079077
		 46 6.9542973622345094 47 6.9404342590409609 48 6.9258551488241018 49 6.9127957101173161
		 50 6.8995399469037082 51 6.8855976475822942 52 6.873045954796912;
createNode animCurveTA -n "IKLeg_L_rotateZ";
	rename -uid "EF328B86-4707-D29A-7759-1E9CFF6A5714";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -6.4921249819687334 1 10.601821341630558
		 2 9.6510712304366795 3 9.7359474286027492 4 9.8282663684423941 5 9.8680649589251601
		 6 9.875130790106283 7 9.878871936213045 8 9.8583578154122531 9 9.8185214187068617
		 10 9.7656688985574114 11 9.6767015009723494 12 9.5738564525035379 13 9.5304570935527977
		 14 9.6515897685404859 15 9.7872685315526589 16 9.3548513570869982 17 7.9149344841817681
		 18 5.6440711024198915 19 4.7463634613069514 20 5.5481810510172469 21 6.7621823216951249
		 22 7.5194955937467105 23 8.1447612309674078 24 8.8467020322417245 25 9.5193405529499451
		 26 9.8607339977835284 27 9.8727810298496088 28 9.8560156515059454 29 9.8577193362310727
		 30 9.8369404990403808 31 9.8401220504728002 32 9.8239966702032877 33 9.8071468905856403
		 34 9.7979406681551762 35 9.77860351894752 36 9.7648938343908114 37 9.7542832913345219
		 38 9.7425195289739062 39 9.7296030425682769 40 9.7142848189257638 41 9.7010564203012688
		 42 9.6854603393653527 43 9.6734057011858887 44 9.6558618216832688 45 9.6332533016720827
		 46 9.614560384030133 47 9.5962072574501196 48 9.5766034798058932 49 9.559357640369603
		 50 9.5417978922066453 51 9.5231304568041395 52 9.506500481835209;
createNode animCurveTA -n "FKKnee_L_rotateX";
	rename -uid "EFF74BD4-4BCC-3615-0FB7-A29245BBDF3D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -3.1712690496059834 1 -0.59194443043794209
		 2 2.4216520329379754 3 5.9775516294351148 4 8.8855999572163622 5 9.3810334555545563
		 6 9.2514156021632967 7 9.1572609829830345 8 9.0910203424712481 9 9.0541078170949341
		 10 9.1414582268444224 11 9.4490971237048207 12 9.7599205939286726 13 9.5464592472075296
		 14 8.4184823098807673 15 6.9044539078731004 16 5.932756626599982 17 4.4488636714094616
		 18 -0.86430114586710249 19 -2.9254783997824916 20 -3.8800556515232461 21 -5.5191440157440521
		 22 -6.8238075510328997 23 -7.3548016343318841 24 -7.501815704643799 25 -7.2785597837411933
		 26 -7.2022115581203145 27 -7.3651016165054326 28 -7.5048096458866898 29 -7.5662632252210145
		 30 -7.5561102488656235 31 -7.4711646577926105 32 -7.402738720636191 33 -7.4209857197475904
		 34 -7.5521003432960434 35 -7.3105526950083561 36 -6.3820579820979804 37 -5.4611119209456849
		 38 -4.6492304490462262 39 -3.765472450752525 40 -3.0164828318879144 41 -2.3976469753035698
		 42 -1.8361962429391019 43 -1.4653665279114745 44 -1.3203897722946116 45 -1.3427901658194243
		 46 -1.473960155462269 47 -1.6590711434903023 48 -1.9309439948306113 49 -2.2386787252006042
		 50 -2.44900497699863 51 -2.6278922384965697 52 -2.8415842664939546;
createNode animCurveTA -n "FKKnee_L_rotateY";
	rename -uid "FA9C6E3B-461E-D97D-61E3-E4A2B257F6E4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.92568050959810244 1 -8.3618262601745101
		 2 -8.2894113022109472 3 -8.6962852835460627 4 -8.9554862223420564 5 -8.886058997251963
		 6 -8.8792313891505206 7 -8.8450944820266901 8 -8.6960594190527694 9 -8.4927799982859433
		 10 -8.0544497667683999 11 -7.3337864563990847 12 -6.9727616037803779 13 -7.6772375833076181
		 14 -9.5525320514431034 15 -11.765990960930711 16 -13.377160287709657 17 -13.524874720457813
		 18 -10.404889917565642 19 -8.2655567655933329 20 -7.347490266749177 21 -6.8523214070883327
		 22 -6.4426778705798178 23 -6.3887697287249763 24 -6.340019419772112 25 -6.1141235763354755
		 26 -6.0290406148920601 27 -6.0370592669940946 28 -6.1242014656477748 29 -6.3373805819091942
		 30 -6.4519376916708788 31 -6.3147948515815591 32 -6.0200644695481937 33 -5.8841534922183367
		 34 -5.9625644851622503 35 -6.1979003579465282 36 -6.6342742236357832 37 -7.0624623422540127
		 38 -7.3671856834158378 39 -7.6171268586199483 40 -7.7751890068390459 41 -7.7411890186123129
		 42 -7.6281095670099361 43 -7.5532748474306057 44 -7.4619593732991518 45 -7.3859683275416375
		 46 -7.382314650407884 47 -7.4119070971984344 48 -7.4182935140961721 49 -7.4304597550151996
		 50 -7.4837142960293601 51 -7.5122028651840136 52 -7.5053942464391463;
createNode animCurveTA -n "FKKnee_L_rotateZ";
	rename -uid "F02E3FC1-425F-45B2-70C8-06A39906DD37";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -12.802053136362845 1 -11.701288868301248
		 2 -11.092257719666414 3 -10.985696613961494 4 -11.543062846532699 5 -12.525285428784887
		 6 -14.054157180928541 7 -15.84964381411325 8 -17.957104889356245 9 -20.526045666205576
		 10 -23.497326782812344 11 -26.991530829582764 12 -31.03890859885421 13 -34.811642501819151
		 14 -37.11051561378914 15 -37.373471463433511 16 -35.694883388216155 17 -33.134860644922
		 18 -30.568133887557909 19 -27.272730676900416 20 -22.472110654284901 21 -17.521135238343007
		 22 -16.44004994713535 23 -20.779638765325828 24 -25.042270394249712 25 -26.682081810278479
		 26 -27.25561514273927 27 -27.205570771512871 28 -26.335796211533285 29 -25.227420372348263
		 30 -24.548337080503234 31 -24.043750502822771 32 -23.123037259905427 33 -21.887042798128402
		 34 -20.438491717382906 35 -18.741498419460566 36 -16.996770360492068 37 -15.244627301635429
		 38 -13.408837776803864 39 -11.37195952569707 40 -9.1930971604964427 41 -7.4241517409492923
		 42 -6.5809274580335932 43 -6.2029174690379003 44 -5.8461043603391296 45 -5.9878250659564927
		 46 -6.7504585952833196 47 -7.7298736509231816 48 -8.7738174156646913 49 -9.78329763492642
		 50 -10.600225865438409 51 -11.285661700945605 52 -11.943298801038148;
createNode animCurveTA -n "FKHip_L_rotateX";
	rename -uid "AFADDF6D-49EC-A961-8F91-1BA3E9D7EF82";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -1.9083328088781151e-14 1 168.30097531288584
		 2 169.05980286867813 3 169.00714779495448 4 168.84106492815781 5 168.51486946106832
		 6 168.17145622966964 7 167.80432966750561 8 167.31829207188295 9 166.75815959486906
		 10 166.09437766015617 11 165.25390492905296 12 164.49552037305534 13 164.42626489537128
		 14 165.66852672583704 15 167.92361255724322 16 170.20483247590238 17 171.79433146678198
		 18 172.20905714095758 19 171.55332727081674 20 171.08297530760228 21 171.3122991184018
		 22 171.64825366986832 23 172.34054423674587 24 173.31040289918951 25 174.03591687854939
		 26 174.74859210704145 27 175.36626678513028 28 175.55245272127655 29 175.30875744934204
		 30 174.84138890146815 31 174.25792455357728 32 173.55223655364259 33 172.92045857750406
		 34 172.53091335917708 35 172.19049106737148 36 171.75510005107165 37 171.34804249204612
		 38 171.01435555710526 39 170.73567948332263 40 170.4521246952163 41 170.05985034421391
		 42 169.64869790321319 43 169.37353818000824 44 169.19396164794304 45 169.04553751364952
		 46 168.94767026576335 47 168.90269826478766 48 168.86385784962076 49 168.853412538729
		 50 168.91911250550825 51 168.97311813369433 52 168.98466665684063;
createNode animCurveTA -n "FKHip_L_rotateY";
	rename -uid "D7657985-4C4E-5A1C-8D46-72B4CB92AA89";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -4.4527765540489216e-14 1 171.11719572637529
		 2 171.58336351298954 3 171.4402558920157 4 171.33959525789905 5 171.28430087744499
		 6 171.32003498262492 7 171.48459432037274 8 171.70463666730743 9 172.02205448993655
		 10 172.47106141972068 11 172.87040973151352 12 173.10531154787117 13 173.38569381802779
		 14 173.84995052811826 15 174.17141349776637 16 174.08923586288418 17 173.66617654900006
		 18 173.23093456916126 19 172.61499344177267 20 172.08552466112201 21 172.47279342504211
		 22 172.928317067406 23 173.15277290495098 24 173.99892870072634 25 175.22674040619899
		 26 176.29824939197803 27 177.15120554209571 28 177.62079981744898 29 177.6299938805646
		 30 177.48168800924481 31 177.38099852685758 32 177.20413222590119 33 176.88990506568192
		 34 176.5305560008556 35 176.02350352096767 36 175.23003701295403 37 174.40831873935107
		 38 173.80290316478593 39 173.36977890783729 40 172.99422123473383 41 172.5964470972535
		 42 172.1836923920855 43 171.89801236964266 44 171.77638203324679 45 171.68786296562138
		 46 171.58695422761372 47 171.51455157047687 48 171.46453937710629 49 171.44977266440688
		 50 171.52411461127087 51 171.60229228757996 52 171.63081726897386;
createNode animCurveTA -n "FKHip_L_rotateZ";
	rename -uid "CFE324B3-44B3-2C13-1F8F-D6AF8AE244A1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -1.2404163257707715e-13 1 -165.41926643248848
		 2 -166.89951799870292 3 -167.26567526010592 4 -167.45853026024574 5 -167.52323716580068
		 6 -167.29472217179318 7 -166.89602106522679 8 -166.44214899787451 9 -166.01204998508911
		 10 -165.70856600209649 11 -165.40888930782751 12 -164.69719825419529 13 -163.40458046426494
		 14 -161.74198795270897 15 -160.4901959738024 16 -160.01618418864064 17 -159.49621080539288
		 18 -158.46725232982971 19 -158.23857594525538 20 -158.64899404950899 21 -158.26830781306032
		 22 -156.14975410058244 23 -152.81321005327842 24 -150.45537996503418 25 -149.14923791989139
		 26 -148.27266895201032 27 -148.3055070278447 28 -149.51384325981905 29 -151.60216845157234
		 30 -153.75864351821602 31 -155.68179708563636 32 -157.42374122813055 33 -158.84799623336821
		 34 -160.1714023928329 35 -161.43501890172311 36 -162.4928877294048 37 -163.47979320635142
		 38 -164.48167443311388 39 -165.6095042995556 40 -166.92122998849396 41 -168.13936156262139
		 42 -168.89720509474895 43 -169.28679375221139 44 -169.5509430824479 45 -169.53450585649654
		 46 -169.21226222454729 47 -168.78745573578198 48 -168.30156144688885 49 -167.77840548951636
		 50 -167.3235305948125 51 -166.92714657178857 52 -166.4591206449125;
createNode animCurveTL -n "RootX_M_translateX";
	rename -uid "81E1A35D-41E1-5AE3-8A3E-F887D7D80ABB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0 1 -0.12340018834764491 2 -0.16694298661799592
		 3 -0.12971792856374367 4 0.031197953891104371 5 0.29431474048004069 6 0.65091362162969035
		 7 1.1388554658627097 8 1.8087772623254486 9 2.650791391512342 10 3.6227132675462399
		 11 4.7592555750712613 12 5.9931453483707005 13 7.1443578032240698 14 8.0501032795934737
		 15 8.5924870799412378 16 8.8905738906903231 17 9.1186964159291861 18 9.2377541705114119
		 19 9.112350490361429 20 8.6215636647996465 21 7.8755939811300255 22 7.4263183550095455
		 23 7.4695185600601315 24 7.6097560971560672 25 7.6987776108554522 26 7.8078132289768325
		 27 7.9994794929138715 28 8.2102028227679753 29 8.2735193848285196 30 8.1388443588854642
		 31 7.7912792860593933 32 7.1895635891097864 33 6.361721027992516 34 5.3689662013618076
		 35 4.2900052237338997 36 3.2237700932461348 37 2.2480408807625332 38 1.400319796207282
		 39 0.72647504927520035 40 0.25581471038274056 41 -0.054091128633259079 42 -0.24816362812219916
		 43 -0.35809145616325821 44 -0.41294704473892219 45 -0.42381178634686817 46 -0.4095621069711069
		 47 -0.38485031084398474 48 -0.34398591828613995 49 -0.28823629632423381 50 -0.21849800921600052
		 51 -0.14996808911601686 52 -0.095538629275722389;
createNode animCurveTL -n "RootX_M_translateY";
	rename -uid "C9CD6727-4208-23C3-5871-35AF84A32630";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0 1 -0.36396547950923264 2 -0.31847161311657146
		 3 -0.31456963234734303 4 -0.33648172767553319 5 -0.36774859782131841 6 -0.40891547703559183
		 7 -0.46000099133311778 8 -0.52963237210568082 9 -0.66649429678797389 10 -0.92779696487731655
		 11 -1.3471947065171435 12 -1.9078472902041312 13 -2.418816842064146 14 -2.5803421502276791
		 15 -2.3004061298363041 16 -1.590396782769659 17 -0.64815602571405861 18 0.22296970382797099
		 19 1.1368469349023798 20 2.0822397216411588 21 2.6771756867889849 22 2.4937301555817299
		 23 1.5416993958298093 24 0.55766812671959087 25 -0.015691970888084938 26 -0.30548487830158422
		 27 -0.38618857822444852 28 -0.25613655031597204 29 -0.054731025462260163 30 0.040155255866977768
		 31 0.040102707928312498 32 0.045499228835069516 33 0.053684289924433415 34 0.035715717022682725
		 35 0.012209629926530852 36 0.0037914049975853459 37 -0.0071362521045870153 38 -0.039056105174623212
		 39 -0.056458955209251371 40 -0.038646107079571834 41 -0.02520015633652406 42 -0.035258655858058319
		 43 -0.048671700641648385 44 -0.058831740164947632 45 -0.073358281977633055 46 -0.097898507991430961
		 47 -0.13390682774837614 48 -0.17637656847536221 49 -0.22027537607579006 50 -0.26093099940555931
		 51 -0.29600480120272721 52 -0.32839735995092667;
createNode animCurveTL -n "RootX_M_translateZ";
	rename -uid "73A8D51A-4B64-2C17-7422-AF80A45CAFE4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 0 1 -0.36211221341346117 2 -0.5906899757070464
		 3 -0.85748867939040485 4 -1.1185460260205278 5 -1.2909532843511791 6 -1.2839684115137777
		 7 -1.0581730591012837 8 -0.61653389399612901 9 0.0014537681508979272 10 0.7210041713488986
		 11 1.561978021735825 12 2.6378543196567334 13 3.9186499348283128 14 5.1925127709156707
		 15 6.2435909095584385 16 7.0289230807880703 17 7.4814472567414274 18 7.2401010265090031
		 19 6.3915032572407116 20 5.7078898022975713 21 5.5823238288831902 22 5.8259697616568786
		 23 5.9463594279850858 24 5.7548847050943657 25 5.5792823911627778 26 5.4892668409200089
		 27 5.3219555693963558 28 5.1410696935768128 29 5.0083341296440693 30 4.8876456886336879
		 31 4.7664259723005653 32 4.6296476424425572 33 4.4221028878703468 34 4.0689846733412551
		 35 3.5910886356885774 36 3.095831899942675 37 2.5926474543087967 38 2.0637046060179038
		 39 1.5827967558857448 40 1.2037934165375224 41 0.88126038999830292 42 0.58752248030738397
		 43 0.35508323327301272 44 0.18704329476561843 45 0.065110256745023243 46 -0.015433815056270728
		 47 -0.068310006810954449 48 -0.10863114369104931 49 -0.13656113065801745 50 -0.14865112251752344
		 51 -0.14379010747293924 52 -0.14071343818697263;
createNode animCurveTA -n "RootX_M_rotateX";
	rename -uid "A267F33B-4A9A-26C6-2A1E-1EAABC94D7D0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -0.73024705826986569 1 -0.13796906061364106
		 2 0.49012622718339205 3 1.1962881954246534 4 1.9382372792916058 5 2.6876141754666651
		 6 3.4659345829336452 7 4.1999899529005091 8 4.7569338424922281 9 5.1362100664863419
		 10 5.3279086376862201 11 5.1823307321484924 12 4.7664121073663015 13 4.2483495301885039
		 14 3.6693825581950672 15 2.9636584508026278 16 2.285165360088568 17 1.8564259115457866
		 18 1.4830672844255262 19 0.89349429773580069 20 0.79023876885410949 21 2.0515892827487789
		 22 3.9521317499714161 23 5.1389540488428658 24 5.6350554283235343 25 6.335059142288662
		 26 7.0195378877574353 27 7.1254029956433644 28 6.6371991499303471 29 5.5790099932482127
		 30 4.3232782960439113 31 3.2351367072772503 32 2.4728707331203013 33 2.0238457232879354
		 34 1.6499061086420495 35 1.3383950914537277 36 1.1254427825871458 37 0.91947682945838949
		 38 0.74792671182127435 39 0.61460785978193255 40 0.41184144052756805 41 0.15140956617524265
		 42 -0.082435948800215361 43 -0.23766564189772676 44 -0.32660984910958357 45 -0.40693569418228537
		 46 -0.51582194656337743 47 -0.64346991612865745 48 -0.76211861839524142 49 -0.84444057215530277
		 50 -0.88019669912748977 51 -0.88477193271058552 52 -0.81772891353299093;
createNode animCurveTA -n "RootX_M_rotateY";
	rename -uid "1FF1FB39-4D24-77B8-C007-10B7DCCCDE98";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -7.7672306756285918 1 -9.8766743820468825
		 2 -12.682970531187781 3 -16.150260268853579 4 -20.159978920915957 5 -24.506138719072194
		 6 -28.73148314518771 7 -32.460528354009483 8 -35.783089771407482 9 -39.309111218059321
		 10 -43.274083223664285 11 -46.903512189679581 12 -49.094359879321814 13 -48.699958043455716
		 14 -44.53114731474804 15 -37.082970451367714 16 -28.032326542201918 17 -18.041739246690209
		 18 -8.8044062816927848 19 -1.9398320633929587 20 4.0990121939353337 21 10.599536736903319
		 22 16.008598093417206 23 18.203514960792734 24 18.301714447239192 25 18.667181215902342
		 26 19.272029121920042 27 19.260039166612405 28 18.149444351105831 29 15.74888095555878
		 30 12.694032177595993 31 9.6009503503908924 32 6.8059613727590849 33 4.4450133651535628
		 34 2.3289560366577051 35 0.44372480529420472 36 -1.1060803372287005 37 -2.3478607474158522
		 38 -3.4289606108676947 39 -4.4393305377891155 40 -5.2853676777524798 41 -6.1570057810764807
		 42 -7.1073112933151856 43 -7.7647748021171097 44 -8.085551680860549 45 -8.2818993213424399
		 46 -8.4008297841308632 47 -8.4370715671888679 48 -8.3881994061203198 49 -8.2627520059679753
		 50 -8.1205071990146642 51 -7.9965174250147237 52 -7.8664814988516936;
createNode animCurveTA -n "RootX_M_rotateZ";
	rename -uid "100659A8-40B7-B476-7A70-939CB459F49A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 53 ".ktv[0:52]"  0 -2.4289619894683998 1 -2.2491478217103609
		 2 -2.0881055959245467 3 -1.9578748610052688 4 -1.7935838730285976 5 -1.6560882213223707
		 6 -1.6395839984890406 7 -1.6751483333500228 8 -1.7490677563770987 9 -1.7949699016859226
		 10 -1.6366541841420124 11 -1.3254443751283449 12 -1.2772960307798915 13 -1.8028261877579037
		 14 -2.9598912442700467 15 -4.3885076683462527 16 -5.6492568643620569 17 -6.6727742654104549
		 18 -7.1205090103680115 19 -7.5184883569111092 20 -8.5008758478864141 21 -9.1645176892456952
		 22 -9.6303043086659859 23 -10.049042124397843 24 -9.5337765255564051 25 -8.5302832193716238
		 26 -7.7216723703319952 27 -7.0345994999945507 28 -6.523205925912448 29 -6.1574920710143584
		 30 -5.6635030886795876 31 -4.8947897238120639 32 -4.0462997319024963 33 -3.3797596269718837
		 34 -2.8102242445587984 35 -2.3769456044851358 36 -2.2953264054236624 37 -2.3513230743243918
		 38 -2.2768762689692768 39 -2.1374697473780904 40 -2.0457049079590308 41 -1.9852919304369485
		 42 -1.9854809494959444 43 -2.0112350711134273 44 -1.9781737913364221 45 -1.973897673468638
		 46 -2.0415428001502063 47 -2.1135685022786483 48 -2.1850850356533869 49 -2.2643315368998294
		 50 -2.2976114801197318 51 -2.3169825499775909 52 -2.386947532613545;
createNode mayaUsdLayerManager -n "mayaUsdLayerManager1";
	rename -uid "C473AFEC-4AF1-CB89-CAE3-B889DC82CC6E";
	setAttr ".sst" -type "string" "";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
	setAttr ".rtfm" 1;
select -ne :renderPartition;
	setAttr -s 8 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 11 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 24 ".u";
select -ne :defaultRenderingList1;
	setAttr -s 2 ".r";
select -ne :defaultTextureList1;
	setAttr -s 24 ".tx";
select -ne :standardSurface1;
	setAttr ".bc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
	setAttr ".sr" 0.5;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "standardSurface1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 3 ".sol";
connectAttr "FKNeck_M_rotateX.o" "zombie_rig_ver2RN.phl[1]";
connectAttr "FKNeck_M_rotateY.o" "zombie_rig_ver2RN.phl[2]";
connectAttr "FKNeck_M_rotateZ.o" "zombie_rig_ver2RN.phl[3]";
connectAttr "zombie_rig_ver2RN.phl[4]" "FKNeck_M_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[5]" "FKNeck_M_orientConstraint1.cpim";
connectAttr "FKHead_M_rotateX.o" "zombie_rig_ver2RN.phl[6]";
connectAttr "FKHead_M_rotateY.o" "zombie_rig_ver2RN.phl[7]";
connectAttr "FKHead_M_rotateZ.o" "zombie_rig_ver2RN.phl[8]";
connectAttr "zombie_rig_ver2RN.phl[9]" "FKHead_M_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[10]" "FKHead_M_orientConstraint1.cpim";
connectAttr "FKScapula_R_rotateX.o" "zombie_rig_ver2RN.phl[11]";
connectAttr "FKScapula_R_rotateY.o" "zombie_rig_ver2RN.phl[12]";
connectAttr "FKScapula_R_rotateZ.o" "zombie_rig_ver2RN.phl[13]";
connectAttr "zombie_rig_ver2RN.phl[14]" "FKScapula_R_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[15]" "FKScapula_R_orientConstraint1.cpim";
connectAttr "FKShoulder_R_rotateX.o" "zombie_rig_ver2RN.phl[16]";
connectAttr "FKShoulder_R_rotateY.o" "zombie_rig_ver2RN.phl[17]";
connectAttr "FKShoulder_R_rotateZ.o" "zombie_rig_ver2RN.phl[18]";
connectAttr "zombie_rig_ver2RN.phl[19]" "FKShoulder_R_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[20]" "FKShoulder_R_orientConstraint1.cpim";
connectAttr "FKElbow_R_rotateX.o" "zombie_rig_ver2RN.phl[21]";
connectAttr "FKElbow_R_rotateY.o" "zombie_rig_ver2RN.phl[22]";
connectAttr "FKElbow_R_rotateZ.o" "zombie_rig_ver2RN.phl[23]";
connectAttr "zombie_rig_ver2RN.phl[24]" "FKElbow_R_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[25]" "FKElbow_R_orientConstraint1.cpim";
connectAttr "FKWrist_R_rotateX.o" "zombie_rig_ver2RN.phl[26]";
connectAttr "FKWrist_R_rotateY.o" "zombie_rig_ver2RN.phl[27]";
connectAttr "FKWrist_R_rotateZ.o" "zombie_rig_ver2RN.phl[28]";
connectAttr "zombie_rig_ver2RN.phl[29]" "FKWrist_R_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[30]" "FKWrist_R_orientConstraint1.cpim";
connectAttr "FKScapula_L_rotateX.o" "zombie_rig_ver2RN.phl[31]";
connectAttr "FKScapula_L_rotateY.o" "zombie_rig_ver2RN.phl[32]";
connectAttr "FKScapula_L_rotateZ.o" "zombie_rig_ver2RN.phl[33]";
connectAttr "zombie_rig_ver2RN.phl[34]" "FKScapula_L_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[35]" "FKScapula_L_orientConstraint1.cpim";
connectAttr "FKShoulder_L_rotateX.o" "zombie_rig_ver2RN.phl[36]";
connectAttr "FKShoulder_L_rotateY.o" "zombie_rig_ver2RN.phl[37]";
connectAttr "FKShoulder_L_rotateZ.o" "zombie_rig_ver2RN.phl[38]";
connectAttr "zombie_rig_ver2RN.phl[39]" "FKShoulder_L_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[40]" "FKShoulder_L_orientConstraint1.cpim";
connectAttr "FKElbow_L_rotateX.o" "zombie_rig_ver2RN.phl[41]";
connectAttr "FKElbow_L_rotateY.o" "zombie_rig_ver2RN.phl[42]";
connectAttr "FKElbow_L_rotateZ.o" "zombie_rig_ver2RN.phl[43]";
connectAttr "zombie_rig_ver2RN.phl[44]" "FKElbow_L_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[45]" "FKElbow_L_orientConstraint1.cpim";
connectAttr "FKWrist_L_rotateX.o" "zombie_rig_ver2RN.phl[46]";
connectAttr "FKWrist_L_rotateY.o" "zombie_rig_ver2RN.phl[47]";
connectAttr "FKWrist_L_rotateZ.o" "zombie_rig_ver2RN.phl[48]";
connectAttr "zombie_rig_ver2RN.phl[49]" "FKWrist_L_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[50]" "FKWrist_L_orientConstraint1.cpim";
connectAttr "FKMiddleFinger1_R_rotateX.o" "zombie_rig_ver2RN.phl[51]";
connectAttr "FKMiddleFinger1_R_rotateY.o" "zombie_rig_ver2RN.phl[52]";
connectAttr "FKMiddleFinger1_R_rotateZ.o" "zombie_rig_ver2RN.phl[53]";
connectAttr "zombie_rig_ver2RN.phl[54]" "FKMiddleFinger1_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[55]" "FKMiddleFinger1_R_orientConstraint1.cpim"
		;
connectAttr "FKMiddleFinger2_R_rotateX.o" "zombie_rig_ver2RN.phl[56]";
connectAttr "FKMiddleFinger2_R_rotateY.o" "zombie_rig_ver2RN.phl[57]";
connectAttr "FKMiddleFinger2_R_rotateZ.o" "zombie_rig_ver2RN.phl[58]";
connectAttr "zombie_rig_ver2RN.phl[59]" "FKMiddleFinger2_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[60]" "FKMiddleFinger2_R_orientConstraint1.cpim"
		;
connectAttr "FKMiddleFinger3_R_rotateX.o" "zombie_rig_ver2RN.phl[61]";
connectAttr "FKMiddleFinger3_R_rotateY.o" "zombie_rig_ver2RN.phl[62]";
connectAttr "FKMiddleFinger3_R_rotateZ.o" "zombie_rig_ver2RN.phl[63]";
connectAttr "zombie_rig_ver2RN.phl[64]" "FKMiddleFinger3_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[65]" "FKMiddleFinger3_R_orientConstraint1.cpim"
		;
connectAttr "FKThumbFinger1_R_rotateX.o" "zombie_rig_ver2RN.phl[66]";
connectAttr "FKThumbFinger1_R_rotateY.o" "zombie_rig_ver2RN.phl[67]";
connectAttr "FKThumbFinger1_R_rotateZ.o" "zombie_rig_ver2RN.phl[68]";
connectAttr "zombie_rig_ver2RN.phl[69]" "FKThumbFinger1_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[70]" "FKThumbFinger1_R_orientConstraint1.cpim"
		;
connectAttr "FKThumbFinger2_R_rotateX.o" "zombie_rig_ver2RN.phl[71]";
connectAttr "FKThumbFinger2_R_rotateY.o" "zombie_rig_ver2RN.phl[72]";
connectAttr "FKThumbFinger2_R_rotateZ.o" "zombie_rig_ver2RN.phl[73]";
connectAttr "zombie_rig_ver2RN.phl[74]" "FKThumbFinger2_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[75]" "FKThumbFinger2_R_orientConstraint1.cpim"
		;
connectAttr "FKThumbFinger3_R_rotateX.o" "zombie_rig_ver2RN.phl[76]";
connectAttr "FKThumbFinger3_R_rotateY.o" "zombie_rig_ver2RN.phl[77]";
connectAttr "FKThumbFinger3_R_rotateZ.o" "zombie_rig_ver2RN.phl[78]";
connectAttr "zombie_rig_ver2RN.phl[79]" "FKThumbFinger3_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[80]" "FKThumbFinger3_R_orientConstraint1.cpim"
		;
connectAttr "FKIndexFinger1_R_rotateX.o" "zombie_rig_ver2RN.phl[81]";
connectAttr "FKIndexFinger1_R_rotateY.o" "zombie_rig_ver2RN.phl[82]";
connectAttr "FKIndexFinger1_R_rotateZ.o" "zombie_rig_ver2RN.phl[83]";
connectAttr "zombie_rig_ver2RN.phl[84]" "FKIndexFinger1_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[85]" "FKIndexFinger1_R_orientConstraint1.cpim"
		;
connectAttr "FKIndexFinger2_R_rotateX.o" "zombie_rig_ver2RN.phl[86]";
connectAttr "FKIndexFinger2_R_rotateY.o" "zombie_rig_ver2RN.phl[87]";
connectAttr "FKIndexFinger2_R_rotateZ.o" "zombie_rig_ver2RN.phl[88]";
connectAttr "zombie_rig_ver2RN.phl[89]" "FKIndexFinger2_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[90]" "FKIndexFinger2_R_orientConstraint1.cpim"
		;
connectAttr "FKIndexFinger3_R_rotateX.o" "zombie_rig_ver2RN.phl[91]";
connectAttr "FKIndexFinger3_R_rotateY.o" "zombie_rig_ver2RN.phl[92]";
connectAttr "FKIndexFinger3_R_rotateZ.o" "zombie_rig_ver2RN.phl[93]";
connectAttr "zombie_rig_ver2RN.phl[94]" "FKIndexFinger3_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[95]" "FKIndexFinger3_R_orientConstraint1.cpim"
		;
connectAttr "FKPinkyFinger1_R_rotateX.o" "zombie_rig_ver2RN.phl[96]";
connectAttr "FKPinkyFinger1_R_rotateY.o" "zombie_rig_ver2RN.phl[97]";
connectAttr "FKPinkyFinger1_R_rotateZ.o" "zombie_rig_ver2RN.phl[98]";
connectAttr "zombie_rig_ver2RN.phl[99]" "FKPinkyFinger1_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[100]" "FKPinkyFinger1_R_orientConstraint1.cpim"
		;
connectAttr "FKPinkyFinger2_R_rotateX.o" "zombie_rig_ver2RN.phl[101]";
connectAttr "FKPinkyFinger2_R_rotateY.o" "zombie_rig_ver2RN.phl[102]";
connectAttr "FKPinkyFinger2_R_rotateZ.o" "zombie_rig_ver2RN.phl[103]";
connectAttr "zombie_rig_ver2RN.phl[104]" "FKPinkyFinger2_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[105]" "FKPinkyFinger2_R_orientConstraint1.cpim"
		;
connectAttr "FKPinkyFinger3_R_rotateX.o" "zombie_rig_ver2RN.phl[106]";
connectAttr "FKPinkyFinger3_R_rotateY.o" "zombie_rig_ver2RN.phl[107]";
connectAttr "FKPinkyFinger3_R_rotateZ.o" "zombie_rig_ver2RN.phl[108]";
connectAttr "zombie_rig_ver2RN.phl[109]" "FKPinkyFinger3_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[110]" "FKPinkyFinger3_R_orientConstraint1.cpim"
		;
connectAttr "FKRingFinger1_R_rotateX.o" "zombie_rig_ver2RN.phl[111]";
connectAttr "FKRingFinger1_R_rotateY.o" "zombie_rig_ver2RN.phl[112]";
connectAttr "FKRingFinger1_R_rotateZ.o" "zombie_rig_ver2RN.phl[113]";
connectAttr "zombie_rig_ver2RN.phl[114]" "FKRingFinger1_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[115]" "FKRingFinger1_R_orientConstraint1.cpim"
		;
connectAttr "FKRingFinger2_R_rotateX.o" "zombie_rig_ver2RN.phl[116]";
connectAttr "FKRingFinger2_R_rotateY.o" "zombie_rig_ver2RN.phl[117]";
connectAttr "FKRingFinger2_R_rotateZ.o" "zombie_rig_ver2RN.phl[118]";
connectAttr "zombie_rig_ver2RN.phl[119]" "FKRingFinger2_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[120]" "FKRingFinger2_R_orientConstraint1.cpim"
		;
connectAttr "FKRingFinger3_R_rotateX.o" "zombie_rig_ver2RN.phl[121]";
connectAttr "FKRingFinger3_R_rotateY.o" "zombie_rig_ver2RN.phl[122]";
connectAttr "FKRingFinger3_R_rotateZ.o" "zombie_rig_ver2RN.phl[123]";
connectAttr "zombie_rig_ver2RN.phl[124]" "FKRingFinger3_R_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[125]" "FKRingFinger3_R_orientConstraint1.cpim"
		;
connectAttr "FKHip_R_rotateX.o" "zombie_rig_ver2RN.phl[126]";
connectAttr "FKHip_R_rotateY.o" "zombie_rig_ver2RN.phl[127]";
connectAttr "FKHip_R_rotateZ.o" "zombie_rig_ver2RN.phl[128]";
connectAttr "zombie_rig_ver2RN.phl[129]" "FKHip_R_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[130]" "FKHip_R_orientConstraint1.cpim";
connectAttr "FKKnee_R_rotateX.o" "zombie_rig_ver2RN.phl[131]";
connectAttr "FKKnee_R_rotateY.o" "zombie_rig_ver2RN.phl[132]";
connectAttr "FKKnee_R_rotateZ.o" "zombie_rig_ver2RN.phl[133]";
connectAttr "zombie_rig_ver2RN.phl[134]" "FKKnee_R_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[135]" "FKKnee_R_orientConstraint1.cpim";
connectAttr "FKAnkle_R_rotateX.o" "zombie_rig_ver2RN.phl[136]";
connectAttr "FKAnkle_R_rotateY.o" "zombie_rig_ver2RN.phl[137]";
connectAttr "FKAnkle_R_rotateZ.o" "zombie_rig_ver2RN.phl[138]";
connectAttr "zombie_rig_ver2RN.phl[139]" "FKAnkle_R_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[140]" "FKAnkle_R_orientConstraint1.cpim";
connectAttr "FKToes_R_rotateX.o" "zombie_rig_ver2RN.phl[141]";
connectAttr "FKToes_R_rotateY.o" "zombie_rig_ver2RN.phl[142]";
connectAttr "FKToes_R_rotateZ.o" "zombie_rig_ver2RN.phl[143]";
connectAttr "zombie_rig_ver2RN.phl[144]" "FKToes_R_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[145]" "FKToes_R_orientConstraint1.cpim";
connectAttr "FKHip_L_rotateX.o" "zombie_rig_ver2RN.phl[146]";
connectAttr "FKHip_L_rotateY.o" "zombie_rig_ver2RN.phl[147]";
connectAttr "FKHip_L_rotateZ.o" "zombie_rig_ver2RN.phl[148]";
connectAttr "zombie_rig_ver2RN.phl[149]" "FKHip_L_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[150]" "FKHip_L_orientConstraint1.cpim";
connectAttr "FKKnee_L_rotateX.o" "zombie_rig_ver2RN.phl[151]";
connectAttr "FKKnee_L_rotateY.o" "zombie_rig_ver2RN.phl[152]";
connectAttr "FKKnee_L_rotateZ.o" "zombie_rig_ver2RN.phl[153]";
connectAttr "zombie_rig_ver2RN.phl[154]" "FKKnee_L_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[155]" "FKKnee_L_orientConstraint1.cpim";
connectAttr "FKAnkle_L_rotateX.o" "zombie_rig_ver2RN.phl[156]";
connectAttr "FKAnkle_L_rotateY.o" "zombie_rig_ver2RN.phl[157]";
connectAttr "FKAnkle_L_rotateZ.o" "zombie_rig_ver2RN.phl[158]";
connectAttr "zombie_rig_ver2RN.phl[159]" "FKAnkle_L_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[160]" "FKAnkle_L_orientConstraint1.cpim";
connectAttr "FKToes_L_rotateX.o" "zombie_rig_ver2RN.phl[161]";
connectAttr "FKToes_L_rotateY.o" "zombie_rig_ver2RN.phl[162]";
connectAttr "FKToes_L_rotateZ.o" "zombie_rig_ver2RN.phl[163]";
connectAttr "zombie_rig_ver2RN.phl[164]" "FKToes_L_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[165]" "FKToes_L_orientConstraint1.cpim";
connectAttr "FKSpine1_M_rotateX.o" "zombie_rig_ver2RN.phl[166]";
connectAttr "FKSpine1_M_rotateY.o" "zombie_rig_ver2RN.phl[167]";
connectAttr "FKSpine1_M_rotateZ.o" "zombie_rig_ver2RN.phl[168]";
connectAttr "zombie_rig_ver2RN.phl[169]" "FKSpine1_M_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[170]" "FKSpine1_M_orientConstraint1.cpim";
connectAttr "FKChest_M_rotateX.o" "zombie_rig_ver2RN.phl[171]";
connectAttr "FKChest_M_rotateY.o" "zombie_rig_ver2RN.phl[172]";
connectAttr "FKChest_M_rotateZ.o" "zombie_rig_ver2RN.phl[173]";
connectAttr "zombie_rig_ver2RN.phl[174]" "FKChest_M_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[175]" "FKChest_M_orientConstraint1.cpim";
connectAttr "FKMiddleFinger1_L_rotateX.o" "zombie_rig_ver2RN.phl[176]";
connectAttr "FKMiddleFinger1_L_rotateY.o" "zombie_rig_ver2RN.phl[177]";
connectAttr "FKMiddleFinger1_L_rotateZ.o" "zombie_rig_ver2RN.phl[178]";
connectAttr "zombie_rig_ver2RN.phl[179]" "FKMiddleFinger1_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[180]" "FKMiddleFinger1_L_orientConstraint1.cpim"
		;
connectAttr "FKMiddleFinger2_L_rotateX.o" "zombie_rig_ver2RN.phl[181]";
connectAttr "FKMiddleFinger2_L_rotateY.o" "zombie_rig_ver2RN.phl[182]";
connectAttr "FKMiddleFinger2_L_rotateZ.o" "zombie_rig_ver2RN.phl[183]";
connectAttr "zombie_rig_ver2RN.phl[184]" "FKMiddleFinger2_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[185]" "FKMiddleFinger2_L_orientConstraint1.cpim"
		;
connectAttr "FKMiddleFinger3_L_rotateX.o" "zombie_rig_ver2RN.phl[186]";
connectAttr "FKMiddleFinger3_L_rotateY.o" "zombie_rig_ver2RN.phl[187]";
connectAttr "FKMiddleFinger3_L_rotateZ.o" "zombie_rig_ver2RN.phl[188]";
connectAttr "zombie_rig_ver2RN.phl[189]" "FKMiddleFinger3_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[190]" "FKMiddleFinger3_L_orientConstraint1.cpim"
		;
connectAttr "FKThumbFinger1_L_rotateX.o" "zombie_rig_ver2RN.phl[191]";
connectAttr "FKThumbFinger1_L_rotateY.o" "zombie_rig_ver2RN.phl[192]";
connectAttr "FKThumbFinger1_L_rotateZ.o" "zombie_rig_ver2RN.phl[193]";
connectAttr "zombie_rig_ver2RN.phl[194]" "FKThumbFinger1_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[195]" "FKThumbFinger1_L_orientConstraint1.cpim"
		;
connectAttr "FKThumbFinger2_L_rotateX.o" "zombie_rig_ver2RN.phl[196]";
connectAttr "FKThumbFinger2_L_rotateY.o" "zombie_rig_ver2RN.phl[197]";
connectAttr "FKThumbFinger2_L_rotateZ.o" "zombie_rig_ver2RN.phl[198]";
connectAttr "zombie_rig_ver2RN.phl[199]" "FKThumbFinger2_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[200]" "FKThumbFinger2_L_orientConstraint1.cpim"
		;
connectAttr "FKThumbFinger3_L_rotateX.o" "zombie_rig_ver2RN.phl[201]";
connectAttr "FKThumbFinger3_L_rotateY.o" "zombie_rig_ver2RN.phl[202]";
connectAttr "FKThumbFinger3_L_rotateZ.o" "zombie_rig_ver2RN.phl[203]";
connectAttr "zombie_rig_ver2RN.phl[204]" "FKThumbFinger3_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[205]" "FKThumbFinger3_L_orientConstraint1.cpim"
		;
connectAttr "FKIndexFinger1_L_rotateX.o" "zombie_rig_ver2RN.phl[206]";
connectAttr "FKIndexFinger1_L_rotateY.o" "zombie_rig_ver2RN.phl[207]";
connectAttr "FKIndexFinger1_L_rotateZ.o" "zombie_rig_ver2RN.phl[208]";
connectAttr "zombie_rig_ver2RN.phl[209]" "FKIndexFinger1_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[210]" "FKIndexFinger1_L_orientConstraint1.cpim"
		;
connectAttr "FKIndexFinger2_L_rotateX.o" "zombie_rig_ver2RN.phl[211]";
connectAttr "FKIndexFinger2_L_rotateY.o" "zombie_rig_ver2RN.phl[212]";
connectAttr "FKIndexFinger2_L_rotateZ.o" "zombie_rig_ver2RN.phl[213]";
connectAttr "zombie_rig_ver2RN.phl[214]" "FKIndexFinger2_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[215]" "FKIndexFinger2_L_orientConstraint1.cpim"
		;
connectAttr "FKIndexFinger3_L_rotateX.o" "zombie_rig_ver2RN.phl[216]";
connectAttr "FKIndexFinger3_L_rotateY.o" "zombie_rig_ver2RN.phl[217]";
connectAttr "FKIndexFinger3_L_rotateZ.o" "zombie_rig_ver2RN.phl[218]";
connectAttr "zombie_rig_ver2RN.phl[219]" "FKIndexFinger3_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[220]" "FKIndexFinger3_L_orientConstraint1.cpim"
		;
connectAttr "FKPinkyFinger1_L_rotateX.o" "zombie_rig_ver2RN.phl[221]";
connectAttr "FKPinkyFinger1_L_rotateY.o" "zombie_rig_ver2RN.phl[222]";
connectAttr "FKPinkyFinger1_L_rotateZ.o" "zombie_rig_ver2RN.phl[223]";
connectAttr "zombie_rig_ver2RN.phl[224]" "FKPinkyFinger1_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[225]" "FKPinkyFinger1_L_orientConstraint1.cpim"
		;
connectAttr "FKPinkyFinger2_L_rotateX.o" "zombie_rig_ver2RN.phl[226]";
connectAttr "FKPinkyFinger2_L_rotateY.o" "zombie_rig_ver2RN.phl[227]";
connectAttr "FKPinkyFinger2_L_rotateZ.o" "zombie_rig_ver2RN.phl[228]";
connectAttr "zombie_rig_ver2RN.phl[229]" "FKPinkyFinger2_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[230]" "FKPinkyFinger2_L_orientConstraint1.cpim"
		;
connectAttr "FKPinkyFinger3_L_rotateX.o" "zombie_rig_ver2RN.phl[231]";
connectAttr "FKPinkyFinger3_L_rotateY.o" "zombie_rig_ver2RN.phl[232]";
connectAttr "FKPinkyFinger3_L_rotateZ.o" "zombie_rig_ver2RN.phl[233]";
connectAttr "zombie_rig_ver2RN.phl[234]" "FKPinkyFinger3_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[235]" "FKPinkyFinger3_L_orientConstraint1.cpim"
		;
connectAttr "FKRingFinger1_L_rotateX.o" "zombie_rig_ver2RN.phl[236]";
connectAttr "FKRingFinger1_L_rotateY.o" "zombie_rig_ver2RN.phl[237]";
connectAttr "FKRingFinger1_L_rotateZ.o" "zombie_rig_ver2RN.phl[238]";
connectAttr "zombie_rig_ver2RN.phl[239]" "FKRingFinger1_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[240]" "FKRingFinger1_L_orientConstraint1.cpim"
		;
connectAttr "FKRingFinger2_L_rotateX.o" "zombie_rig_ver2RN.phl[241]";
connectAttr "FKRingFinger2_L_rotateY.o" "zombie_rig_ver2RN.phl[242]";
connectAttr "FKRingFinger2_L_rotateZ.o" "zombie_rig_ver2RN.phl[243]";
connectAttr "zombie_rig_ver2RN.phl[244]" "FKRingFinger2_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[245]" "FKRingFinger2_L_orientConstraint1.cpim"
		;
connectAttr "FKRingFinger3_L_rotateX.o" "zombie_rig_ver2RN.phl[246]";
connectAttr "FKRingFinger3_L_rotateY.o" "zombie_rig_ver2RN.phl[247]";
connectAttr "FKRingFinger3_L_rotateZ.o" "zombie_rig_ver2RN.phl[248]";
connectAttr "zombie_rig_ver2RN.phl[249]" "FKRingFinger3_L_orientConstraint1.cro"
		;
connectAttr "zombie_rig_ver2RN.phl[250]" "FKRingFinger3_L_orientConstraint1.cpim"
		;
connectAttr "IKLeg_R_translateX.o" "zombie_rig_ver2RN.phl[251]";
connectAttr "IKLeg_R_translateY.o" "zombie_rig_ver2RN.phl[252]";
connectAttr "IKLeg_R_translateZ.o" "zombie_rig_ver2RN.phl[253]";
connectAttr "zombie_rig_ver2RN.phl[254]" "IKLeg_R_parentConstraint1.crp";
connectAttr "zombie_rig_ver2RN.phl[255]" "IKLeg_R_parentConstraint1.crt";
connectAttr "IKLeg_R_rotateX.o" "zombie_rig_ver2RN.phl[256]";
connectAttr "IKLeg_R_rotateY.o" "zombie_rig_ver2RN.phl[257]";
connectAttr "IKLeg_R_rotateZ.o" "zombie_rig_ver2RN.phl[258]";
connectAttr "zombie_rig_ver2RN.phl[259]" "IKLeg_R_parentConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[260]" "IKLeg_R_parentConstraint1.cpim";
connectAttr "IKLeg_L_translateX.o" "zombie_rig_ver2RN.phl[261]";
connectAttr "IKLeg_L_translateY.o" "zombie_rig_ver2RN.phl[262]";
connectAttr "IKLeg_L_translateZ.o" "zombie_rig_ver2RN.phl[263]";
connectAttr "IKLeg_L_rotateX.o" "zombie_rig_ver2RN.phl[264]";
connectAttr "IKLeg_L_rotateY.o" "zombie_rig_ver2RN.phl[265]";
connectAttr "IKLeg_L_rotateZ.o" "zombie_rig_ver2RN.phl[266]";
connectAttr "zombie_rig_ver2RN.phl[267]" "IKLeg_L_parentConstraint1.crp";
connectAttr "zombie_rig_ver2RN.phl[268]" "IKLeg_L_parentConstraint1.crt";
connectAttr "zombie_rig_ver2RN.phl[269]" "pairBlend1.ro";
connectAttr "zombie_rig_ver2RN.phl[270]" "IKLeg_L_parentConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[271]" "pairBlend1.w";
connectAttr "zombie_rig_ver2RN.phl[272]" "IKLeg_L_parentConstraint1.cpim";
connectAttr "RootX_M_translateX.o" "zombie_rig_ver2RN.phl[273]";
connectAttr "RootX_M_translateY.o" "zombie_rig_ver2RN.phl[274]";
connectAttr "RootX_M_translateZ.o" "zombie_rig_ver2RN.phl[275]";
connectAttr "zombie_rig_ver2RN.phl[276]" "RootX_M_pointConstraint1.crp";
connectAttr "zombie_rig_ver2RN.phl[277]" "RootX_M_pointConstraint1.crt";
connectAttr "RootX_M_rotateX.o" "zombie_rig_ver2RN.phl[278]";
connectAttr "RootX_M_rotateY.o" "zombie_rig_ver2RN.phl[279]";
connectAttr "RootX_M_rotateZ.o" "zombie_rig_ver2RN.phl[280]";
connectAttr "zombie_rig_ver2RN.phl[281]" "RootX_M_orientConstraint1.cro";
connectAttr "zombie_rig_ver2RN.phl[282]" "RootX_M_orientConstraint1.cpim";
connectAttr "zombie_rig_ver2RN.phl[283]" "RootX_M_pointConstraint1.cpim";
connectAttr "zombie_rig_ver2RN.phl[284]" "pairBlend1.irx1";
connectAttr "zombie_rig_ver2RN.phl[285]" "pairBlend1.iry1";
connectAttr "zombie_rig_ver2RN.phl[286]" "pairBlend1.irz1";
connectAttr "zombie_rig_ver2RN.phl[287]" "pairBlend1.itx1";
connectAttr "zombie_rig_ver2RN.phl[288]" "pairBlend1.ity1";
connectAttr "zombie_rig_ver2RN.phl[289]" "pairBlend1.itz1";
connectAttr "Hips_translateX.o" "mixamorig5:Hips.tx";
connectAttr "Hips_translateY.o" "mixamorig5:Hips.ty";
connectAttr "Hips_translateZ.o" "mixamorig5:Hips.tz";
connectAttr "Hips_rotateX.o" "mixamorig5:Hips.rx";
connectAttr "Hips_rotateY.o" "mixamorig5:Hips.ry";
connectAttr "Hips_rotateZ.o" "mixamorig5:Hips.rz";
connectAttr "mixamorig5:Hips.s" "mixamorig5:Spine.is";
connectAttr "Spine_rotateX.o" "mixamorig5:Spine.rx";
connectAttr "Spine_rotateY.o" "mixamorig5:Spine.ry";
connectAttr "Spine_rotateZ.o" "mixamorig5:Spine.rz";
connectAttr "mixamorig5:Spine.s" "mixamorig5:Spine1.is";
connectAttr "Spine1_rotateX.o" "mixamorig5:Spine1.rx";
connectAttr "Spine1_rotateY.o" "mixamorig5:Spine1.ry";
connectAttr "Spine1_rotateZ.o" "mixamorig5:Spine1.rz";
connectAttr "mixamorig5:Spine1.s" "mixamorig5:Spine2.is";
connectAttr "Spine2_rotateX.o" "mixamorig5:Spine2.rx";
connectAttr "Spine2_rotateY.o" "mixamorig5:Spine2.ry";
connectAttr "Spine2_rotateZ.o" "mixamorig5:Spine2.rz";
connectAttr "mixamorig5:Spine2.s" "mixamorig5:Neck.is";
connectAttr "Neck_rotateX.o" "mixamorig5:Neck.rx";
connectAttr "Neck_rotateY.o" "mixamorig5:Neck.ry";
connectAttr "Neck_rotateZ.o" "mixamorig5:Neck.rz";
connectAttr "mixamorig5:Neck.s" "mixamorig5:Head.is";
connectAttr "Head_rotateX.o" "mixamorig5:Head.rx";
connectAttr "Head_rotateY.o" "mixamorig5:Head.ry";
connectAttr "Head_rotateZ.o" "mixamorig5:Head.rz";
connectAttr "mixamorig5:Head.s" "mixamorig5:HeadTop_End.is";
connectAttr "mixamorig5:Spine2.s" "mixamorig5:LeftShoulder.is";
connectAttr "LeftShoulder_rotateX.o" "mixamorig5:LeftShoulder.rx";
connectAttr "LeftShoulder_rotateY.o" "mixamorig5:LeftShoulder.ry";
connectAttr "LeftShoulder_rotateZ.o" "mixamorig5:LeftShoulder.rz";
connectAttr "mixamorig5:LeftShoulder.s" "mixamorig5:LeftArm.is";
connectAttr "LeftArm_rotateX.o" "mixamorig5:LeftArm.rx";
connectAttr "LeftArm_rotateY.o" "mixamorig5:LeftArm.ry";
connectAttr "LeftArm_rotateZ.o" "mixamorig5:LeftArm.rz";
connectAttr "mixamorig5:LeftArm.s" "mixamorig5:LeftForeArm.is";
connectAttr "LeftForeArm_rotateX.o" "mixamorig5:LeftForeArm.rx";
connectAttr "LeftForeArm_rotateY.o" "mixamorig5:LeftForeArm.ry";
connectAttr "LeftForeArm_rotateZ.o" "mixamorig5:LeftForeArm.rz";
connectAttr "mixamorig5:LeftForeArm.s" "mixamorig5:LeftHand.is";
connectAttr "LeftHand_rotateX.o" "mixamorig5:LeftHand.rx";
connectAttr "LeftHand_rotateY.o" "mixamorig5:LeftHand.ry";
connectAttr "LeftHand_rotateZ.o" "mixamorig5:LeftHand.rz";
connectAttr "mixamorig5:LeftHand.s" "mixamorig5:LeftHandThumb1.is";
connectAttr "LeftHandThumb1_rotateX.o" "mixamorig5:LeftHandThumb1.rx";
connectAttr "LeftHandThumb1_rotateY.o" "mixamorig5:LeftHandThumb1.ry";
connectAttr "LeftHandThumb1_rotateZ.o" "mixamorig5:LeftHandThumb1.rz";
connectAttr "mixamorig5:LeftHandThumb1.s" "mixamorig5:LeftHandThumb2.is";
connectAttr "LeftHandThumb2_rotateX.o" "mixamorig5:LeftHandThumb2.rx";
connectAttr "LeftHandThumb2_rotateY.o" "mixamorig5:LeftHandThumb2.ry";
connectAttr "LeftHandThumb2_rotateZ.o" "mixamorig5:LeftHandThumb2.rz";
connectAttr "mixamorig5:LeftHandThumb2.s" "mixamorig5:LeftHandThumb3.is";
connectAttr "LeftHandThumb3_rotateX.o" "mixamorig5:LeftHandThumb3.rx";
connectAttr "LeftHandThumb3_rotateY.o" "mixamorig5:LeftHandThumb3.ry";
connectAttr "LeftHandThumb3_rotateZ.o" "mixamorig5:LeftHandThumb3.rz";
connectAttr "mixamorig5:LeftHandThumb3.s" "mixamorig5:LeftHandThumb4.is";
connectAttr "mixamorig5:LeftHand.s" "mixamorig5:LeftHandIndex1.is";
connectAttr "LeftHandIndex1_rotateX.o" "mixamorig5:LeftHandIndex1.rx";
connectAttr "LeftHandIndex1_rotateY.o" "mixamorig5:LeftHandIndex1.ry";
connectAttr "LeftHandIndex1_rotateZ.o" "mixamorig5:LeftHandIndex1.rz";
connectAttr "mixamorig5:LeftHandIndex1.s" "mixamorig5:LeftHandIndex2.is";
connectAttr "LeftHandIndex2_rotateX.o" "mixamorig5:LeftHandIndex2.rx";
connectAttr "LeftHandIndex2_rotateY.o" "mixamorig5:LeftHandIndex2.ry";
connectAttr "LeftHandIndex2_rotateZ.o" "mixamorig5:LeftHandIndex2.rz";
connectAttr "mixamorig5:LeftHandIndex2.s" "mixamorig5:LeftHandIndex3.is";
connectAttr "LeftHandIndex3_rotateX.o" "mixamorig5:LeftHandIndex3.rx";
connectAttr "LeftHandIndex3_rotateY.o" "mixamorig5:LeftHandIndex3.ry";
connectAttr "LeftHandIndex3_rotateZ.o" "mixamorig5:LeftHandIndex3.rz";
connectAttr "mixamorig5:LeftHandIndex3.s" "mixamorig5:LeftHandIndex4.is";
connectAttr "mixamorig5:LeftHand.s" "mixamorig5:LeftHandMiddle1.is";
connectAttr "LeftHandMiddle1_rotateX.o" "mixamorig5:LeftHandMiddle1.rx";
connectAttr "LeftHandMiddle1_rotateY.o" "mixamorig5:LeftHandMiddle1.ry";
connectAttr "LeftHandMiddle1_rotateZ.o" "mixamorig5:LeftHandMiddle1.rz";
connectAttr "mixamorig5:LeftHandMiddle1.s" "mixamorig5:LeftHandMiddle2.is";
connectAttr "LeftHandMiddle2_rotateX.o" "mixamorig5:LeftHandMiddle2.rx";
connectAttr "LeftHandMiddle2_rotateY.o" "mixamorig5:LeftHandMiddle2.ry";
connectAttr "LeftHandMiddle2_rotateZ.o" "mixamorig5:LeftHandMiddle2.rz";
connectAttr "mixamorig5:LeftHandMiddle2.s" "mixamorig5:LeftHandMiddle3.is";
connectAttr "LeftHandMiddle3_rotateX.o" "mixamorig5:LeftHandMiddle3.rx";
connectAttr "LeftHandMiddle3_rotateY.o" "mixamorig5:LeftHandMiddle3.ry";
connectAttr "LeftHandMiddle3_rotateZ.o" "mixamorig5:LeftHandMiddle3.rz";
connectAttr "mixamorig5:LeftHandMiddle3.s" "mixamorig5:LeftHandMiddle4.is";
connectAttr "mixamorig5:LeftHand.s" "mixamorig5:LeftHandRing1.is";
connectAttr "LeftHandRing1_rotateX.o" "mixamorig5:LeftHandRing1.rx";
connectAttr "LeftHandRing1_rotateY.o" "mixamorig5:LeftHandRing1.ry";
connectAttr "LeftHandRing1_rotateZ.o" "mixamorig5:LeftHandRing1.rz";
connectAttr "mixamorig5:LeftHandRing1.s" "mixamorig5:LeftHandRing2.is";
connectAttr "LeftHandRing2_rotateX.o" "mixamorig5:LeftHandRing2.rx";
connectAttr "LeftHandRing2_rotateY.o" "mixamorig5:LeftHandRing2.ry";
connectAttr "LeftHandRing2_rotateZ.o" "mixamorig5:LeftHandRing2.rz";
connectAttr "mixamorig5:LeftHandRing2.s" "mixamorig5:LeftHandRing3.is";
connectAttr "LeftHandRing3_rotateX.o" "mixamorig5:LeftHandRing3.rx";
connectAttr "LeftHandRing3_rotateY.o" "mixamorig5:LeftHandRing3.ry";
connectAttr "LeftHandRing3_rotateZ.o" "mixamorig5:LeftHandRing3.rz";
connectAttr "mixamorig5:LeftHandRing3.s" "mixamorig5:LeftHandRing4.is";
connectAttr "mixamorig5:LeftHand.s" "mixamorig5:LeftHandPinky1.is";
connectAttr "LeftHandPinky1_rotateX.o" "mixamorig5:LeftHandPinky1.rx";
connectAttr "LeftHandPinky1_rotateY.o" "mixamorig5:LeftHandPinky1.ry";
connectAttr "LeftHandPinky1_rotateZ.o" "mixamorig5:LeftHandPinky1.rz";
connectAttr "mixamorig5:LeftHandPinky1.s" "mixamorig5:LeftHandPinky2.is";
connectAttr "LeftHandPinky2_rotateX.o" "mixamorig5:LeftHandPinky2.rx";
connectAttr "LeftHandPinky2_rotateY.o" "mixamorig5:LeftHandPinky2.ry";
connectAttr "LeftHandPinky2_rotateZ.o" "mixamorig5:LeftHandPinky2.rz";
connectAttr "mixamorig5:LeftHandPinky2.s" "mixamorig5:LeftHandPinky3.is";
connectAttr "LeftHandPinky3_rotateX.o" "mixamorig5:LeftHandPinky3.rx";
connectAttr "LeftHandPinky3_rotateY.o" "mixamorig5:LeftHandPinky3.ry";
connectAttr "LeftHandPinky3_rotateZ.o" "mixamorig5:LeftHandPinky3.rz";
connectAttr "mixamorig5:LeftHandPinky3.s" "mixamorig5:LeftHandPinky4.is";
connectAttr "mixamorig5:Spine2.s" "mixamorig5:RightShoulder.is";
connectAttr "RightShoulder_rotateX.o" "mixamorig5:RightShoulder.rx";
connectAttr "RightShoulder_rotateY.o" "mixamorig5:RightShoulder.ry";
connectAttr "RightShoulder_rotateZ.o" "mixamorig5:RightShoulder.rz";
connectAttr "mixamorig5:RightShoulder.s" "mixamorig5:RightArm.is";
connectAttr "RightArm_rotateX.o" "mixamorig5:RightArm.rx";
connectAttr "RightArm_rotateY.o" "mixamorig5:RightArm.ry";
connectAttr "RightArm_rotateZ.o" "mixamorig5:RightArm.rz";
connectAttr "mixamorig5:RightArm.s" "mixamorig5:RightForeArm.is";
connectAttr "RightForeArm_rotateX.o" "mixamorig5:RightForeArm.rx";
connectAttr "RightForeArm_rotateY.o" "mixamorig5:RightForeArm.ry";
connectAttr "RightForeArm_rotateZ.o" "mixamorig5:RightForeArm.rz";
connectAttr "mixamorig5:RightForeArm.s" "mixamorig5:RightHand.is";
connectAttr "RightHand_rotateX.o" "mixamorig5:RightHand.rx";
connectAttr "RightHand_rotateY.o" "mixamorig5:RightHand.ry";
connectAttr "RightHand_rotateZ.o" "mixamorig5:RightHand.rz";
connectAttr "mixamorig5:RightHand.s" "mixamorig5:RightHandThumb1.is";
connectAttr "RightHandThumb1_rotateX.o" "mixamorig5:RightHandThumb1.rx";
connectAttr "RightHandThumb1_rotateY.o" "mixamorig5:RightHandThumb1.ry";
connectAttr "RightHandThumb1_rotateZ.o" "mixamorig5:RightHandThumb1.rz";
connectAttr "mixamorig5:RightHandThumb1.s" "mixamorig5:RightHandThumb2.is";
connectAttr "RightHandThumb2_rotateX.o" "mixamorig5:RightHandThumb2.rx";
connectAttr "RightHandThumb2_rotateY.o" "mixamorig5:RightHandThumb2.ry";
connectAttr "RightHandThumb2_rotateZ.o" "mixamorig5:RightHandThumb2.rz";
connectAttr "mixamorig5:RightHandThumb2.s" "mixamorig5:RightHandThumb3.is";
connectAttr "RightHandThumb3_rotateX.o" "mixamorig5:RightHandThumb3.rx";
connectAttr "RightHandThumb3_rotateY.o" "mixamorig5:RightHandThumb3.ry";
connectAttr "RightHandThumb3_rotateZ.o" "mixamorig5:RightHandThumb3.rz";
connectAttr "mixamorig5:RightHandThumb3.s" "mixamorig5:RightHandThumb4.is";
connectAttr "mixamorig5:RightHand.s" "mixamorig5:RightHandIndex1.is";
connectAttr "RightHandIndex1_rotateX.o" "mixamorig5:RightHandIndex1.rx";
connectAttr "RightHandIndex1_rotateY.o" "mixamorig5:RightHandIndex1.ry";
connectAttr "RightHandIndex1_rotateZ.o" "mixamorig5:RightHandIndex1.rz";
connectAttr "mixamorig5:RightHandIndex1.s" "mixamorig5:RightHandIndex2.is";
connectAttr "RightHandIndex2_rotateX.o" "mixamorig5:RightHandIndex2.rx";
connectAttr "RightHandIndex2_rotateY.o" "mixamorig5:RightHandIndex2.ry";
connectAttr "RightHandIndex2_rotateZ.o" "mixamorig5:RightHandIndex2.rz";
connectAttr "mixamorig5:RightHandIndex2.s" "mixamorig5:RightHandIndex3.is";
connectAttr "RightHandIndex3_rotateX.o" "mixamorig5:RightHandIndex3.rx";
connectAttr "RightHandIndex3_rotateY.o" "mixamorig5:RightHandIndex3.ry";
connectAttr "RightHandIndex3_rotateZ.o" "mixamorig5:RightHandIndex3.rz";
connectAttr "mixamorig5:RightHandIndex3.s" "mixamorig5:RightHandIndex4.is";
connectAttr "mixamorig5:RightHand.s" "mixamorig5:RightHandMiddle1.is";
connectAttr "RightHandMiddle1_rotateX.o" "mixamorig5:RightHandMiddle1.rx";
connectAttr "RightHandMiddle1_rotateY.o" "mixamorig5:RightHandMiddle1.ry";
connectAttr "RightHandMiddle1_rotateZ.o" "mixamorig5:RightHandMiddle1.rz";
connectAttr "mixamorig5:RightHandMiddle1.s" "mixamorig5:RightHandMiddle2.is";
connectAttr "RightHandMiddle2_rotateX.o" "mixamorig5:RightHandMiddle2.rx";
connectAttr "RightHandMiddle2_rotateY.o" "mixamorig5:RightHandMiddle2.ry";
connectAttr "RightHandMiddle2_rotateZ.o" "mixamorig5:RightHandMiddle2.rz";
connectAttr "mixamorig5:RightHandMiddle2.s" "mixamorig5:RightHandMiddle3.is";
connectAttr "RightHandMiddle3_rotateX.o" "mixamorig5:RightHandMiddle3.rx";
connectAttr "RightHandMiddle3_rotateY.o" "mixamorig5:RightHandMiddle3.ry";
connectAttr "RightHandMiddle3_rotateZ.o" "mixamorig5:RightHandMiddle3.rz";
connectAttr "mixamorig5:RightHandMiddle3.s" "mixamorig5:RightHandMiddle4.is";
connectAttr "mixamorig5:RightHand.s" "mixamorig5:RightHandRing1.is";
connectAttr "RightHandRing1_rotateX.o" "mixamorig5:RightHandRing1.rx";
connectAttr "RightHandRing1_rotateY.o" "mixamorig5:RightHandRing1.ry";
connectAttr "RightHandRing1_rotateZ.o" "mixamorig5:RightHandRing1.rz";
connectAttr "mixamorig5:RightHandRing1.s" "mixamorig5:RightHandRing2.is";
connectAttr "RightHandRing2_rotateX.o" "mixamorig5:RightHandRing2.rx";
connectAttr "RightHandRing2_rotateY.o" "mixamorig5:RightHandRing2.ry";
connectAttr "RightHandRing2_rotateZ.o" "mixamorig5:RightHandRing2.rz";
connectAttr "mixamorig5:RightHandRing2.s" "mixamorig5:RightHandRing3.is";
connectAttr "RightHandRing3_rotateX.o" "mixamorig5:RightHandRing3.rx";
connectAttr "RightHandRing3_rotateY.o" "mixamorig5:RightHandRing3.ry";
connectAttr "RightHandRing3_rotateZ.o" "mixamorig5:RightHandRing3.rz";
connectAttr "mixamorig5:RightHandRing3.s" "mixamorig5:RightHandRing4.is";
connectAttr "mixamorig5:RightHand.s" "mixamorig5:RightHandPinky1.is";
connectAttr "RightHandPinky1_rotateX.o" "mixamorig5:RightHandPinky1.rx";
connectAttr "RightHandPinky1_rotateY.o" "mixamorig5:RightHandPinky1.ry";
connectAttr "RightHandPinky1_rotateZ.o" "mixamorig5:RightHandPinky1.rz";
connectAttr "mixamorig5:RightHandPinky1.s" "mixamorig5:RightHandPinky2.is";
connectAttr "RightHandPinky2_rotateX.o" "mixamorig5:RightHandPinky2.rx";
connectAttr "RightHandPinky2_rotateY.o" "mixamorig5:RightHandPinky2.ry";
connectAttr "RightHandPinky2_rotateZ.o" "mixamorig5:RightHandPinky2.rz";
connectAttr "mixamorig5:RightHandPinky2.s" "mixamorig5:RightHandPinky3.is";
connectAttr "RightHandPinky3_rotateX.o" "mixamorig5:RightHandPinky3.rx";
connectAttr "RightHandPinky3_rotateY.o" "mixamorig5:RightHandPinky3.ry";
connectAttr "RightHandPinky3_rotateZ.o" "mixamorig5:RightHandPinky3.rz";
connectAttr "mixamorig5:RightHandPinky3.s" "mixamorig5:RightHandPinky4.is";
connectAttr "mixamorig5:Hips.s" "mixamorig5:LeftUpLeg.is";
connectAttr "LeftUpLeg_rotateX.o" "mixamorig5:LeftUpLeg.rx";
connectAttr "LeftUpLeg_rotateY.o" "mixamorig5:LeftUpLeg.ry";
connectAttr "LeftUpLeg_rotateZ.o" "mixamorig5:LeftUpLeg.rz";
connectAttr "mixamorig5:LeftUpLeg.s" "mixamorig5:LeftLeg.is";
connectAttr "LeftLeg_rotateX.o" "mixamorig5:LeftLeg.rx";
connectAttr "LeftLeg_rotateY.o" "mixamorig5:LeftLeg.ry";
connectAttr "LeftLeg_rotateZ.o" "mixamorig5:LeftLeg.rz";
connectAttr "mixamorig5:LeftLeg.s" "mixamorig5:LeftFoot.is";
connectAttr "LeftFoot_rotateX.o" "mixamorig5:LeftFoot.rx";
connectAttr "LeftFoot_rotateY.o" "mixamorig5:LeftFoot.ry";
connectAttr "LeftFoot_rotateZ.o" "mixamorig5:LeftFoot.rz";
connectAttr "mixamorig5:LeftFoot.s" "mixamorig5:LeftToeBase.is";
connectAttr "LeftToeBase_rotateX.o" "mixamorig5:LeftToeBase.rx";
connectAttr "LeftToeBase_rotateY.o" "mixamorig5:LeftToeBase.ry";
connectAttr "LeftToeBase_rotateZ.o" "mixamorig5:LeftToeBase.rz";
connectAttr "mixamorig5:LeftToeBase.s" "mixamorig5:LeftToe_End.is";
connectAttr "mixamorig5:Hips.s" "mixamorig5:RightUpLeg.is";
connectAttr "RightUpLeg_rotateX.o" "mixamorig5:RightUpLeg.rx";
connectAttr "RightUpLeg_rotateY.o" "mixamorig5:RightUpLeg.ry";
connectAttr "RightUpLeg_rotateZ.o" "mixamorig5:RightUpLeg.rz";
connectAttr "mixamorig5:RightUpLeg.s" "mixamorig5:RightLeg.is";
connectAttr "RightLeg_rotateX.o" "mixamorig5:RightLeg.rx";
connectAttr "RightLeg_rotateY.o" "mixamorig5:RightLeg.ry";
connectAttr "RightLeg_rotateZ.o" "mixamorig5:RightLeg.rz";
connectAttr "mixamorig5:RightLeg.s" "mixamorig5:RightFoot.is";
connectAttr "RightFoot_rotateX.o" "mixamorig5:RightFoot.rx";
connectAttr "RightFoot_rotateY.o" "mixamorig5:RightFoot.ry";
connectAttr "RightFoot_rotateZ.o" "mixamorig5:RightFoot.rz";
connectAttr "mixamorig5:RightFoot.s" "mixamorig5:RightToeBase.is";
connectAttr "RightToeBase_rotateX.o" "mixamorig5:RightToeBase.rx";
connectAttr "RightToeBase_rotateY.o" "mixamorig5:RightToeBase.ry";
connectAttr "RightToeBase_rotateZ.o" "mixamorig5:RightToeBase.rz";
connectAttr "mixamorig5:RightToeBase.s" "mixamorig5:RightToe_End.is";
connectAttr "MoCapConstraints.disableConstraints" "RootX_M_orientConstraint1.nds"
		;
connectAttr "mixamorig5:Hips.r" "RootX_M_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:Hips.ro" "RootX_M_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:Hips.pm" "RootX_M_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:Hips.jo" "RootX_M_orientConstraint1.tg[0].tjo";
connectAttr "RootX_M_orientConstraint1.w0" "RootX_M_orientConstraint1.tg[0].tw";
connectAttr "MoCapConstraints.disableConstraints" "RootX_M_pointConstraint1.nds"
		;
connectAttr "mixamorig5:Hips.t" "RootX_M_pointConstraint1.tg[0].tt";
connectAttr "mixamorig5:Hips.rp" "RootX_M_pointConstraint1.tg[0].trp";
connectAttr "mixamorig5:Hips.rpt" "RootX_M_pointConstraint1.tg[0].trt";
connectAttr "mixamorig5:Hips.pm" "RootX_M_pointConstraint1.tg[0].tpm";
connectAttr "RootX_M_pointConstraint1.w0" "RootX_M_pointConstraint1.tg[0].tw";
connectAttr "MoCapConstraints.disableConstraints" "IKLeg_L_parentConstraint1.nds"
		;
connectAttr "mixamorig5:LeftFoot.t" "IKLeg_L_parentConstraint1.tg[0].tt";
connectAttr "mixamorig5:LeftFoot.rp" "IKLeg_L_parentConstraint1.tg[0].trp";
connectAttr "mixamorig5:LeftFoot.rpt" "IKLeg_L_parentConstraint1.tg[0].trt";
connectAttr "mixamorig5:LeftFoot.r" "IKLeg_L_parentConstraint1.tg[0].tr";
connectAttr "mixamorig5:LeftFoot.ro" "IKLeg_L_parentConstraint1.tg[0].tro";
connectAttr "mixamorig5:LeftFoot.s" "IKLeg_L_parentConstraint1.tg[0].ts";
connectAttr "mixamorig5:LeftFoot.pm" "IKLeg_L_parentConstraint1.tg[0].tpm";
connectAttr "mixamorig5:LeftFoot.jo" "IKLeg_L_parentConstraint1.tg[0].tjo";
connectAttr "mixamorig5:LeftFoot.ssc" "IKLeg_L_parentConstraint1.tg[0].tsc";
connectAttr "mixamorig5:LeftFoot.is" "IKLeg_L_parentConstraint1.tg[0].tis";
connectAttr "IKLeg_L_parentConstraint1.w0" "IKLeg_L_parentConstraint1.tg[0].tw";
connectAttr "MoCapConstraints.disableConstraints" "IKLeg_R_parentConstraint1.nds"
		;
connectAttr "mixamorig5:RightFoot.t" "IKLeg_R_parentConstraint1.tg[0].tt";
connectAttr "mixamorig5:RightFoot.rp" "IKLeg_R_parentConstraint1.tg[0].trp";
connectAttr "mixamorig5:RightFoot.rpt" "IKLeg_R_parentConstraint1.tg[0].trt";
connectAttr "mixamorig5:RightFoot.r" "IKLeg_R_parentConstraint1.tg[0].tr";
connectAttr "mixamorig5:RightFoot.ro" "IKLeg_R_parentConstraint1.tg[0].tro";
connectAttr "mixamorig5:RightFoot.s" "IKLeg_R_parentConstraint1.tg[0].ts";
connectAttr "mixamorig5:RightFoot.pm" "IKLeg_R_parentConstraint1.tg[0].tpm";
connectAttr "mixamorig5:RightFoot.jo" "IKLeg_R_parentConstraint1.tg[0].tjo";
connectAttr "mixamorig5:RightFoot.ssc" "IKLeg_R_parentConstraint1.tg[0].tsc";
connectAttr "mixamorig5:RightFoot.is" "IKLeg_R_parentConstraint1.tg[0].tis";
connectAttr "IKLeg_R_parentConstraint1.w0" "IKLeg_R_parentConstraint1.tg[0].tw";
connectAttr "MoCapConstraints.disableConstraints" "FKRingFinger1_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandRing1.r" "FKRingFinger1_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandRing1.ro" "FKRingFinger1_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandRing1.pm" "FKRingFinger1_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandRing1.jo" "FKRingFinger1_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKRingFinger1_L_orientConstraint1.w0" "FKRingFinger1_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKRingFinger2_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandRing2.r" "FKRingFinger2_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandRing2.ro" "FKRingFinger2_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandRing2.pm" "FKRingFinger2_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandRing2.jo" "FKRingFinger2_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKRingFinger2_L_orientConstraint1.w0" "FKRingFinger2_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKRingFinger3_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandRing3.r" "FKRingFinger3_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandRing3.ro" "FKRingFinger3_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandRing3.pm" "FKRingFinger3_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandRing3.jo" "FKRingFinger3_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKRingFinger3_L_orientConstraint1.w0" "FKRingFinger3_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKPinkyFinger1_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandPinky1.r" "FKPinkyFinger1_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandPinky1.ro" "FKPinkyFinger1_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandPinky1.pm" "FKPinkyFinger1_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandPinky1.jo" "FKPinkyFinger1_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKPinkyFinger1_L_orientConstraint1.w0" "FKPinkyFinger1_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKPinkyFinger2_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandPinky2.r" "FKPinkyFinger2_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandPinky2.ro" "FKPinkyFinger2_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandPinky2.pm" "FKPinkyFinger2_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandPinky2.jo" "FKPinkyFinger2_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKPinkyFinger2_L_orientConstraint1.w0" "FKPinkyFinger2_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKPinkyFinger3_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandPinky3.r" "FKPinkyFinger3_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandPinky3.ro" "FKPinkyFinger3_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandPinky3.pm" "FKPinkyFinger3_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandPinky3.jo" "FKPinkyFinger3_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKPinkyFinger3_L_orientConstraint1.w0" "FKPinkyFinger3_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKIndexFinger1_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandIndex1.r" "FKIndexFinger1_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandIndex1.ro" "FKIndexFinger1_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandIndex1.pm" "FKIndexFinger1_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandIndex1.jo" "FKIndexFinger1_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKIndexFinger1_L_orientConstraint1.w0" "FKIndexFinger1_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKIndexFinger2_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandIndex2.r" "FKIndexFinger2_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandIndex2.ro" "FKIndexFinger2_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandIndex2.pm" "FKIndexFinger2_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandIndex2.jo" "FKIndexFinger2_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKIndexFinger2_L_orientConstraint1.w0" "FKIndexFinger2_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKIndexFinger3_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandIndex3.r" "FKIndexFinger3_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandIndex3.ro" "FKIndexFinger3_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandIndex3.pm" "FKIndexFinger3_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandIndex3.jo" "FKIndexFinger3_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKIndexFinger3_L_orientConstraint1.w0" "FKIndexFinger3_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKThumbFinger1_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandThumb1.r" "FKThumbFinger1_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandThumb1.ro" "FKThumbFinger1_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandThumb1.pm" "FKThumbFinger1_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandThumb1.jo" "FKThumbFinger1_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKThumbFinger1_L_orientConstraint1.w0" "FKThumbFinger1_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKThumbFinger2_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandThumb2.r" "FKThumbFinger2_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandThumb2.ro" "FKThumbFinger2_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandThumb2.pm" "FKThumbFinger2_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandThumb2.jo" "FKThumbFinger2_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKThumbFinger2_L_orientConstraint1.w0" "FKThumbFinger2_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKThumbFinger3_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandThumb3.r" "FKThumbFinger3_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandThumb3.ro" "FKThumbFinger3_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandThumb3.pm" "FKThumbFinger3_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandThumb3.jo" "FKThumbFinger3_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKThumbFinger3_L_orientConstraint1.w0" "FKThumbFinger3_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKMiddleFinger1_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandMiddle1.r" "FKMiddleFinger1_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandMiddle1.ro" "FKMiddleFinger1_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandMiddle1.pm" "FKMiddleFinger1_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandMiddle1.jo" "FKMiddleFinger1_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKMiddleFinger1_L_orientConstraint1.w0" "FKMiddleFinger1_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKMiddleFinger2_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandMiddle2.r" "FKMiddleFinger2_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandMiddle2.ro" "FKMiddleFinger2_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandMiddle2.pm" "FKMiddleFinger2_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandMiddle2.jo" "FKMiddleFinger2_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKMiddleFinger2_L_orientConstraint1.w0" "FKMiddleFinger2_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKMiddleFinger3_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHandMiddle3.r" "FKMiddleFinger3_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftHandMiddle3.ro" "FKMiddleFinger3_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftHandMiddle3.pm" "FKMiddleFinger3_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftHandMiddle3.jo" "FKMiddleFinger3_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKMiddleFinger3_L_orientConstraint1.w0" "FKMiddleFinger3_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKChest_M_orientConstraint1.nds"
		;
connectAttr "mixamorig5:Spine2.r" "FKChest_M_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:Spine2.ro" "FKChest_M_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:Spine2.pm" "FKChest_M_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:Spine2.jo" "FKChest_M_orientConstraint1.tg[0].tjo";
connectAttr "FKChest_M_orientConstraint1.w0" "FKChest_M_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKSpine1_M_orientConstraint1.nds"
		;
connectAttr "mixamorig5:Spine1.r" "FKSpine1_M_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:Spine1.ro" "FKSpine1_M_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:Spine1.pm" "FKSpine1_M_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:Spine1.jo" "FKSpine1_M_orientConstraint1.tg[0].tjo";
connectAttr "FKSpine1_M_orientConstraint1.w0" "FKSpine1_M_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKHip_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftUpLeg.r" "FKHip_L_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:LeftUpLeg.ro" "FKHip_L_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:LeftUpLeg.pm" "FKHip_L_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:LeftUpLeg.jo" "FKHip_L_orientConstraint1.tg[0].tjo";
connectAttr "FKHip_L_orientConstraint1.w0" "FKHip_L_orientConstraint1.tg[0].tw";
connectAttr "MoCapConstraints.disableConstraints" "FKKnee_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftLeg.r" "FKKnee_L_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:LeftLeg.ro" "FKKnee_L_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:LeftLeg.pm" "FKKnee_L_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:LeftLeg.jo" "FKKnee_L_orientConstraint1.tg[0].tjo";
connectAttr "FKKnee_L_orientConstraint1.w0" "FKKnee_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKAnkle_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftFoot.r" "FKAnkle_L_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:LeftFoot.ro" "FKAnkle_L_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:LeftFoot.pm" "FKAnkle_L_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:LeftFoot.jo" "FKAnkle_L_orientConstraint1.tg[0].tjo";
connectAttr "FKAnkle_L_orientConstraint1.w0" "FKAnkle_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKToes_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftToeBase.r" "FKToes_L_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:LeftToeBase.ro" "FKToes_L_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:LeftToeBase.pm" "FKToes_L_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:LeftToeBase.jo" "FKToes_L_orientConstraint1.tg[0].tjo";
connectAttr "FKToes_L_orientConstraint1.w0" "FKToes_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKHip_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightUpLeg.r" "FKHip_R_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:RightUpLeg.ro" "FKHip_R_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:RightUpLeg.pm" "FKHip_R_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:RightUpLeg.jo" "FKHip_R_orientConstraint1.tg[0].tjo";
connectAttr "FKHip_R_orientConstraint1.w0" "FKHip_R_orientConstraint1.tg[0].tw";
connectAttr "MoCapConstraints.disableConstraints" "FKKnee_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightLeg.r" "FKKnee_R_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:RightLeg.ro" "FKKnee_R_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:RightLeg.pm" "FKKnee_R_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:RightLeg.jo" "FKKnee_R_orientConstraint1.tg[0].tjo";
connectAttr "FKKnee_R_orientConstraint1.w0" "FKKnee_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKAnkle_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightFoot.r" "FKAnkle_R_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:RightFoot.ro" "FKAnkle_R_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:RightFoot.pm" "FKAnkle_R_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:RightFoot.jo" "FKAnkle_R_orientConstraint1.tg[0].tjo";
connectAttr "FKAnkle_R_orientConstraint1.w0" "FKAnkle_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKToes_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightToeBase.r" "FKToes_R_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:RightToeBase.ro" "FKToes_R_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:RightToeBase.pm" "FKToes_R_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:RightToeBase.jo" "FKToes_R_orientConstraint1.tg[0].tjo";
connectAttr "FKToes_R_orientConstraint1.w0" "FKToes_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKRingFinger1_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandRing1.r" "FKRingFinger1_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandRing1.ro" "FKRingFinger1_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandRing1.pm" "FKRingFinger1_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandRing1.jo" "FKRingFinger1_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKRingFinger1_R_orientConstraint1.w0" "FKRingFinger1_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKRingFinger2_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandRing2.r" "FKRingFinger2_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandRing2.ro" "FKRingFinger2_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandRing2.pm" "FKRingFinger2_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandRing2.jo" "FKRingFinger2_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKRingFinger2_R_orientConstraint1.w0" "FKRingFinger2_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKRingFinger3_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandRing3.r" "FKRingFinger3_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandRing3.ro" "FKRingFinger3_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandRing3.pm" "FKRingFinger3_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandRing3.jo" "FKRingFinger3_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKRingFinger3_R_orientConstraint1.w0" "FKRingFinger3_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKPinkyFinger1_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandPinky1.r" "FKPinkyFinger1_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandPinky1.ro" "FKPinkyFinger1_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandPinky1.pm" "FKPinkyFinger1_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandPinky1.jo" "FKPinkyFinger1_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKPinkyFinger1_R_orientConstraint1.w0" "FKPinkyFinger1_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKPinkyFinger2_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandPinky2.r" "FKPinkyFinger2_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandPinky2.ro" "FKPinkyFinger2_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandPinky2.pm" "FKPinkyFinger2_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandPinky2.jo" "FKPinkyFinger2_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKPinkyFinger2_R_orientConstraint1.w0" "FKPinkyFinger2_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKPinkyFinger3_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandPinky3.r" "FKPinkyFinger3_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandPinky3.ro" "FKPinkyFinger3_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandPinky3.pm" "FKPinkyFinger3_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandPinky3.jo" "FKPinkyFinger3_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKPinkyFinger3_R_orientConstraint1.w0" "FKPinkyFinger3_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKIndexFinger1_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandIndex1.r" "FKIndexFinger1_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandIndex1.ro" "FKIndexFinger1_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandIndex1.pm" "FKIndexFinger1_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandIndex1.jo" "FKIndexFinger1_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKIndexFinger1_R_orientConstraint1.w0" "FKIndexFinger1_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKIndexFinger2_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandIndex2.r" "FKIndexFinger2_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandIndex2.ro" "FKIndexFinger2_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandIndex2.pm" "FKIndexFinger2_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandIndex2.jo" "FKIndexFinger2_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKIndexFinger2_R_orientConstraint1.w0" "FKIndexFinger2_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKIndexFinger3_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandIndex3.r" "FKIndexFinger3_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandIndex3.ro" "FKIndexFinger3_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandIndex3.pm" "FKIndexFinger3_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandIndex3.jo" "FKIndexFinger3_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKIndexFinger3_R_orientConstraint1.w0" "FKIndexFinger3_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKThumbFinger1_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandThumb1.r" "FKThumbFinger1_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandThumb1.ro" "FKThumbFinger1_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandThumb1.pm" "FKThumbFinger1_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandThumb1.jo" "FKThumbFinger1_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKThumbFinger1_R_orientConstraint1.w0" "FKThumbFinger1_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKThumbFinger2_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandThumb2.r" "FKThumbFinger2_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandThumb2.ro" "FKThumbFinger2_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandThumb2.pm" "FKThumbFinger2_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandThumb2.jo" "FKThumbFinger2_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKThumbFinger2_R_orientConstraint1.w0" "FKThumbFinger2_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKThumbFinger3_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandThumb3.r" "FKThumbFinger3_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandThumb3.ro" "FKThumbFinger3_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandThumb3.pm" "FKThumbFinger3_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandThumb3.jo" "FKThumbFinger3_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKThumbFinger3_R_orientConstraint1.w0" "FKThumbFinger3_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKMiddleFinger1_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandMiddle1.r" "FKMiddleFinger1_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandMiddle1.ro" "FKMiddleFinger1_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandMiddle1.pm" "FKMiddleFinger1_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandMiddle1.jo" "FKMiddleFinger1_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKMiddleFinger1_R_orientConstraint1.w0" "FKMiddleFinger1_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKMiddleFinger2_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandMiddle2.r" "FKMiddleFinger2_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandMiddle2.ro" "FKMiddleFinger2_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandMiddle2.pm" "FKMiddleFinger2_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandMiddle2.jo" "FKMiddleFinger2_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKMiddleFinger2_R_orientConstraint1.w0" "FKMiddleFinger2_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKMiddleFinger3_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHandMiddle3.r" "FKMiddleFinger3_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightHandMiddle3.ro" "FKMiddleFinger3_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightHandMiddle3.pm" "FKMiddleFinger3_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightHandMiddle3.jo" "FKMiddleFinger3_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKMiddleFinger3_R_orientConstraint1.w0" "FKMiddleFinger3_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKScapula_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftShoulder.r" "FKScapula_L_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:LeftShoulder.ro" "FKScapula_L_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:LeftShoulder.pm" "FKScapula_L_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:LeftShoulder.jo" "FKScapula_L_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKScapula_L_orientConstraint1.w0" "FKScapula_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKShoulder_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftArm.r" "FKShoulder_L_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:LeftArm.ro" "FKShoulder_L_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:LeftArm.pm" "FKShoulder_L_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:LeftArm.jo" "FKShoulder_L_orientConstraint1.tg[0].tjo";
connectAttr "FKShoulder_L_orientConstraint1.w0" "FKShoulder_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKElbow_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftForeArm.r" "FKElbow_L_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:LeftForeArm.ro" "FKElbow_L_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:LeftForeArm.pm" "FKElbow_L_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:LeftForeArm.jo" "FKElbow_L_orientConstraint1.tg[0].tjo";
connectAttr "FKElbow_L_orientConstraint1.w0" "FKElbow_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKWrist_L_orientConstraint1.nds"
		;
connectAttr "mixamorig5:LeftHand.r" "FKWrist_L_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:LeftHand.ro" "FKWrist_L_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:LeftHand.pm" "FKWrist_L_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:LeftHand.jo" "FKWrist_L_orientConstraint1.tg[0].tjo";
connectAttr "FKWrist_L_orientConstraint1.w0" "FKWrist_L_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKScapula_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightShoulder.r" "FKScapula_R_orientConstraint1.tg[0].tr"
		;
connectAttr "mixamorig5:RightShoulder.ro" "FKScapula_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightShoulder.pm" "FKScapula_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightShoulder.jo" "FKScapula_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKScapula_R_orientConstraint1.w0" "FKScapula_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKShoulder_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightArm.r" "FKShoulder_R_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:RightArm.ro" "FKShoulder_R_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:RightArm.pm" "FKShoulder_R_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:RightArm.jo" "FKShoulder_R_orientConstraint1.tg[0].tjo";
connectAttr "FKShoulder_R_orientConstraint1.w0" "FKShoulder_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKElbow_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightForeArm.r" "FKElbow_R_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:RightForeArm.ro" "FKElbow_R_orientConstraint1.tg[0].tro"
		;
connectAttr "mixamorig5:RightForeArm.pm" "FKElbow_R_orientConstraint1.tg[0].tpm"
		;
connectAttr "mixamorig5:RightForeArm.jo" "FKElbow_R_orientConstraint1.tg[0].tjo"
		;
connectAttr "FKElbow_R_orientConstraint1.w0" "FKElbow_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKWrist_R_orientConstraint1.nds"
		;
connectAttr "mixamorig5:RightHand.r" "FKWrist_R_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:RightHand.ro" "FKWrist_R_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:RightHand.pm" "FKWrist_R_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:RightHand.jo" "FKWrist_R_orientConstraint1.tg[0].tjo";
connectAttr "FKWrist_R_orientConstraint1.w0" "FKWrist_R_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKHead_M_orientConstraint1.nds"
		;
connectAttr "mixamorig5:Head.r" "FKHead_M_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:Head.ro" "FKHead_M_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:Head.pm" "FKHead_M_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:Head.jo" "FKHead_M_orientConstraint1.tg[0].tjo";
connectAttr "FKHead_M_orientConstraint1.w0" "FKHead_M_orientConstraint1.tg[0].tw"
		;
connectAttr "MoCapConstraints.disableConstraints" "FKNeck_M_orientConstraint1.nds"
		;
connectAttr "mixamorig5:Neck.r" "FKNeck_M_orientConstraint1.tg[0].tr";
connectAttr "mixamorig5:Neck.ro" "FKNeck_M_orientConstraint1.tg[0].tro";
connectAttr "mixamorig5:Neck.pm" "FKNeck_M_orientConstraint1.tg[0].tpm";
connectAttr "mixamorig5:Neck.jo" "FKNeck_M_orientConstraint1.tg[0].tjo";
connectAttr "FKNeck_M_orientConstraint1.w0" "FKNeck_M_orientConstraint1.tg[0].tw"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "zombie_rig_ver2RNfosterParent1.msg" "zombie_rig_ver2RN.fp";
connectAttr "IKLeg_L_parentConstraint1.ctx" "pairBlend1.itx2";
connectAttr "IKLeg_L_parentConstraint1.cty" "pairBlend1.ity2";
connectAttr "IKLeg_L_parentConstraint1.ctz" "pairBlend1.itz2";
connectAttr "IKLeg_L_parentConstraint1.crx" "pairBlend1.irx2";
connectAttr "IKLeg_L_parentConstraint1.cry" "pairBlend1.iry2";
connectAttr "IKLeg_L_parentConstraint1.crz" "pairBlend1.irz2";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of throw.ma
