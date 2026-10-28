using DG.Tweening;
using System.Collections;
using UnityEngine;
using UnityEngine.EventSystems;

public class CardDrag : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IBeginDragHandler, IDragHandler, IEndDragHandler
{
    public FlagstoneManager manager;
    public RectTransform RT;

    private bool checkCard;

    private Vector3 originalScale;
    private Vector3 originalPosition;
    private Transform originalParent;

    private int originalIndex;

    private CanvasGroup canvasGroup;

    public void SetUp(FlagstoneManager manager)
    {
        this.manager = manager;

        originalScale = transform.localScale;
        originalPosition = transform.localPosition;
        originalParent = transform.parent;
        originalIndex = transform.GetSiblingIndex(); // ��ȡ��ʼ����
        checkCard = true;

        canvasGroup = GetComponent<CanvasGroup>();
        if (canvasGroup == null)
        {
            canvasGroup = gameObject.AddComponent<CanvasGroup>();
        }
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        Debug.Log(this.name + " Begin Drag");

        originalParent = transform.parent;
        originalIndex = transform.GetSiblingIndex(); // ��¼��ʼλ��
        transform.SetParent(manager.canvas.transform, true);
        transform.SetAsLastSibling(); // ������ק�����Ƶ���ǰ��
        canvasGroup.blocksRaycasts = false;   //�������߼��
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (RectTransformUtility.ScreenPointToLocalPointInRectangle(manager.MoveLimitRt, eventData.position, eventData.pressEventCamera, out Vector2 MousePosition))
        {
            Vector3 globalMousePos = manager.canvas.transform.TransformPoint(MousePosition);
            RT.position = globalMousePos;
            checkCard = false;

            // ȷ����ק�Ŀ���ʼ������߲㼶
            transform.SetAsLastSibling();

            // ��̬�����������λ��
            //AdjustSiblingIndex(eventData);
        }
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        Debug.Log(this.name + " End Drag");

        checkCard = true;
        transform.localScale = originalScale; // �ָ���ʼ���ű���
        canvasGroup.blocksRaycasts = true;     //�ָ����߼��

        if (RectTransformUtility.RectangleContainsScreenPoint(manager.UpperListArea, eventData.position, eventData.pressEventCamera))
        {
            Debug.Log(this.name + " 1");
            if (manager.UpperListParent.childCount < manager.maxCardsInUpperList)
            {
                Debug.Log(this.name + " 1-1");
                // �����Ŀ�������ڣ�����Ŀ�������ڿ�������С��������ƣ�����Ŀ������
                transform.SetParent(manager.UpperListParent, true);
                transform.SetSiblingIndex(GetNewSiblingIndexInTarget(eventData));
            }
            else
            {
                Debug.Log(this.name + " 1-2");
                // �滻�����б��еĿ���
                Transform cardToReplace = GetCardToReplace(eventData);
                if (cardToReplace != null)
                {
                    int replaceIndex = cardToReplace.GetSiblingIndex();

                    cardToReplace.SetParent(manager.LowerListParent, true);
                    cardToReplace.SetAsLastSibling();

                    transform.SetParent(manager.UpperListParent, true);
                    transform.SetSiblingIndex(replaceIndex);
                }
                else
                {
                    // ���û���ҵ����滻�Ŀ�Ƭ���ָ���ԭʼλ��
                    RT.localPosition = originalPosition;
                    transform.SetParent(originalParent, true);
                    transform.SetSiblingIndex(originalIndex); // �ָ���ʼ����
                }
            }
        }
        else if (RectTransformUtility.RectangleContainsScreenPoint(manager.LowerListArea, eventData.position, eventData.pressEventCamera))
        {
            Debug.Log(this.name + " 2");
            // ��������б������ڣ��������б�
            transform.SetParent(manager.LowerListParent, true);
            transform.SetSiblingIndex(GetNewSiblingIndexInTarget(eventData));
        }
        else if (IsWithinParentBounds(eventData))
        {
            Debug.Log(this.name + " 3");
            // �����ԭʼ�����巶Χ�ڣ��ָ���ʼλ��
            transform.SetParent(originalParent, true);
            transform.SetSiblingIndex(GetNewSiblingIndex(eventData)); // ������λ��
        }
        else
        {
            Debug.Log(this.name + " 4");
            // ��������κ���Ч�����ڣ��ָ���ԭʼλ��
            RT.localPosition = originalPosition;
            transform.SetParent(originalParent, true);
            transform.SetSiblingIndex(originalIndex); // �ָ���ʼ����
        }
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        transform.localScale = new Vector3(1.1f, 1.1f, 1);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        if (checkCard)
        {
            transform.localScale = originalScale;
        }
    }

    void AdjustSiblingIndex(PointerEventData eventData)
    {
        int newIndex = GetNewSiblingIndex(eventData);
        if (newIndex != transform.GetSiblingIndex())
        {
            transform.SetSiblingIndex(newIndex);
        }
    }

    int GetNewSiblingIndex(PointerEventData eventData)
    {
        Transform currentParent = originalParent;

        // ����Ƿ������б�����
        if (RectTransformUtility.RectangleContainsScreenPoint(manager.UpperListArea, eventData.position, eventData.pressEventCamera))
        {
            currentParent = manager.UpperListArea;
        }
        // ����Ƿ������б�����
        else if (RectTransformUtility.RectangleContainsScreenPoint(manager.LowerListArea, eventData.position, eventData.pressEventCamera))
        {
            currentParent = manager.LowerListParent;
        }

        for (int i = 0; i < currentParent.childCount; i++)
        {
            if (currentParent.GetChild(i) == transform) continue;

            RectTransform child = currentParent.GetChild(i) as RectTransform;
            if (RectTransformUtility.RectangleContainsScreenPoint(child, eventData.position, manager.canvas.worldCamera))
            {
                return i < transform.GetSiblingIndex() ? i : i + 1;
            }
        }
        return currentParent.childCount - 1;
    }

    int GetNewSiblingIndexInTarget(PointerEventData eventData)
    {
        RectTransform targetParent = manager.UpperListArea;

        // ����Ƿ������б�����
        if (RectTransformUtility.RectangleContainsScreenPoint(manager.UpperListArea, eventData.position, eventData.pressEventCamera))
        {
            targetParent = manager.UpperListParent;
        }
        // ����Ƿ������б�����
        else if (RectTransformUtility.RectangleContainsScreenPoint(manager.LowerListArea, eventData.position, eventData.pressEventCamera))
        {
            targetParent = manager.LowerListParent;
        }

        for (int i = 0; i < targetParent.childCount; i++)
        {
            RectTransform child = targetParent.GetChild(i) as RectTransform;
            if (RectTransformUtility.RectangleContainsScreenPoint(child, eventData.position, manager.canvas.worldCamera))
            {
                return i;
            }
        }
        return targetParent.childCount;
    }

    bool IsWithinParentBounds(PointerEventData eventData)
    {
        // ����Ƿ���ԭʼ����������ƶ����Ʒ�Χ��
        return RectTransformUtility.RectangleContainsScreenPoint(originalParent as RectTransform, eventData.position, manager.canvas.worldCamera)
            || RectTransformUtility.RectangleContainsScreenPoint(manager.MoveLimitRt, eventData.position, manager.canvas.worldCamera);
    }

    Transform GetCardToReplace(PointerEventData eventData)
    {
        RectTransform targetParent = manager.UpperListParent;

        for (int i = 0; i < targetParent.childCount; i++)
        {
            RectTransform child = targetParent.GetChild(i) as RectTransform;
            if (RectTransformUtility.RectangleContainsScreenPoint(child, eventData.position, manager.canvas.worldCamera))
            {
                return child;
            }
        }
        return null;
    }
}
