using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class PuzzleManager : MonoBehaviour
{
    [Header("拼图设置")]
    public int totalPieces = 8;
    
    [Header("第一只海獭（画中）")]
    public GameObject otterPrefab;
    public Transform otterSpawnPoint;
    public float otterAppearDelay = 0.5f;
    
    [Header("第二只海獭（画前探头）")]
    public Transform hidePoint;              // 藏起来的位置（画框下方）
    public Transform showPoint;              // 探出头的位置（画框底部边缘）
    
    [Header("特效与音效（可选）")]
    public ParticleSystem magicEffect;
    public AudioClip completeSound;
    public GameObject completionText;
    
    [Header("重置功能（可选）")]
    public Button resetButton;
    public GameObject[] allPieces;
    
    private int piecesPlaced = 0;
    private bool isComplete = false;
    
    void Start()
    {
        piecesPlaced = 0;
        isComplete = false;
        
        if (resetButton != null)
            resetButton.onClick.AddListener(ResetPuzzle);
        
        if (completionText != null)
            completionText.SetActive(false);
    }
    
    public void PiecePlaced()
    {
        if (isComplete) return;
        piecesPlaced++;
        Debug.Log($"拼图进度：{piecesPlaced}/{totalPieces}");
        
        if (piecesPlaced >= totalPieces)
        {
            StartCoroutine(OnPuzzleComplete());
        }
    }
    
    IEnumerator OnPuzzleComplete()
    {
        isComplete = true;
        Debug.Log("拼图完成！海獭即将出现");
        
        if (magicEffect != null) magicEffect.Play();
        if (completeSound != null) AudioSource.PlayClipAtPoint(completeSound, Camera.main.transform.position);
        if (completionText != null) completionText.SetActive(true);
        
        yield return new WaitForSeconds(otterAppearDelay);
        
        // 生成第一只海獭（画中）
        if (otterPrefab != null && otterSpawnPoint != null)
        {
            Canvas canvas = FindObjectOfType<Canvas>();
            GameObject otter = Instantiate(otterPrefab, canvas.transform);
            otter.transform.position = otterSpawnPoint.position;
            
            // 传递位置给第一只海獭的点击脚本，让它知道从哪里生成第二只
            OtterClickable clickable = otter.GetComponent<OtterClickable>();
            if (clickable != null)
            {
                clickable.hidePoint = hidePoint;
                clickable.showPoint = showPoint;
            }
            
            Debug.Log("第一只海獭已出现");
        }
        else
        {
            if (otterPrefab == null) Debug.LogError("otterPrefab未设置");
            if (otterSpawnPoint == null) Debug.LogError("otterSpawnPoint未设置");
        }
    }
    
    public void ResetPuzzle()
    {
        // 销毁第一只海獭
        GameObject existingOtter = GameObject.Find("Otter(Clone)");
        if (existingOtter != null) Destroy(existingOtter);
        
        // 销毁第二只海獭（如果有）
        GameObject existingPeeking = GameObject.Find("OtterPeeking(Clone)");
        if (existingPeeking != null) Destroy(existingPeeking);
        
        isComplete = false;
        piecesPlaced = 0;
        
        foreach (GameObject piece in allPieces)
        {
            if (piece != null)
            {
                DraggablePiece draggable = piece.GetComponent<DraggablePiece>();
                if (draggable != null) draggable.ResetPiece();
            }
        }
        
        if (completionText != null) completionText.SetActive(false);
        if (magicEffect != null) magicEffect.Stop();
        
        Debug.Log("拼图已重置");
    }
    
    public int GetProgress()
    {
        return piecesPlaced;
    }
}