# One-shot: add SpriteRenderer + sprite refs on existing S1 Reveal objects.
from pathlib import Path

scene = Path(r"E:\Workspace\unityWorkspace\1005-alice\Assets\Scenes\S1.unity")
text = scene.read_text(encoding="utf-8")

sprites = {
    "Reveal_MedievalCastle": "b1d1b87a591736141bcf12abb97d2a9b",
    "Reveal_KnightArmor": "dbc65b5d69f056244967794a2e6ede97",
    "Reveal_GothicArch": "2dee933b7bfcae641bfe4371a05aa6ca",
    "Reveal_Parchment": "18a0549996f90e643b903a476fa99122",
    "Reveal_Microphone": "5947db842d7a50a40a6252792e3dba55",
    "Reveal_NeonSign": "d32b3f853ee607046ad4f7239ed20459",
    "Reveal_Spaceship": "3f50f71818841d14caa542b0d3e919e2",
    "Reveal_Livestream": "84956cf3113b3f64fb6c901851610731",
    "Reveal_CandleTorch": "8f7aa7cecce6249429a85eb02e5a73ac",
    "Reveal_WoodenTable": "e230c1a2f9b1c8f4a93a2851382cf88d",
    "Reveal_Throne": "1bbff9b633210234c9db3d10f9c008d1",
    "Reveal_StainedGlass": "79cd1ebde36a1134d9fb786004b80906",
    "Reveal_GreekColumns": "3a43df5b66d449f4e8885d9afe3344d4",
    "Reveal_RomanArena": "66ea02e3a00984d40b11974c231a6818",
    "Reveal_RenaissancePainting": "5ace48e9c435f374cb9bc5f045365caf",
    "Reveal_BaroqueChandelier": "d0122f23887ad894a8654e9bd6c826bc",
    "Reveal_VictorianSteamEngine": "5f189851042fa7b449a68d420c5c3906",
    "Reveal_Torii": "adf426703d02ae9408459c415a1968cf",
    "Reveal_BeachUmbrella": "ca6b97876686d0e4c8b445c3619b75fe",
    "Reveal_VendingMachine": "2071da10a44d7f140a02106718a0d04b",
}

MAT = "a97c105638bdf8b4a8650670310a4cd3"


def sprite_block(sr_id, go_id, guid):
    return f"""--- !u!212 &{sr_id}
SpriteRenderer:
  m_ObjectHideFlags: 0
  m_CorrespondingSourceObject: {{fileID: 0}}
  m_PrefabInstance: {{fileID: 0}}
  m_PrefabAsset: {{fileID: 0}}
  m_GameObject: {{fileID: {go_id}}}
  m_Enabled: 1
  m_CastShadows: 0
  m_ReceiveShadows: 0
  m_DynamicOccludee: 1
  m_StaticShadowCaster: 0
  m_MotionVectors: 1
  m_LightProbeUsage: 1
  m_ReflectionProbeUsage: 1
  m_RayTracingMode: 0
  m_RayTraceProcedural: 0
  m_RenderingLayerMask: 1
  m_RendererPriority: 0
  m_Materials:
  - {{fileID: 2100000, guid: {MAT}, type: 2}}
  m_StaticBatchInfo:
    firstSubMesh: 0
    subMeshCount: 0
  m_StaticBatchRoot: {{fileID: 0}}
  m_ProbeAnchor: {{fileID: 0}}
  m_LightProbeVolumeOverride: {{fileID: 0}}
  m_ScaleInLightmap: 1
  m_ReceiveGI: 1
  m_PreserveUVs: 0
  m_IgnoreNormalsForChartDetection: 0
  m_ImportantGI: 0
  m_StitchLightmapSeams: 1
  m_SelectedEditorRenderState: 0
  m_MinimumChartSize: 4
  m_AutoUVMaxDistance: 0.5
  m_AutoUVMaxAngle: 89
  m_LightmapParameters: {{fileID: 0}}
  m_SortingLayerID: 0
  m_SortingLayer: 0
  m_SortingOrder: 5
  m_Sprite: {{fileID: 21300000, guid: {guid}, type: 3}}
  m_Color: {{r: 1, g: 1, b: 1, a: 1}}
  m_FlipX: 0
  m_FlipY: 0
  m_DrawMode: 0
  m_Size: {{x: 1, y: 1}}
  m_AdaptiveModeThreshold: 0.5
  m_SpriteTileMode: 0
  m_WasSpriteAssigned: 1
  m_MaskInteraction: 0
  m_SpriteSortPoint: 0
"""


for name, guid in sprites.items():
    marker = f"  m_Name: {name}\n"
    idx = text.find(marker)
    if idx < 0:
        raise SystemExit(f"missing {name}")
    go_start = text.rfind("--- !u!1 &", 0, idx)
    go_id = text[go_start:].split("&", 1)[1].splitlines()[0].strip()
    sr_id = str(int(go_id) + 3)
    if f"--- !u!212 &{sr_id}" in text:
        continue
    comp = "  m_Component:\n"
    comp_idx = text.find(comp, go_start)
    insert_at = text.find("\n", text.find("\n", comp_idx + 1) + 1)  # after two component lines
    # insert after the two existing component entries
    line1 = text.find("- component:", go_start)
    line2 = text.find("- component:", line1 + 1)
    end2 = text.find("\n", line2)
    text = text[: end2 + 1] + f"  - component: {{fileID: {sr_id}}}\n" + text[end2 + 1 :]
    active = f"  m_Name: {name}\n  m_TagString: Untagged\n  m_Icon: {{fileID: 0}}\n  m_NavMeshLayer: 0\n  m_StaticEditorFlags: 0\n  m_IsActive: 0\n"
    text = text.replace(active, active.replace("m_IsActive: 0", "m_IsActive: 1"), 1)
    # insert renderer after this object's MonoBehaviour, before next --- !u!1
    mb = text.find("--- !u!114 &", go_start)
    next_obj = text.find("\n--- !u!", mb + 1)
    text = text[: next_obj + 1] + sprite_block(sr_id, go_id, guid) + text[next_obj + 1 :]

scene.write_text(text, encoding="utf-8")
print("patched", scene)
