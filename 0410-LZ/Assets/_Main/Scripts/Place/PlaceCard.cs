using System.Collections;
using UnityEngine;
using UnityEngine.EventSystems;

namespace RTSBuildingSystem
{
    public class PlaceCard : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler, IPointerExitHandler
    {
        public GameObject buildingPrefab;

        private bool mouseOver;
        private bool selected;

        private readonly Vector3 clickScale = new Vector3(1.2f, 1.2f, 1f);
        private readonly Vector3 enterScale = new Vector3(1.1f, 1.1f, 1f);
        private readonly Vector3 exitScale  = new Vector3(1f, 1f, 1f);

        private Coroutine runningCoroutine;

        private void Start()
        {
            if (buildingPrefab == null)
            {
                Debug.LogWarning("PlaceCard: buildingPrefab is not assigned!", this);
            }
        }

        private void SmartCoroutine(IEnumerator newCoroutine)
        {
            if (runningCoroutine != null)
                StopCoroutine(runningCoroutine);

            runningCoroutine = StartCoroutine(newCoroutine);
        }

        #region Coroutines

        IEnumerator ClickScale()
        {
            while (transform.localScale.x < clickScale.x - 0.03f)
            {
                transform.localScale = Vector3.Lerp(transform.localScale, clickScale, 0.5f);
                yield return new WaitForFixedUpdate();
            }
            transform.localScale = clickScale;
            runningCoroutine = null;
        }

        IEnumerator HoverEnter()
        {
            while (transform.localScale.x < enterScale.x - 0.02f && mouseOver)
            {
                transform.localScale = Vector3.Lerp(transform.localScale, enterScale, 0.5f);
                yield return new WaitForFixedUpdate();
            }
            transform.localScale = enterScale;
            runningCoroutine = null;
        }

        IEnumerator HoverExit()
        {
            while (transform.localScale.x > exitScale.x + 0.02f && !mouseOver)
            {
                transform.localScale = Vector3.Lerp(transform.localScale, exitScale, 0.5f);
                yield return new WaitForFixedUpdate();
            }
            transform.localScale = exitScale;
            runningCoroutine = null;
        }

        #endregion

        public void OnPointerClick(PointerEventData eventData)
        {
            // 右键点击 → 取消选中
            if (eventData.pointerId == -2)  // -2 是右键
            {
                if (selected && PlacementManager.instance.currentCard == this)
                {
                    Select(false);
                    PlacementManager.instance.currentCard = null;
                }
                return;
            }

            // 左键点击
            if (selected) return;

            // 如果已经有其他卡片被选中，先取消它
            if (PlacementManager.instance.currentCard != null)
            {
                PlacementManager.instance.currentCard.Select(false);
            }

            Select(true);
            PlacementManager.instance.currentCard = this;
            PlacementManager.instance.SelectBuilding();
            
            SmartCoroutine(ClickScale());
        }

        public void OnPointerEnter(PointerEventData eventData)
        {
            if (selected) return;

            mouseOver = true;
            SmartCoroutine(HoverEnter());
        }

        public void OnPointerExit(PointerEventData eventData)
        {
            if (selected) return;

            mouseOver = false;
            SmartCoroutine(HoverExit());
        }

        public void Select(bool select)
        {
            selected = select;

            if (select)
            {
                // 已选中状态（可根据需要添加额外效果）
            }
            else
            {
                mouseOver = false;
                SmartCoroutine(HoverExit());
            }
        }
    }
}