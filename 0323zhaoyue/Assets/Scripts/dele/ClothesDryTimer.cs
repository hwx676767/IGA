using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class ClothesDryTimer : MonoBehaviour
{
    public float dryTime = 10f;           // 衣服干的时间（秒）
    private float currentTime;            // 当前时间（倒计时）
    private bool isDry = false;           // 衣服是否干了
    public bool hasCollectedClothes = false; // 玩家是否已经收衣服
    public Slider timerSlider;            // UI Slider 用于显示倒计时进度
    public GameObject clothesObject;      // 衣服的 GameObject
    public GameObject dryingWarningUI;    // 衣服没干的提示UI

    private bool isWarningActive = false; // 判断提示UI是否正在显示

    void Start()
    {
        // 初始化倒计时
        currentTime = dryTime;
        timerSlider.maxValue = dryTime;    // 设置 Slider 最大值为干燥时间
        timerSlider.value = currentTime;  // 设置初始值为干燥时间
        dryingWarningUI.SetActive(false); // 初始时隐藏衣服没干的提示 UI
        timerSlider.gameObject.SetActive(true); // 确保 Slider 默认是可见的
    }

    void Update()
    {
        // 倒计时逻辑，只有衣服未干时才更新
        if (!isDry)
        {
            currentTime -= Time.deltaTime;       // 每帧减少时间
            timerSlider.value = currentTime;    // 更新 Slider 的值

            if (currentTime <= 0f)              // 如果时间到了
            {
                currentTime = 0f;               // 确保时间不会小于 0
                isDry = true;                   // 衣服干了
                timerSlider.gameObject.SetActive(false); // 隐藏倒计时 Slider
                dryingWarningUI.SetActive(false);        // 确保警告面板隐藏
            }
        }

        // 检测收衣服的输入
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            CollectClothes();
        }
    }

    // 收衣服的方法，根据衣服是否干了决定行为
    public void CollectClothes()
    {
        if (isDry)
        {
            clothesObject.SetActive(false); // 如果衣服干了，收衣服，隐藏衣服
            hasCollectedClothes = true;     // 设置已收衣服
        }
        else
        {
            // 衣服没干时显示 UI 提示
            if (!isWarningActive)
            {
                dryingWarningUI.SetActive(true); // 显示提示 UI
                isWarningActive = true;          // 标记 UI 正在显示
                StartCoroutine(HideWarningUI()); // 启动协程，1秒后隐藏 UI
            }
        }
    }

    // 协程：1秒后隐藏提示 UI
    private IEnumerator HideWarningUI()
    {
        yield return new WaitForSeconds(1f);  // 等待 1 秒
        dryingWarningUI.SetActive(false);     // 隐藏提示 UI
        isWarningActive = false;              // 标记提示 UI 已隐藏
    }

    // 方法用于其他脚本调用来检查衣服是否干了
    public bool IsClothesDry()
    {
        return isDry;
    }

    // 可以通过外部调用设置衣服的干燥时间
    public void SetDryTime(float newDryTime)
    {
        dryTime = newDryTime;
        currentTime = dryTime; // 更新当前时间
        timerSlider.maxValue = dryTime; // 更新 Slider 最大值
        timerSlider.value = currentTime; // 更新 Slider 的当前值
    }
}
