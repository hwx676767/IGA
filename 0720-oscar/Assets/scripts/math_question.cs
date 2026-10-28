using System.Collections;
using System.Collections.Generic;
using System.Text;
using Unity.PlasticSCM.Editor.WebApi;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;
using static Unity.Burst.Intrinsics.X86.Avx;
using System.Linq;

public class math_question : MonoBehaviour
{
    public string answer;
    private bool inArea = false;
    private bool isInputActive = false;
    private bool isAnswered = false; // 新增：标记是否已答对
    public Text response;
    public Text result;
    public GameObject obstacle;
    private StringBuilder currentInput = new StringBuilder();
    // 静态变量，跟踪当前激活的 MathQuestion 实例
    private static math_question currentActiveQuestion = null;
    void Start()
    {
        Text[] allTexts = GetComponentsInChildren<Text>(true);
        // 确保每个预制体引用自己的 UI 组件
        response = allTexts.FirstOrDefault(t => t.name == "Answer");
        result = allTexts.FirstOrDefault(t => t.name == "Result");
        obstacle = transform.Find("obstacle")?.gameObject;
        // 如果 UI 组件或 obstacle 未正确设置，打印警告
        if (response == null) Debug.LogWarning("Response Text not found for " +
        gameObject.name);
        if (result == null) Debug.LogWarning("Result Text not found for " +
        gameObject.name);
        if (obstacle == null) Debug.LogWarning("Obstacle not found for " +
        gameObject.name);
    }
    void Update()
    {
        // 仅当当前实例是激活的实例且在区域内时处理输入
        if (inArea && this == currentActiveQuestion && !isAnswered)
        {
            if (Input.GetKeyDown(KeyCode.UpArrow))
            {
                Debug.Log("开始输入");
                StartInput();
            }
            if (isInputActive)
            {
                HandleTextInput();
            }
        }
    }
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.CompareTag("Player") && !isAnswered)
        {
            Debug.Log("进入答题区域: " + gameObject.name);
            inArea = true;
            currentActiveQuestion = this; // 设置当前实例为激活实例
        }
    }
    private void OnTriggerExit2D(Collider2D collision)
    {
        if (collision.CompareTag("Player"))
        {
            Debug.Log("离开答题区域: " + gameObject.name);
            inArea = false;
            if (currentActiveQuestion == this)
            {
                currentActiveQuestion = null; // 清除激活实例
            }
            isInputActive = false; // 停止输入
            UpdateAnswerText(); // 清空显示
        }
    }
    public void StartInput()
    {
        if (isAnswered) return; // 已答对则不允许输入
        isInputActive = true;
        currentInput.Clear();
        if (response != null)
        {
            response.text = "";
        }
    }
    public void HandleTextInput()
    {
        if (Input.GetKeyDown(KeyCode.Return))
        {
            ConfirmInput();
            return;
        }
        if (Input.GetKeyDown(KeyCode.Backspace) && currentInput.Length > 0)
        {
            currentInput.Length--;
            UpdateAnswerText();
            return;
        }
        // 过滤输入，仅允许字母、数字、常见符号，排除 wasd 和方向键
        string inputString = Input.inputString;
        if (!string.IsNullOrEmpty(inputString))
        {
            foreach (char c in inputString)
            {
                // 允许可打印字符（字母、数字、符号），但排除 wasd
                if (c >= ' ' && c <= '~' && c != 'w' && c != 'a' && c != 's' && c
                != 'd')
                {
                    currentInput.Append(c);
                }
            }
            UpdateAnswerText();
        }
    }
    public void UpdateAnswerText()
    {
        if (response != null)
        {
            response.text = currentInput.ToString();
        }
    }
    public void ConfirmInput()
    {
        isInputActive = false;
        string finalAnswer = currentInput.ToString();
        if (finalAnswer == answer)
        {
            result.text = "Result: Correct!";
            result.color = Color.green;
            isAnswered = true; // 标记为已答对
            if (obstacle != null)
            {
                Destroy(obstacle);
            }
            // 可选：销毁整个答题区域
            // Destroy(gameObject);
        }
        else
        {
            result.text = "Result: Rethink!";
            result.color = Color.red;
            StartInput(); // 错误时清空并重新输入
        }
    }
}
