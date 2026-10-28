//Maya ASCII 2024 scene
//Name: walk.ma
//Last modified: Sat, May 18, 2024 02:30:14 PM
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
fileInfo "UUID" "10E4E90F-46FB-3100-1D86-42A35E5ED352";
createNode transform -s -n "persp";
	rename -uid "783DCE5D-494E-B9C7-B417-9E88DB654571";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 488.64724673472881 200.68018762401485 253.45958477172715 ;
	setAttr ".r" -type "double3" -10.538352730459515 -295.39999999936845 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "AB2324FA-4900-A09A-CEED-33B73CFE39B5";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 544.44792182812148;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -80.875401319482336 140.13743389250973 -4.7694100552135659 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "DE385896-40CD-9857-F815-A89011E0DD92";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "DE4731CF-484C-7161-7DEA-958192DBE880";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "4E3C9FE1-4649-BC5A-C859-258269E8CF82";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -62.571510846826769 147.20078201215429 1004.7395981784915 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "0266B5CF-4D14-3076-81C6-76B8B5D3F3A3";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1009.6503556145115;
	setAttr ".ow" 33.994244924395893;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -61.522752522577484 147.47620038625243 -4.9107574360199893 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "F1D13F6D-4CE1-1021-3022-2DACE0758DF1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 7.3293799014488039 0.6603402933296747 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "55415DFF-4BB7-7323-4A05-7EB60D81B65B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 34.325973982133746;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "07D70D05-4C78-3B84-F931-4CA96686D43A";
	setAttr -s 8 ".lnk";
	setAttr -s 8 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "B6A53DE8-4810-BE7F-4C6A-43A85804DD71";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "937293F0-45E1-B697-BA9E-BCACE6B85837";
createNode displayLayerManager -n "layerManager";
	rename -uid "AC25A26B-4DC5-EA58-7FDD-FD9DE0090729";
createNode displayLayer -n "defaultLayer";
	rename -uid "045EDD86-4955-5BFE-EAA0-8199631F1027";
	setAttr ".ufem" -type "stringArray" 0  ;
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "A8F6FFDA-4F16-74F5-7F45-3FA491B0E153";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "C5E6F3B1-495C-4BFC-BAEF-61B722CBD100";
	setAttr ".g" yes;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "6C010E3A-4040-B2F7-DE83-8CAD3BBC454B";
	setAttr ".version" -type "string" "5.3.4.1";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "4A31478C-4D27-0B70-3A87-F69CC7AECA9C";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "53364E14-4FA0-0169-C08E-50AD1E880C4C";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "F2D6822C-4ED8-8200-FA8E-B78BB6458134";
	setAttr ".ai_translator" -type "string" "maya";
	setAttr ".output_mode" 0;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "9B126685-408D-8772-37DA-2DA066D1F2B2";
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
		+ "        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n"
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
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1579\\n    -height 1043\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -bluePencil 1\\n    -greasePencils 0\\n    -excludeObjectPreset \\\"All\\\" \\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1579\\n    -height 1043\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 20 -size 20 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "49AAEE3D-4D11-F8D2-F0EF-089D425C7E58";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 33 -ast 1 -aet 33 ";
	setAttr ".st" 6;
createNode reference -n "zombie_rig_ver2RN";
	rename -uid "C81E62FC-4B10-ED6C-07A2-889039B99F4F";
	setAttr -s 120 ".phl";
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
	setAttr ".ed" -type "dataReferenceEdits" 
		"zombie_rig_ver2RN"
		"zombie_rig_ver2RN" 0
		"zombie_rig_ver2RN" 369
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"blendParent1" "blendParent1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L" 
		"blendParent1" "blendParent1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M" 
		"blendPoint1" "blendPoint1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		1 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M" 
		"blendOrient1" "blendOrient1" " -ci 1 -k 1 -dv 1 -smn 0 -smx 1 -at \"double\""
		2 "|zombie_rig_ver2:Group" "visibility" " 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKExtraNeck_M|zombie_rig_ver2:FKNeck_M" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M" 
		"Global" " -k 1 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R" 
		"rotate" " -type \"double3\" -360 360.00000000000005684 360.00000000000005684"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R" 
		"rotate" " -type \"double3\" -9.65519962652785324 63.27752667549889765 -11.82728173419621776"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R" 
		"rotate" " -type \"double3\" -362.21378034241899968 39.74284549522414522 355.53356953789136696"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetMiddleFinger1_R|zombie_rig_ver2:SDKFKMiddleFinger1_R|zombie_rig_ver2:FKExtraMiddleFinger1_R|zombie_rig_ver2:FKMiddleFinger1_R|zombie_rig_ver2:FKXMiddleFinger1_R|zombie_rig_ver2:FKOffsetMiddleFinger2_R|zombie_rig_ver2:SDKFKMiddleFinger2_R|zombie_rig_ver2:FKExtraMiddleFinger2_R|zombie_rig_ver2:FKMiddleFinger2_R|zombie_rig_ver2:FKXMiddleFinger2_R|zombie_rig_ver2:FKOffsetMiddleFinger3_R|zombie_rig_ver2:SDKFKMiddleFinger3_R|zombie_rig_ver2:FKExtraMiddleFinger3_R|zombie_rig_ver2:FKMiddleFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R" 
		"rotate" " -type \"double3\" 302.20573826293298225 -343.38619507184387203 -352.93035384256381803"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R" 
		"rotate" " -type \"double3\" 10.80451041302848125 1.61258969736176327 -3.86141570595393357"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R" 
		"rotate" " -type \"double3\" 4.62030559345030944 35.73813899151327433 15.25500901778496221"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetThumbFinger1_R|zombie_rig_ver2:FKExtraThumbFinger1_R|zombie_rig_ver2:FKThumbFinger1_R|zombie_rig_ver2:FKXThumbFinger1_R|zombie_rig_ver2:FKOffsetThumbFinger2_R|zombie_rig_ver2:SDKFKThumbFinger2_R|zombie_rig_ver2:FKExtraThumbFinger2_R|zombie_rig_ver2:FKThumbFinger2_R|zombie_rig_ver2:FKXThumbFinger2_R|zombie_rig_ver2:FKOffsetThumbFinger3_R|zombie_rig_ver2:SDKFKThumbFinger3_R|zombie_rig_ver2:FKExtraThumbFinger3_R|zombie_rig_ver2:FKThumbFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R" 
		"rotate" " -type \"double3\" -720 0 720"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R" 
		"rotate" " -type \"double3\" -362.80592036763766828 67.90227830988061442 362.22865021205029734"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R" 
		"rotate" " -type \"double3\" 1.53288483275466225 64.78165933310070557 366.76155507812933365"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetIndexFinger1_R|zombie_rig_ver2:SDKFKIndexFinger1_R|zombie_rig_ver2:FKExtraIndexFinger1_R|zombie_rig_ver2:FKIndexFinger1_R|zombie_rig_ver2:FKXIndexFinger1_R|zombie_rig_ver2:FKOffsetIndexFinger2_R|zombie_rig_ver2:SDKFKIndexFinger2_R|zombie_rig_ver2:FKExtraIndexFinger2_R|zombie_rig_ver2:FKIndexFinger2_R|zombie_rig_ver2:FKXIndexFinger2_R|zombie_rig_ver2:FKOffsetIndexFinger3_R|zombie_rig_ver2:SDKFKIndexFinger3_R|zombie_rig_ver2:FKExtraIndexFinger3_R|zombie_rig_ver2:FKIndexFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R" 
		"rotate" " -type \"double3\" 7.26636239383509874 399.04081106245746469 -360.55579574970607837"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R" 
		"rotate" " -type \"double3\" -360.30992697033661898 35.40874098333036102 357.22973249824980257"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R" 
		"rotate" " -type \"double3\" -721.04376239161831563 32.18304561395294172 714.93913781489106896"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetPinkyFinger1_R|zombie_rig_ver2:SDKFKPinkyFinger1_R|zombie_rig_ver2:FKExtraPinkyFinger1_R|zombie_rig_ver2:FKPinkyFinger1_R|zombie_rig_ver2:FKXPinkyFinger1_R|zombie_rig_ver2:FKOffsetPinkyFinger2_R|zombie_rig_ver2:SDKFKPinkyFinger2_R|zombie_rig_ver2:FKExtraPinkyFinger2_R|zombie_rig_ver2:FKPinkyFinger2_R|zombie_rig_ver2:FKXPinkyFinger2_R|zombie_rig_ver2:FKOffsetPinkyFinger3_R|zombie_rig_ver2:SDKFKPinkyFinger3_R|zombie_rig_ver2:FKExtraPinkyFinger3_R|zombie_rig_ver2:FKPinkyFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R" 
		"rotate" " -type \"double3\" -0.32230060178889186 53.86105268080348196 -8.47514152496122897"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R" 
		"rotate" " -type \"double3\" 360 359.99999999999994316 -359.99999999999982947"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R" 
		"rotate" " -type \"double3\" 364.98908853331897717 -654.54832771950884762 6.24971347290340429"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_R|zombie_rig_ver2:FKOffsetCup_R|zombie_rig_ver2:SDKFKCup_R|zombie_rig_ver2:FKExtraCup_R|zombie_rig_ver2:FKCup_R|zombie_rig_ver2:FKXCup_R|zombie_rig_ver2:FKOffsetRingFinger1_R|zombie_rig_ver2:SDKFKRingFinger1_R|zombie_rig_ver2:FKExtraRingFinger1_R|zombie_rig_ver2:FKRingFinger1_R|zombie_rig_ver2:FKXRingFinger1_R|zombie_rig_ver2:FKOffsetRingFinger2_R|zombie_rig_ver2:SDKFKRingFinger2_R|zombie_rig_ver2:FKExtraRingFinger2_R|zombie_rig_ver2:FKRingFinger2_R|zombie_rig_ver2:FKXRingFinger2_R|zombie_rig_ver2:FKOffsetRingFinger3_R|zombie_rig_ver2:SDKFKRingFinger3_R|zombie_rig_ver2:FKExtraRingFinger3_R|zombie_rig_ver2:FKRingFinger3_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L" 
		"rotate" " -type \"double3\" 1.08057583640218002 0.8676163482237369 9.14799123016685556"
		
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L|zombie_rig_ver2:FKXThumbFinger2_L|zombie_rig_ver2:FKOffsetThumbFinger3_L|zombie_rig_ver2:SDKFKThumbFinger3_L|zombie_rig_ver2:FKExtraThumbFinger3_L|zombie_rig_ver2:FKThumbFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L" 
		"translate" " -type \"double3\" 0 0 0"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L" 
		"scale" " -type \"double3\" 1 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L" 
		"blendOrient1" " -k 1 1"
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
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R" 
		"blendParent1" " -k 1 1"
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
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M" 
		"blendPoint1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M" 
		"blendOrient1" " -k 1 1"
		2 "|zombie_rig_ver2:Group|zombie_rig_ver2:Geometry|zombie_rig_ver2:geo|zombie_rig_ver2:zombie" 
		"visibility" " 1"
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
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[4]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[5]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetNeck_M|zombie_rig_ver2:FKXNeck_M|zombie_rig_ver2:FKOffsetNeckPart1_M|zombie_rig_ver2:FKInbetweenNeckPart1_M|zombie_rig_ver2:FKExtraNeckPart1_M|zombie_rig_ver2:FKNeckPart1_M|zombie_rig_ver2:FKXNeckPart1_M|zombie_rig_ver2:FKOffsetNeckPart2_M|zombie_rig_ver2:FKInbetweenNeckPart2_M|zombie_rig_ver2:FKExtraNeckPart2_M|zombie_rig_ver2:FKNeckPart2_M|zombie_rig_ver2:FKXNeckPart2_M|zombie_rig_ver2:FKOffsetHead_M|zombie_rig_ver2:FKGlobalStaticHead_M|zombie_rig_ver2:FKGlobalHead_M|zombie_rig_ver2:FKExtraHead_M|zombie_rig_ver2:FKHead_M.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[6]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[7]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[8]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[9]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[10]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[11]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[12]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[13]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[14]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[15]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[16]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[17]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_R|zombie_rig_ver2:FKExtraScapula_R|zombie_rig_ver2:FKScapula_R|zombie_rig_ver2:FKXScapula_R|zombie_rig_ver2:FKOffsetShoulder_R|zombie_rig_ver2:FKExtraShoulder_R|zombie_rig_ver2:FKShoulder_R|zombie_rig_ver2:FKXShoulder_R|zombie_rig_ver2:FKOffsetElbow_R|zombie_rig_ver2:FKExtraElbow_R|zombie_rig_ver2:FKElbow_R|zombie_rig_ver2:FKXElbow_R|zombie_rig_ver2:FKOffsetWrist_R|zombie_rig_ver2:FKExtraWrist_R|zombie_rig_ver2:FKWrist_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[18]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[19]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[20]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[21]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[22]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[23]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[24]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[25]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[26]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[27]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[28]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[29]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToChest_M|zombie_rig_ver2:FKOffsetScapula_L|zombie_rig_ver2:FKExtraScapula_L|zombie_rig_ver2:FKScapula_L|zombie_rig_ver2:FKXScapula_L|zombie_rig_ver2:FKOffsetShoulder_L|zombie_rig_ver2:FKExtraShoulder_L|zombie_rig_ver2:FKShoulder_L|zombie_rig_ver2:FKXShoulder_L|zombie_rig_ver2:FKOffsetElbow_L|zombie_rig_ver2:FKExtraElbow_L|zombie_rig_ver2:FKElbow_L|zombie_rig_ver2:FKXElbow_L|zombie_rig_ver2:FKOffsetWrist_L|zombie_rig_ver2:FKExtraWrist_L|zombie_rig_ver2:FKWrist_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[30]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[31]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[32]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[33]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[34]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[35]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[36]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[37]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[38]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[39]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[40]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[41]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_R|zombie_rig_ver2:FKExtraHip_R|zombie_rig_ver2:FKHip_R|zombie_rig_ver2:FKXHip_R|zombie_rig_ver2:FKOffsetKnee_R|zombie_rig_ver2:FKExtraKnee_R|zombie_rig_ver2:FKKnee_R|zombie_rig_ver2:FKXKnee_R|zombie_rig_ver2:FKOffsetAnkle_R|zombie_rig_ver2:FKExtraAnkle_R|zombie_rig_ver2:FKAnkle_R|zombie_rig_ver2:FKXAnkle_R|zombie_rig_ver2:FKOffsetToes_R|zombie_rig_ver2:FKExtraToes_R|zombie_rig_ver2:FKToes_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[42]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[43]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[44]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[45]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[46]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[47]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[48]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[49]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[50]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[51]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[52]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[53]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToRoot_M|zombie_rig_ver2:FKOffsetHip_L|zombie_rig_ver2:FKExtraHip_L|zombie_rig_ver2:FKHip_L|zombie_rig_ver2:FKXHip_L|zombie_rig_ver2:FKOffsetKnee_L|zombie_rig_ver2:FKExtraKnee_L|zombie_rig_ver2:FKKnee_L|zombie_rig_ver2:FKXKnee_L|zombie_rig_ver2:FKOffsetAnkle_L|zombie_rig_ver2:FKExtraAnkle_L|zombie_rig_ver2:FKAnkle_L|zombie_rig_ver2:FKXAnkle_L|zombie_rig_ver2:FKOffsetToes_L|zombie_rig_ver2:FKExtraToes_L|zombie_rig_ver2:FKToes_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[54]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[55]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[56]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKExtraSpine1_M|zombie_rig_ver2:FKSpine1_M.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[57]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[58]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[59]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKOffsetRoot_M|zombie_rig_ver2:FKXRoot_M|zombie_rig_ver2:FKOffsetRootPart1_M|zombie_rig_ver2:FKInbetweenRootPart1_M|zombie_rig_ver2:FKExtraRootPart1_M|zombie_rig_ver2:FKRootPart1_M|zombie_rig_ver2:FKXRootPart1_M|zombie_rig_ver2:FKOffsetRootPart2_M|zombie_rig_ver2:FKInbetweenRootPart2_M|zombie_rig_ver2:FKExtraRootPart2_M|zombie_rig_ver2:FKRootPart2_M|zombie_rig_ver2:FKXRootPart2_M|zombie_rig_ver2:HipSwingerStabilizer|zombie_rig_ver2:FKOffsetSpine1_M|zombie_rig_ver2:FKXSpine1_M|zombie_rig_ver2:FKOffsetSpine1Part1_M|zombie_rig_ver2:FKInbetweenSpine1Part1_M|zombie_rig_ver2:FKExtraSpine1Part1_M|zombie_rig_ver2:FKSpine1Part1_M|zombie_rig_ver2:FKXSpine1Part1_M|zombie_rig_ver2:FKOffsetSpine1Part2_M|zombie_rig_ver2:FKInbetweenSpine1Part2_M|zombie_rig_ver2:FKExtraSpine1Part2_M|zombie_rig_ver2:FKSpine1Part2_M|zombie_rig_ver2:FKXSpine1Part2_M|zombie_rig_ver2:FKOffsetChest_M|zombie_rig_ver2:FKExtraChest_M|zombie_rig_ver2:FKChest_M.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[60]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[61]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[62]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[63]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[64]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[65]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[66]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[67]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[68]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetMiddleFinger1_L|zombie_rig_ver2:SDKFKMiddleFinger1_L|zombie_rig_ver2:FKExtraMiddleFinger1_L|zombie_rig_ver2:FKMiddleFinger1_L|zombie_rig_ver2:FKXMiddleFinger1_L|zombie_rig_ver2:FKOffsetMiddleFinger2_L|zombie_rig_ver2:SDKFKMiddleFinger2_L|zombie_rig_ver2:FKExtraMiddleFinger2_L|zombie_rig_ver2:FKMiddleFinger2_L|zombie_rig_ver2:FKXMiddleFinger2_L|zombie_rig_ver2:FKOffsetMiddleFinger3_L|zombie_rig_ver2:SDKFKMiddleFinger3_L|zombie_rig_ver2:FKExtraMiddleFinger3_L|zombie_rig_ver2:FKMiddleFinger3_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[69]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[70]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[71]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[72]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[73]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[74]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetThumbFinger1_L|zombie_rig_ver2:FKExtraThumbFinger1_L|zombie_rig_ver2:FKThumbFinger1_L|zombie_rig_ver2:FKXThumbFinger1_L|zombie_rig_ver2:FKOffsetThumbFinger2_L|zombie_rig_ver2:SDKFKThumbFinger2_L|zombie_rig_ver2:FKExtraThumbFinger2_L|zombie_rig_ver2:FKThumbFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[75]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[76]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[77]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[78]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[79]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[80]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[81]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[82]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[83]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetIndexFinger1_L|zombie_rig_ver2:SDKFKIndexFinger1_L|zombie_rig_ver2:FKExtraIndexFinger1_L|zombie_rig_ver2:FKIndexFinger1_L|zombie_rig_ver2:FKXIndexFinger1_L|zombie_rig_ver2:FKOffsetIndexFinger2_L|zombie_rig_ver2:SDKFKIndexFinger2_L|zombie_rig_ver2:FKExtraIndexFinger2_L|zombie_rig_ver2:FKIndexFinger2_L|zombie_rig_ver2:FKXIndexFinger2_L|zombie_rig_ver2:FKOffsetIndexFinger3_L|zombie_rig_ver2:SDKFKIndexFinger3_L|zombie_rig_ver2:FKExtraIndexFinger3_L|zombie_rig_ver2:FKIndexFinger3_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[84]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[85]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[86]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[87]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[88]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[89]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[90]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[91]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[92]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetPinkyFinger1_L|zombie_rig_ver2:SDKFKPinkyFinger1_L|zombie_rig_ver2:FKExtraPinkyFinger1_L|zombie_rig_ver2:FKPinkyFinger1_L|zombie_rig_ver2:FKXPinkyFinger1_L|zombie_rig_ver2:FKOffsetPinkyFinger2_L|zombie_rig_ver2:SDKFKPinkyFinger2_L|zombie_rig_ver2:FKExtraPinkyFinger2_L|zombie_rig_ver2:FKPinkyFinger2_L|zombie_rig_ver2:FKXPinkyFinger2_L|zombie_rig_ver2:FKOffsetPinkyFinger3_L|zombie_rig_ver2:SDKFKPinkyFinger3_L|zombie_rig_ver2:FKExtraPinkyFinger3_L|zombie_rig_ver2:FKPinkyFinger3_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[93]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[94]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[95]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[96]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[97]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[98]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[99]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[100]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[101]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:FKSystem|zombie_rig_ver2:FKParentConstraintToWrist_L|zombie_rig_ver2:FKOffsetCup_L|zombie_rig_ver2:SDKFKCup_L|zombie_rig_ver2:FKExtraCup_L|zombie_rig_ver2:FKCup_L|zombie_rig_ver2:FKXCup_L|zombie_rig_ver2:FKOffsetRingFinger1_L|zombie_rig_ver2:SDKFKRingFinger1_L|zombie_rig_ver2:FKExtraRingFinger1_L|zombie_rig_ver2:FKRingFinger1_L|zombie_rig_ver2:FKXRingFinger1_L|zombie_rig_ver2:FKOffsetRingFinger2_L|zombie_rig_ver2:SDKFKRingFinger2_L|zombie_rig_ver2:FKExtraRingFinger2_L|zombie_rig_ver2:FKRingFinger2_L|zombie_rig_ver2:FKXRingFinger2_L|zombie_rig_ver2:FKOffsetRingFinger3_L|zombie_rig_ver2:SDKFKRingFinger3_L|zombie_rig_ver2:FKExtraRingFinger3_L|zombie_rig_ver2:FKRingFinger3_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[102]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.translateX" 
		"zombie_rig_ver2RN.placeHolderList[103]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.translateY" 
		"zombie_rig_ver2RN.placeHolderList[104]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.translateZ" 
		"zombie_rig_ver2RN.placeHolderList[105]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[106]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[107]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_R|zombie_rig_ver2:IKExtraLeg_R|zombie_rig_ver2:IKLeg_R.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[108]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.translateX" 
		"zombie_rig_ver2RN.placeHolderList[109]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.translateY" 
		"zombie_rig_ver2RN.placeHolderList[110]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.translateZ" 
		"zombie_rig_ver2RN.placeHolderList[111]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[112]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[113]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:IKSystem|zombie_rig_ver2:IKHandle|zombie_rig_ver2:IKHandleFollowMain|zombie_rig_ver2:IKOffsetLeg_L|zombie_rig_ver2:IKExtraLeg_L|zombie_rig_ver2:IKLeg_L.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[114]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.translateX" 
		"zombie_rig_ver2RN.placeHolderList[115]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.translateY" 
		"zombie_rig_ver2RN.placeHolderList[116]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.translateZ" 
		"zombie_rig_ver2RN.placeHolderList[117]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.rotateX" 
		"zombie_rig_ver2RN.placeHolderList[118]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.rotateY" 
		"zombie_rig_ver2RN.placeHolderList[119]" ""
		5 4 "zombie_rig_ver2RN" "|zombie_rig_ver2:Group|zombie_rig_ver2:MotionSystem|zombie_rig_ver2:RootSystem|zombie_rig_ver2:RootCenterBtwLegsBlended_M|zombie_rig_ver2:RootOffsetX_M|zombie_rig_ver2:RootExtraX_M|zombie_rig_ver2:RootX_M.rotateZ" 
		"zombie_rig_ver2RN.placeHolderList[120]" "";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode animCurveTA -n "FKNeck_M_rotateX1";
	rename -uid "F1C38C2D-4C23-DBA6-24C1-318013E1952F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 9.0026572384158197 1 9.0580309244208568
		 2 9.1620617276427669 3 9.3088244312553172 4 9.4696952467456725 5 9.6134746561955584
		 6 9.7231127763858023 7 9.7813124061443695 8 9.7424345383655915 9 9.5944199212900383
		 10 9.4274980432610533 11 9.3258817499035178 12 9.2473203724596313 13 9.1472473409714645
		 14 9.0606855753216049 15 9.0107231887954597 16 8.9842679093764648 17 8.9666236591325621
		 18 8.9273362433095791 19 8.8508744558346653 20 8.7729821373240053 21 8.7255834470913207
		 22 8.6929897275076424 23 8.652412663769633 24 8.605166407067637 25 8.5576074705864436
		 26 8.5215728318369077 27 8.5314298041750369 28 8.6189212859110675 29 8.7677808966473361
		 30 8.9100239658604821 31 8.9933503288924896 32 9.0026274039731042 33 9.0026274039731042
		 34 9.0026274039731042;
createNode animCurveTA -n "FKNeck_M_rotateY1";
	rename -uid "1EDC34E9-4251-02E8-7BA2-468AB96FBC7B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -3.0686418456597266 1 -3.0783369397399123
		 2 -3.1072667035847643 3 -3.1055647974365872 4 -3.0141582906801818 5 -2.8663350088213067
		 6 -2.7637726713359969 7 -2.7567143650512875 8 -2.8128874907834533 9 -2.8634265298695207
		 10 -2.848602341238593 11 -2.801453215054992 12 -2.7885061334722052 13 -2.7934224618753132
		 14 -2.7754437232729878 15 -2.7575240082027572 16 -2.7827306326528571 17 -2.8087100450701397
		 18 -2.7387104605436305 19 -2.594041805485956 20 -2.5052082199328392 21 -2.524272645863201
		 22 -2.599145728292064 23 -2.6570242067973111 24 -2.6491804385508435 25 -2.6131224256808148
		 26 -2.616854359140683 27 -2.6209943706849002 28 -2.6166337816689396 29 -2.7088614116605858
		 30 -2.8883764505968799 31 -3.0289004131771824 32 -3.0687602995493162 33 -3.0687602995493162
		 34 -3.0687602995493162;
createNode animCurveTA -n "FKNeck_M_rotateZ1";
	rename -uid "CE8A0C6F-4DC0-A176-40BA-1FBF838E1E85";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0.42638291504548664 1 18.199298688519267
		 2 17.16568263885959 3 17.322237242381402 4 17.472381693890153 5 17.56930284324115
		 6 17.552755895276846 7 17.460692121919202 8 17.401487918948341 9 17.436682743094295
		 10 17.590639774921719 11 17.768174763955326 12 17.766387779402312 13 17.584611727402038
		 14 17.433735880986053 15 17.381219296501406 16 17.304368435570016 17 17.162625185155775
		 18 17.040179385255158 19 17.007557639899638 20 17.021468608963094 21 16.971286370302266
		 22 16.863578167016016 23 16.869364532082887 24 16.984448342092367 25 16.953962501764089
		 26 16.803560349323046 27 16.934781564395159 28 17.28797893416969 29 17.407199773144121
		 30 17.261078051602265 31 17.106322226591672 32 16.964111422078176 33 16.964111422078176
		 34 16.964111422078176;
createNode animCurveTA -n "FKHead_M_rotateX1";
	rename -uid "DC38E6C2-4898-5D4F-F7C4-0C9E451F0C16";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 8.3253287770579387 1 8.3782321277443366
		 2 8.4757623227348287 3 8.6208352715962739 4 8.795569006932519 5 8.9633281981759492
		 6 9.0894677200867395 7 9.1481272375274933 8 9.0999329606522945 9 8.9450531840220862
		 10 8.782999914699662 11 8.6910601815506983 12 8.6158592172391408 13 8.516294173782887
		 14 8.4340768696637358 15 8.3879618533013538 16 8.3574322180774185 17 8.3354623173221967
		 18 8.3090295437491228 19 8.2590641323988869 20 8.1978345295682278 21 8.1477712665539137
		 22 8.1024665632246435 23 8.0522882673599998 24 8.0070868850691372 25 7.9665015979959728
		 26 7.9303354702099229 27 7.9393361123711603 28 8.0263671713480775 29 8.1569205162781842
		 30 8.2656610724812651 31 8.3231437628715028 32 8.3252719902192247 33 8.3252719902192247
		 34 8.3252719902192247;
createNode animCurveTA -n "FKHead_M_rotateY1";
	rename -uid "56FAF64B-49F7-1A45-32BB-1D9B3AF846D2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -4.6071003822441767 1 -4.6263309864638353
		 2 -4.6730155750352687 3 -4.6970077440315459 4 -4.6351292090660445 5 -4.5147061409740834
		 6 -4.4328763677590191 7 -4.4361023499905672 8 -4.4846253912709662 9 -4.508522248089367
		 10 -4.4647540079170032 11 -4.4005787551651769 12 -4.3740938518883192 13 -4.3614280467134519
		 14 -4.3285845672091456 15 -4.3022190738352801 16 -4.3223896003261633 17 -4.3448700104116984
		 18 -4.2690947263169807 19 -4.1132964469099189 20 -4.0121850031232826 21 -4.0226749376271265
		 22 -4.0906699729741627 23 -4.1405544664244482 24 -4.1245606896598934 25 -4.080708199800795
		 26 -4.0780848503329068 27 -4.083898702946402 28 -4.0949177616849388 29 -4.2117715296127738
		 30 -4.4134186821874364 31 -4.5663551591136953 32 -4.6072103078999129 33 -4.6072103078999129
		 34 -4.6072103078999129;
createNode animCurveTA -n "FKHead_M_rotateZ1";
	rename -uid "B29DCED6-4EDE-3F31-1DE4-FDA0965BE637";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -4.2735739385754732 1 -4.1997281684028112
		 2 -4.0682537990062864 3 -3.9078321276174348 4 -3.752029544834258 5 -3.6490508611059389
		 6 -3.6611631642248836 7 -3.7515058922675255 8 -3.8125779699694538 9 -3.782204694568319
		 10 -3.6326001328184345 11 -3.4571771339933504 12 -3.4608783775302618 13 -3.6453771162024649
		 14 -3.7982663150913321 15 -3.8518490532390404 16 -3.929710471727792 17 -4.0722386707390257
		 18 -4.1947455919019792 19 -4.2274741667908726 20 -4.2144921864605687 21 -4.266073542891422
		 22 -4.3755223310794538 23 -4.3714845794274977 24 -4.2574565919361307 25 -4.2886571187794154
		 26 -4.4399824521010993 27 -4.3086141594061642 28 -3.9531940504166601 29 -3.8313709712928063
		 30 -3.976344300208325 31 -4.1308743074123795 32 -4.2733919885166332 33 -4.2733919885166332
		 34 -4.2733919885166332;
createNode animCurveTA -n "FKWrist_R_rotateX1";
	rename -uid "8A3FF650-44DE-2072-1EDE-13AF0D893587";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 350.75983724262255 1 356.22272015464597
		 2 355.09308392342308 3 354.64594933146935 4 353.96495000932032 5 353.40890165906575
		 6 353.03777355076767 7 352.73498057385291 8 352.52254385964716 9 352.04240937622711
		 10 351.54738404049527 11 351.47674875102098 12 351.80971499882935 13 352.17147940800845
		 14 352.24819699483476 15 352.1318503198948 16 351.87754580877089 17 351.77680070404386
		 18 351.89017195189865 19 352.03212249974854 20 352.26457111802256 21 352.58302619546936
		 22 353.02969751842693 23 353.5855569827051 24 354.11322017498475 25 354.46591016068294
		 26 354.74131863591788 27 355.01652912840768 28 355.34212689223841 29 355.68932692262865
		 30 355.97363181078168 31 356.1541292115154 32 356.22272015464597 33 356.22272015464597
		 34 356.22272015464597;
	setAttr -s 35 ".kit[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kot[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kix[1:34]"  1 0.94956134189228369 0.97320374217670713 
		0.96803747528521367 0.98166263948168941 0.99018535072222091 0.994228133875249 0.98964313947078197 
		0.97977422470134956 0.99608369863322455 1 0.9895794603336292 0.99580961161706683 
		1 0.99700041936249562 0.99724660346316274 1 0.99857329946045115 0.99693972945237597 
		0.99340934480543086 0.98740244739859528 0.9786594885079114 0.97520451772153771 0.98342335216084487 
		0.99145818232876348 0.99341608853250341 0.99217582371376611 0.99021756342304668 0.99136647860229332 
		0.995295100622824 0.99864197218764139 1 1 1;
	setAttr -s 35 ".kiy[1:34]"  0 -0.31358134189349596 -0.22994450681252041 
		-0.25080559492050686 -0.19062649932746151 -0.13976040646446511 -0.10728661524598444 
		-0.14354949145996407 -0.20010614336114024 -0.08841530024354112 0 0.14398781783818759 
		0.091450628270485446 0 -0.077396148424892619 -0.074156671184631845 0 0.053398179787968451 
		0.078174009999638222 0.11462056383234412 0.15822896975985229 0.20548869933267211 
		0.22130555486815706 0.18132432386397238 0.13042496959303648 0.1145621012585808 0.12484844747897229 
		0.13953199306440248 0.13112019334827291 0.096889951368564445 0.05209809387279149 
		0 0 0;
	setAttr -s 35 ".kox[1:34]"  1 0.94956134189228369 0.97320374217670713 
		0.96803747528521367 0.98166263948168941 0.99018535072222091 0.994228133875249 0.98964313947078197 
		0.97977422470134956 0.99608369863322455 1 0.9895794603336292 0.99580961161706683 
		1 0.99700041936249562 0.99724660346316252 1 0.99857329946045115 0.99693972945237597 
		0.99340934480543086 0.98740244739859528 0.97865948850791129 0.97520451772153782 0.98342335216084498 
		0.99145818232876337 0.99341608853250341 0.99217582371376611 0.99021756342304668 0.99136647860229332 
		0.995295100622824 0.99864197218764139 1 1 1;
	setAttr -s 35 ".koy[1:34]"  0 -0.31358134189349596 -0.22994450681252041 
		-0.25080559492050686 -0.19062649932746153 -0.13976040646446514 -0.10728661524598444 
		-0.14354949145996404 -0.20010614336114024 -0.08841530024354112 0 0.14398781783818759 
		0.09145062827048546 0 -0.077396148424892619 -0.074156671184631831 0 0.053398179787968451 
		0.078174009999638222 0.11462056383234411 0.15822896975985229 0.20548869933267205 
		0.22130555486815706 0.18132432386397238 0.13042496959303648 0.11456210125858081 0.12484844747897229 
		0.13953199306440245 0.13112019334827291 0.096889951368564445 0.052098093872791483 
		0 0 0;
createNode animCurveTA -n "FKWrist_R_rotateY1";
	rename -uid "FEC4639C-4DC8-9871-3CEB-AF815FA9BD00";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -12.744636141446469 1 -11.720749651317828
		 2 -11.167670535875503 3 -10.699371365367384 4 -9.8627836977883216 5 -8.8408288107986124
		 6 -7.9047390792963439 7 -7.1381648258223818 8 -6.8339141362581772 9 -6.7469087482322712
		 10 -6.4418086423774845 11 -6.0522471581992212 12 -5.8655050505574513 13 -5.8046237093578048
		 14 -5.6145241484872725 15 -5.180324706515897 16 -4.7341835662931873 17 -4.7353968938747535
		 18 -5.2495054949432216 19 -5.8631324883430382 20 -6.4441983458021417 21 -7.0389385231817672
		 22 -7.7816863409532049 23 -8.6725650826453737 24 -9.4000019894898568 25 -9.6947800490186058
		 26 -9.9182520209519609 27 -10.157062115161324 28 -10.451478234713553 29 -10.833330084899307
		 30 -11.23107876126374 31 -11.557113159452557 32 -11.720749651317828 33 -11.720749651317828
		 34 -11.720749651317828;
	setAttr -s 35 ".kit[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kot[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kix[1:34]"  1 0.97787622991619827 0.96462470359777863 
		0.93189024362138273 0.92522205585128781 0.94190223564965603 0.97576143096282797 0.99665936562632051 
		0.99664491785385045 0.98958149989026067 0.99279430359663701 0.99865786636371112 0.99862130018348394 
		0.99155991047026315 0.98342381477413909 1 0.99999883762806518 0.97322190805460751 
		0.97009320268032084 0.97099089729668908 0.96293330337534089 0.94615219550128038 0.94707849513812781 
		0.97784116525819709 0.99416085803395249 0.99534562885221411 0.99382167392663179 0.99011788570433767 
		0.98693070753037115 0.98870472044468638 0.99478221311641846 1 1 1;
	setAttr -s 35 ".kiy[1:34]"  0 0.20918431816195551 0.26362697359886739 
		0.3627403669889524 0.37942607628669422 0.33588715140383052 0.2188369937770448 0.081670734717770602 
		0.081846855260856499 0.14397379996006859 0.11983100911729215 0.051792527934828823 
		0.052492845415809695 0.12964931140659391 0.18132181483505991 0 -0.001524710634375944 
		-0.22986760903300155 -0.24273272979439323 -0.23911645147703819 -0.26973960267386343 
		-0.32372213848933284 -0.32100206237172241 -0.20934816819473567 -0.1079082404323021 
		-0.096369492707963952 -0.1109886500218271 -0.14023755705363636 -0.16114520946525487 
		-0.14987653508936802 -0.10202131378883904 0 0 0;
	setAttr -s 35 ".kox[1:34]"  1 0.97787622991619849 0.96462470359777863 
		0.93189024362138262 0.92522205585128792 0.94190223564965603 0.97576143096282797 0.99665936562632051 
		0.99664491785385045 0.98958149989026079 0.9927943035966369 0.99865786636371112 0.99862130018348394 
		0.99155991047026304 0.98342381477413909 1 0.99999883762806518 0.97322190805460751 
		0.97009320268032084 0.97099089729668897 0.96293330337534089 0.94615219550128038 0.94707849513812781 
		0.97784116525819698 0.99416085803395238 0.99534562885221411 0.99382167392663179 0.99011788570433779 
		0.98693070753037127 0.98870472044468638 0.99478221311641823 1 1 1;
	setAttr -s 35 ".koy[1:34]"  0 0.20918431816195554 0.26362697359886739 
		0.3627403669889524 0.37942607628669422 0.33588715140383046 0.2188369937770448 0.081670734717770602 
		0.081846855260856499 0.14397379996006862 0.11983100911729215 0.051792527934828816 
		0.052492845415809695 0.12964931140659394 0.18132181483505991 0 -0.0015247106343759442 
		-0.22986760903300155 -0.24273272979439325 -0.23911645147703817 -0.26973960267386343 
		-0.32372213848933284 -0.32100206237172246 -0.20934816819473565 -0.1079082404323021 
		-0.096369492707963966 -0.1109886500218271 -0.14023755705363636 -0.1611452094652549 
		-0.14987653508936802 -0.10202131378883902 0 0 0;
createNode animCurveTA -n "FKWrist_R_rotateZ1";
	rename -uid "1D0EAAAE-4939-F330-FE34-42BBD5C54E4F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 3.4039763651969137 1 -339.79537856801221
		 2 -340.72977232046418 3 -341.04309837176834 4 -341.46737676999743 5 -342.06660451729402
		 6 -342.93851582588047 7 -344.08170272655173 8 -345.1954785156413 9 -345.69479380815284
		 10 -345.88916133064214 11 -346.05243420199258 12 -345.55405416842899 13 -344.41710468377602
		 14 -343.23547504948459 15 -342.33816051549132 16 -341.6414840188113 17 -341.03244577604863
		 18 -340.48317484988036 19 -340.08129753612843 20 -339.78658533006256 21 -339.50338325602939
		 22 -339.24647453087823 23 -339.02066790503028 24 -338.69239026846003 25 -338.39345868891797
		 26 -338.40462455415621 27 -338.5586032326961 28 -338.62065689070442 29 -338.68689669411822
		 30 -338.97971754917177 31 -339.47243438982753 32 -339.79537856801221 33 -339.79537856801221
		 34 -339.79537856801221;
	setAttr -s 35 ".kit[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kot[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kix[1:34]"  1 0.96751031123016518 0.98827684072223587 
		0.97778700396452012 0.95566549001477918 0.92130931955612461 0.904082785120635 0.94739320003910066 
		0.9896103828067454 0.99720644292132321 1 0.9460487974735956 0.89954782368076847 0.91685856725753645 
		0.94853768221929324 0.96458215817655446 0.97181194015485983 0.98072975990567179 0.98952449643982587 
		0.99275440678642979 0.99366262810678718 0.99492827486853852 0.99333378610907108 0.99148204382335869 
		1 0.99990157387808076 0.99897798192895626 0.99963920443502574 0.9971843050779774 
		0.98673484559554814 0.98572007846953502 1 1 1;
	setAttr -s 35 ".kiy[1:34]"  0 -0.25283155986409017 -0.1526724798124286 
		-0.20960098968775778 -0.29445453162553298 -0.38883047424170702 -0.42735736526765966 
		-0.32007206144815659 -0.14377513777105844 -0.074694780247362549 0 0.32402418551516099 
		0.4368222898515976 0.39921218373999728 0.31666427870862063 0.26378260012263954 0.23575740279458304 
		0.19536923513021062 0.14436506137396588 0.12016109106580207 0.11240365431743203 0.10058691697787406 
		0.11527354151850322 0.13024345195001358 0 -0.014030059021150027 -0.045199464832562646 
		-0.026860025251449603 -0.074989744006438874 -0.16234021217039757 -0.16839218183162138 
		0 0 0;
	setAttr -s 35 ".kox[1:34]"  1 0.96751031123016518 0.98827684072223587 
		0.97778700396452012 0.95566549001477918 0.9213093195561245 0.904082785120635 0.94739320003910077 
		0.9896103828067454 0.99720644292132321 1 0.94604879747359572 0.89954782368076847 
		0.91685856725753656 0.94853768221929324 0.96458215817655457 0.97181194015485972 0.98072975990567179 
		0.98952449643982598 0.99275440678642979 0.99366262810678718 0.99492827486853852 0.99333378610907119 
		0.99148204382335869 1 0.99990157387808076 0.99897798192895626 0.99963920443502574 
		0.9971843050779774 0.98673484559554814 0.98572007846953491 1 1 1;
	setAttr -s 35 ".koy[1:34]"  0 -0.25283155986409017 -0.15267247981242857 
		-0.20960098968775781 -0.29445453162553298 -0.38883047424170708 -0.42735736526765966 
		-0.32007206144815664 -0.14377513777105844 -0.074694780247362536 0 0.32402418551516105 
		0.43682228985159766 0.39921218373999728 0.31666427870862063 0.2637826001226396 0.23575740279458302 
		0.19536923513021062 0.14436506137396588 0.12016109106580206 0.11240365431743203 0.10058691697787407 
		0.11527354151850323 0.13024345195001358 0 -0.014030059021150027 -0.045199464832562646 
		-0.0268600252514496 -0.074989744006438874 -0.16234021217039757 -0.16839218183162138 
		0 0 0;
createNode animCurveTA -n "FKElbow_R_rotateX1";
	rename -uid "E9E894B1-4C11-F4D2-086E-7AA704EDFAA3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 720 1 713.60350437567377 2 715.8074717184893
		 3 715.32427360503698 4 714.99031924463759 5 715.13345200935771 6 715.84648188821461
		 7 717.13072570339261 8 718.22700848295187 9 719.22682896528909 10 720.45082052044972
		 11 721.85359904701329 12 722.83892686898241 13 723.2073662562575 14 723.41527667749745
		 15 723.88972536015376 16 724.58318434323985 17 725.13849744092215 18 725.29581086275869
		 19 725.11171238673296 20 724.70935600579696 21 724.13904703225319 22 723.24902961785563
		 23 722.02191442201729 24 721.15151692064887 25 720.98166721754023 26 720.61050965585753
		 27 720.05960397637955 28 719.49557793369286 29 718.77792809966013 30 717.78693156135409
		 31 716.66756748787509 32 715.99459226179999 33 715.99459226179999 34 715.99459226179999;
createNode animCurveTA -n "FKElbow_R_rotateY1";
	rename -uid "81415C33-4311-F56E-C402-61BDE61187A5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -6.0430538947806803e-14 1 44.413382938391585
		 2 41.994329988964488 3 42.543912741951907 4 43.259059995530563 5 43.806136179088654
		 6 44.149988565456383 7 44.993774062129638 8 47.031792551269263 9 49.37586696513948
		 10 50.694523946771994 11 50.478064860726072 12 49.581895663906451 13 48.828600818954897
		 14 48.070589605419251 15 46.954479195920563 16 45.608252396652318 17 44.3177677566988
		 18 43.300843192115501 19 42.761152972052209 20 42.491967756652308 21 42.234015713036321
		 22 42.016313359422405 23 41.833922075895515 24 41.364348811350602 25 40.691422421035981
		 26 40.406663945971687 27 40.298276849683923 28 40.077767255483472 29 39.913971671686348
		 30 40.089339574054911 31 40.546293162734003 32 40.867208287411088 33 40.867208287411088
		 34 40.867208287411088;
createNode animCurveTA -n "FKElbow_R_rotateZ1";
	rename -uid "2AC8C011-498C-1210-1009-EF943282D5D8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -720 1 -675.77927149678374 2 -679.76009053878943
		 3 -679.90021908485221 4 -680.04458669224914 5 -680.23774900505225 6 -680.46538129491205
		 7 -680.96654301082083 8 -681.45626166785917 9 -681.87680979357094 10 -682.41242883283735
		 11 -683.20958804471081 12 -683.79198193142247 13 -683.85114341361884 14 -683.71709693541209
		 15 -683.71285948293496 16 -683.93547774224453 17 -684.41584489911577 18 -684.96086703358196
		 19 -685.25259153537968 20 -685.3441984822208 21 -685.32716994541966 22 -685.11582206251444
		 23 -684.58927856220498 24 -684.37342182639031 25 -684.60444437512854 26 -684.38522136086499
		 27 -683.88992507189084 28 -683.44142837936579 29 -682.79948848744129 30 -681.67741499919532
		 31 -680.23743513935017 32 -679.33100737875532 33 -679.33100737875532 34 -679.33100737875532;
createNode animCurveTA -n "FKShoulder_R_rotateX1";
	rename -uid "35555B03-4DB0-83D2-54E8-9D9A2A0439BF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 1.5902773407317584e-14 1 -138.12517568041173
		 2 -139.88549259738286 3 -140.46589945555317 4 -140.88946259663919 5 -141.47830272816586
		 6 -142.44136965739165 7 -144.1370625996106 8 -146.40764386155652 9 -147.68571167370587
		 10 -147.97574527884461 11 -148.01381887530772 12 -147.82971789569615 13 -147.17264954739815
		 14 -146.14050556806546 15 -144.85721231556488 16 -143.69967324828539 17 -143.47091944303355
		 18 -144.31381774674728 19 -145.21130418409447 20 -145.3540048914694 21 -144.85726313775808
		 22 -144.13348168425782 23 -143.26940371833058 24 -142.09343438786937 25 -140.79852365766453
		 26 -139.9217994822553 27 -139.21271262945245 28 -138.36222050133506 29 -137.64415781078782
		 30 -137.4741174688528 31 -137.82030449036949 32 -138.12517568041173 33 -138.12517568041173
		 34 -138.12517568041173;
	setAttr -s 35 ".kit[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kot[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kix[1:34]"  1 0.89790512089008456 0.97860012676255759 
		0.97825079542194948 0.95102549867125608 0.87367697454295512 0.76921861730038754 0.80260160085944643 
		0.95007373120539573 0.99885740398177747 1 0.98483349114722962 0.94273957082996829 
		0.89978035235246501 0.8904001788868825 0.9610793818344292 1 0.93953093939245691 0.98429929513408942 
		1 0.96884646192718415 0.94890307188578527 0.91957894600937684 0.88812392948608332 
		0.91027019919400631 0.94902491785458842 0.9505754833427621 0.95004698325058545 0.98313758829462106 
		1 0.99083100680331015 1 1 1;
	setAttr -s 35 ".kiy[1:34]"  0 -0.44018904334315573 -0.20577121251600283 
		-0.20742560414838621 -0.30911244050844772 -0.48650646876836934 -0.63898569530035643 
		-0.59651544011689583 -0.31202548817918324 -0.047790025222676294 0 0.17350214613877124 
		0.33352976117781064 0.43634311902500988 0.45517855995005685 0.27627236889119322 0 
		-0.34246403303752587 -0.176507500119782 0 0.24766213519869593 0.31556767921591755 
		0.39290528382331968 0.45960405337007032 0.41401469111530842 0.31520105534577691 0.31049355946246937 
		0.31210692016753155 0.18286739042879163 0 -0.13510705369128082 0 0 0;
	setAttr -s 35 ".kox[1:34]"  1 0.89790512089008456 0.97860012676255759 
		0.97825079542194959 0.95102549867125619 0.87367697454295523 0.76921861730038765 0.80260160085944632 
		0.95007373120539573 0.99885740398177758 1 0.98483349114722973 0.94273957082996818 
		0.89978035235246501 0.8904001788868825 0.96107938183442909 1 0.93953093939245691 
		0.98429929513408931 1 0.96884646192718415 0.94890307188578527 0.91957894600937695 
		0.88812392948608332 0.91027019919400631 0.94902491785458842 0.9505754833427621 0.95004698325058534 
		0.98313758829462106 1 0.99083100680331027 1 1 1;
	setAttr -s 35 ".koy[1:34]"  0 -0.44018904334315573 -0.2057712125160028 
		-0.20742560414838623 -0.30911244050844777 -0.48650646876836945 -0.63898569530035643 
		-0.59651544011689583 -0.31202548817918324 -0.047790025222676308 0 0.17350214613877127 
		0.33352976117781058 0.43634311902500988 0.45517855995005685 0.27627236889119317 0 
		-0.34246403303752587 -0.17650750011978197 0 0.24766213519869593 0.31556767921591755 
		0.39290528382331968 0.45960405337007032 0.41401469111530842 0.31520105534577691 0.31049355946246937 
		0.31210692016753155 0.18286739042879166 0 -0.13510705369128084 0 0 0;
createNode animCurveTA -n "FKShoulder_R_rotateY1";
	rename -uid "E9915270-4A8A-CF96-A75B-A8AF51DF8D2B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -1.2722218725854067e-14 1 -252.11834299091174
		 2 -252.0417663465046 3 -252.17327358328436 4 -252.08512011075973 5 -251.97029281302676
		 6 -252.01680031607503 7 -251.82568536528962 8 -250.64017518494416 9 -248.91311411226883
		 10 -247.57635272999403 11 -247.22309847111202 12 -247.53787846121531 13 -247.87362971770969
		 14 -248.09736403483873 15 -248.51366884324841 16 -249.20176047609087 17 -249.91320079844931
		 18 -250.36961648264833 19 -250.46801079791351 20 -250.47948665188034 21 -250.63050601410751
		 22 -250.87088223729634 23 -251.11961191752286 24 -251.47817358018764 25 -251.83914705888043
		 26 -251.98764341241161 27 -252.03569209831804 28 -252.14908147466582 29 -252.28779863690087
		 30 -252.29787349096421 31 -252.17408241615925 32 -252.11834299091174 33 -252.11834299091174
		 34 -252.11834299091174;
	setAttr -s 35 ".kit[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kot[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kix[1:34]"  1 1 1 0.99909757973341751 1 1 0.97235151578262957 
		0.85370076458686173 0.84162674029333917 0.94268969035923278 1 0.99084564041008927 
		0.99320451403174004 0.99113466860867594 0.97427686209941877 0.95962495927052893 0.97136522110094603 
		0.9933164867131965 0.99989603383449033 0.99989603383449033 0.99665699483667569 0.99479415302291874 
		0.99200808721603762 0.98883471120020139 0.99435537781929939 0.99915382556427712 0.99942888057889667 
		0.99860893150541474 0.99991986632588559 1 0.99929383937069083 1 1 1;
	setAttr -s 35 ".kiy[1:34]"  0 0 0 0.042473829246109041 0 0 0.23352201128635119 
		0.52076386639609284 0.54005965413388191 0.33367071746021382 0 -0.13499969214898158 
		-0.11638210045782384 -0.13286108791504847 -0.22535437865217989 -0.28128266484985459 
		-0.23759126085677132 -0.11542251610388676 -0.014419484111991242 -0.014419484111991244 
		-0.081699661217944405 -0.10190482378873816 -0.12617430363579732 -0.14901648877092161 
		-0.10610081338914611 -0.041129464624161401 -0.033792198283237443 -0.052727620064004208 
		-0.012659420477382556 0 0.037574227813539127 0 0 0;
	setAttr -s 35 ".kox[1:34]"  1 1 1 0.9990975797334174 1 1 0.97235151578262957 
		0.85370076458686173 0.84162674029333917 0.94268969035923267 1 0.99084564041008949 
		0.99320451403174004 0.99113466860867594 0.97427686209941877 0.95962495927052893 0.97136522110094592 
		0.9933164867131965 0.99989603383449033 0.99989603383449033 0.99665699483667569 0.99479415302291874 
		0.9920080872160375 0.98883471120020139 0.99435537781929939 0.99915382556427712 0.99942888057889667 
		0.99860893150541452 0.99991986632588559 1 0.99929383937069083 1 1 1;
	setAttr -s 35 ".koy[1:34]"  0 0 0 0.042473829246109027 0 0 0.23352201128635117 
		0.52076386639609284 0.54005965413388191 0.33367071746021376 0 -0.13499969214898161 
		-0.11638210045782384 -0.13286108791504847 -0.22535437865217989 -0.28128266484985459 
		-0.23759126085677129 -0.11542251610388676 -0.014419484111991244 -0.014419484111991242 
		-0.081699661217944405 -0.10190482378873816 -0.12617430363579735 -0.14901648877092161 
		-0.10610081338914609 -0.041129464624161401 -0.033792198283237443 -0.052727620064004201 
		-0.012659420477382556 0 0.037574227813539127 0 0 0;
createNode animCurveTA -n "FKShoulder_R_rotateZ1";
	rename -uid "A2D8078D-46E7-5DF0-1D18-B8B9E016C88D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 1.7655625192200634e-30 1 -228.44233368901683
		 2 -226.01489784296859 3 -225.47093808048885 4 -225.33419471351257 5 -224.78255575628941
		 6 -223.38485704738375 7 -220.86076166882677 8 -217.82181510741 9 -216.48971319883722
		 10 -216.28529498224057 11 -215.72942688867693 12 -215.19345603486892 13 -215.56669110659243
		 14 -216.70161612770201 15 -218.12473470580957 16 -219.08744519816821 17 -218.56379900535634
		 18 -216.69833916415354 19 -215.12013448857539 20 -214.84257792058995 21 -215.60985771537651
		 22 -216.85947674539327 23 -218.45656541159434 24 -220.20349647743316 25 -221.69910871441755
		 26 -222.89333075383712 27 -224.01860898388023 28 -225.3161962540625 29 -226.63795210688298
		 30 -227.61131707996813 31 -228.14354338612694 32 -228.44233368901683 33 -228.44233368901683
		 34 -228.44233368901683;
	setAttr -s 35 ".kit[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kot[1:34]"  1 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 
		18 18 18 18 18 18 18 18 18;
	setAttr -s 35 ".kix[1:34]"  1 0.84901645434986228 0.98998978735798226 
		0.98976613245572398 0.92581360875038199 0.77274518166454298 0.65128872077767186 0.73759355351478995 
		0.96855442426740213 0.98755837159398174 0.9748367363416951 1 0.953561075508501 0.88146488472873774 
		0.8945392050265959 1 0.89429365182432174 0.8110574068906975 0.94421466874877624 1 
		0.92118482315775163 0.85892460106454627 0.81908957246391401 0.827266137049672 0.87125608845941704 
		0.89947962446341323 0.89175621724080578 0.87673594143097333 0.90128066682619945 0.95370833163711499 
		0.98518935012594366 1 1 1;
	setAttr -s 35 ".kiy[1:34]"  0 0.52836640718651695 0.14113901277427451 
		0.14269899454319337 0.37798037231130754 0.6347163809247659 0.75883002193362359 0.67524495541501417 
		0.24880178301620129 0.15725286227806251 0.22292002484898557 0 -0.3011997265521183 
		-0.4722495706616926 -0.44698949727078158 0 0.44748057422274634 0.58496656547852166 
		0.32933062311245648 0 -0.38912532889009155 -0.51210206959756577 -0.57366564502407025 
		-0.56181023352277348 -0.4908287158697997 -0.43696270455858921 -0.45251613121784795 
		-0.48097202517729115 -0.43323568597856932 -0.30073313446634153 -0.17146995188201569 
		0 0 0;
	setAttr -s 35 ".kox[1:34]"  1 0.84901645434986228 0.98998978735798249 
		0.98976613245572398 0.92581360875038188 0.77274518166454298 0.65128872077767186 0.73759355351478995 
		0.96855442426740213 0.98755837159398163 0.9748367363416951 1 0.953561075508501 0.88146488472873774 
		0.8945392050265959 1 0.89429365182432174 0.8110574068906975 0.94421466874877624 1 
		0.92118482315775163 0.85892460106454627 0.81908957246391401 0.82726613704967211 0.87125608845941693 
		0.89947962446341334 0.89175621724080578 0.87673594143097333 0.90128066682619934 0.95370833163711499 
		0.98518935012594366 1 1 1;
	setAttr -s 35 ".koy[1:34]"  0 0.52836640718651695 0.14113901277427451 
		0.1426989945431934 0.37798037231130749 0.6347163809247659 0.75883002193362359 0.67524495541501428 
		0.24880178301620129 0.15725286227806251 0.2229200248489856 0 -0.3011997265521183 
		-0.4722495706616926 -0.44698949727078158 0 0.44748057422274634 0.58496656547852166 
		0.32933062311245648 0 -0.38912532889009155 -0.51210206959756577 -0.57366564502407036 
		-0.56181023352277337 -0.49082871586979965 -0.43696270455858921 -0.45251613121784795 
		-0.48097202517729115 -0.43323568597856926 -0.30073313446634153 -0.17146995188201566 
		0 0 0;
createNode animCurveTA -n "FKScapula_R_rotateX1";
	rename -uid "7409D98D-4C44-3147-7B34-F385B356F139";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -1.9283565196463717 1 -1.6500473805050164
		 2 -1.6510164588270664 3 -1.6954466218526298 4 -1.7449209708022917 5 -1.7402772232007995
		 6 -1.7106555841176618 7 -1.7330904325569008 8 -1.7946990413734514 9 -1.7986953218192863
		 10 -1.6864733137544559 11 -1.5115163963902052 12 -1.381535815346884 13 -1.3437100972888192
		 14 -1.3707876468227314 15 -1.4084766980205616 16 -1.4372773410269952 17 -1.458211888842712
		 18 -1.4622051748158862 19 -1.4661481168232198 20 -1.4845948496011994 21 -1.5090140249199822
		 22 -1.528770453769523 23 -1.551298142425042 24 -1.5742584460757878 25 -1.5960137005154338
		 26 -1.6166394309143965 27 -1.6380553460259937 28 -1.660190287007216 29 -1.6814392815672852
		 30 -1.699092797883424 31 -1.71558603362517 32 -1.7257355536083099 33 -1.7257355536083099
		 34 -1.7257355536083099;
createNode animCurveTA -n "FKScapula_R_rotateY1";
	rename -uid "6C25D258-41E1-3E7C-95EA-399E8F166CF9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 3.5028152382704749 1 3.9921614977754216
		 2 4.0201276158592796 3 3.8691360498379059 4 3.7297768125252633 5 3.8141291642865509
		 6 3.9663054589958087 7 3.8288355782886869 8 3.3753297201805474 9 3.0608452295991833
		 10 3.3740089170537946 11 4.172606416912628 12 4.8126828714030738 13 4.9963343388368502
		 14 4.9291699081771698 15 4.8388720577548563 16 4.7470023656938167 17 4.6743717725765066
		 18 4.6615059180792908 19 4.617877856234081 20 4.5029669450387475 21 4.3796602587771281
		 22 4.3009794400011865 23 4.2256114818960802 24 4.1562603225514518 25 4.093548634804967
		 26 4.0356731231249947 27 3.9791954530036646 28 3.9260921019791484 29 3.8775231021318697
		 30 3.8387282146474022 31 3.811719998551419 32 3.8011450017970265 33 3.8011450017970265
		 34 3.8011450017970265;
createNode animCurveTA -n "FKScapula_R_rotateZ1";
	rename -uid "A244EAA1-4C6A-F99E-B5DC-A986A0AB3024";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 720.07170002510372 1 716.27912500193167
		 2 716.47248924012706 3 716.57610575761578 4 716.73006453326434 5 716.80782347647744
		 6 716.80754708407767 7 716.7756841611515 8 716.58203749849599 9 716.1602117613952
		 10 715.80014337667569 11 715.7152045312364 12 715.72620705315421 13 715.72495218899689
		 14 715.80889889164428 15 715.93273932692034 16 715.99744779074626 17 716.02830933908456
		 18 716.04432364713114 19 716.01751453940039 20 715.98680311800229 21 715.99307547913088
		 22 716.04747776938029 23 716.11430514402912 24 716.18651255691714 25 716.25621340255668
		 26 716.32217281027511 27 716.39127819441592 28 716.46523307678092 29 716.53691587274739
		 30 716.59850900580147 31 716.64405090296441 32 716.66350579560969 33 716.66350579560969
		 34 716.66350579560969;
createNode animCurveTA -n "FKMiddleFinger3_L_rotateX1";
	rename -uid "976EB706-4233-9147-6FBB-A186C00733E2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -2.4043428486379579 1 -2.4465893307195059
		 2 -2.553140340073405 3 -2.6966595778328677 4 -2.8613600042072527 5 -3.009895493944879
		 6 -3.1027049148490797 7 -3.1051189729570345 8 -3.0283984171507785 9 -2.8927625944991764
		 10 -2.7209028720254711 11 -2.5298065269175147 12 -2.3299607056887468 13 -2.1335124000905861
		 14 -1.9495103795163571 15 -1.7843814131019233 16 -1.6423985128062906 17 -1.5257218464198452
		 18 -1.4353577526951506 19 -1.3750064747633246 20 -1.3413277205651988 21 -1.3366415121473323
		 22 -1.3638652793568362 23 -1.4198369089013723 24 -1.5050073518967397 25 -1.614534635250283
		 26 -1.7444074708081645 27 -1.8884468473475216 28 -2.0378695431418925 29 -2.1809919182253936
		 30 -2.3034291479331541 31 -2.3836394156668139 32 -2.416000842153335 33 -2.416000842153335
		 34 -2.416000842153335;
createNode animCurveTA -n "FKMiddleFinger3_L_rotateY1";
	rename -uid "F22D12A0-412A-9FDD-78C1-549A01F7B040";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 35.650339357421458 1 35.932648306083607
		 2 36.654069569773164 3 37.61682995101323 4 38.621399543530728 5 39.476809110169427
		 6 39.986581172266348 7 40.002217033171924 8 39.584063705570379 9 38.815409285136433
		 10 37.757221898198139 11 36.47285563916364 12 35.026553790405451 13 33.480164038762119
		 14 31.895778451948047 15 30.337687555118535 16 28.870278752455555 17 27.556043984126713
		 18 26.457545233463843 19 25.638492798038381 20 25.164303318690468 21 25.09992725529942
		 22 25.4793377465517 23 26.237814941408288 24 27.284398983546957 25 28.533772531955222
		 26 29.900041958673352 27 31.294595546009699 28 32.629008131831156 29 33.817748585445713
		 30 34.775642077983932 31 35.415817499910467 32 35.647691812998708 33 35.647691812998708
		 34 35.647691812998708;
createNode animCurveTA -n "FKMiddleFinger3_L_rotateZ1";
	rename -uid "ECDF6C79-4D48-7FAD-0191-2CA7771415FB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -6.5645213721180387 1 -6.6429969901820076
		 2 -6.8392753388259981 3 -7.1015323939499666 4 -7.385716061762297 5 -7.6341755227664478
		 6 -7.791017445470569 7 -7.7953390535970106 8 -7.6688860226025817 9 -7.4432569564511724
		 10 -7.1436887938022755 11 -6.7945707473782742 12 -6.4143002599857137 13 -6.0217338549136654
		 14 -5.6332333894180122 15 -5.2633826621609225 16 -4.9251629249561537 17 -4.6298440984056608
		 18 -4.3877870426650762 19 -4.2151877450911535 20 -4.1184573427742928 21 -4.1035894531993415
		 22 -4.1820800108680665 23 -4.3429441787735872 24 -4.5735642503944991 25 -4.8539892641988738
		 26 -5.1677684240121406 27 -5.4964376151730523 28 -5.8197215722132203 29 -6.11558001922584
		 30 -6.359525237947782 31 -6.5175795628003437 32 -6.5791845464669274 33 -6.5791845464669274
		 34 -6.5791845464669274;
createNode animCurveTA -n "FKMiddleFinger2_L_rotateX1";
	rename -uid "601BEBF5-4E04-CF2A-2D3F-BF9ED72B9D11";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -1.3544306143362548 1 -1.3801637799610562
		 2 -1.441147237314196 3 -1.5282255358008723 4 -1.6281807779832274 5 -1.7123889526593157
		 6 -1.7686953640833947 7 -1.7717040931399695 8 -1.7242575347548212 9 -1.6484825157896741
		 10 -1.5461027738274118 11 -1.4266662052752979 12 -1.3033573168228032 13 -1.1835773873457596
		 14 -1.0731122561078048 15 -0.97604712520588965 16 -0.89458137351303546 17 -0.82957117406359471
		 18 -0.78327837435331771 19 -0.75330033397151053 20 -0.73510139659598794 21 -0.73377645518054779
		 22 -0.74758796558920881 23 -0.77468538045112645 24 -0.82052706535050512 25 -0.88220497485315508
		 26 -0.95703134840441184 27 -1.0420049593685627 28 -1.1317102930613874 29 -1.21904328019667
		 30 -1.2924042648524185 31 -1.3443098612644455 32 -1.3654563518745029 33 -1.3654563518745029
		 34 -1.3654563518745029;
createNode animCurveTA -n "FKMiddleFinger2_L_rotateY1";
	rename -uid "8DBBC8ED-4932-13A2-41A5-2C8A9219E6BB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 28.294285420058372 1 28.578084431873521
		 2 29.30458804819375 3 30.272284271905352 4 31.28196579197142 5 32.143550125838502
		 6 32.657517637456188 7 32.672745744507431 8 32.251813236355737 9 31.477226669836476
		 10 30.412741687622674 11 29.122701832627069 12 27.670405405561691 13 26.118077645458541
		 14 24.52817259983393 15 22.965073108767903 16 21.493295481326122 17 20.175416746466517
		 18 19.073177067714692 19 18.251523450912693 20 17.776554954217652 21 17.711943913366426
		 22 18.092001502646731 23 18.853048701717306 24 19.902418586233285 25 21.154977687340509
		 26 22.525035244162893 27 23.923800279219027 28 25.262535378380065 29 26.455426943013222
		 30 27.417198926366737 31 28.059494619107927 32 28.292192765080294 33 28.292192765080294
		 34 28.292192765080294;
createNode animCurveTA -n "FKMiddleFinger2_L_rotateZ1";
	rename -uid "B338D2AB-4035-BB18-0138-9F99D8050769";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -5.3667644564725379 1 -5.4310877904239696
		 2 -5.5826502333614458 3 -5.795083858538133 4 -6.0265334070617254 5 -6.2175496863918598
		 6 -6.3372698112283841 7 -6.3430623162009798 8 -6.2433448043664646 9 -6.0722245841416305
		 10 -5.8340615938057487 11 -5.5455658270231032 12 -5.2289420715044743 13 -4.8988194535240863
		 14 -4.5687601488426095 15 -4.251505608116144 16 -3.9587234947304455 17 -3.701189193923287
		 18 -3.4942817933351522 19 -3.3462657758336301 20 -3.2593365930238059 21 -3.2464738502867707
		 22 -3.3170801720719458 23 -3.4539699093215699 24 -3.6562929285710042 25 -3.9028501754504807
		 26 -4.1763686977774075 27 -4.4604780730788161 28 -4.7374673618008067 29 -4.9890507405840561
		 30 -5.192907970630487 31 -5.3265066167508159 32 -5.3791362647943215 33 -5.3791362647943215
		 34 -5.3791362647943215;
createNode animCurveTA -n "FKMiddleFinger1_L_rotateX1";
	rename -uid "E3DA4074-4657-A075-79CD-BA917F0CCD68";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -3.5260212859928566 1 -3.6561524502470419
		 2 -3.9578425924779492 3 -4.3780194665225478 4 -4.8451279593886278 5 -5.2661590173221109
		 6 -5.5265769205222099 7 -5.5493210247927749 8 -5.4134946429031245 9 -5.1729232186579184
		 10 -4.8577260369814681 11 -4.4994073056970691 12 -4.1264721516028384 13 -3.7621528880284125
		 14 -3.4243592612568383 15 -3.1259666408020981 16 -2.8745428220755849 17 -2.673105637530365
		 18 -2.5215944787436855 19 -2.4185260628234144 20 -2.3625545293109247 21 -2.3524236757085202
		 22 -2.3723924192963031 23 -2.4136520583835646 24 -2.4749555818339939 25 -2.5540200445927517
		 26 -2.6485238059550298 27 -2.7538025318171657 28 -2.8649027324968408 29 -3.0310336757588985
		 30 -3.2565615108741364 31 -3.4594557020693602 32 -3.5468846418423925 33 -3.5468846418423925
		 34 -3.5468846418423925;
createNode animCurveTA -n "FKMiddleFinger1_L_rotateY1";
	rename -uid "578C9A73-4EDC-25C9-2C5B-FAB5B1C3E5AA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 25.33104343148829 1 24.366960790309857
		 2 25.066741039108813 3 25.88917270860885 4 26.741743297637015 5 27.462358328128811
		 6 27.891000357976079 7 27.896956208442926 8 27.508132193765665 9 26.792551789580976
		 10 25.805831165126921 11 24.605756110639813 12 23.250682038930389 13 21.797945925751335
		 14 20.305843996592628 15 18.835282976774316 16 17.447814775033123 17 16.203372286503953
		 18 15.162074275358716 19 14.385819639432546 20 13.936434162282804 21 13.877381431996662
		 22 14.255075032023235 23 15.010355124700862 24 16.053512043647196 25 17.299093055076554
		 26 18.661294402257209 27 20.051866258454478 28 21.381848211151606 29 22.537232067220021
		 30 23.427996086557521 31 24.000224952256076 32 24.202260145748408 33 24.202260145748408
		 34 24.202260145748408;
createNode animCurveTA -n "FKMiddleFinger1_L_rotateZ1";
	rename -uid "D9BBDFF1-429B-5AC9-F778-1CBB0DB9882A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -6.1433582126814255 1 -12.703029108576976
		 2 -12.932426150929379 3 -13.799019454366482 4 -14.717610949672169 5 -15.511651798530043
		 6 -15.988456599490735 7 -16.032401442553162 8 -15.8008444261752 9 -15.382726415637373
		 10 -14.817158423524967 11 -14.145268462817715 12 -13.40591926877215 13 -12.633938522005716
		 14 -11.860947628145093 15 -11.116725557705776 16 -10.428762146363249 17 -9.8222351708888809
		 18 -9.3214681136726654 19 -8.951839204778052 20 -8.7391948875113403 21 -8.6991100872294691
		 22 -8.782087402770248 23 -8.948840145466562 24 -9.1805724587372914 25 -9.4594090935995681
		 26 -9.7687800342051165 27 -10.089607328871471 28 -10.40572587072583 29 -10.835678608396595
		 30 -11.378216686064691 31 -11.844299692975236 32 -12.040669727145438 33 -12.040669727145438
		 34 -12.040669727145438;
createNode animCurveTA -n "FKThumbFinger2_L_rotateX1";
	rename -uid "DBD30EFF-4CB9-072E-6FEE-819B7BD2F795";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 9.8027278881902511 1 9.7941572714615557
		 2 9.7721392528435516 3 9.742281697869668 4 9.7105053171347535 5 9.682924825079537
		 6 9.6664074191219775 7 9.6643807448409174 8 9.6698192429178338 9 9.6796515351097998
		 10 9.6931198325916572 11 9.709278533964266 12 9.7272530909605628 13 9.7462614860239682
		 14 9.7654870976139225 15 9.7841812045700358 16 9.801521408167984 17 9.8169243586984045
		 18 9.8296562837571866 19 9.8390785048387031 20 9.844356675188072 21 9.845304188491431
		 22 9.8453588834223993 23 9.8454681709289069 24 9.8455143307787374 25 9.8455843753099028
		 26 9.8456138542696223 27 9.845627044936677 28 9.8454926435579093 29 9.8385904546940885
		 30 9.8239396338120262 31 9.8093057629018734 32 9.8027098158231691 33 9.8027098158231691
		 34 9.8027098158231691;
createNode animCurveTA -n "FKThumbFinger2_L_rotateY1";
	rename -uid "05BD08A8-4C6C-0A13-4C6E-2D9DBC26D883";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 6.0166951856016873 1 6.1317460115511038
		 2 6.4252229803876206 3 6.8166245176816505 4 7.2254742389085482 5 7.5737849181565657
		 6 7.7801097336147995 7 7.8049073501441537 8 7.7373558633900901 9 7.6146636854231691
		 10 7.4459028447417657 11 7.2413052902969524 12 7.0110760901946323 13 6.7650667417387842
		 14 6.5131766556018569 15 6.2656123753930055 16 6.0325788500061099 17 5.8239318302417313
		 18 5.6495911324196557 19 5.5197748305145096 20 5.4448586630752365 21 5.4278760985933268
		 22 5.4288183690575647 23 5.4286934202034738 24 5.4286165695946025 25 5.4285668116558234
		 26 5.4285409370417961 27 5.4283439295814926 28 5.4305441839721516 29 5.5264826058613963
		 30 5.7280436133683308 31 5.927386011637414 32 6.0166901679088474 33 6.0166901679088474
		 34 6.0166901679088474;
createNode animCurveTA -n "FKThumbFinger2_L_rotateZ1";
	rename -uid "BD8C2EE1-457A-8AF2-841A-9DB00182CC1B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -2.5941182492116002 1 -2.600350099713499
		 2 -2.6163027959503098 3 -2.6377477036902444 4 -2.6604057159776802 5 -2.6798580658329803
		 6 -2.6914657049364972 7 -2.6928462724562903 8 -2.6890809299984308 9 -2.6821666332812124
		 10 -2.6726884195453358 11 -2.6612668546479323 12 -2.6484676897379762 13 -2.63491391312215
		 14 -2.621101779391839 15 -2.6075885022308443 16 -2.5949914489095014 17 -2.583729172116211
		 18 -2.5743848379158978 19 -2.567392711019818 20 -2.5642750767451208 21 -2.565100194184545
		 22 -2.5643459460649103 23 -2.5638021715377151 24 -2.5633435195669843 25 -2.563013850374424
		 26 -2.5627811795009587 27 -2.5626380274284912 28 -2.5626906945321593 29 -2.5678272169358953
		 30 -2.5786049196709708 31 -2.5892954738030811 32 -2.5941368736344255 33 -2.5941368736344255
		 34 -2.5941368736344255;
createNode animCurveTA -n "FKThumbFinger1_L_rotateX1";
	rename -uid "D6F7C259-4CED-15C9-2229-1085B0DE1993";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -25.07480414538249 1 -25.08317217712014
		 2 -25.09882621605373 3 -25.118390657916486 4 -25.137031957001156 5 -25.152363261113184
		 6 -25.168821928552244 7 -25.17240580423238 8 -25.165007918925379 9 -25.152826607553628
		 10 -25.145552072583943 11 -25.136877261349518 12 -25.12647084566807 13 -25.114727124261471
		 14 -25.102008911024519 15 -25.088806466122854 16 -25.075718016122323 17 -25.063512984067405
		 18 -25.052853326973807 19 -25.045223636444447 20 -25.037157843220555 21 -25.034956120706763
		 22 -25.035542506786513 23 -25.035839348489354 24 -25.036023070953629 25 -25.036177865686252
		 26 -25.036248977656697 27 -25.036245038641908 28 -25.036636649596055 29 -25.044007229877359
		 30 -25.05618927873622 31 -25.067755330711211 32 -25.074515520481469 33 -25.074515520481469
		 34 -25.074515520481469;
createNode animCurveTA -n "FKThumbFinger1_L_rotateY1";
	rename -uid "09F20909-4391-C813-EEED-438F8D2D5413";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 12.270655407430004 1 12.177890970299904
		 2 11.941126983806392 3 11.624075461420107 4 11.2912612976637 5 11.006397947644258
		 6 10.836618695539958 7 10.81584809059934 8 10.871729663812978 9 10.97287273626614
		 10 11.111157000589653 11 11.278393876697733 12 11.466066812653665 13 11.666010591337859
		 14 11.87011985472115 15 12.070118663822701 16 12.257825641185592 17 12.425446856827323
		 18 12.565167083818961 19 12.669022352754405 20 12.7293237934618 21 12.744710785058714
		 22 12.743118309633353 23 12.742732702578744 24 12.742469483350858 25 12.7423440171109
		 26 12.742244372048502 27 12.742332416402437 28 12.740591853106244 29 12.663778058951642
		 30 12.502472826822194 31 12.342554871842129 32 12.270637673137529 33 12.270637673137529
		 34 12.270637673137529;
createNode animCurveTA -n "FKThumbFinger1_L_rotateZ1";
	rename -uid "F821782B-4133-295B-7B51-76A5160D61DC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -7.1875127152175873 1 -7.4357076002267126
		 2 -8.0678482274117194 3 -8.9099938916043211 4 -9.7883824299820308 5 -10.535947928238141
		 6 -10.979247531563171 7 -11.032825277395654 8 -10.887383298509622 9 -10.623515613638862
		 10 -10.261531508864801 11 -9.8224109877094001 12 -9.3278696639415486 13 -8.7990500675580012
		 14 -8.2571451033881722 15 -7.7240546053751862 16 -7.2217855058891374 17 -6.7718188949677804
		 18 -6.3955474035103181 19 -6.1152673846713439 20 -5.9527178552982738 21 -5.9157358371699953
		 22 -5.917993693708147 23 -5.9178849213289002 24 -5.9177853447880482 25 -5.9177642869936751
		 26 -5.9177175298350839 27 -5.917402220711721 28 -5.9222141656926688 29 -6.1294944735146801
		 30 -6.5646663121758806 31 -6.9947464119810077 32 -7.1874734492267063 33 -7.1874734492267063
		 34 -7.1874734492267063;
createNode animCurveTA -n "FKIndexFinger3_L_rotateX1";
	rename -uid "52B32A04-443C-A36E-23E9-E999CD6635A5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -1.7969355488573691 1 -1.8321325878722936
		 2 -1.9221839298063981 3 -2.0408481527485343 4 -2.1697762172002264 5 -2.2871023153978931
		 6 -2.3594534139686978 7 -2.3609953930297558 8 -2.3001624135121785 9 -2.1953622529471204
		 10 -2.0593182310183233 11 -1.9011620404574838 12 -1.7323755796901266 13 -1.5620374122285061
		 14 -1.3978357711635907 15 -1.2459870931065151 16 -1.111347365016145 17 -0.9974458438322632
		 18 -0.90586965076578374 19 -0.83973674426352984 20 -0.80267133145933078 21 -0.79861485641925234
		 22 -0.828731012548518 23 -0.8878998286094224 24 -0.9737985092028576 25 -1.0816642504291596
		 26 -1.2050275243230244 27 -1.3382758712265246 28 -1.4727008842076064 29 -1.5980653199591679
		 30 -1.7057954701979077 31 -1.7827059534538308 32 -1.811269267964885 33 -1.811269267964885
		 34 -1.811269267964885;
createNode animCurveTA -n "FKIndexFinger3_L_rotateY1";
	rename -uid "3D120BC2-4BB4-B735-1987-6E893794B649";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 21.319458059234236 1 21.603672143644093
		 2 22.329110384791953 3 23.297452813549398 4 24.308559397862481 5 25.168983255042459
		 6 25.682815190495127 7 25.69862765574922 8 25.277888510825605 9 24.504005587121732
		 10 23.439048059042104 11 22.14737079739999 12 20.693042175003175 13 19.138392327606013
		 14 17.545782661976681 15 15.979839012021861 16 14.505188100386789 17 13.184588084944115
		 18 12.080784541253591 19 11.258946298451457 20 10.783624647790059 21 10.718544697936212
		 22 11.098985663657958 23 11.860520995025819 24 12.912241731099426 25 14.167766695180683
		 26 15.540923063687515 27 16.94257848228375 28 18.283943265657665 29 19.479129963247193
		 30 20.442071456314277 31 21.08383097842604 32 21.316886081373593 33 21.316886081373593
		 34 21.316886081373593;
createNode animCurveTA -n "FKIndexFinger3_L_rotateZ1";
	rename -uid "F9E2D549-4369-38CF-DB5F-3B84E021E246";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -3.6622880756502392 1 -3.7198842029321462
		 2 -3.8650596600432721 3 -4.0565655096691495 4 -4.2602870697152309 5 -4.4406738372066279
		 6 -4.5512040008297028 7 -4.5536424256428019 8 -4.4612564594021746 9 -4.3007730053792095
		 10 -4.0850692511054048 11 -3.8294650831926562 12 -3.5491365592597526 13 -3.2574540349991339
		 14 -2.9665460130888741 15 -2.687649342597128 16 -2.430906836155514 17 -2.2054532690834501
		 18 -2.020367756259676 19 -1.8823360599167274 20 -1.80190138159617 21 -1.7918401059871669
		 22 -1.8568674101365981 23 -1.9832869893523282 24 -2.15951969071648 25 -2.3729234455270931
		 26 -2.610653749073562 27 -2.8583220129778004 28 -3.1004893419050394 29 -3.3206730650538328
		 30 -3.5014831070959493 31 -3.6272685639193538 32 -3.6743182739887614 33 -3.6743182739887614
		 34 -3.6743182739887614;
createNode animCurveTA -n "FKIndexFinger2_L_rotateX1";
	rename -uid "B067DC70-4152-581B-00CE-14B6DA577993";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -1.7126945393302682 1 -1.7476257839039864
		 2 -1.8385052642803905 3 -1.9630567546687541 4 -2.0980241882667183 5 -2.2175187521534951
		 6 -2.2901813227243437 7 -2.2907635668712598 8 -2.2286043828499373 9 -2.1206520034401279
		 10 -1.9796536339878017 11 -1.8165815480134477 12 -1.643511062491013 13 -1.4709244507843189
		 14 -1.306010463650048 15 -1.1535439342351144 16 -1.0192765799754839 17 -0.9069626407695961
		 18 -0.81866133763047555 19 -0.75578757040623701 20 -0.72075358403357426 21 -0.71657089458017731
		 22 -0.74555155546230678 23 -0.80397606669748012 24 -0.88806409738250147 25 -0.99255893850567423
		 26 -1.1128258306835948 27 -1.2445143219723158 28 -1.3806637811221378 29 -1.5103365071796506
		 30 -1.620458662125928 31 -1.6970255925317479 32 -1.7253360023470377 33 -1.7253360023470377
		 34 -1.7253360023470377;
createNode animCurveTA -n "FKIndexFinger2_L_rotateY1";
	rename -uid "5119B2B2-4D6B-7036-CC26-85AC1BF804FB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 21.968176191505929 1 22.250827559904629
		 2 22.971816648059374 3 23.933817677563813 4 24.938353645160504 5 25.79353260801366
		 6 26.304517102345834 7 26.320425885320798 8 25.902039453208339 9 25.132895350855097
		 10 24.074695680946796 11 22.791002157792089 12 21.34555199838297 13 19.800167400165961
		 14 18.216926880190179 15 16.660043883523848 16 15.19388628544297 17 13.880717802469126
		 18 12.783088323936932 19 11.965924006442796 20 11.493166637772728 21 11.428498643671402
		 22 11.806792177513913 23 12.563953204300754 24 13.609773195640063 25 14.858270743662345
		 26 16.223652802793541 27 17.617312972282868 28 18.950818022736811 29 20.138777240217124
		 30 21.095461288455141 31 21.73320909163116 32 21.964948703844243 33 21.964948703844243
		 34 21.964948703844243;
createNode animCurveTA -n "FKIndexFinger2_L_rotateZ1";
	rename -uid "6A0095E8-4D83-88AC-E5E7-568DD310AB56";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -4.3747438152895066 1 -4.4419163178183911
		 2 -4.6140087110021275 3 -4.8429532139559948 4 -5.0861856308565283 5 -5.298753464745741
		 6 -5.4268622736457646 7 -5.4292217656508113 8 -5.3226263973027779 9 -5.1333682060752652
		 10 -4.8768502071757798 11 -4.5725717115611992 12 -4.2382069936527555 13 -3.8897516062029265
		 14 -3.5413754048092185 15 -3.2063904433774741 16 -2.8973801029964701 17 -2.6256270291162287
		 18 -2.4016318038090132 19 -2.234535014991557 20 -2.1381604723458274 21 -2.1254728367628628
		 22 -2.2036806027415152 23 -2.357084425806415 24 -2.5699404123736378 25 -2.8276454089516339
		 26 -3.1137817606844038 27 -3.4113095356502972 28 -3.701791359245449 29 -3.9653631690648101
		 30 -4.1841076708704952 31 -4.3342715964671115 32 -4.3891321195903563 33 -4.3891321195903563
		 34 -4.3891321195903563;
createNode animCurveTA -n "FKIndexFinger1_L_rotateX1";
	rename -uid "11BD737D-410F-8210-4360-CCB05C604046";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -1.1175725042344993 1 -1.1880366731247594
		 2 -1.3698731902053398 3 -1.6318748654485276 4 -1.9292455483930098 5 -2.2015883209191194
		 6 -2.3726051131260411 7 -2.3866826841912969 8 -2.2953836821191258 9 -2.1348229519314192
		 10 -1.9258291111721102 11 -1.6907499821705596 12 -1.4499214500608608 13 -1.2199441122540866
		 14 -1.0134759691815649 15 -0.83892203755082506 16 -0.70012608989396075 17 -0.59684962551940046
		 18 -0.52577820025932409 19 -0.4817203675985629 20 -0.46146988732059901 21 -0.4622033790756131
		 22 -0.46847914178265904 23 -0.4851373199129661 24 -0.51158872430658175 25 -0.55087895529509801
		 26 -0.60012901970277599 27 -0.65730038148120484 28 -0.71921190826190962 29 -0.81298056857362011
		 30 -0.94354262579335568 31 -1.0634037962177192 32 -1.1175567273465119 33 -1.1175567273465119
		 34 -1.1175567273465119;
createNode animCurveTA -n "FKIndexFinger1_L_rotateY1";
	rename -uid "9C3582F5-4856-F052-6712-DA99A3DA43F2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 5.7005486692549638 1 5.9474738303619379
		 2 6.5759598372387424 3 7.4108516525114334 4 8.2785910726215324 5 9.01399734155091
		 6 9.4522423906937192 7 9.4590364521288848 8 9.0649022127980281 9 8.3400598017552436
		 10 7.3415128989861254 11 6.1283338928171105 12 4.7600216333348353 13 3.2947899683320676
		 14 1.7915285572451929 15 0.31147818412227057 16 -1.0836363849090167 17 -2.3339461289126424
		 18 -3.379462316893695 19 -4.1584580199098591 20 -4.6092754883844238 21 -4.6687591123474137
		 22 -4.2898793999255416 23 -3.5317568028496873 24 -2.4848316767479455 25 -1.2350792619012703
		 26 0.13164184909880619 27 1.5267516546758089 28 2.8615733303464213 29 4.0224149537615999
		 30 4.9190454430240083 31 5.4962913589722096 32 5.7005551311363574 33 5.7005551311363574
		 34 5.7005551311363574;
createNode animCurveTA -n "FKIndexFinger1_L_rotateZ1";
	rename -uid "FB69848C-4FB3-A396-9F7F-FFA5ECA6D110";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -6.0609309890961329 1 -6.2914481559807722
		 2 -6.8816777272143188 3 -7.6717367355296151 4 -8.5009776328950828 5 -9.2111248289313306
		 6 -9.6343098360073807 7 -9.6754483136378884 8 -9.4817551069572374 9 -9.1300210816657152
		 10 -8.6498941455775835 11 -8.0727966749551392 12 -7.4290823272327886 13 -6.7470103373729753
		 14 -6.0535102598835424 15 -5.3755748557817427 16 -4.7396742906010978 17 -4.1714896440535902
		 18 -3.6969431666418031 19 -3.3434326502235785 20 -3.1387373595434869 21 -3.099771816042983
		 22 -3.1738340282633204 23 -3.318942619401275 24 -3.5206736618055023 25 -3.7630023368744157
		 26 -4.030537809742313 27 -4.3065671992531707 28 -4.5747968222917752 29 -4.9553480284017386
		 30 -5.4505194585425114 31 -5.8796944746030215 32 -6.0609395477541934 33 -6.0609395477541934
		 34 -6.0609395477541934;
createNode animCurveTA -n "FKPinkyFinger3_L_rotateX1";
	rename -uid "AE88BC7B-4B52-C891-2233-19AD7D5287C0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -6.8851713321601835 1 -7.0346788270040035
		 2 -7.4189495958306306 3 -7.9427258501088485 4 -8.5268506752385385 5 -9.0667101974881774
		 6 -9.4136019973334442 7 -9.4246760999711459 8 -9.1318375022436467 9 -8.6391925917350445
		 10 -8.013263631074107 11 -7.3162737043053871 12 -6.6023569099079493 13 -5.9113754016283009
		 14 -5.2706880426849851 15 -4.6983509419242386 16 -4.2051869770865276 17 -3.7969536875946153
		 18 -3.4775862955133334 19 -3.2485206153977839 20 -3.1152349704620668 21 -3.09182641379418
		 22 -3.1938907206116545 23 -3.4055150121386024 24 -3.7071444041218928 25 -4.0858542739493027
		 26 -4.5318945226103482 27 -5.0254255156557441 28 -5.5382168912048844 29 -6.0324562813529994
		 30 -6.4592461661515106 31 -6.7719196726688669 32 -6.8925229216128372 33 -6.8925229216128372
		 34 -6.8925229216128372;
createNode animCurveTA -n "FKPinkyFinger3_L_rotateY1";
	rename -uid "B742FA38-4EE4-5223-0BC4-7B9B9B67D025";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 59.369387254988773 1 59.645250867654887
		 2 60.349107346725219 3 61.288287303951059 4 62.267829071373747 5 63.097802457867672
		 6 63.591644739925606 7 63.606682628947368 8 63.202987914621005 9 62.457528489386114
		 10 61.427257410827515 11 60.172698749940537 12 58.755523231130852 13 57.235876681134926
		 14 55.674807697897897 15 54.136194868007479 16 52.68443796933898 17 51.382299793993127
		 18 50.292606306543149 19 49.480829798711461 20 49.012430325099629 21 48.949065862356548
		 22 49.324624914624252 23 50.076606965131347 24 51.115314053894274 25 52.354259940872353
		 26 53.707261304457873 27 55.085992972421714 28 56.402863588042386 29 57.573794932949504
		 30 58.515243194191278 31 59.140093681920767 32 59.366441795344436 33 59.366441795344436
		 34 59.366441795344436;
createNode animCurveTA -n "FKPinkyFinger3_L_rotateZ1";
	rename -uid "7614A20F-483A-2C4D-906A-B5A02C99E615";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -16.103784558964772 1 -16.276429395209448
		 2 -16.722816430386771 3 -17.331990437871418 4 -18.000238327159469 5 -18.61525301696399
		 6 -19.005240017360052 7 -19.0173927045591 8 -18.690776045555712 9 -18.130728674701615
		 10 -17.414249413243404 11 -16.610931827740153 12 -15.777728807065181 13 -14.960087001720208
		 14 -14.190413023301426 15 -13.491946028994761 16 -12.880561164983428 17 -12.366854629550549
		 18 -11.959759220634281 19 -11.664899811899101 20 -11.490289157950599 21 -11.463112295646813
		 22 -11.599471999429358 23 -11.870817561452212 24 -12.254140292780198 25 -12.732797427492587
		 26 -13.288628615313838 27 -13.894771316381116 28 -14.515881568611405 29 -15.107081783737598
		 30 -15.613707602825672 31 -15.980313336890887 32 -16.120005291607988 33 -16.120005291607988
		 34 -16.120005291607988;
createNode animCurveTA -n "FKPinkyFinger2_L_rotateX1";
	rename -uid "D0E3B266-4895-A230-103C-17BCE916C49E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -1.056163486859397 1 -1.0933061299253142
		 2 -1.1875356667612376 3 -1.3058201163592922 4 -1.4322974231900711 5 -1.5541699161912321
		 6 -1.6363156550437987 7 -1.6387787390429893 8 -1.5716475068571476 9 -1.454347220583587
		 10 -1.3166033969496822 11 -1.1616188482388061 12 -0.99905744984738276 13 -0.83814783164844708
		 14 -0.68595094435085269 15 -0.54764908148448177 16 -0.42692343150982981 17 -0.32619215326310863
		 18 -0.24285414053488247 19 -0.17945718445631773 20 -0.14390230002682067 21 -0.13949799123901102
		 22 -0.16899960701140337 23 -0.22475279203397464 24 -0.2989179161875688 25 -0.39191068001148999
		 26 -0.50003155273056055 27 -0.61844161262954234 28 -0.73991217621681959 29 -0.85520884487628457
		 30 -0.95582928070213802 31 -1.0338887062130191 32 -1.0639683384014689 33 -1.0639683384014689
		 34 -1.0639683384014689;
createNode animCurveTA -n "FKPinkyFinger2_L_rotateY1";
	rename -uid "C190CEB1-4872-E67B-581B-F2924E0B8FD1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 39.689793294333278 1 39.975654150757087
		 2 40.705043298160497 3 41.679489963714872 4 42.697611234050562 5 43.563540795569452
		 6 44.079996442539397 7 44.095625602523157 8 43.672147763259119 9 42.894631114345131
		 10 41.823174762259008 11 40.52282393066934 12 39.059006559982045 13 37.494284197574771
		 14 35.891607928732732 15 34.315925943660808 16 32.832288920065736 17 31.50372732006889
		 18 30.393739127381789 19 29.568119593530113 20 29.090602096850553 21 29.025308297118052
		 22 29.407446116813915 23 30.172880899735024 24 31.230920476950601 25 32.494277230306757
		 26 33.876088313185605 27 35.286747397093961 28 36.636835485544637 29 37.839854556677942
		 30 38.808982188051814 31 39.454382495771405 32 39.688805206927647 33 39.688805206927647
		 34 39.688805206927647;
createNode animCurveTA -n "FKPinkyFinger2_L_rotateZ1";
	rename -uid "6D1382B6-468F-06FC-FFC2-B0974E5EC8E0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -6.2272994493879255 1 -6.2871335198771963
		 2 -6.4386134296010979 3 -6.6312153880506433 4 -6.8345930282901968 5 -7.0225368929300256
		 6 -7.1446678619897011 7 -7.1488366223183109 8 -7.0499788680784654 9 -6.8733047112765888
		 10 -6.6515184326945604 11 -6.3977358629405323 12 -6.1232563709519541 13 -5.842075975368779
		 14 -5.565920619329761 15 -5.3049168437068239 16 -5.0677792487657127 17 -4.8619671722345288
		 18 -4.6915662354790557 19 -4.5586507522605038 20 -4.4811474433496983 21 -4.471343835590714
		 22 -4.5346388628719891 23 -4.6525544393139739 24 -4.8109163929658285 25 -5.0030840120831943
		 26 -5.2194299711172301 27 -5.4476468818935384 28 -5.6736250103565622 29 -5.8815894453162869
		 30 -6.0570224119152885 31 -6.1861218920003882 32 -6.2348826316453998 33 -6.2348826316453998
		 34 -6.2348826316453998;
createNode animCurveTA -n "FKPinkyFinger1_L_rotateX1";
	rename -uid "9268C75A-42D5-958A-7C90-29BF1B60B57C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -4.5384127135551093 1 -7.7397177241154775
		 2 -7.6587913844305691 3 -7.8057545535636939 4 -7.967881196772316 5 -8.1132223292733681
		 6 -8.2107070857583899 7 -8.2138009076494001 8 -8.1338867693779306 9 -7.9972952993264359
		 10 -7.8249968016639571 11 -7.6274012747235709 12 -7.4201039359213716 13 -7.2152106899956392
		 14 -7.0220822057552583 15 -6.8477852522910441 16 -6.6969638541220444 17 -6.5723603706971598
		 18 -6.4755270755538792 19 -6.4073956040208824 20 -6.3676014111571764 21 -6.3627668251152301
		 22 -6.3928818195288226 23 -6.4542764261077918 24 -6.5444553871134206 25 -6.6598016182641935
		 26 -6.7960712506851682 27 -6.9465748192290109 28 -7.1019984939546967 29 -7.2501723733590424
		 30 -7.3760628832941695 31 -7.4686246167448296 32 -7.5047983237508191 33 -7.5047983237508191
		 34 -7.5047983237508191;
createNode animCurveTA -n "FKPinkyFinger1_L_rotateY1";
	rename -uid "47C06949-46EC-13B8-37C2-09BE100CEDAE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 31.568869626245171 1 30.274281890253985
		 2 31.109130001582166 3 32.061464287057603 4 33.056420659545772 5 33.901558455999051
		 6 34.405177533214058 7 34.420466923338132 8 34.007659226566219 9 33.248675559896782
		 10 32.201728964790313 11 30.930428027968315 12 29.498583447387379 13 27.967387754669144
		 14 26.398186670717557 15 24.854730367148203 16 23.400916917834145 17 22.098685140197233
		 18 21.010197295673187 19 20.200648295398821 20 19.732768961463766 21 19.668862659951664
		 22 20.043368290895806 23 20.7935719622044 24 21.831031287168486 25 23.069435028468074
		 26 24.423527105657723 27 25.805426619661219 28 27.127499469993239 29 28.305122366216768
		 30 29.254056653111995 31 29.885468813324188 32 30.114364517421212 33 30.114364517421212
		 34 30.114364517421212;
createNode animCurveTA -n "FKPinkyFinger1_L_rotateZ1";
	rename -uid "1DEF20B5-49DD-D865-87D0-21BAAF984195";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -4.3827341937142608 1 -17.701582762374759
		 2 -17.069320931878622 3 -17.366101340229179 4 -17.678646854766388 5 -17.959462572704663
		 6 -18.134693797059004 7 -18.140162441163824 8 -17.996639538479393 9 -17.740520454806127
		 10 -17.405767459415316 11 -17.014221385532263 12 -16.585358120699301 13 -16.14013008546301
		 14 -15.696860897917491 15 -15.272495411284572 16 -14.882328422006104 17 -14.540035905061474
		 18 -14.258154454606604 19 -14.044780893700938 20 -13.919593424432531 21 -13.902957404589728
		 22 -14.003295647011791 23 -14.199227251260199 24 -14.465849996418681 25 -14.788733748142334
		 26 -15.148708429459179 27 -15.524195791408374 28 -15.891865372563677 29 -16.22673031294989
		 30 -16.501190945867879 31 -16.693955456156811 32 -16.766931913275162 33 -16.766931913275162
		 34 -16.766931913275162;
createNode animCurveTA -n "FKRingFinger3_L_rotateX1";
	rename -uid "FAE8FD14-4A6F-6ADF-A5A4-59B5ADEAF790";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -3.7274381437253501 1 -3.8053407934749952
		 2 -4.0100407532682363 3 -4.2908046187370967 4 -4.5882664059664613 5 -4.8678812156563058
		 6 -5.0420447127478205 7 -5.0466046102649038 8 -4.9018599133004335 9 -4.6463959995474298
		 10 -4.3228119568487235 11 -3.962811718340534 12 -3.5861642615906355 13 -3.2144504430182499
		 14 -2.8636091798880181 15 -2.5453094352985981 16 -2.268174575491571 17 -2.0321438447997635
		 18 -1.8406473394244711 19 -1.7046872299268785 20 -1.6285307062794194 21 -1.6181310692153099
		 22 -1.6785848035573769 23 -1.8027893963741917 24 -1.9805552234776533 25 -2.1949417999115992
		 26 -2.4455098837849709 27 -2.7197060848836387 28 -3.0011526906319559 29 -3.2685694750307759
		 30 -3.5018011490623495 31 -3.672031255883152 32 -3.7350885830728018 33 -3.7350885830728018
		 34 -3.7350885830728018;
createNode animCurveTA -n "FKRingFinger3_L_rotateY1";
	rename -uid "795CA26B-4757-541D-8600-9AAA06CA19F2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 47.026185290375686 1 47.305995296887119
		 2 48.019207020212782 3 48.970614093753895 4 49.966089616729882 5 50.809963675512549
		 6 51.313581114877664 7 51.328979960095531 8 50.916380718790677 9 50.158275996081763
		 10 49.112344651692212 11 47.839711206688563 12 46.405232205585349 13 44.870142769905591
		 14 43.295996490027406 15 41.746864874967969 16 40.286887003414726 17 38.979075301237025
		 18 37.886547579372213 19 37.073721943659386 20 36.603405529878742 21 36.539186252629875
		 22 36.915708168285562 23 37.669413444775969 24 38.711721196402877 25 39.956432653203748
		 26 41.316901691450866 27 42.704742213661959 28 44.031884506550085 29 45.213527382615425
		 30 46.16373094101273 31 46.795278446041515 32 47.024766123518951 33 47.024766123518951
		 34 47.024766123518951;
createNode animCurveTA -n "FKRingFinger3_L_rotateZ1";
	rename -uid "6429FF3C-42E6-3338-B367-6A8907C48484";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -10.662159854266815 1 -10.771564110060504
		 2 -11.056478779338851 3 -11.441830804883956 4 -11.843927418592351 5 -12.216938240705046
		 6 -12.44697915157281 7 -12.453522564405096 8 -12.263583728325388 9 -11.924305793268037
		 10 -11.485433281167312 11 -10.990202900101233 12 -10.460892459747644 13 -9.9248751242924058
		 14 -9.4044141438145488 15 -8.9179668205033433 16 -8.4807936536848043 17 -8.102263668809135
		 18 -7.7900505249348786 19 -7.5566081749054126 20 -7.4233351299186943 21 -7.4052317254071953
		 22 -7.5120898109204415 23 -7.7233638642092313 24 -8.0124352703776136 25 -8.3628523722947765
		 26 -8.7610839441649588 27 -9.1851006721159134 28 -9.6089597284831871 29 -10.002442906043305
		 30 -10.338920978126479 31 -10.580944969790631 32 -10.669876845196892 33 -10.669876845196892
		 34 -10.669876845196892;
createNode animCurveTA -n "FKRingFinger2_L_rotateX1";
	rename -uid "616B762E-42A9-1892-964F-0A8202E0B8F1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -1.926526816903892 1 -1.9784041059116937
		 2 -2.1149674683306845 3 -2.2940815863923349 4 -2.4875864857547141 5 -2.6716289731698906
		 6 -2.7857921142258268 7 -2.7884109415626539 8 -2.6929733340065716 9 -2.5246620948506906
		 10 -2.3137544483438428 11 -2.0799673191200991 12 -1.8346078772879106 13 -1.5919857373585025
		 14 -1.3627836211689122 15 -1.1548970237752139 16 -0.97370658038394797 17 -0.81870362573091793
		 18 -0.69023201162429781 19 -0.59965994508579357 20 -0.5488680760319482 21 -0.54169543040468626
		 22 -0.58135092869237004 23 -0.66353511462765469 24 -0.78310405887258361 25 -0.92636466370998816
		 26 -1.0893683383489952 27 -1.2684017001972763 28 -1.4522275727616332 29 -1.6267216438056571
		 30 -1.7796453217621166 31 -1.8932140963277182 32 -1.9352014237639805 33 -1.9352014237639805
		 34 -1.9352014237639805;
createNode animCurveTA -n "FKRingFinger2_L_rotateY1";
	rename -uid "FF69E010-4B6D-BD59-3594-0CAC1D4847EB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 40.89594388643296 1 41.178608980888256
		 2 41.8992856303758 3 42.861035192383525 4 43.865368061323032 5 44.719437359784294
		 6 45.229588722923673 7 45.245322940709435 8 44.827601012844795 9 44.060192744501791
		 10 43.002487662036515 11 41.717156821523211 12 40.269466339883728 13 38.721325619449907
		 14 37.134884895809748 15 35.574515044752879 16 34.104837878928855 17 32.788964989614847
		 18 31.69095238720249 19 30.87318743747166 20 30.399979867979052 21 30.335376042528935
		 22 30.714257423127993 23 31.471722487361177 24 32.519009745094486 25 33.770823517791925
		 26 35.139944759952819 27 36.537215982833231 28 37.874023352713856 29 39.06489027591406
		 30 40.023423141899194 31 40.661154327472218 32 40.89295302764603 33 40.89295302764603
		 34 40.89295302764603;
createNode animCurveTA -n "FKRingFinger2_L_rotateZ1";
	rename -uid "0B639C5F-4994-2A6B-596C-3DAD39231681";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -8.3777521904354657 1 -8.4610545790244025
		 2 -8.6772415717970883 3 -8.9652882431129211 4 -9.2726955331548702 5 -9.549740448459179
		 6 -9.7188547486490151 7 -9.7228255856889056 8 -9.5818287841353929 9 -9.3296927923990509
		 10 -9.0031272720039652 11 -8.6320969007929218 12 -8.2314525977141777 13 -7.8214093170862569
		 14 -7.4190778551704204 15 -7.0391650478432153 16 -6.6942385269114837 17 -6.3916277775668355
		 18 -6.133516537214506 19 -5.9440377351219569 20 -5.8358419023240158 21 -5.8211496146730646
		 22 -5.9075469552789812 23 -6.0828222087078618 24 -6.3216121262145535 25 -6.6032909486383646
		 26 -6.9183609751894881 27 -7.2511026951228272 28 -7.5808295053693948 29 -7.884207206329835
		 30 -8.1414864781574821 31 -8.3266899061373216 32 -8.3945180491031763 33 -8.3945180491031763
		 34 -8.3945180491031763;
createNode animCurveTA -n "FKRingFinger1_L_rotateX1";
	rename -uid "944FB074-484E-7B16-348D-939B1713F529";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -3.9756933518293974e-14 1 -6.7724293459686029
		 2 -6.2779936353513968 3 -6.4476325186534202 4 -6.6236200758513473 5 -6.7832311583863403
		 6 -6.8842270885917989 7 -6.8871443919637487 8 -6.8039292648688576 9 -6.656643954336662
		 10 -6.4702003862173889 11 -6.2561911823677523 12 -6.0306378664772593 13 -5.8064609838320687
		 14 -5.5939327598315209 15 -5.4009803704313448 16 -5.2330293545319799 17 -5.093582996299677
		 18 -4.9811083544434629 19 -4.8998302750436329 20 -4.85489085694444 21 -4.84904908773896
		 22 -4.8852421138818016 23 -4.960013516030843 24 -5.0621513986948239 25 -5.1916423181126179
		 26 -5.3436291388576658 27 -5.510580111941751 28 -5.6820174707606359 29 -5.8446103945443912
		 30 -5.9861517562643387 31 -6.0884440276396159 32 -6.126108978503261 33 -6.126108978503261
		 34 -6.126108978503261;
createNode animCurveTA -n "FKRingFinger1_L_rotateY1";
	rename -uid "A474BA20-4E06-23D1-48A1-9684D1161BD9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -9.9392333795733459e-16 1 28.522608341337175
		 2 27.431620840148355 3 28.373456938379363 4 29.359514060817485 5 30.196667259612482
		 6 30.696099247089947 7 30.711317070964348 8 30.302055167389497 9 29.550140356545079
		 10 28.512408645241202 11 27.25194562408727 12 25.832051969406798 13 24.31322824054012
		 14 22.756422557111726 15 21.224878674241744 16 19.782059693170535 17 18.489437057477286
		 18 17.409270380538118 19 16.605997558613094 20 16.141692459613953 21 16.078258851429574
		 22 16.449836131702689 23 17.194230414197257 24 18.224252421397342 25 19.453629565298087
		 26 20.797721760055349 27 22.169152037872983 28 23.481034873432975 29 24.649418619006692
		 30 25.589717731124566 31 26.215202279105839 32 26.442126636400459 33 26.442126636400459
		 34 26.442126636400459;
createNode animCurveTA -n "FKRingFinger1_L_rotateZ1";
	rename -uid "15EE54E7-498D-E827-D882-54BD88CBF1FF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 4.1297514692127857e-14 1 -18.416965906649306
		 2 -17.218915011624269 3 -17.546582446956471 4 -17.883111602477065 5 -18.184815855944933
		 6 -18.369318110542686 7 -18.3748048875492 8 -18.223209198367858 9 -17.949510500183905
		 10 -17.590379310416179 11 -17.169340215087075 12 -16.707067950176398 13 -16.225849806621785
		 14 -15.74550466826684 15 -15.284570624638762 16 -14.859785078100201 17 -14.486445765531203
		 18 -14.177245696301856 19 -13.943235455510715 20 -13.807170539334294 21 -13.788801253179159
		 22 -13.898137506370118 23 -14.113227268274265 24 -14.404454391399293 25 -14.756632923254543
		 26 -15.148496337428046 27 -15.556483841188724 28 -15.955120987595192 29 -16.317390519593417
		 30 -16.617877115455215 31 -16.827887176983591 32 -16.90515118634778 33 -16.90515118634778
		 34 -16.90515118634778;
createNode animCurveTA -n "FKWrist_L_rotateX1";
	rename -uid "3C2FD5B5-4372-73D7-5B25-79876488AD2D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 7.9513867036588047e-16 1 9.1231665888196147
		 2 8.1419048801907614 3 7.8485528286769402 4 7.4804611640819276 5 7.0738808170098482
		 6 6.6749690016074918 7 6.3398550680298777 8 6.1275630294752546 9 6.0173603092391579
		 10 5.9353916204200479 11 5.8753059358910829 12 5.8277691084242376 13 5.7962768151943225
		 14 5.7740167727063696 15 5.7598781294128099 16 5.7435243307763946 17 5.7290222242656945
		 18 5.7122949021838405 19 5.6907936849992744 20 5.6638509973283409 21 5.6365881586430433
		 22 5.5835964297528147 23 5.5061467018880883 24 5.4173120514762498 25 5.3364896990884079
		 26 5.281420750812055 27 5.3924949872444996 28 5.8590956681416602 29 6.5645370852461893
		 30 7.3366540526562591 31 7.9724921531462112 32 8.2352689175510623 33 8.2352689175510623
		 34 8.2352689175510623;
createNode animCurveTA -n "FKWrist_L_rotateY1";
	rename -uid "60BEED11-48AA-A24A-B860-81A0C6D22AB8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -4.7708320221952744e-15 1 -12.90376117082956
		 2 -11.938077591816619 3 -11.601690561831969 4 -11.160180265819731 5 -10.635049335740709
		 6 -10.054722919793646 7 -9.4563945725810132 8 -8.8817354125217935 9 -8.305357803550157
		 10 -7.6672668810886861 11 -6.9798348995152848 12 -6.2599380451936311 13 -5.5220651698040299
		 14 -4.7822799815229917 15 -4.0565673750840476 16 -3.363222107875711 17 -2.7181013058268353
		 18 -2.1391503399179896 19 -1.6450245912297468 20 -1.2547520889178994 21 -0.96127000025142939
		 22 -0.63861088548277078 23 -0.26607083065103132 24 0.089595983152808131 25 0.37039320313825974
		 26 0.54788498137952679 27 -0.0041127937515422165 28 -2.1482639189926749 29 -5.2914270836891122
		 30 -8.5915497558275415 31 -11.193632240989713 32 -12.243394602887181 33 -12.243394602887181
		 34 -12.243394602887181;
createNode animCurveTA -n "FKWrist_L_rotateZ1";
	rename -uid "4792B687-4D80-4301-8AE1-94850FFF8BE1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 3.270007781879677e-14 1 13.864355123478092
		 2 11.307266437322079 3 9.0499922095005161 4 6.449143561347376 5 3.8198172708838096
		 6 1.4769574920174151 7 -0.25577297850566699 8 -1.0575927545982897 9 -1.0682996004252345
		 10 -0.76326039352969799 11 -0.20141716608210347 12 0.58149843702805248 13 1.5507989497104586
		 14 2.6712563674177412 15 3.9070161452744299 16 5.2227170326636427 17 6.5841988344643365
		 18 7.9575707917392808 19 9.308105365523522 20 10.600913016236714 21 11.872049953437475
		 22 13.492815698993949 23 15.390642038784922 24 17.231115968521504 25 18.703873475580878
		 26 19.494902661615964 27 19.304646494030596 28 18.228214539690569 29 16.69938620660049
		 30 15.147372197255837 31 13.963911114871205 32 13.496851361432043 33 13.496851361432043
		 34 13.496851361432043;
createNode animCurveTA -n "FKElbow_L_rotateX1";
	rename -uid "5A575691-48D2-A88E-EE27-63BE5FB7D125";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 25.578737790939233 1 18.066307521654561
		 2 18.405981792319956 3 19.329413462433379 4 22.350255573538298 5 25.83349755324274
		 6 27.861715312078243 7 28.791812622340856 8 30.433490704744429 9 32.99715971507063
		 10 34.820234623239209 11 34.532458515859133 12 32.91769739695755 13 31.760901960266068
		 14 30.759166495861692 15 29.562140241435696 16 28.353850189132597 17 26.838962895850159
		 18 25.200379601530617 19 23.610832565879356 20 22.182730787885806 21 20.970404284515148
		 22 18.852203084699319 23 16.066168057005434 24 12.95510245905918 25 9.6421358707852125
		 26 6.7472937064600327 27 5.2850192899353807 28 6.4232950556676007 29 9.5339913430765719
		 30 13.557113711812743 31 17.365017806502653 32 18.797557180226022 33 18.797557180226022
		 34 18.797557180226022;
createNode animCurveTA -n "FKElbow_L_rotateY1";
	rename -uid "68609065-4712-7FAB-8994-B098FCBDE7E6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 13.707101327733607 1 34.996965074222828
		 2 33.157857254241158 3 32.946847854692777 4 32.946256336455242 5 32.740879579351436
		 6 32.280653910092916 7 31.645347322532405 8 31.096432203873327 9 30.854660620363347
		 10 30.760694991543442 11 30.817378489409542 12 30.994215617446219 13 31.001261465545113
		 14 30.981141540624751 15 31.191168278129176 16 31.433506628920473 17 31.579269740349844
		 18 31.854483565627099 19 32.428837283978289 20 33.225480943929917 21 34.11669375128205
		 22 34.784072344663187 23 35.29894915223813 24 35.625220123096618 25 35.610858065209079
		 26 35.249670057484309 27 34.857469440358187 28 34.908444021957067 29 35.07003697642682
		 30 34.973365035124985 31 34.613255021865555 32 34.088161598190709 33 34.088161598190709
		 34 34.088161598190709;
createNode animCurveTA -n "FKElbow_L_rotateZ1";
	rename -uid "63F47727-4A46-9CFE-74E7-4E92A816348C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -8.3380617743805736 1 8.5302191226709372
		 2 6.8095399307407227 3 5.5116105287596602 4 2.9345088116041289 5 0.34822048683322304
		 6 -1.0125589287802477 7 -1.2166885625857806 8 -1.8346099869663852 9 -3.7205299599209818
		 10 -5.5209584662322273 11 -5.972546304922993 12 -5.3924106451708314 13 -4.2369742143425855
		 14 -2.7864750769763056 15 -1.6040088272124915 16 -0.3148009299322348 17 1.4889371161957734
		 18 3.494524837077202 19 5.5335944190750235 20 7.4955025869067073 21 9.4126269379864773
		 22 11.993262590443269 23 14.675703134130275 24 17.125352387610207 25 19.275732667417749
		 26 20.672118866979368 27 20.731693081445162 28 18.956044579063221 29 15.867256016350101
		 30 12.32102790154932 31 9.1699506983250512 32 7.7772483916037283 33 7.7772483916037283
		 34 7.7772483916037283;
createNode animCurveTA -n "FKShoulder_L_rotateX1";
	rename -uid "0C5C5473-4B11-7541-C462-6E84DAC70073";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 28.121258291581317 1 32.200352267499902
		 2 30.712550057364297 3 28.883708910447215 4 27.136058251922936 5 25.790305233242048
		 6 24.900126091106653 7 24.881048597235022 8 25.4152553941314 9 25.973857931727871
		 10 26.299837199777105 11 26.521091343600876 12 27.401887000422931 13 28.921912561588673
		 14 30.235530846253937 15 31.285177656288834 16 32.677324907405776 17 34.364091398667661
		 18 35.831246978901774 19 36.497356628850014 20 36.645615857406128 21 36.658515019742026
		 22 36.45047651286297 23 36.26453367376174 24 36.082754539379877 25 35.560038949569922
		 26 35.236504612971515 27 35.277067344052647 28 35.045692554238897 29 34.393740972694332
		 30 33.772746185487826 31 33.297864216986021 32 32.727027983178601 33 32.727027983178601
		 34 32.727027983178601;
createNode animCurveTA -n "FKShoulder_L_rotateY1";
	rename -uid "7E2AD85B-4A6E-003A-CB5D-6C8B5CEDA182";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 45.711629023778038 1 27.491509006615001
		 2 27.591543487879608 3 26.327540055294271 4 25.094639493355075 5 24.265890152268881
		 6 24.012499492587132 7 24.595243720521101 8 25.590989934920852 9 26.020817435341957
		 10 26.48683325534369 11 27.463124482619548 12 27.786090765136962 13 27.891974405243772
		 14 28.657750365072609 15 29.280287611376711 16 29.518340844260241 17 29.894023042336027
		 18 30.460052147224928 19 30.654989295939266 20 30.576266437339672 21 30.712954513702542
		 22 30.897836404495823 23 31.280720631680982 24 31.867666128821298 25 32.174402910165391
		 26 32.086215239560119 27 31.75103694826894 28 31.291291252660482 29 30.739099926559213
		 30 30.188378711928284 31 29.741643929597334 32 29.364891019481533 33 29.364891019481533
		 34 29.364891019481533;
createNode animCurveTA -n "FKShoulder_L_rotateZ1";
	rename -uid "76DBB5F1-46B6-61A9-9F89-5B9345A6679D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -43.49017993317068 1 -55.485366596756549
		 2 -56.232074557422514 3 -57.851033869588591 4 -59.040464144266835 5 -59.718998726551149
		 6 -60.519722400914347 7 -61.377374321892155 8 -61.438812976371274 9 -60.053266876076464
		 10 -58.27221001817118 11 -57.417740747043148 12 -56.739059668547348 13 -55.414441255573841
		 14 -53.799765046634334 15 -52.027870817005436 16 -50.159753134303969 17 -48.482284057576059
		 18 -47.012023924482641 19 -45.956137954711721 20 -45.265540768063723 21 -44.785169307505114
		 22 -45.092318830784173 23 -46.355082402842108 24 -48.137178341360745 25 -50.220478380614452
		 26 -51.454822703167302 27 -51.698447536708599 28 -52.067817573663973 29 -52.88172088007174
		 30 -53.500931254694613 31 -53.883100463695214 32 -54.243241496197399 33 -54.243241496197399
		 34 -54.243241496197399;
createNode animCurveTA -n "FKScapula_L_rotateX1";
	rename -uid "7009B3FD-4173-3B6E-BD0F-9580983FD1E0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0.064682564519117886 1 0.064945054965550197
		 2 0.064977204291302645 3 0.071529664170706525 4 0.093125772040036608 5 0.1353564573924512
		 6 0.20863475745308638 7 0.29793237628772079 8 0.33522926858061786 9 0.25816321512080787
		 10 0.09302792804835712 11 -0.052111206716189067 12 -0.11678601753750611 13 -0.13329195090585966
		 14 -0.15300846139971894 15 -0.18417457319204197 16 -0.20648190485382897 17 -0.2103263071776949
		 18 -0.20329190976175923 19 -0.1940841154662781 20 -0.18493379286715225 21 -0.17719756967173039
		 22 -0.17077878896061938 23 -0.15220253163891342 24 -0.12358034028181535 25 -0.092687495782366097
		 26 -0.06167431355586122 27 -0.030795991860868434 28 -0.0010441356476745072 29 0.024907067049304184
		 30 0.045421831479852043 31 0.059969952989203386 32 0.065688875509214636 33 0.065688875509214636
		 34 0.065688875509214636;
createNode animCurveTA -n "FKScapula_L_rotateY1";
	rename -uid "859F9356-4359-3BDD-382A-24B98D20AD35";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 1.1729704129848251 1 1.2193950700908864
		 2 1.2455178238608771 3 1.2723903387204107 4 1.3162196794063759 5 1.3307361651832657
		 6 1.2912510154903987 7 1.3525002152199155 8 1.7631669768011966 9 2.4745323250909013
		 10 3.0332482170205548 11 3.0660038205267779 12 2.7133036329394713 13 2.3453250309708289
		 14 2.1366480952039342 15 2.0640155292291267 16 2.0226969445949101 17 1.9201011480316803
		 18 1.7421186654188152 19 1.5754400678284188 20 1.5003347656264221 21 1.4899781256488411
		 22 1.4740047315218046 23 1.4412351751069767 24 1.4052714118602565 25 1.367190747927916
		 26 1.324589874062216 27 1.2860947740308644 28 1.2531322936491736 29 1.2243659458096388
		 30 1.2020287948960366 31 1.1891942862622606 32 1.1857730264267778 33 1.1857730264267778
		 34 1.1857730264267778;
createNode animCurveTA -n "FKScapula_L_rotateZ1";
	rename -uid "7167FB55-44EE-7DCC-51AC-5DAB76291EA0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 1.9513841628936619 1 1.9454948361545235
		 2 1.9424655971939837 3 1.8926408325753659 4 1.754216992292337 5 1.5045867396296553
		 6 1.0862208702976901 7 0.56193033830416639 8 0.29682158473950249 9 0.63651751179869887
		 10 1.4444858636240667 11 2.2100494547312155 12 2.6224032439254117 13 2.7947867492172001
		 14 2.9498394831843657 15 3.1346159372464397 16 3.2632125224039101 17 3.3084167103868207
		 18 3.311446647689436 19 3.3006372657998106 20 3.2764669205791384 21 3.2457686733100464
		 22 3.1989640532547901 23 3.0858178712164421 24 2.9326068234717977 25 2.7671585281579896
		 26 2.5965731099592122 27 2.4295337655105249 28 2.2740610992563575 29 2.1385672064752925
		 30 2.0314809970063457 31 1.9608825872850153 32 1.9353883986589395 33 1.9353883986589395
		 34 1.9353883986589395;
createNode animCurveTA -n "FKChest_M_rotateX1";
	rename -uid "45035790-45DC-053A-DD59-5E8B4154A06B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -5.3989924024177016 1 -5.3101954048933537
		 2 -5.2443932437227572 3 -5.2398914383995319 4 -5.2742964035104105 5 -5.2852632785172995
		 6 -5.2261579346322806 7 -5.0836982937892454 8 -4.8280179779848584 9 -4.4074495186195541
		 10 -3.8761560141400744 11 -3.5257910813638249 12 -3.6187470833272575 13 -3.9851551406706101
		 14 -4.2694322614142903 15 -4.412939312441261 16 -4.6209886084637048 17 -5.0176328338719891
		 18 -5.5066800248038925 19 -5.8920505879233982 20 -6.1241710936132039 21 -6.3219639737749622
		 22 -6.6123154957638519 23 -6.9791261382184615 24 -7.138277046112588 25 -6.8290472153837998
		 26 -6.2937118076110377 27 -5.901349220195943 28 -5.5842121681116694 29 -5.2971695578905242
		 30 -5.2177041224070306 31 -5.3291363267288485 32 -5.3989881647641873 33 -5.3989881647641873
		 34 -5.3989881647641873;
createNode animCurveTA -n "FKChest_M_rotateY1";
	rename -uid "E8500FA1-4A2A-DC53-8BF9-DDAA5D969C98";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -0.19000060708607866 1 -0.39561481321172604
		 2 -0.63274332730465521 3 -0.84350471026734153 4 -1.0105256791177932 5 -1.1184531510014624
		 6 -1.108376050213878 7 -0.91167166666531629 8 -0.63106782140718309 9 -0.50956796307465402
		 10 -0.5584739491164431 11 -0.46246213649364371 12 -0.080805906064511032 13 0.39329605957240832
		 14 0.72320439925758173 15 0.82487645614301064 16 0.83428912258035393 17 0.91955569872739729
		 18 1.077585294546926 19 1.2090912968338841 20 1.2657595462592717 21 1.2339479659376866
		 22 1.1198878119886277 23 1.0103079734829257 24 1.0171734736361377 25 1.1418071815800332
		 26 1.2553088547838716 27 1.2203305415989298 28 1.0566758686007216 29 0.83583232081839198
		 30 0.55271454762251915 31 0.19600277322260551 32 -0.19000283701116552 33 -0.19000283701116552
		 34 -0.19000283701116552;
createNode animCurveTA -n "FKChest_M_rotateZ1";
	rename -uid "9B4B9CD9-4687-5A38-D6C0-BFADF6C2E878";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -2.1669450462049333 1 -2.1573663181907392
		 2 -2.1535845219613794 3 -2.3267992893592861 4 -2.729528052832741 5 -3.1038862009146948
		 6 -3.1398388610951753 7 -2.76757503004827 8 -2.1730414700774525 9 -1.6011940219518266
		 10 -1.3142861798650012 11 -1.3364424449112686 12 -1.3489742346823108 13 -1.2280380423539239
		 14 -1.191264553239388 15 -1.3317493586668019 16 -1.4947250587974588 17 -1.5666766497897935
		 18 -1.5794982822612169 19 -1.6531452239837392 20 -1.850365607197344 21 -2.1070236956327371
		 22 -2.3611570016775101 23 -2.6052114418259005 24 -2.8198622782688845 25 -2.9037910346916598
		 26 -2.7825585422858787 27 -2.5780140146071786 28 -2.4924027786633562 29 -2.5339926196021993
		 30 -2.5315675524692067 31 -2.3554961867337929 32 -2.166950013511042 33 -2.166950013511042
		 34 -2.166950013511042;
createNode animCurveTA -n "FKSpine1_M_rotateX1";
	rename -uid "B5D794A0-4398-7945-85EC-FEB827A668A8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -8.5713852789005553 1 -8.5983593845023716
		 2 -8.5963534743706678 3 -8.6425130746237429 4 -8.7280494736827574 5 -8.7597254138474199
		 6 -8.6631550085289195 7 -8.3904648617281943 8 -7.9202001196130256 9 -7.2391707497457753
		 10 -6.4110724526974954 11 -5.7902162806298998 12 -5.7671813704823505 13 -6.140523130812098
		 14 -6.4190194092238775 15 -6.551875367839747 16 -6.8177749775482681 17 -7.3622933116946232
		 18 -8.0356231323205343 19 -8.5733198827947135 20 -8.9115839044925433 21 -9.2312430617797148
		 22 -9.7345635516758069 23 -10.355818946621421 24 -10.605853877170444 25 -10.03162866133181
		 26 -9.0870405334799109 27 -8.4920014715089902 28 -8.1063947917781132 29 -7.8200908952290717
		 30 -7.887995019770301 31 -8.2735292835192755 32 -8.6002852315801999 33 -8.6002852315801999
		 34 -8.6002852315801999;
createNode animCurveTA -n "FKSpine1_M_rotateY1";
	rename -uid "C5E9C8D8-444E-488B-D58B-268897EC736B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -0.20358324716746445 1 0.13058149712972458
		 2 -0.15024109925880905 3 -0.35410409860361108 4 -0.51099520994609737 5 -0.58507909291342641
		 6 -0.49685233066320617 7 -0.16272516000658918 8 0.16232745363666445 9 0.029231492895080285
		 10 -0.39921036818606476 11 -0.37853823745358506 12 0.37482117261015269 13 1.4188000332910791
		 14 2.163739909471635 15 2.4127998379991795 16 2.5284574585473441 17 2.8589577862756821
		 18 3.3334074999751984 19 3.6817424274025372 20 3.8151115146371346 21 3.7638830339991936
		 22 3.5716033919666375 23 3.4022483275528783 24 3.4346823443095706 25 3.6004835627654921
		 26 3.5611202324016027 27 3.2630167678857349 28 2.875299009772176 29 2.3265620352511878
		 30 1.6863558505776772 31 1.0090904173281392 32 0.33746122333508166 33 0.33746122333508166
		 34 0.33746122333508166;
createNode animCurveTA -n "FKSpine1_M_rotateZ1";
	rename -uid "2E263929-4E38-DFE2-559A-A8AB18A16BCD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 9.6218024119426513 1 19.923652851777302
		 2 19.272566239638216 3 18.98863449378436 4 18.294724453256006 5 17.645512931837775
		 6 17.573864317887065 7 18.211087038010735 8 19.274239202897871 9 20.330280597813484
		 10 20.846614150189811 11 20.753181649127761 12 20.658418020850522 13 20.809732349578571
		 14 20.826657985473688 15 20.560826766198669 16 20.273374302172861 17 20.140411653029869
		 18 20.107427112494211 19 19.97927511166824 20 19.648365941898035 21 19.209475195989828
		 22 18.777433672840484 23 18.366587822074163 24 18.005622628197973 25 17.875540205158266
		 26 18.072505398913478 27 18.386009764809899 28 18.523087459572825 29 18.457016424950176
		 30 18.49296748895215 31 18.854767874308031 32 19.230810841183406 33 19.230810841183406
		 34 19.230810841183406;
createNode animCurveTA -n "FKToes_R_rotateX1";
	rename -uid "DC898BE7-4AF5-E168-BC2A-C4AF655B3CD2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0.1434498052014406 1 -3.0809008952071868
		 2 -2.0164843924588225 3 -1.5000131246881667 4 -0.6607195494242899 5 1.0696276075552473
		 6 2.8156684124839777 7 5.429505094105223 8 7.4241228277665963 9 8.3198303478339088
		 10 11.093517196297928 11 23.773426765635548 12 23.405223684012274 13 15.542333932877241
		 14 11.51587207590744 15 10.917713432802085 16 10.322111281859973 17 7.5170968705104872
		 18 3.1222465496790703 19 1.8246846985374627 20 3.902935684896891 21 5.4183427060555553
		 22 4.4954181417882495 23 2.7308517403972425 24 0.96039625049365895 25 -0.96500600502577283
		 26 -2.3635619748800232 27 -2.7526865554935354 28 -2.7555889645938327 29 -2.7517088950117587
		 30 -2.7514559227732764 31 -2.7555100637689289 32 -2.7657540229138435 33 -2.7657540229138435
		 34 -2.7657540229138435;
createNode animCurveTA -n "FKToes_R_rotateY1";
	rename -uid "E7BE40F5-40C2-DEEC-3440-8F9A9CEEDFFA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0.13112372558537294 1 -4.9739214572007642
		 2 -4.7230883179033087 3 -5.296864694296386 4 -6.0471547946335127 5 -6.6790513934875655
		 6 -7.3844180592075714 7 -7.5918924212314476 8 -6.4813704597355892 9 -5.1693401335617768
		 10 -7.7847584111413486 11 -6.9812001951168199 12 -11.874980660293316 13 -13.155442174069993
		 14 -10.642751711665905 15 -8.8662859257151307 16 -8.2163720880584439 17 -8.6390103090623231
		 18 -9.1808039854396366 19 -9.3847314736500014 20 -9.9976634704892131 21 -10.39694613591073
		 22 -10.037371756637279 23 -8.8976856459457441 24 -7.3714411783621667 25 -5.9024449028382904
		 26 -4.9675435820066784 27 -4.7189264621736475 28 -4.7234948378302528 29 -4.7298101213112336
		 30 -4.7412851728535541 31 -4.7551202998010025 32 -4.7668848540807023 33 -4.7668848540807023
		 34 -4.7668848540807023;
createNode animCurveTA -n "FKToes_R_rotateZ1";
	rename -uid "835E26AA-47DF-7A9F-C3F8-E5A9AE38B807";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0.4293163681825517 1 3.7732490452897283
		 2 4.2379725745908319 3 5.2021072387723688 4 6.2384035659782127 5 7.4775146158739787
		 6 9.5081777285061495 7 12.998530563085772 8 16.164981370727279 9 21.515296871698077
		 10 32.174195975598607 11 40.866447045395141 12 36.862090352954581 13 28.019095615988508
		 14 24.085159911947343 15 22.725725400292092 16 18.941626922323689 17 11.327255831896018
		 18 4.8007340717754046 19 2.835876267465304 20 2.8880334965320054 21 2.0948614001083232
		 22 0.36628181274135835 23 -0.26784922081137041 24 0.39178749815987057 25 1.2882751955378713
		 26 2.2791438334848002 27 2.606548631975961 28 2.6451265460232456 29 2.7097323868104377
		 30 2.7880168907442271 31 2.8653500594142569 32 2.9223988795880809 33 2.9223988795880809
		 34 2.9223988795880809;
createNode animCurveTA -n "FKAnkle_R_rotateX1";
	rename -uid "A1FB09D6-40B1-8207-99B7-C1AF20F728A2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 4.0560839537349533 1 2.6989108352910587
		 2 2.293518784407909 3 1.998798282973949 4 1.6764851277670652 5 1.4467223729411793
		 6 1.3527861978717695 7 1.2729675902448092 8 0.83006126356746635 9 -0.088248921277459022
		 10 1.0273340829308681 11 2.8576648054651872 12 2.4978759038129681 13 2.0459431992809782
		 14 2.677829362681643 15 2.657094452239193 16 2.624751986763878 17 3.0601248690477783
		 18 2.7775597379256411 19 2.8387199456388315 20 2.7038225796378201 21 1.4605361188054902
		 22 0.47958554239856926 23 0.029025567877067896 24 3.0760632729628634 25 4.318376042193683
		 26 4.2009891090367217 27 4.3092805153336897 28 4.2767824761625919 29 4.2609772186164729
		 30 3.9963026947645215 31 3.5995722704713273 32 3.2278980873006593 33 3.2278980873006593
		 34 3.2278980873006593;
createNode animCurveTA -n "FKAnkle_R_rotateY1";
	rename -uid "409D929C-45EB-3A2C-1AC5-EAB3CB6C8AE7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -3.4977888234386261 1 -3.5881278931321838
		 2 -1.9421701987549407 3 -0.46343316197660206 4 1.091450393521197 5 2.4053886322126039
		 6 2.5042260393554305 7 2.4357839977364413 8 3.6589918673046835 9 6.2274068753798977
		 10 7.0404805671157904 11 1.2053324159304373 12 -6.1546138845380352 13 -7.5623088931284634
		 14 -6.0506004520117038 15 -3.5239986907273537 16 -1.7605983979257906 17 -1.4627091874124656
		 18 -0.91838821882947996 19 0.45408707188519365 20 1.7722983934447907 21 4.1031701801723441
		 22 6.4450958976900123 23 5.6154607158351997 24 -9.7507912249666155 25 -10.233940250636794
		 26 -9.1903944381662139 27 -8.7850375297499959 28 -8.431245501751107 29 -7.7139909907848736
		 30 -6.879769364028383 31 -6.0255435453843091 32 -4.9640022793382048 33 -4.9640022793382048
		 34 -4.9640022793382048;
createNode animCurveTA -n "FKAnkle_R_rotateZ1";
	rename -uid "21F34E8B-4D34-4326-6666-269F55697933";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -0.77476035878390914 1 15.980613736891206
		 2 14.545985038387771 3 14.254553686551947 4 14.656951435303906 5 15.967307391280357
		 6 17.934585280083887 7 19.599401115364831 8 20.685428680145638 9 18.262638759913905
		 10 8.5814566354136321 11 -7.8265204838208069 12 -12.10464527413408 13 -8.0396209264263181
		 14 -5.5028508913628675 15 -1.918481595585916 16 0.79226434142056879 17 3.007132942462067
		 18 4.9284714158505389 19 6.9169643079347534 20 9.0645733559990642 21 12.162965792945826
		 22 16.293716180984237 23 21.142123626915819 24 15.183019547283099 25 0.14051908521986439
		 26 2.0512969978198266 27 4.9239651681397358 28 7.5462818109187726 29 9.8044093854466894
		 30 11.699664613195468 31 13.404219791033235 32 14.917563996530351 33 14.917563996530351
		 34 14.917563996530351;
createNode animCurveTL -n "IKLeg_R_translateX1";
	rename -uid "2DDF6B75-4831-3DE6-AF3C-F881E47FF2A8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 27.2358285298032 1 10.088226023383193
		 2 11.409709978066529 3 11.462758451921829 4 11.55692543913807 5 11.709593182523182
		 6 12.068117673353095 7 12.440488747471612 8 12.809435854286091 9 13.209997289323432
		 10 13.887460339978915 11 14.775386540815802 12 16.525508840526811 13 18.315958785705142
		 14 19.461550271319318 15 19.657031530204797 16 18.904162318330897 17 17.638711227500188
		 18 16.016910038143308 19 14.586506499467438 20 13.477557235664948 21 12.531761209066897
		 22 11.985656009645297 23 12.05886874116251 24 13.270951770995236 25 12.088202650706648
		 26 11.545508534609192 27 11.497584797594438 28 11.54873789583899 29 11.576917795732134
		 30 11.587858149241153 31 11.565121833149199 32 11.524789565254174 33 11.524789565254174
		 34 11.524789565254174;
createNode animCurveTL -n "IKLeg_R_translateY1";
	rename -uid "7CB6E982-4F45-2285-5116-6F8459279DD6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 21.29867452345102 1 9.4088418308695445
		 2 9.7341964960496057 3 9.7788666496606034 4 9.8752283500764193 5 10.066793076475349
		 6 10.458665005355641 7 10.939396934386448 8 11.660589897063357 9 13.481937641465688
		 10 16.796531140898054 11 19.390407134944319 12 21.191330689878747 13 22.782990543337053
		 14 22.908551189940368 15 22.386403657714613 16 21.275798779632769 17 19.906264721445908
		 18 18.337740944843272 19 16.837262994252782 20 15.596228106771196 21 14.324523591932532
		 22 12.616688108676957 23 10.278934956150824 24 8.4131154670039372 25 6.8714526688192255
		 26 7.0722498233321502 27 7.5027356724321272 28 7.9685445815078602 29 8.4067361875913633
		 30 8.8012554821446756 31 9.1516821673686835 32 9.4379511350061378 33 9.4379511350061378
		 34 9.4379511350061378;
createNode animCurveTL -n "IKLeg_R_translateZ1";
	rename -uid "1F1CFBAC-4DE7-12C8-1120-A892BAD15018";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -41.156377132997775 1 -11.075732700173543
		 2 -17.099760865386791 3 -20.80090938724658 4 -24.55500357218083 5 -28.356110497721158
		 6 -32.030480947717351 7 -35.496515318073683 8 -38.734602361885457 9 -41.168820671890096
		 10 -41.474663678271746 11 -39.154324354433193 12 -35.957249632342837 13 -32.167005424445875
		 14 -27.263693043802188 15 -22.11918203235939 16 -16.525980193518794 17 -10.611876834448317
		 18 -4.3902946788719825 19 2.2156261078357886 20 8.7291291090240435 21 14.687261271388618
		 22 18.975257084748645 23 20.54408202294961 24 20.14022699306766 25 19.359096186393753
		 26 15.167756269372635 27 10.84724390953194 28 6.6375372652342648 29 2.5314087371354841
		 30 -1.4999373445522197 31 -5.4916232359060198 32 -9.4818206165531791 33 -9.4818206165531791
		 34 -9.4818206165531791;
createNode animCurveTA -n "IKLeg_R_rotateX1";
	rename -uid "20899134-4422-0A41-7036-41A11D24CFE5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 52.397291765829245 1 4.9450020703194015
		 2 8.3165877845041347 3 8.8777286618156293 4 9.6390651025679919 5 10.719648694735646
		 6 12.803988869595683 7 15.893842020858179 8 19.381563639115416 9 26.628577508739919
		 10 43.656458157829334 11 68.320020692452204 12 78.057397904369282 13 75.970312109068146
		 14 71.981319953525215 15 61.756052281053826 16 49.549344662120575 17 37.963076962547547
		 18 24.629631253515395 19 11.023801667011764 20 -2.0830380709759244 21 -15.202810808316032
		 22 -26.132919986423435 23 -30.619559107040825 24 -14.528430298503364 25 4.0449848067157905
		 26 7.0385963141930885 27 7.8549389869333464 28 8.1114884967908356 29 8.1194310633571547
		 30 7.9872290453800456 31 7.8284692726904108 32 7.7525432930436002 33 7.7525432930436002
		 34 7.7525432930436002;
createNode animCurveTA -n "IKLeg_R_rotateY1";
	rename -uid "AEC530D2-455A-D71E-EE0D-D08E5773BDB4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -26.540536687760078 1 -26.568437980854355
		 2 -26.833337976180871 3 -27.160798109178405 4 -27.38710765057991 5 -27.634148389150823
		 6 -27.746738076471161 7 -27.810315470785266 8 -28.595840456811477 9 -30.312472722576555
		 10 -33.552945897061889 11 -31.785727769490403 12 -28.504900011352021 13 -30.904524799543985
		 14 -36.743288093003954 15 -41.484790429604978 16 -43.461803781849788 17 -43.670822644246158
		 18 -41.646505258105066 19 -40.205384874009191 20 -37.824135861685534 21 -33.240892430834059
		 22 -30.449020038022553 23 -27.298458949400747 24 -24.949189905892972 25 -27.171747837776834
		 26 -26.239435538329449 27 -26.301833814684635 28 -26.310161183899975 29 -26.321636952162262
		 30 -26.329040153383819 31 -26.33644476943298 32 -26.34263388209666 33 -26.34263388209666
		 34 -26.34263388209666;
createNode animCurveTA -n "IKLeg_R_rotateZ1";
	rename -uid "0FDAC861-440C-3ACC-235D-90A8D90979CB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 2.320674561998354 1 2.6507650896049735
		 2 3.2661102367094803 3 2.9859260303743183 4 2.3094093078064835 5 1.2935541725029245
		 6 -0.80327020301336804 7 -3.2004484140106397 8 -5.2914253486069507 9 -7.1842797941832606
		 10 -12.507362311802632 11 -23.36210423405355 12 -30.578311321624234 13 -30.722040617022706
		 14 -28.957647676013387 15 -22.35611718220904 16 -14.863976883074169 17 -9.4876552441970841
		 18 -2.3971438343961013 19 4.8129845954761441 20 11.944877768703531 21 19.283865519532434
		 22 24.674327091449122 23 23.881851572169552 24 7.0475032887506091 25 2.6311415775823401
		 26 2.1094322342684584 27 2.2207767687842379 28 2.4006143391207142 29 2.3976651696685249
		 30 2.2945484278098891 31 2.1650897336189803 32 2.0976557154382229 33 2.0976557154382229
		 34 2.0976557154382229;
createNode animCurveTA -n "FKKnee_R_rotateX1";
	rename -uid "00FA1DD4-4764-E290-1658-CCA832899934";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -370.69311148161154 1 -372.86271675719689
		 2 -375.45799186149173 3 -377.78276109787134 4 -379.6331748178348 5 -381.14993986047432
		 6 -382.56481910507608 7 -384.43419543031803 8 -386.40155262795332 9 -387.35048360791774
		 10 -385.33076923142301 11 -160.25996227594658 12 -166.71432623393483 13 -170.24646124193708
		 14 -172.59389097300627 15 -173.53245198491754 16 -174.29119158396696 17 -175.44708982444263
		 18 -176.13234383255107 19 -177.18885491261946 20 -178.04728084515932 21 -178.14678703060991
		 22 -360.94195598454212 23 -361.18873664887644 24 -363.2865564437837 25 -361.63200026570348
		 26 -177.06918310902867 27 -176.08043858518658 28 -175.15093476282945 29 -173.74934810145029
		 30 -172.36084714873559 31 -368.99414518769805 32 -370.6931305525685 33 -370.6931305525685
		 34 -370.6931305525685;
createNode animCurveTA -n "FKKnee_R_rotateY1";
	rename -uid "B44D37F6-41A1-5EC5-BFE1-B2BF37027068";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 361.28884340549359 1 362.15503920147091
		 2 362.7470225684778 3 362.14775629965845 4 360.66076375774674 5 359.23752304787087
		 6 358.41835303899728 7 358.09815449098841 8 357.34720543434526 9 356.09835634005361
		 10 354.86681336098832 11 532.85080292911766 12 529.95923828098353 13 529.02897456409141
		 14 528.55714096128327 15 529.30186415728917 16 529.73896048859604 17 529.67070089865274
		 18 531.22015874163344 19 532.87858749369934 20 535.67788284115477 21 539.85407262950594
		 22 362.53168744409362 23 364.52440483861142 24 366.12364318182898 25 362.21868882895478
		 26 540.71456527368298 27 540.43028015759285 28 540.87704853087121 29 541.1751247557014
		 30 541.24681515813745 31 361.3377089634223 32 361.28883611951881 33 361.28883611951881
		 34 361.28883611951881;
createNode animCurveTA -n "FKKnee_R_rotateZ1";
	rename -uid "05B06D94-480C-969A-E598-57B4D70BA110";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 313.46226766522375 1 315.69826955740842
		 2 319.05925095791861 3 322.78595566542134 4 325.60477988973332 5 326.71286839917514
		 6 325.83326158260468 7 324.50324776209965 8 324.33180032091013 9 323.03845016884691
		 10 316.70558134260665 11 489.7331564446992 12 483.59482359010275 13 476.99970399517133
		 14 472.86932567766161 15 470.65707802972685 16 470.57035621578041 17 472.25016627106305
		 18 475.59219377957703 19 480.08847516013947 20 484.86197146162141 21 489.94411436334207
		 22 314.54048675160209 23 316.80421750451274 24 315.3129626600641 25 315.18822814470388
		 26 490.70909435789076 27 488.25106979839182 28 487.27343204399375 29 487.72089686138202
		 30 489.23903978481911 31 311.37239134771033 32 313.4622591134883 33 313.4622591134883
		 34 313.4622591134883;
createNode animCurveTA -n "FKHip_R_rotateX1";
	rename -uid "ED2DAF2D-4DD3-9831-7921-68B66DECBD4D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -359.99999999999994 1 -183.15197927001392
		 2 -184.67274513291264 3 -185.298152210864 4 -185.18071413913131 5 -184.88090038433947
		 6 -184.89237064834822 7 -185.61452639697478 8 -187.09267419758365 9 -188.12151448159079
		 10 -186.9503396742891 11 -183.76791489740089 12 -181.64026506586941 13 -182.26176021251197
		 14 -183.85110089522198 15 -184.23680636038901 16 -183.22429269735878 17 -181.85742497701466
		 18 -180.80953400823699 19 -180.18607227019456 20 -180.26920675469813 21 -181.3353859476052
		 22 -182.71010031004505 23 -182.41430271671024 24 -179.31560212367339 25 -176.52624348167822
		 26 -175.63679485882392 27 -176.18492884376732 28 -177.07211717219482 29 -177.67802415888266
		 30 -178.50983275082874 31 -179.87844318079115 32 -181.33125852755873 33 -181.33125852755873
		 34 -181.33125852755873;
createNode animCurveTA -n "FKHip_R_rotateY1";
	rename -uid "29AC5BB0-4D8F-7401-B9D3-46A98893ADBB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 359.99999999999994 1 185.54405340962938
		 2 183.04309270407938 3 181.51843196345038 4 180.42324131834607 5 179.31046842714224
		 6 177.93301974520244 7 175.87512501491136 8 172.76868390154468 9 169.32417755203804
		 10 167.81218572313722 11 168.68682502776298 12 170.60791472341026 13 173.00338737690606
		 14 176.42207515815096 15 180.37224248030606 16 184.1994195799623 17 187.24940462026225
		 18 189.58964374449823 19 191.45840938412948 20 192.78796047430356 21 193.49798887861297
		 22 193.37854726827806 23 192.2726442139458 24 191.79099136208347 25 191.77896398001448
		 26 192.55843198034734 27 192.94480071578747 28 192.45638481029735 29 191.56001194065917
		 30 190.38688461847275 31 188.76458448588664 32 186.92294453320156 33 186.92294453320156
		 34 186.92294453320156;
createNode animCurveTA -n "FKHip_R_rotateZ1";
	rename -uid "12E3C37A-444A-BADA-04E0-5CA651A186E7";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 360.00000000000023 1 207.68552118564912
		 2 202.42206292073323 3 199.35464498186442 4 197.12799594766992 5 195.59623415895771
		 6 194.24283918525884 7 192.14642458909827 8 189.09543241665671 9 187.42722463624534
		 10 190.29143921917014 11 195.55918630693063 12 200.05972904868199 13 204.36151891670858
		 14 208.68166684125549 15 213.09733939037116 16 217.29645494663217 17 220.7931718221196
		 18 223.43367377240378 19 225.41234546227139 20 226.95063387720177 21 227.72297512597811
		 22 227.17835778258544 23 225.60718852055788 24 224.44844220262499 25 223.58457589104458
		 26 223.39497264011692 27 221.98511494232497 28 220.02011351222873 29 217.63551190014286
		 30 214.88227712925948 31 211.60704676435012 32 208.23007190604631 33 208.23007190604631
		 34 208.23007190604631;
createNode animCurveTA -n "FKToes_L_rotateX1";
	rename -uid "1E115B06-4720-3D90-ABB0-0481A9CD4E2C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -0.62275961806077218 1 -1.1396952335827395
		 2 -6.5651676346839816 3 -3.0270941542558729 4 5.0831879801273514 5 6.8706588553995545
		 6 6.3875952184855276 7 5.8346326062480367 8 4.1967666037625895 9 2.3212091587963259
		 10 1.5591557147021138 11 1.4693353757069589 12 1.509974027451001 13 1.5593763869046386
		 14 1.6104652608931549 15 1.6625911729549463 16 1.7152688227212876 17 1.673134566564815
		 18 1.2065077395662802 19 0.69124536238086431 20 0.77216545609175347 21 0.85132950264044605
		 22 0.55376698832881255 23 0.026461220895897634 24 -0.45662109896848707 25 -4.1281686642556599
		 26 -8.7874467573612058 27 -7.9229284381493015 28 -14.301060271600939 29 -17.44401149943738
		 30 -12.941441230784719 31 -5.0392077234010584 32 -0.73517249627011505 33 -0.73517249627011505
		 34 -0.73517249627011505;
createNode animCurveTA -n "FKToes_L_rotateY1";
	rename -uid "6699695D-446D-1DF0-7C7C-38998C695F94";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 2.1884317541186062 1 -2.8213546160301721
		 2 -5.7406510353696518 3 -4.8345528542097895 4 -3.0779897924120356 5 -2.8384500564205193
		 6 -2.9050261573547749 7 -2.2547864541456031 8 -0.91514892973704831 9 -0.20494709573232714
		 10 -0.1483979925868123 11 -0.14210673518796674 12 -0.13002541060670825 13 -0.11580363164875668
		 14 -0.10847688347356048 15 -0.10782815667683729 16 -0.11223027007841735 17 -0.024836960097080231
		 18 0.52369096627154721 19 1.136213798452667 20 1.3880477823992488 21 1.4599915675932982
		 22 1.7341801681103892 23 2.461238518528102 24 3.2347831339755384 25 2.7731806831016059
		 26 1.0269374856346054 27 -1.0407656299236556 28 -3.3910102590565585 29 -5.5356806203944986
		 30 -5.3592418036859737 31 -1.8078124355427063 32 0.019379896979392634 33 0.019379896979392634
		 34 0.019379896979392634;
createNode animCurveTA -n "FKToes_L_rotateZ1";
	rename -uid "E88EBBFF-48C0-7223-3B2D-B58E936CFB2B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 359.2375960931185 1 380.16783134444199
		 2 377.87722397524658 3 373.09855979566237 4 366.94244493959729 5 366.51269148046447
		 6 367.51924927882345 7 369.18095323692552 8 371.78844503314724 9 376.94316862374546
		 10 379.42082528665924 11 379.57901317536727 12 379.61729899329043 13 379.6857430667211
		 14 379.75538409222111 15 379.81225503191661 16 379.8491558970864 17 380.036314963449
		 18 381.14791075340923 19 382.71483947899463 20 383.52989596411709 21 384.40138160802661
		 22 385.69823941438528 23 387.49907371848121 24 390.3314765035143 25 390.66584395051655
		 26 383.77253588193412 27 378.19299468587434 28 380.16055319181226 29 379.75580961156709
		 30 381.75809264075139 31 384.28274857142725 32 379.59102279912076 33 379.59102279912076
		 34 379.59102279912076;
createNode animCurveTA -n "FKAnkle_L_rotateX1";
	rename -uid "C2578C1F-4593-60A1-E164-D1B9F11F3CFD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 720.52825040158598 1 721.56278587185966
		 2 721.68034156114777 3 722.13235996463288 4 722.17337010729887 5 722.08368103545149
		 6 722.34999453429805 7 723.13860753606855 8 721.97661751579437 9 722.0071367084098
		 10 721.87210217266261 11 722.08827583189509 12 722.88484760128063 13 724.08290503622015
		 14 725.14761619620697 15 726.05596483003399 16 726.85583058347606 17 727.45835028836564
		 18 727.95803208797918 19 728.61035314593607 20 729.16407691998836 21 729.88552239895341
		 22 730.77102493809525 23 731.53407911773206 24 732.78957535260349 25 730.76639721680954
		 26 721.8361827001296 27 719.53076797470897 28 720.29622030903749 29 718.80269246819114
		 30 720.4250429403653 31 721.98905997438521 32 721.35940040743401 33 721.35940040743401
		 34 721.35940040743401;
createNode animCurveTA -n "FKAnkle_L_rotateY1";
	rename -uid "D3CBCAF7-47C5-518E-2941-4A8C36E8EC8D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -720.06206380913306 1 -709.5268070584475
		 2 -710.78606570682894 3 -712.36368867097633 4 -715.43666752094441 5 -718.56037052268005
		 6 -720.72589179390332 7 -724.55041970724744 8 -716.93281055945056 9 -714.96312523992196
		 10 -717.27216883030928 11 -719.80683938488392 12 -722.08298477867754 13 -724.50319666300152
		 14 -726.994401561269 15 -729.43677348796734 16 -731.58598837972988 17 -732.81285134185521
		 18 -733.3684404899376 19 -734.70370252568796 20 -736.05120728813154 21 -737.65326023702562
		 22 -739.21856272692105 23 -740.88987582647314 24 -743.1849694983249 25 -741.29728969080429
		 26 -726.55790701421881 27 -719.41686673799961 28 -721.33584045089958 29 -722.29351313131622
		 30 -719.76123176151668 31 -714.61338693511766 32 -712.01570444095216 33 -712.01570444095216
		 34 -712.01570444095216;
createNode animCurveTA -n "FKAnkle_L_rotateZ1";
	rename -uid "3B05F8EC-44DC-285C-3053-9C9EF94A7EE3";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -0.17086771449869137 1 -5.6083241760123483
		 2 -4.3478431794663539 3 -3.5518861608501751 4 -1.948605140149795 5 1.4476030737915309
		 6 5.8778733965851391 7 10.085958705499795 8 1.5351741581825957 9 3.7636166348842925
		 10 9.9821429867358997 11 14.715875029527156 12 17.40127164620003 13 18.829698007621229
		 14 19.573975316968511 15 19.930416810683298 16 19.927128540039945 17 19.578625617213266
		 18 18.700288373547895 19 18.093930817813142 20 18.31918654841299 21 19.176753555302685
		 22 20.669661611056039 23 22.341556833581883 24 22.069646835249724 25 20.139063817273524
		 26 12.933043118663958 27 1.9443797699225807 28 0.22914159184974298 29 -3.0430019039650218
		 30 -5.5353868803683683 31 -6.9064035911471064 32 -6.2491625548642862 33 -6.2491625548642862
		 34 -6.2491625548642862;
createNode animCurveTL -n "IKLeg_L_translateX1";
	rename -uid "A32EB2E9-4156-B1A2-A698-049ECD622F34";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 25.154604550002421 1 11.530385319784308
		 2 12.584421271960974 3 13.236020948531731 4 13.719468540206101 5 13.765173282246327
		 6 13.477744270868659 7 13.247914404719324 8 13.610715351256477 9 14.21744142787167
		 10 14.497745226706495 11 14.513453853584497 12 14.442572878664986 13 14.220579815793151
		 14 13.910183266626387 15 13.603172422416378 16 13.325319276486105 17 13.138880694931789
		 18 12.924173411470406 19 12.55468506448587 20 12.247276487541058 21 12.062942908559073
		 22 12.084808005463746 23 12.330999719583115 24 12.725444335240606 25 15.080214374386454
		 26 19.18084974380951 27 20.392647169642352 28 19.228897409994502 29 16.735710214317496
		 30 13.853948952672631 31 11.978799809531008 32 12.028525310794294 33 12.028525310794294
		 34 12.028525310794294;
createNode animCurveTL -n "IKLeg_L_translateY1";
	rename -uid "230B6CCB-4DD1-6C12-64E4-57B77EC00395";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 49.341279808450608 1 23.077098638217667
		 2 18.579261959292673 3 14.729440399876488 4 12.774778169385428 5 11.73123884934585
		 6 10.776727918209939 7 9.1725711501668172 8 7.2399330668976241 9 6.6707798138937466
		 10 7.2557969996217899 11 8.1210762609538705 12 8.7805371926337727 13 9.2780713073923486
		 14 9.6697389543169372 15 9.9962929880640239 16 10.248283996151791 17 10.455794641630288
		 18 10.781133065902043 19 11.36317079349903 20 12.129191176398237 21 13.099970056418723
		 22 14.179771708675791 23 15.305653392749537 24 16.829854663919377 25 20.581115624745813
		 26 25.858108859681359 27 28.052892683908432 28 29.188303760372769 29 30.210023582662316
		 30 30.400953732186082 31 29.009465602543656 32 26.769617315287768 33 26.769617315287768
		 34 26.769617315287768;
createNode animCurveTL -n "IKLeg_L_translateZ1";
	rename -uid "68909E84-47E4-944A-D20C-B19FE80CC8B1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -37.407698940921705 1 -0.39713409133013666
		 2 2.9657252601735937 3 9.8873295246007338 4 17.079721624103989 5 23.225135741793615
		 6 26.673820503998044 7 27.261514963724132 8 27.094881055868051 9 23.705723679733005
		 10 19.417074773308642 11 15.097389279415408 12 10.894480945807027 13 6.6894156908247346
		 14 2.5126728409459473 15 -1.5955083116149194 16 -5.6302260087289024 17 -9.5479315744726847
		 18 -13.372071321972784 19 -17.267275942163195 20 -21.143063634592437 21 -24.956041728869444
		 22 -28.551263161498113 23 -31.854801118360932 24 -34.482611984344139 25 -34.645433090711528
		 26 -29.273365775942814 27 -23.099604391006871 28 -19.948793128045843 29 -17.747943523480572
		 30 -15.613581583318153 31 -12.696531111187854 32 -8.2470143696517706 33 -8.2470143696517706
		 34 -8.2470143696517706;
createNode animCurveTA -n "IKLeg_L_rotateX1";
	rename -uid "491947D6-439E-B2C5-61E4-2E85D1A9FDF9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 98.634118044689188 1 51.991935769789528
		 2 41.693090443169886 3 27.151432794915277 4 12.119212648403575 5 -2.2469870544244204
		 6 -11.511150088391624 7 -16.35084138631974 8 -0.14591388461000301 9 7.3651127168640462
		 10 8.122295976806198 11 7.9414162514210664 12 7.9643938593829047 13 7.9772304788865949
		 14 7.9709150455609388 15 7.9466988555694416 16 7.9165516981123218 17 8.3105923377956739
		 18 9.6159833891343975 19 10.853646251319665 20 12.345753824865529 21 14.175494308138225
		 22 16.065541564033158 23 18.037213651020885 24 21.958420146436932 25 35.744835522549891
		 26 67.843114424937568 27 87.259015968552063 28 85.399371304268371 29 84.047594710986729
		 30 76.987799945265181 31 70.259696966391573 32 63.645105335918565 33 63.645105335918565
		 34 63.645105335918565;
createNode animCurveTA -n "IKLeg_L_rotateY1";
	rename -uid "4E40290F-4F4C-F82F-B419-2F9D37DDDADD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -26.027776206365235 1 -24.549296792601282
		 2 -28.562513636864072 3 -31.302780269037218 4 -33.642405118903831 5 -33.924746580518182
		 6 -31.578879778694759 7 -29.14235807945542 8 -31.234390153002913 9 -31.041095516704047
		 10 -31.145644121733323 11 -31.159351083072373 12 -31.198587159020619 13 -31.219877441439383
		 14 -31.231930778818011 15 -31.245903637080769 16 -31.264606050731505 17 -31.275202000426429
		 18 -31.120689771332255 19 -30.906073895976267 20 -30.956571992978667 21 -31.399368790892801
		 22 -32.115327787920407 23 -33.373362444964485 24 -35.259152765764028 25 -39.300750462086192
		 26 -35.666150144716397 27 -31.768857128230366 28 -34.237509858859354 29 -34.238860469983123
		 30 -29.096440683129767 31 -22.666870936266324 32 -23.232449123418807 33 -23.232449123418807
		 34 -23.232449123418807;
createNode animCurveTA -n "IKLeg_L_rotateZ1";
	rename -uid "01AE6E73-4914-8900-845C-4D92EB753C3F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -19.928035801946784 1 -14.282457896154501
		 2 -10.480768210991037 3 -3.0421722687554085 4 5.9303113569933119 5 13.764503720870211
		 6 17.3442308532006 7 20.134267044633194 8 10.269771361790676 9 4.5403230130573951
		 10 3.773187539312322 11 3.9119355892356569 12 3.8700679354469076 13 3.873459131049942
		 14 3.911040406053794 15 3.9705352422156084 16 4.0235635805122074 17 3.5526844009976335
		 18 2.836044840848285 19 3.1295907461880255 20 3.2254027788735153 21 3.3273727508723048
		 22 3.4989035618589837 23 3.5590907714796876 24 3.2360135901761038 25 -5.5780511013593816
		 26 -31.232218733295145 27 -40.773447052917582 28 -35.38208985237182 29 -31.267753712406691
		 30 -20.618942990033364 31 -14.871368512814042 32 -15.254076807478571 33 -15.254076807478571
		 34 -15.254076807478571;
createNode animCurveTA -n "FKKnee_L_rotateX1";
	rename -uid "0477019A-4C7E-3B56-F7C4-5DAC4627525F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -5.185630606606785 1 -6.5417709271605142
		 2 -8.4378416348240144 3 -8.7098490190237197 4 -8.1375938606967928 5 -7.0906490788700891
		 6 -5.0569545371448079 7 -3.5863499804003971 8 -3.9104836460594465 9 -3.2766865583789029
		 10 -1.4511575320352132 11 0.18576203857218263 12 0.75102021324610924 13 0.56592394151914782
		 14 0.13912716331644759 15 -0.18009226771099471 16 -0.44863890745820822 17 -1.0567933734229533
		 18 -1.8358575980374485 19 -2.1675429421707593 20 -2.2841690306097031 21 -2.2975247712805809
		 22 -2.0027400664847277 23 -1.8803153649928654 24 -3.3903250243052834 25 -7.4582049775177657
		 26 -11.244789584161357 27 -11.554571133099785 28 -9.3967691095307675 29 -6.8985231842840689
		 30 -4.7136262051167206 31 -4.2180104321584047 32 -5.1856776451104203 33 -5.1856776451104203
		 34 -5.1856776451104203;
createNode animCurveTA -n "FKKnee_L_rotateY1";
	rename -uid "4F6FED9E-4D18-E9BE-3689-6AA8550C6BC5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 13.200542903928721 1 13.1863969762809
		 2 11.023730821828419 3 6.6327155491283518 4 2.9340994386008523 5 0.089852357280992154
		 6 -1.8737632229451215 7 -2.6811053118490817 8 -1.857117815567215 9 -1.4695041380237754
		 10 -2.7811301367985499 11 -4.5891394379357227 12 -4.8845740827885349 13 -3.8168511130268485
		 14 -1.9936068407866594 15 0.11800438748570569 16 1.9294745470709072 17 3.1961578544178351
		 18 3.8808992338432993 19 4.0567145847724735 20 4.134540110545081 21 4.0744658255899182
		 22 3.3777155021975811 23 2.60366123859909 24 3.7284435524987916 25 9.9670759297541807
		 26 22.75423808146229 27 31.326251259177042 28 29.774798080259938 29 26.267763752445216
		 30 18.809305490217266 31 13.27346999400603 32 13.200517377630806 33 13.200517377630806
		 34 13.200517377630806;
createNode animCurveTA -n "FKKnee_L_rotateZ1";
	rename -uid "C76BD744-40A2-42B1-6AE0-239B40B221D0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -83.382123650097739 1 -76.985526802774672
		 2 -64.646881748371172 3 -51.08607893634408 4 -40.490410605196168 5 -33.242170699373574
		 6 -31.186398349908767 7 -33.204920327313985 8 -35.840821030437155 9 -43.805394493740629
		 10 -50.864589648284799 11 -54.463424451005494 12 -54.834348471339631 13 -53.291068179431797
		 14 -50.851788956184691 15 -47.960261790303143 16 -44.481741446320328 17 -40.646240000226278
		 18 -37.39628090960592 19 -35.633737148434818 20 -35.492645627313472 21 -36.808166525656326
		 22 -38.516227799943898 23 -39.431276190470342 24 -40.855461237951715 25 -50.612013471273372
		 26 -69.723775309088964 27 -82.057342476767218 28 -86.383078944430792 29 -88.803547495436305
		 30 -89.122297994722302 31 -86.917693371026388 32 -83.381959219031728 33 -83.381959219031728
		 34 -83.381959219031728;
createNode animCurveTA -n "FKHip_L_rotateX1";
	rename -uid "4AF73A68-4836-CAEA-3CA0-5B9B7EF9BD07";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 2.5444437451708134e-14 1 168.80994524375512
		 2 168.97887450629281 3 169.38461265280603 4 169.9625249674055 5 170.08810282306825
		 6 169.59980196797846 7 169.03894883646183 8 168.49381853638107 9 169.22210623390021
		 10 170.95403122054663 11 172.46430273937614 12 173.75818275943848 13 174.95140550455412
		 14 175.31811681656743 15 175.06367229876989 16 175.0618026235073 17 175.60766682488511
		 18 176.3936686969156 19 177.06623627732097 20 2.4535132096616699 21 1.8819923697616081
		 22 0.67979686500148717 23 -0.76824789101976987 24 -0.9878177563308872 25 0.16710790712507764
		 26 1.666162690715965 27 177.09752737821699 28 175.64798894764249 29 173.37771721150932
		 30 171.44465146966144 31 170.58812115691808 32 170.46047890741889 33 170.46047890741889
		 34 170.46047890741889;
createNode animCurveTA -n "FKHip_L_rotateY1";
	rename -uid "19E9A40B-4A65-BF70-CF57-9E8E03F56C04";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0 1 176.00882327819491 2 175.04527829484357
		 3 173.50700625511914 4 171.94781891464567 5 170.69867542697168 6 169.99695227376031
		 7 169.85477636061802 8 169.80204026343623 9 171.21920465344786 10 173.70724483425039
		 11 176.09545298766821 12 177.70641675917304 13 178.76533476455035 14 179.25975870667159
		 15 179.42477574407721 16 179.83664779456561 17 180.64732748656698 18 181.70886262982035
		 19 182.97462263869221 20 4.319338998902257 21 5.8764740262248933 22 7.8311563969294946
		 23 9.7840700835797296 24 10.395286735142689 25 7.2177081302863639 26 1.3684300343415112
		 27 178.49755595041577 28 177.28064425881678 29 177.23194823901704 30 177.51584004436324
		 31 177.85716751228526 32 177.2581309527406 33 177.2581309527406 34 177.2581309527406;
createNode animCurveTA -n "FKHip_L_rotateZ1";
	rename -uid "E16851E9-4723-0892-75C6-2EB3D547B63B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0 1 -137.056235075416 2 -141.592827458741
		 3 -144.24115189114266 4 -145.28568789084144 5 -145.39237862581356 6 -144.82336621697937
		 7 -144.66053732807407 8 -145.51611610626122 9 -145.08180021530148 10 -144.65823704774485
		 11 -144.8900667701144 12 213.7596339262366 13 211.30297079159078 14 208.22987610339419
		 15 204.85085469524248 16 201.02561014379546 17 196.86351558941865 18 192.92825182215407
		 19 189.68732919144969 20 7.2085225908191175 21 5.2665603633164455 22 3.0331737237103216
		 23 -0.32681219499644926 24 -3.4798420020486787 25 -1.6173843967214643 26 7.5620343138918047
		 27 196.52357819457822 28 202.2935915773935 29 207.58701767555016 30 -147.53555113045479
		 31 -144.07830387597292 32 -141.50818242453926 33 -141.50818242453926 34 -141.50818242453926;
createNode animCurveTL -n "RootX_M_translateX1";
	rename -uid "BE5B5325-4D6C-9297-F8D6-578413711FFE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0 1 0.22323280478608593 2 0.53202987239249555
		 3 0.91427682267537169 4 1.3863574300562775 5 1.9496929890663826 6 2.6092294425155349
		 7 3.417664156774094 8 4.4716569672764983 9 5.8188205616331938 10 7.2946069467282761
		 11 8.4940120873325036 12 9.1062502559297975 13 9.1972760782707876 14 9.0217491526961808
		 15 8.7893172223711495 16 8.5958731114101283 17 8.4301091908947328 18 8.2266117215613423
		 19 7.933800961597588 20 7.5484938604402823 21 7.0476203603584979 22 6.3224173948262878
		 23 5.3109186154387755 24 4.1922605110555544 25 3.1698347959117381 26 2.1433771217059601
		 27 1.17132448388517 28 0.54243327115050433 29 0.2661050517355189 30 0.12620402527022831
		 31 0.012020927998538378 32 -1.1042936631788791e-07 33 -1.1042936631788791e-07 34 -1.1042936631788791e-07;
createNode animCurveTL -n "RootX_M_translateY1";
	rename -uid "14560F0C-459D-92C4-7556-438B392795B4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0 1 0.84473777486927304 2 1.7743154502679488
		 3 2.422820351665365 4 2.5331471842909536 5 2.0091451541287881 6 0.92245183403588271
		 7 -0.5851742671903537 8 -2.187483832227926 9 -3.4119348603921225 10 -3.9663922606986972
		 11 -3.8416187823013388 12 -3.2177668504258747 13 -2.3034988815112172 14 -1.3316681698349981
		 15 -0.43226360712048972 16 0.39232285134373512 17 1.1181500637308375 18 1.672130298745671
		 19 1.9027054351966797 20 1.6571401748476973 21 0.8944571062458806 22 -0.34979473551474882
		 23 -1.9581038175935959 24 -3.5851839042135367 25 -4.7219620216707909 26 -5.1009987846678086
		 27 -4.8988028358455438 28 -4.2931686573860333 29 -3.3398440302011494 30 -2.2049201874479962
		 31 -1.0111771366035924 32 0 33 0 34 0;
createNode animCurveTL -n "RootX_M_translateZ1";
	rename -uid "98F12B9E-4A2F-2736-C887-E7A7283D02DE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0 1 -1.6145899259077674 2 -2.3712055858817047
		 3 -3.0810483752585864 4 -3.5798496682818972 5 -3.69358515003871 6 -3.2322463897375449
		 7 -1.9950438048487118 8 0.047624045188164099 9 2.5403438994835077 10 4.7665531381174109
		 11 6.1060484793186829 12 6.5198026269503222 13 6.2967080723976343 14 5.6339673762997222
		 15 4.7108125799762783 16 3.7278545049693896 17 2.7553479741987505 18 1.7766883847057509
		 19 0.84989630344410716 20 0.11972343365501892 21 -0.21197469010564496 22 0.16255431747357441
		 23 1.4182958900598965 24 3.0699094939798037 25 4.1290957130314458 26 4.0727468391969648
		 27 3.296424491174943 28 2.475274080402996 29 1.7938434090369824 30 1.0551776215846012
		 31 0.40040089511273891 32 -0.30660625146776088 33 -0.30660625146776088 34 -0.30660625146776088;
createNode animCurveTA -n "RootX_M_rotateX1";
	rename -uid "DA472351-41A6-318E-F3CE-06895194B610";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 6.6078886702520911 1 6.581181234451992
		 2 6.5758421509931848 3 6.8083610481075425 4 7.3333661459992241 5 7.7783544005159584
		 6 7.6503884639082802 7 6.8071537470294521 8 5.665191958872728 9 4.8449594464934105
		 10 4.8112696535836488 11 5.5085934848330362 12 6.3103577897874592 13 6.8138569606844097
		 14 7.1096377320937867 15 7.3188379740569873 16 7.3788365723793143 17 7.231856581709355
		 18 6.9237354942072713 19 6.6076240777262489 20 6.4255071153382683 21 6.3967118467572721
		 22 6.456988907971005 23 6.5603818525726885 24 6.7046206983590819 25 6.8363974245499408
		 26 6.8505203511116557 27 6.6940090717018927 28 6.6200472790619802 29 6.7936348517707676
		 30 6.9911337532100388 31 6.9383714028750108 32 6.6078829938017831 33 6.6078829938017831
		 34 6.6078829938017831;
createNode animCurveTA -n "RootX_M_rotateY1";
	rename -uid "64A158A2-43EF-3EAA-FA45-B9B40984D7CD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 -33.178927386359021 1 -33.937730541411682
		 2 -35.192011917317842 3 -36.799501500940146 4 -38.471556426612189 5 -39.990285445295171
		 6 -41.270036333069037 7 -42.281400778554385 8 -42.974507658483816 9 -43.490340594697841
		 10 -44.111049027114348 11 -44.42594754498127 12 -43.53195372133758 13 -41.647918136733068
		 14 -39.958382123960448 15 -38.940473860161802 16 -38.082971321584147 17 -36.918028041686348
		 18 -35.535912326497723 19 -34.334917298856617 20 -33.471959410905512 21 -32.753107407440325
		 22 -31.886173067210045 23 -30.783055448109057 24 -29.940677541309302 25 -30.046578418929787
		 26 -30.735581570466529 27 -31.129344577954249 28 -31.508528112268149 29 -32.24613345005325
		 30 -32.798988258526535 31 -32.946638755896672 32 -33.178919752415688 33 -33.178919752415688
		 34 -33.178919752415688;
createNode animCurveTA -n "RootX_M_rotateZ1";
	rename -uid "2B7D4E62-49AE-FC9C-01F1-EAAC7ABA5FB9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr -s 35 ".ktv[0:34]"  0 0.14100726163431382 1 0.5144141560609593
		 2 0.73123031606787958 3 0.70900136015381243 4 0.50777467029076451 5 0.14535773096286786
		 6 -0.39340922289300195 7 -1.0843633876643293 8 -1.647603781175401 9 -1.7835928768182612
		 10 -1.8524122707785529 11 -2.3586989628274919 12 -3.0014743816204033 13 -3.4008299290029989
		 14 -3.6571725755611624 15 -3.7489837647856432 16 -3.5186293265626118 17 -3.0213274883213956
		 18 -2.4365407935529499 19 -1.8547269845131626 20 -1.2826867383442759 21 -0.69900387419475762
		 22 -0.083494250785179219 23 0.50525299258754897 24 0.74763714980399687 25 0.29149191665500945
		 26 -0.48269486387148175 27 -0.9628847162570725 28 -1.139138554080195 29 -1.0763016757801729
		 30 -0.86921907179429958 31 -0.46783099142694118 32 0.14100445529326197 33 0.14100445529326197
		 34 0.14100445529326197;
createNode mayaUsdLayerManager -n "mayaUsdLayerManager1";
	rename -uid "8FCA752E-4615-DB98-4CBE-EE865948C298";
	setAttr ".sst" -type "string" "";
select -ne :time1;
	setAttr ".o" 26;
	setAttr ".unw" 26;
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
connectAttr "FKNeck_M_rotateX1.o" "zombie_rig_ver2RN.phl[1]";
connectAttr "FKNeck_M_rotateY1.o" "zombie_rig_ver2RN.phl[2]";
connectAttr "FKNeck_M_rotateZ1.o" "zombie_rig_ver2RN.phl[3]";
connectAttr "FKHead_M_rotateX1.o" "zombie_rig_ver2RN.phl[4]";
connectAttr "FKHead_M_rotateY1.o" "zombie_rig_ver2RN.phl[5]";
connectAttr "FKHead_M_rotateZ1.o" "zombie_rig_ver2RN.phl[6]";
connectAttr "FKScapula_R_rotateX1.o" "zombie_rig_ver2RN.phl[7]";
connectAttr "FKScapula_R_rotateY1.o" "zombie_rig_ver2RN.phl[8]";
connectAttr "FKScapula_R_rotateZ1.o" "zombie_rig_ver2RN.phl[9]";
connectAttr "FKShoulder_R_rotateX1.o" "zombie_rig_ver2RN.phl[10]";
connectAttr "FKShoulder_R_rotateY1.o" "zombie_rig_ver2RN.phl[11]";
connectAttr "FKShoulder_R_rotateZ1.o" "zombie_rig_ver2RN.phl[12]";
connectAttr "FKElbow_R_rotateX1.o" "zombie_rig_ver2RN.phl[13]";
connectAttr "FKElbow_R_rotateY1.o" "zombie_rig_ver2RN.phl[14]";
connectAttr "FKElbow_R_rotateZ1.o" "zombie_rig_ver2RN.phl[15]";
connectAttr "FKWrist_R_rotateX1.o" "zombie_rig_ver2RN.phl[16]";
connectAttr "FKWrist_R_rotateY1.o" "zombie_rig_ver2RN.phl[17]";
connectAttr "FKWrist_R_rotateZ1.o" "zombie_rig_ver2RN.phl[18]";
connectAttr "FKScapula_L_rotateX1.o" "zombie_rig_ver2RN.phl[19]";
connectAttr "FKScapula_L_rotateY1.o" "zombie_rig_ver2RN.phl[20]";
connectAttr "FKScapula_L_rotateZ1.o" "zombie_rig_ver2RN.phl[21]";
connectAttr "FKShoulder_L_rotateX1.o" "zombie_rig_ver2RN.phl[22]";
connectAttr "FKShoulder_L_rotateY1.o" "zombie_rig_ver2RN.phl[23]";
connectAttr "FKShoulder_L_rotateZ1.o" "zombie_rig_ver2RN.phl[24]";
connectAttr "FKElbow_L_rotateX1.o" "zombie_rig_ver2RN.phl[25]";
connectAttr "FKElbow_L_rotateY1.o" "zombie_rig_ver2RN.phl[26]";
connectAttr "FKElbow_L_rotateZ1.o" "zombie_rig_ver2RN.phl[27]";
connectAttr "FKWrist_L_rotateX1.o" "zombie_rig_ver2RN.phl[28]";
connectAttr "FKWrist_L_rotateY1.o" "zombie_rig_ver2RN.phl[29]";
connectAttr "FKWrist_L_rotateZ1.o" "zombie_rig_ver2RN.phl[30]";
connectAttr "FKHip_R_rotateX1.o" "zombie_rig_ver2RN.phl[31]";
connectAttr "FKHip_R_rotateY1.o" "zombie_rig_ver2RN.phl[32]";
connectAttr "FKHip_R_rotateZ1.o" "zombie_rig_ver2RN.phl[33]";
connectAttr "FKKnee_R_rotateX1.o" "zombie_rig_ver2RN.phl[34]";
connectAttr "FKKnee_R_rotateY1.o" "zombie_rig_ver2RN.phl[35]";
connectAttr "FKKnee_R_rotateZ1.o" "zombie_rig_ver2RN.phl[36]";
connectAttr "FKAnkle_R_rotateX1.o" "zombie_rig_ver2RN.phl[37]";
connectAttr "FKAnkle_R_rotateY1.o" "zombie_rig_ver2RN.phl[38]";
connectAttr "FKAnkle_R_rotateZ1.o" "zombie_rig_ver2RN.phl[39]";
connectAttr "FKToes_R_rotateX1.o" "zombie_rig_ver2RN.phl[40]";
connectAttr "FKToes_R_rotateY1.o" "zombie_rig_ver2RN.phl[41]";
connectAttr "FKToes_R_rotateZ1.o" "zombie_rig_ver2RN.phl[42]";
connectAttr "FKHip_L_rotateX1.o" "zombie_rig_ver2RN.phl[43]";
connectAttr "FKHip_L_rotateY1.o" "zombie_rig_ver2RN.phl[44]";
connectAttr "FKHip_L_rotateZ1.o" "zombie_rig_ver2RN.phl[45]";
connectAttr "FKKnee_L_rotateX1.o" "zombie_rig_ver2RN.phl[46]";
connectAttr "FKKnee_L_rotateY1.o" "zombie_rig_ver2RN.phl[47]";
connectAttr "FKKnee_L_rotateZ1.o" "zombie_rig_ver2RN.phl[48]";
connectAttr "FKAnkle_L_rotateX1.o" "zombie_rig_ver2RN.phl[49]";
connectAttr "FKAnkle_L_rotateY1.o" "zombie_rig_ver2RN.phl[50]";
connectAttr "FKAnkle_L_rotateZ1.o" "zombie_rig_ver2RN.phl[51]";
connectAttr "FKToes_L_rotateX1.o" "zombie_rig_ver2RN.phl[52]";
connectAttr "FKToes_L_rotateY1.o" "zombie_rig_ver2RN.phl[53]";
connectAttr "FKToes_L_rotateZ1.o" "zombie_rig_ver2RN.phl[54]";
connectAttr "FKSpine1_M_rotateX1.o" "zombie_rig_ver2RN.phl[55]";
connectAttr "FKSpine1_M_rotateY1.o" "zombie_rig_ver2RN.phl[56]";
connectAttr "FKSpine1_M_rotateZ1.o" "zombie_rig_ver2RN.phl[57]";
connectAttr "FKChest_M_rotateX1.o" "zombie_rig_ver2RN.phl[58]";
connectAttr "FKChest_M_rotateY1.o" "zombie_rig_ver2RN.phl[59]";
connectAttr "FKChest_M_rotateZ1.o" "zombie_rig_ver2RN.phl[60]";
connectAttr "FKMiddleFinger1_L_rotateX1.o" "zombie_rig_ver2RN.phl[61]";
connectAttr "FKMiddleFinger1_L_rotateY1.o" "zombie_rig_ver2RN.phl[62]";
connectAttr "FKMiddleFinger1_L_rotateZ1.o" "zombie_rig_ver2RN.phl[63]";
connectAttr "FKMiddleFinger2_L_rotateX1.o" "zombie_rig_ver2RN.phl[64]";
connectAttr "FKMiddleFinger2_L_rotateY1.o" "zombie_rig_ver2RN.phl[65]";
connectAttr "FKMiddleFinger2_L_rotateZ1.o" "zombie_rig_ver2RN.phl[66]";
connectAttr "FKMiddleFinger3_L_rotateX1.o" "zombie_rig_ver2RN.phl[67]";
connectAttr "FKMiddleFinger3_L_rotateY1.o" "zombie_rig_ver2RN.phl[68]";
connectAttr "FKMiddleFinger3_L_rotateZ1.o" "zombie_rig_ver2RN.phl[69]";
connectAttr "FKThumbFinger1_L_rotateX1.o" "zombie_rig_ver2RN.phl[70]";
connectAttr "FKThumbFinger1_L_rotateY1.o" "zombie_rig_ver2RN.phl[71]";
connectAttr "FKThumbFinger1_L_rotateZ1.o" "zombie_rig_ver2RN.phl[72]";
connectAttr "FKThumbFinger2_L_rotateX1.o" "zombie_rig_ver2RN.phl[73]";
connectAttr "FKThumbFinger2_L_rotateY1.o" "zombie_rig_ver2RN.phl[74]";
connectAttr "FKThumbFinger2_L_rotateZ1.o" "zombie_rig_ver2RN.phl[75]";
connectAttr "FKIndexFinger1_L_rotateX1.o" "zombie_rig_ver2RN.phl[76]";
connectAttr "FKIndexFinger1_L_rotateY1.o" "zombie_rig_ver2RN.phl[77]";
connectAttr "FKIndexFinger1_L_rotateZ1.o" "zombie_rig_ver2RN.phl[78]";
connectAttr "FKIndexFinger2_L_rotateX1.o" "zombie_rig_ver2RN.phl[79]";
connectAttr "FKIndexFinger2_L_rotateY1.o" "zombie_rig_ver2RN.phl[80]";
connectAttr "FKIndexFinger2_L_rotateZ1.o" "zombie_rig_ver2RN.phl[81]";
connectAttr "FKIndexFinger3_L_rotateX1.o" "zombie_rig_ver2RN.phl[82]";
connectAttr "FKIndexFinger3_L_rotateY1.o" "zombie_rig_ver2RN.phl[83]";
connectAttr "FKIndexFinger3_L_rotateZ1.o" "zombie_rig_ver2RN.phl[84]";
connectAttr "FKPinkyFinger1_L_rotateX1.o" "zombie_rig_ver2RN.phl[85]";
connectAttr "FKPinkyFinger1_L_rotateY1.o" "zombie_rig_ver2RN.phl[86]";
connectAttr "FKPinkyFinger1_L_rotateZ1.o" "zombie_rig_ver2RN.phl[87]";
connectAttr "FKPinkyFinger2_L_rotateX1.o" "zombie_rig_ver2RN.phl[88]";
connectAttr "FKPinkyFinger2_L_rotateY1.o" "zombie_rig_ver2RN.phl[89]";
connectAttr "FKPinkyFinger2_L_rotateZ1.o" "zombie_rig_ver2RN.phl[90]";
connectAttr "FKPinkyFinger3_L_rotateX1.o" "zombie_rig_ver2RN.phl[91]";
connectAttr "FKPinkyFinger3_L_rotateY1.o" "zombie_rig_ver2RN.phl[92]";
connectAttr "FKPinkyFinger3_L_rotateZ1.o" "zombie_rig_ver2RN.phl[93]";
connectAttr "FKRingFinger1_L_rotateX1.o" "zombie_rig_ver2RN.phl[94]";
connectAttr "FKRingFinger1_L_rotateY1.o" "zombie_rig_ver2RN.phl[95]";
connectAttr "FKRingFinger1_L_rotateZ1.o" "zombie_rig_ver2RN.phl[96]";
connectAttr "FKRingFinger2_L_rotateX1.o" "zombie_rig_ver2RN.phl[97]";
connectAttr "FKRingFinger2_L_rotateY1.o" "zombie_rig_ver2RN.phl[98]";
connectAttr "FKRingFinger2_L_rotateZ1.o" "zombie_rig_ver2RN.phl[99]";
connectAttr "FKRingFinger3_L_rotateX1.o" "zombie_rig_ver2RN.phl[100]";
connectAttr "FKRingFinger3_L_rotateY1.o" "zombie_rig_ver2RN.phl[101]";
connectAttr "FKRingFinger3_L_rotateZ1.o" "zombie_rig_ver2RN.phl[102]";
connectAttr "IKLeg_R_translateX1.o" "zombie_rig_ver2RN.phl[103]";
connectAttr "IKLeg_R_translateY1.o" "zombie_rig_ver2RN.phl[104]";
connectAttr "IKLeg_R_translateZ1.o" "zombie_rig_ver2RN.phl[105]";
connectAttr "IKLeg_R_rotateX1.o" "zombie_rig_ver2RN.phl[106]";
connectAttr "IKLeg_R_rotateY1.o" "zombie_rig_ver2RN.phl[107]";
connectAttr "IKLeg_R_rotateZ1.o" "zombie_rig_ver2RN.phl[108]";
connectAttr "IKLeg_L_translateX1.o" "zombie_rig_ver2RN.phl[109]";
connectAttr "IKLeg_L_translateY1.o" "zombie_rig_ver2RN.phl[110]";
connectAttr "IKLeg_L_translateZ1.o" "zombie_rig_ver2RN.phl[111]";
connectAttr "IKLeg_L_rotateX1.o" "zombie_rig_ver2RN.phl[112]";
connectAttr "IKLeg_L_rotateY1.o" "zombie_rig_ver2RN.phl[113]";
connectAttr "IKLeg_L_rotateZ1.o" "zombie_rig_ver2RN.phl[114]";
connectAttr "RootX_M_translateX1.o" "zombie_rig_ver2RN.phl[115]";
connectAttr "RootX_M_translateY1.o" "zombie_rig_ver2RN.phl[116]";
connectAttr "RootX_M_translateZ1.o" "zombie_rig_ver2RN.phl[117]";
connectAttr "RootX_M_rotateX1.o" "zombie_rig_ver2RN.phl[118]";
connectAttr "RootX_M_rotateY1.o" "zombie_rig_ver2RN.phl[119]";
connectAttr "RootX_M_rotateZ1.o" "zombie_rig_ver2RN.phl[120]";
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
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of walk.ma
