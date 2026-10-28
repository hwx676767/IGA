using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;
using System.Linq;

public class SearchManager : MonoBehaviour
{
    [Header("UI组件")]
    public InputField searchInputField;
    public Button searchButton;
    public Transform resultsContainer;      // ScrollView的Content
    public GameObject infoItemPrefab;        // 信息条预制体
    
    [Header("搜索结果反馈")]
    public Text feedbackMessage;
    
    [Header("搜索设置")]
    public bool caseSensitive = false;
    
    [Header("数据源")]
    public List<InfoData> allInfoData;
    
    // 搜索结果类型枚举
    private enum SearchResultType
    {
        ExactMatch,
        PartialMatch,
        NoMatch
    }
    
    void Start()
    {
        // 确保UIManager存在
        if (UIManager.Instance == null)
        {
            Debug.LogError("场景中需要UIManager！");
        }
        
        // 保存所有数据到静态类
        SearchSystemData.AllInfoDataList = allInfoData;
        
        // 添加监听事件
        if (searchButton != null)
            searchButton.onClick.AddListener(PerformSearch);
        
        feedbackMessage.text = string.Empty;
        
    }
    
    // 执行搜索
    public void PerformSearch()
    {
        string searchText = searchInputField.text;
        
        // 检查输入是否为空
        if (string.IsNullOrEmpty(searchText))
        {
            ShowFeedback("请输入搜索内容", Color.yellow);
            ClearResults();
            return;
        }
        
        // 执行搜索
        var searchResult = SearchByKeyword(searchText);
        
        // 处理搜索结果
        ProcessSearchResults(searchResult);
    }
    
    // 关键词搜索
    private (List<InfoData> results, SearchResultType type) SearchByKeyword(string keyword)
    {
        List<InfoData> exactMatches = new List<InfoData>();
        List<InfoData> partialMatches = new List<InfoData>();
        
        string searchKeyword = caseSensitive ? keyword : keyword.ToLower();
        
        foreach (var infoData in allInfoData)
        {
            bool isExactMatch = false;
            bool isPartialMatch = false;
            
            // 检查关键词列表
            foreach (var kw in infoData.keywords)
            {
                string compareKw = caseSensitive ? kw : kw.ToLower();
                
                if (compareKw.Equals(searchKeyword))
                {
                    isExactMatch = true;
                    break;
                }
                else if (compareKw.Contains(searchKeyword) || searchKeyword.Contains(compareKw))
                {
                    isPartialMatch = true;
                }
            }
            
            // 检查标题（作为补充匹配）
            string title = caseSensitive ? infoData.infoTitle : infoData.infoTitle.ToLower();
            if (title.Contains(searchKeyword))
            {
                isPartialMatch = true;
            }
            
            // 分类结果
            if (isExactMatch)
            {
                exactMatches.Add(infoData);
            }
            else if (isPartialMatch)
            {
                partialMatches.Add(infoData);
            }
        }
        
        // 确定结果类型并返回
        if (exactMatches.Count > 0)
        {
            return (exactMatches, SearchResultType.ExactMatch);
        }
        else if (partialMatches.Count > 0)
        {
            return (partialMatches, SearchResultType.PartialMatch);
        }
        else
        {
            return (new List<InfoData>(), SearchResultType.NoMatch);
        }
    }
    
    // 处理搜索结果
    private void ProcessSearchResults((List<InfoData> results, SearchResultType type) searchResult)
    {
        // 清除现有结果
        ClearResults();
        
        // 根据结果类型显示不同的反馈
        switch (searchResult.type)
        {
            case SearchResultType.ExactMatch:
                //ShowFeedback($"找到 {searchResult.results.Count} 条相关信息", Color.green);
                // 生成完全匹配的结果
                GenerateResultItems(searchResult.results);
                break;
                
            case SearchResultType.PartialMatch:
                ShowFeedback($"找到 {searchResult.results.Count} 条相关建议", Color.yellow);
                // 生成部分匹配的结果 - 确保这里执行
                //GenerateResultItems(searchResult.results);
                Debug.Log($"部分匹配：生成了 {searchResult.results.Count} 个结果");
                break;
                
            case SearchResultType.NoMatch:
                ShowFeedback("未找到相关信息", Color.red);
                break;
        }
    }
    
    // 生成结果条目
    private void GenerateResultItems(List<InfoData> results)
    {
        if (results == null || results.Count == 0)
        {
            Debug.Log("没有结果可生成");
            return;
        }
        
        foreach (var data in results)
        {
            // 实例化预制体到Content容器
            GameObject itemObj = Instantiate(infoItemPrefab, resultsContainer);
            
            // 获取组件并初始化
            InfoItemButton itemButton = itemObj.GetComponent<InfoItemButton>();
            if (itemButton != null)
            {
                itemButton.Initialize(data);
            }
            
            // 保持原有的RectTransform设置
            RectTransform rectTransform = itemObj.GetComponent<RectTransform>();
            if (rectTransform != null)
            {
                rectTransform.localScale = Vector3.one;
            }
        }
        
        // 强制刷新布局（保持原有的布局行为）
        LayoutRebuilder.ForceRebuildLayoutImmediate(resultsContainer.GetComponent<RectTransform>());
    }
    
    // 显示反馈信息
    private void ShowFeedback(string message, Color color)
    {
        if (feedbackMessage != null)
        {
            feedbackMessage.text = message;
            feedbackMessage.color = color;
        }
    }
    
    // 清除搜索结果
    private void ClearResults()
    {
        if (resultsContainer != null)
        {
            foreach (Transform child in resultsContainer)
            {
                Destroy(child.gameObject);
            }
        }
    }
}